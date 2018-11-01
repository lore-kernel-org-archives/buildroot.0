From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  1 Nov 2018 13:58:16 -0500
Subject: [Buildroot] [PATCH 2/2] package/libdrm: correct cunit test
 dependency
In-Reply-To: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1541098696-25824-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously the option to install tests would result in the test
cases that don't have a cunit dependency, to build and be installed.

This patch adds the cunit dependency so all test cases are built and
installed to target when that is selected via kconfig.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libdrm/Config.in | 1 +
 package/libdrm/libdrm.mk | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 581f921..9dd1fb7 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -99,6 +99,7 @@ config BR2_PACKAGE_LIBDRM_VC4
 
 config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	bool "Install test programs"
+	select BR2_PACKAGE_CUNIT
 	help
 	  This option allows to install the libdrm test programs.
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 18ef9cd..e927dd1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -115,6 +115,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
 LIBDRM_CONF_OPTS += --enable-install-test-programs
+# By default most of the test cases with automatically
+# be disabled if cunit is not present
+LIBDRM_DEPENDENCIES += cunit
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
