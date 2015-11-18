From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 18 Nov 2015 22:00:51 +0100
Subject: [Buildroot] [RFC] wine: Bump to 1.8
Message-ID: <564CE703.2070706@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In a couple of weeks Wine 1.8 will be released, 1.7.55 was the last 1.7.x version.
To prepare for the version jump of two years, I want to make sure early if i do something wrong.
So a quick overlook over the patch would be nice.
What about moving the patches around like I do? 0003->0001?
Note that this patches is missing a hash file, will be added back later

Thanks


---
 ...revent-call-to-memset-with-a-null-pointer.patch | 40 ----------------------
 package/wine/0001-sane-config-fix.patch            | 22 ++++++++++++
 package/wine/0002-detect-ncursesw.patch            | 17 ---------
 package/wine/0003-sane-config-fix.patch            | 21 ------------
 package/wine/wine.hash                             |  2 --
 package/wine/wine.mk                               | 27 +++++++++++++--
 6 files changed, 46 insertions(+), 83 deletions(-)
 delete mode 100644 package/wine/0001-Prevent-call-to-memset-with-a-null-pointer.patch
 create mode 100644 package/wine/0001-sane-config-fix.patch
 delete mode 100644 package/wine/0002-detect-ncursesw.patch
 delete mode 100644 package/wine/0003-sane-config-fix.patch
 delete mode 100644 package/wine/wine.hash

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
-Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
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
diff --git a/package/wine/0001-sane-config-fix.patch b/package/wine/0001-sane-config-fix.patch
new file mode 100644
index 0000000..996f02a
--- /dev/null
+++ b/package/wine/0001-sane-config-fix.patch
@@ -0,0 +1,22 @@
+Add support for SANE_CONFIG variable
+
+Instead of using directly the sane-config command, allow to pass a
+SANE_CONFIG environment variable to override where to find the
+sane-config tool.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Andr? Hentschel  <nerv@dawncrow.de>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -1329,7 +1329,7 @@
+ dnl **** Check for SANE ****
+ if test "x$with_sane" != "xno"
+ then
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
diff --git a/package/wine/0003-sane-config-fix.patch b/package/wine/0003-sane-config-fix.patch
deleted file mode 100644
index d53843a..0000000
--- a/package/wine/0003-sane-config-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Add support for SANE_CONFIG variable
-
-Instead of using directly the sane-config command, allow to pass a
-SANE_CONFIG environment variable to override where to find the
-sane-config tool.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -1375,7 +1375,7 @@
- if test "x$with_sane" != "xno"
- then
-     ac_save_CPPFLAGS="$CPPFLAGS"
--    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`sane-config --cflags 2>/dev/null`],[`sane-config --ldflags 2>/dev/null`])
-+    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`${SANE_CONFIG:-sane-config} --cflags 2>/dev/null`],[`${SANE_CONFIG:-sane-config} --ldflags 2>/dev/null`])
-     AC_CHECK_HEADER(sane/sane.h,
-         [WINE_CHECK_SONAME(sane,sane_init,,[SANE_CFLAGS=""],[$SANE_LIBS])],
-         [SANE_CFLAGS=""])
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
deleted file mode 100644
index d1e3494..0000000
--- a/package/wine/wine.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256 f0ab9eede5a0ccacbf6e50682649f9377b9199e49cf55641f1787cf72405acbe wine-1.6.2.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 38576db..17ba827 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.6.2
+WINE_VERSION = 1.7.55
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
-WINE_SITE = https://dl.winehq.org/wine/source/1.6
+WINE_SITE = https://dl.winehq.org/wine/source/1.7
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
@@ -27,7 +27,6 @@ WINE_CONF_OPTS = \
 	--without-hal \
 	--without-openal \
 	--without-opencl \
-	--without-osmesa \
 	--without-oss
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
@@ -122,6 +121,13 @@ else
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
@@ -171,6 +177,20 @@ else
 WINE_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+WINE_CONF_OPTS += --with-osmesa
+WINE_DEPENDENCIES += mesa3d
+else
+WINE_CONF_OPTS += --without-osmesa
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
@@ -270,6 +290,7 @@ endif
 define HOST_WINE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 	  tools \
+	  tools/sfnt2fon \
 	  tools/widl \
 	  tools/winebuild \
 	  tools/winegcc \
-- 
1.9.1
