From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 18:15:03 +0200
Subject: [Buildroot] [git commit] package/w_scan: new package
Message-ID: <20130627165841.1C7C79B22F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8db7962b1fc08b359fdffa84a8a0223873371a36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs libiconv if !locale]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/w_scan/Config.in |   10 ++++++++++
 package/w_scan/w_scan.mk |   18 ++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 81b26be..eefa2ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -301,6 +301,7 @@ source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
+source "package/w_scan/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
new file mode 100644
index 0000000..4487b0a
--- /dev/null
+++ b/package/w_scan/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_W_SCAN
+	bool "w_scan"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  w_scan is a small command line utility used to perform frequency
+	  scans for DVB and ATSC transmissions. It is capable of creating
+	  channels.conf files (in different output formats !) as well as
+	  initial tuning data for scan.
+
+	  http://wirbel.htpc-forum.de/w_scan/index_en.html
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
new file mode 100644
index 0000000..d2f3e4a
--- /dev/null
+++ b/package/w_scan/w_scan.mk
@@ -0,0 +1,18 @@
+###############################################################################
+#
+# w_scan
+#
+###############################################################################
+
+W_SCAN_VERSION              = 20130331
+W_SCAN_SOURCE               = w_scan-$(W_SCAN_VERSION).tar.bz2
+W_SCAN_SITE                 = http://wirbel.htpc-forum.de/w_scan
+W_SCAN_LICENSE              = GPLv2+
+W_SCAN_LICENSE_FILES        = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+W_SCAN_DEPENDENCIES        += libiconv
+W_SCAN_CONF_ENV            += LIBS=-liconv
+endif
+
+$(eval $(autotools-package))
