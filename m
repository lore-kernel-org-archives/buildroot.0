From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2016 14:26:32 +0300
Subject: [Buildroot] [PATCH 3/3] wireshark: needs the qt5tools lrelease
	utility
In-Reply-To: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
References: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
Message-ID: <1b772d44273db8f887bbb378e5dd59053a328c3d.1476789992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/0a4/0a4ccf752ed1e81e2416d33a78984b47087f68bd/
http://autobuild.buildroot.net/results/196/196b96e28a2cd5983a58948df4a2c3eb3bccdfa4/
http://autobuild.buildroot.net/results/056/056b3299ce45552fe3e7cbf5aa68b223f8fa458e/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/Config.in    | 2 ++
 package/wireshark/wireshark.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 4982c1f8d53d..959fb5b4f79d 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_QT5TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 01886c803ea8..a2aa205e29e8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -40,7 +40,7 @@ endif
 # Qt4 needs accessibility, we don't support it
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 WIRESHARK_CONF_OPTS += --with-qt=5
-WIRESHARK_DEPENDENCIES += qt5base
+WIRESHARK_DEPENDENCIES += qt5base qt5tools
 WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
 # Seems it expects wrappers and passes a -qt=X parameter for version
 WIRESHARK_MAKE_OPTS += \
-- 
2.9.3
