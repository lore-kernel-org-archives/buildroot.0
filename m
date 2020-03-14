From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 14:19:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] Makefile: don't recreate
 staging symlink if it exists
Message-ID: <20200314140059.51E5B82AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd62e87b6d61fe8cd9f05b61e7e5a5172932a8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Create the staging symlink the same way as the host symlink. This means
using a make dependency rather than recreating it every time.

In coreutils versions below 8.27, re-creation of symbolic links was not
atomic. This means that there is a period in time where the existing link is
removed, before the new one is created. In coreutils 8.27 this was fixed,
see [1]. Note that CentOS 7 ships with coreutils 8.22.

In the following scenario, this is a problem:

- an application is compiled using the sysroot prepared by Buildroot and
  links against Xenomai userspace libraries, but its build process is steered
  from outside of Buildroot
- to know the correct flags, the application makefile uses the 'xeno-config'
  file to request them, and passes DESTDIR=/buildroot/output/staging
- the xeno-config responds with flags based on the path
  '/buildroot/output/staging/...'
- while the application build is ongoing, a 'make' happens in Buildroot,
  causing the 'staging' symlink to be recreated (even though it already
  existed)
- when exactly at this time, the application calls the compiler with -I
  flags pointing to output/staging, the build fails with:

  -I/buildroot/output/staging/usr/include/xenomai/mercury: Error:  ^ is not a directory
  -I/buildroot/output/staging/usr/include/xenomai: Error:  ^ is not a directory
  -I/buildroot/output/staging/usr/include/xenomai/xenomai: Error:  ^ is not a directory
  -I/buildroot/output/staging/usr/include/xenomai/psos: Error:  ^ is not a directory
  Failed: ** ^ *

Work around this problem by only creating the staging symlink once, similar
to how the host symlink (if any) is created.

See also commit d0f4f95e390bcb1c953efa125f5277a8a235396e which changed the
way these symlinks are made. The reasoning in this commit is to move away
from the 'dirs' target.

[1] https://github.com/coreutils/coreutils/commit/376967889ed7ed561e46ff6d88a66779db62737a

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b824423142697bf8715d3c3a230559b551b98f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2aa32029af..cf35ae2b7f 100644
--- a/Makefile
+++ b/Makefile
@@ -465,6 +465,10 @@ $(HOST_DIR_SYMLINK): $(BASE_DIR)
 	ln -snf $(HOST_DIR) $(BASE_DIR)/host
 endif
 
+STAGING_DIR_SYMLINK = $(BASE_DIR)/staging
+$(STAGING_DIR_SYMLINK): $(BASE_DIR)
+	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
+
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
@@ -730,8 +734,7 @@ target-finalize: ROOTFS=
 host-finalize: $(HOST_DIR_SYMLINK)
 
 .PHONY: staging-finalize
-staging-finalize:
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+staging-finalize: $(STAGING_DIR_SYMLINK)
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) host-finalize
