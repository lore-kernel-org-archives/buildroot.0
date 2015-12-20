From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:34:43 +0100
Subject: [Buildroot] [git commit] wine: Bump to version 1.8
Message-ID: <20151220123448.8BA6B81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac8b5ffef1ce93b13ac6fb2ba37c8ce7ec42afcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping to brand new stable version 1.8

Upstreamed patches are dropped, sane patch is rebased.
Adding libpcap, pulseaudio and samba4 as soft dependencies.
sfnt2fon moved to its own subfolder and needs to be built in host-wine.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...revent-call-to-memset-with-a-null-pointer.patch | 40 ----------------------
 ...config-fix.patch => 0001-sane-config-fix.patch} | 14 ++++----
 package/wine/0002-detect-ncursesw.patch            | 17 ---------
 package/wine/wine.hash                             |  2 +-
 package/wine/wine.mk                               | 31 +++++++++++++++--
 5 files changed, 36 insertions(+), 68 deletions(-)

diff --git a/package/wine/0001-Prevent-call-to-memset-with-a-null-pointer.patch b/package/wine/0001-Prevent-call-to-memset-with-a-null-pointer.patch
deleted file mode 100644
index f6d5a9d..0000000
--- a/package/wine/0001-Prevent-call-to-memset-with-a-null-pointer.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-commit deb274226783ab886bdb44876944e156757efe2b
-Author: Daniel Beitler <dan@dablabs.com>
-Date:   Sun May 18 13:27:42 2014 -0400
-
-    msi: Prevent call to memset with a null pointer
-         in get_tablecolumns function.
-
-Fix miscompilation with gcc >= 4.9
-See https://bugs.winehq.org/show_bug.cgi?id=36139 for the upstream
-bug report. There won't be a Wine 1.6.3 so we need to address this
-anyway.
-
-Backported from: deb274226783ab886bdb44876944e156757efe2b
-Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
----
- dlls/msi/table.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dlls/msi/table.c b/dlls/msi/table.c
-index 8012369..9ed9421 100644
---- a/dlls/msi/table.c
-+++ b/dlls/msi/table.c
-@@ -671,7 +671,7 @@ static UINT get_tablecolumns( MSIDATABASE *db, LPCWSTR szTableName, MSICOLUMNINF
-     /* Note: _Columns table doesn't have non-persistent data */
- 
-     /* if maxcount is non-zero, assume it's exactly right for this table */
--    memset( colinfo, 0, maxcount * sizeof(*colinfo) );
-+    if (colinfo) memset( colinfo, 0, maxcount * sizeof(*colinfo) );
-     count = table->row_count;
-     for (i = 0; i < count; i++)
-     {
-@@ -684,7 +684,7 @@ static UINT get_tablecolumns( MSIDATABASE *db, LPCWSTR szTableName, MSICOLUMNINF
-             /* check the column number is in range */
-             if (col < 1 || col > maxcount)
-             {
--                ERR("column %d out of range\n", col);
-+                ERR("column %d out of range (maxcount: %d)\n", col, maxcount);
-                 continue;
-             }
-             /* check if this column was already set */
diff --git a/package/wine/0003-sane-config-fix.patch b/package/wine/0001-sane-config-fix.patch
similarity index 68%
rename from package/wine/0003-sane-config-fix.patch
rename to package/wine/0001-sane-config-fix.patch
index d53843a..bccde7d 100644
--- a/package/wine/0003-sane-config-fix.patch
+++ b/package/wine/0001-sane-config-fix.patch
@@ -10,12 +10,12 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1375,7 +1375,7 @@
+@@ -1291,7 +1291,7 @@
+ dnl **** Check for SANE ****
  if test "x$with_sane" != "xno"
  then
-     ac_save_CPPFLAGS="$CPPFLAGS"
--    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`sane-config --cflags 2>/dev/null`],[`sane-config --ldflags 2>/dev/null`])
-+    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`${SANE_CONFIG:-sane-config} --cflags 2>/dev/null`],[`${SANE_CONFIG:-sane-config} --ldflags 2>/dev/null`])
-     AC_CHECK_HEADER(sane/sane.h,
-         [WINE_CHECK_SONAME(sane,sane_init,,[SANE_CFLAGS=""],[$SANE_LIBS])],
-         [SANE_CFLAGS=""])
+-    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`sane-config --cflags 2>/dev/null`],[`sane-config --ldflags 2>/dev/null`],
++    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`${SANE_CONFIG:-sane-config} --cflags 2>/dev/null`],[`${SANE_CONFIG:-sane-config} --ldflags 2>/dev/null`],
+         [AC_CHECK_HEADER(sane/sane.h,
+             [WINE_CHECK_SONAME(sane,sane_init,,[SANE_CFLAGS=""],[$SANE_LIBS])],
+             [SANE_CFLAGS=""])])
diff --git a/package/wine/0002-detect-ncursesw.patch b/package/wine/0002-detect-ncursesw.patch
deleted file mode 100644
index 7f153b1..0000000
--- a/package/wine/0002-detect-ncursesw.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Detect libncursesw as well.
-Backport from upstream 8d4e1fa7d77636a88651c9d48a48d39fab931c49
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura wine-1.6.2.orig/configure.ac wine-1.6.2/configure.ac
---- wine-1.6.2.orig/configure.ac	2015-05-01 09:24:24.741960685 -0300
-+++ wine-1.6.2/configure.ac	2015-05-01 09:25:26.860069750 -0300
-@@ -1359,7 +1359,7 @@
- CURSESLIBS=""
- if test "$ac_cv_header_ncurses_h" = "yes"
- then
--    WINE_CHECK_SONAME(ncurses,waddch,[CURSESLIBS="-lncurses"])
-+    WINE_CHECK_SONAME(ncurses,waddch,[CURSESLIBS="-lncurses"],,,[[libncursesw\\{0,1\\}]])
- elif test "$ac_cv_header_curses_h" = "yes"
- then
-     WINE_CHECK_SONAME(curses,waddch,[CURSESLIBS="-lcurses"])
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index d1e3494..80c0f68 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 f0ab9eede5a0ccacbf6e50682649f9377b9199e49cf55641f1787cf72405acbe wine-1.6.2.tar.bz2
+sha256 f33b45c18112b2071fbf9edee0e8c575407f9e2a9855ca4ee918ed33efa7c6f4 wine-1.8.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 98958ef..1d935cc 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.6.2
+WINE_VERSION = 1.8
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
-WINE_SITE = https://dl.winehq.org/wine/source/1.6
+WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
-# For 0002-detect-ncursesw.patch
+# For 0001-sane-config-fix.patch
 WINE_AUTORECONF = YES
 
 # Wine needs its own directory structure and tools for cross compiling
@@ -120,6 +120,13 @@ else
 WINE_CONF_OPTS += --without-glu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+WINE_CONF_OPTS += --with-pcap
+WINE_DEPENDENCIES += libpcap
+else
+WINE_CONF_OPTS += --without-pcap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WINE_CONF_OPTS += --with-png
 WINE_DEPENDENCIES += libpng
@@ -183,6 +190,20 @@ else
 WINE_CONF_OPTS += --without-osmesa
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+WINE_CONF_OPTS += --with-pulse
+WINE_DEPENDENCIES += pulseaudio
+else
+WINE_CONF_OPTS += --without-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+WINE_CONF_OPTS += --with-netapi
+WINE_DEPENDENCIES += samba4
+else
+WINE_CONF_OPTS += --without-netapi
+endif
+
 ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
 WINE_CONF_OPTS += --with-sane
 WINE_DEPENDENCIES += sane-backends
@@ -282,6 +303,7 @@ endif
 define HOST_WINE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 	  tools \
+	  tools/sfnt2fon \
 	  tools/widl \
 	  tools/winebuild \
 	  tools/winegcc \
@@ -318,11 +340,14 @@ HOST_WINE_CONF_OPTS += \
 	--without-jpeg \
 	--without-ldap \
 	--without-mpg123 \
+	--without-netapi \
 	--without-openal \
 	--without-opencl \
 	--without-opengl \
 	--without-osmesa \
 	--without-oss \
+	--without-pcap \
+	--without-pulse \
 	--without-png \
 	--without-sane \
 	--without-tiff \
