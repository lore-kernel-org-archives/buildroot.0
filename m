From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Mar 2016 20:54:49 +0300
Subject: [Buildroot] [PATCH] libxml2: fix static build with xz
Message-ID: <83a61efc9b5c0ed716172544323ed519c8926902.1459187689.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that adds '-llzma' to the output of 'xml2-config --libs' when xz
is enabled. This fixes static build when xz is enabled.

Fixes:
http://autobuild.buildroot.net/results/496/496715348d1f0fb1ff1b729ab457c1993e4cab31/
http://autobuild.buildroot.net/results/89c/89c9dad226fa4df46cbbfd21e48358eb52ccadc4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Add-xz-to-xml2-config-libs-output.patch   | 32 ++++++++++++++++++++++
 package/libxml2/libxml2.mk                         |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 package/libxml2/0001-Add-xz-to-xml2-config-libs-output.patch

diff --git a/package/libxml2/0001-Add-xz-to-xml2-config-libs-output.patch b/package/libxml2/0001-Add-xz-to-xml2-config-libs-output.patch
new file mode 100644
index 000000000000..bb4cc873eb4a
--- /dev/null
+++ b/package/libxml2/0001-Add-xz-to-xml2-config-libs-output.patch
@@ -0,0 +1,32 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 28 Mar 2016 19:56:05 +0300
+Subject: [PATCH] Add xz to xml2-config --libs output
+
+XML_LIBS should include LZMA_LIBS. This ensures that 'xml2-config --libs'
+shows -llzma when xz is enabled. Otherwise static link fails because of
+missing xz symbols.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: posted upstream
+(https://mail.gnome.org/archives/xml/2016-March/msg00018.html)
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 55a5a6f2c818..d965fca1eb7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1480,7 +1480,7 @@ case "$host" in
+ 	*) M_LIBS="-lm"
+ 	;;
+ esac
+-XML_LIBS="-lxml2 $Z_LIBS $THREAD_LIBS $ICONV_LIBS $M_LIBS $LIBS"
++XML_LIBS="-lxml2 $Z_LIBS $LZMA_LIBS $THREAD_LIBS $ICONV_LIBS $M_LIBS $LIBS"
+ XML_LIBTOOLLIBS="libxml2.la"
+ AC_SUBST(WITH_ICONV)
+ 
+-- 
+2.8.0.rc3
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ee9b2ca44e30..5990ad1b2cdf 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -10,6 +10,8 @@ LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_CONFIG_SCRIPTS = xml2-config
+# Patching configure.ac
+LIBXML2_AUTORECONF = YES
 
 LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
 
-- 
2.8.0.rc3
