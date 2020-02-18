From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Feb 2020 16:01:00 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't recreate staging symlink if
 it exists
In-Reply-To: <20200218150101.22274-1-patrickdepinguin@gmail.com>
References: <20200218150101.22274-1-patrickdepinguin@gmail.com>
Message-ID: <20200218150101.22274-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

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
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index facccd32e7..3f301716f1 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,10 @@ $(HOST_DIR_SYMLINK): $(BASE_DIR)
 	ln -snf $(HOST_DIR) $(HOST_DIR_SYMLINK)
 endif
 
+STAGING_DIR_SYMLINK = $(BASE_DIR)/staging
+$(STAGING_DIR_SYMLINK): $(BASE_DIR)
+	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
+
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
@@ -726,8 +730,7 @@ host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
 
 .PHONY: staging-finalize
-staging-finalize:
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+staging-finalize: $(STAGING_DIR_SYMLINK)
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
-- 
2.24.1
