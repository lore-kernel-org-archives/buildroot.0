From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 5 Jul 2016 12:16:05 +0100
Subject: [Buildroot] [PATCH v2] openblas: add an option to install tests on
	the target
Message-ID: <1467717365-27849-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Also install some necessary input files for the tests.

 package/openblas/Config.in   |  3 +++
 package/openblas/openblas.mk | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 51afaec..67dbf71 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -59,4 +59,7 @@ config BR2_PACKAGE_OPENBLAS_TARGET
 	string "OpenBLAS target CPU"
 	default BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 
+config BR2_PACKAGE_OPENBLAS_INSTALL_TESTS
+	bool "Install OpenBLAS tests"
+
 endif
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index baeef05..a5e5100 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -53,4 +53,17 @@ define OPENBLAS_INSTALL_TARGET_CMDS
 		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
 endef
 
+ifeq ($(BR2_PACKAGE_OPENBLAS_INSTALL_TESTS),y)
+define OPENBLAS_INSTALL_TESTS
+	for i in test ctest utest; do \
+		mkdir -p $(TARGET_DIR)/usr/share/openblas/$$i && \
+		cd $(@D)/$$i && \
+		find . -type f -perm -a=x -exec $(INSTALL) -m 0755 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; && \
+		find . -type f -name "?in*" -exec $(INSTALL) -m 0644 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; && \
+		find . -type f -name "*.dat" -exec $(INSTALL) -m 0644 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; ; \
+		done
+endef
+OPENBLAS_POST_INSTALL_TARGET_HOOKS += OPENBLAS_INSTALL_TESTS
+endif
+
 $(eval $(generic-package))
-- 
2.7.3
