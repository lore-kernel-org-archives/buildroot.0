From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 11:10:02 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] Makefile: use order-only
 dependency so symlinks are made only once
Message-ID: <20200722090927.213C5817AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=455910df024cd34214121ddb4fbb39ca2bb67c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

The rule to create the staging symlink has it depend on BASE_DIR, and
the symlink is created in BASE_DIR, which means that when the symlink
is created, BASE_DIR is updated, and thus made more recent than the
symlink itself.

As a consequence, every time one runs 'make', the symlink will be older
than BASE_DIR, and so will be re-created.

Ditto for the host symlink when the user has elected to have an
out-of-tree host dir.

Fix that by changing to using an order-only dependency.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d38e58d4c6d62868b3973204c827b62bde4aa84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 413e565dae..b90ec32b25 100644
--- a/Makefile
+++ b/Makefile
@@ -457,12 +457,12 @@ endif
 
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
-$(HOST_DIR_SYMLINK): $(BASE_DIR)
+$(HOST_DIR_SYMLINK): | $(BASE_DIR)
 	ln -snf $(HOST_DIR) $(HOST_DIR_SYMLINK)
 endif
 
 STAGING_DIR_SYMLINK = $(BASE_DIR)/staging
-$(STAGING_DIR_SYMLINK): $(BASE_DIR)
+$(STAGING_DIR_SYMLINK): | $(BASE_DIR)
 	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
 
 # Quotes are needed for spaces and all in the original PATH content.
