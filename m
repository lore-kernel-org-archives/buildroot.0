From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Oct 2020 19:13:09 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/cukinia: fix dependency
Message-ID: <20201008171309.368294-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gawk can't be selected when busybox is not available as gawk needs
wchar:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GAWK
  Depends on [n]: BR2_USE_WCHAR [=n] && BR2_USE_MMU [=y] && BR2_PACKAGE_BUSYBOX_SHOW_OTHERS [=y]
  Selected by [y]:
  - BR2_PACKAGE_CUKINIA [=y] && !BR2_PACKAGE_BUSYBOX [=n]

So replace this "select" by a "depends on", as already done by
BR2_PACKAGE_APPARMOR_UTILS_EXTRA

Fixes:
 - http://autobuild.buildroot.org/results/66dacfe7b0783c7df29052fff20f3e79ecbcf054

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add a comment

 package/cukinia/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cukinia/Config.in b/package/cukinia/Config.in
index 37373e9a08..20d0820a70 100644
--- a/package/cukinia/Config.in
+++ b/package/cukinia/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CUKINIA
 	bool "cukinia"
-	select BR2_PACKAGE_GAWK if !BR2_PACKAGE_BUSYBOX
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK
 	help
 	  Cukinia is designed to help Linux-based embedded firmware
 	  developers run system-level validation tests on their product.
@@ -13,3 +13,6 @@ config BR2_PACKAGE_CUKINIA
 	  integration with CI systems such as Jenkins.
 
 	  https://github.com/savoirfairelinux/cukinia
+
+comment "cukinia needs busybox or gawk"
+	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK)
-- 
2.28.0
