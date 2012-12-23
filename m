From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 02:06:09 +0200
Subject: [Buildroot] [PATCH] rxvt-unicode: new package
Message-ID: <1356221169-32572-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                                  |    1 +
 package/rxvt-unicode/Config.in                     |    9 +++++++++
 .../rxvt-unicode/rxvt-unicode-9.15-terminfo.patch  |   12 ++++++++++++
 package/rxvt-unicode/rxvt-unicode.mk               |   12 ++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/rxvt-unicode/Config.in
 create mode 100644 package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
 create mode 100644 package/rxvt-unicode/rxvt-unicode.mk

diff --git a/package/Config.in b/package/Config.in
index d5e94db..562bfda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ source "package/leafpad/Config.in"
 source "package/midori/Config.in"
 source "package/pcmanfm/Config.in"
 source "package/rdesktop/Config.in"
+source "package/rxvt-unicode/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
diff --git a/package/rxvt-unicode/Config.in b/package/rxvt-unicode/Config.in
new file mode 100644
index 0000000..3eab31d
--- /dev/null
+++ b/package/rxvt-unicode/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RXVT_UNICODE
+	bool "rxvt-unicode"
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	help
+	  rxvt clone with xft and unicode support
+
+	  http://software.schmorp.de/pkg/rxvt-unicode
diff --git a/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
new file mode 100644
index 0000000..910ce76
--- /dev/null
+++ b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
@@ -0,0 +1,12 @@
+diff -Naur rxvt-unicode-9.15.org/doc/Makefile.in rxvt-unicode-9.15/doc/Makefile.in
+--- rxvt-unicode-9.15.org/doc/Makefile.in	2012-04-11 23:57:47.105465883 +0300
++++ rxvt-unicode-9.15/doc/Makefile.in	2012-04-12 00:02:13.848367530 +0300
+@@ -102,7 +102,7 @@
+ 	$(INSTALL_DATA) rxvt.7.man  $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ @IF_PERL@	$(INSTALL) -d $(DESTDIR)$(man3dir)
+ @IF_PERL@	$(INSTALL_DATA) rxvtperl.3.man $(DESTDIR)$(man3dir)/$(RXVTNAME)perl.$(man3ext)
+-	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)/usr/share/terminfo
+ 
+ distdepend: alldoc
+ 
diff --git a/package/rxvt-unicode/rxvt-unicode.mk b/package/rxvt-unicode/rxvt-unicode.mk
new file mode 100644
index 0000000..009b40e
--- /dev/null
+++ b/package/rxvt-unicode/rxvt-unicode.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# rxvt-unicode
+#
+#############################################################
+RXVT_UNICODE_VERSION = 9.15
+RXVT_UNICODE_SOURCE = rxvt-unicode-$(RXVT_UNICODE_VERSION).tar.bz2
+RXVT_UNICODE_SITE = http://dist.schmorp.de/rxvt-unicode
+RXVT_UNICODE_DEPENDENCIES = fontconfig ncurses xlib_libX11 xlib_libXrender
+RXVT_UNICODE_CONF_OPT += --enable-everything --disable-perl --with-x --with-terminfo=/usr/share/terminfo
+
+$(eval $(autotools-package))
-- 
1.7.7.6
