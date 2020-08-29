From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:36:31 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] Makefile: hide commands
 that build the package file lists at end of build
Message-ID: <20200829173331.4758E86F1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e27d0d8b5bc16f20d09bc646a2aaa9d9c6d11ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Since commit 0e2be4db8ab01d479177a3a187c22525752195ae
("package/pkg-generic: make file list logic parallel build
compatible"), the commands executed at the every end of the build
to assemble the list of files installed by the different packages
are visible in the make output. They are quite noisy, and clutter
the output.

The other commands in target-finalize are also hidden using "@",
so we should also do the same for those commands. But that hurts
debuggability, so we use $(Q) (the existing '@'s can be changed
in a followup patch).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: use '$(Q)', not '@']
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 18f6c2611898c852a10e38978249a9ce81c24163)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0026e7761c..79096fdc90 100644
--- a/Makefile
+++ b/Makefile
@@ -816,11 +816,11 @@ endif # merged /usr
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
-	$(if $(TARGET_DIR_FILES_LISTS), \
+	$(Q)$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
-	$(if $(HOST_DIR_FILES_LISTS), \
+	$(Q)$(if $(HOST_DIR_FILES_LISTS), \
 		cat $(HOST_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-host.txt
-	$(if $(STAGING_DIR_FILES_LISTS), \
+	$(Q)$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
