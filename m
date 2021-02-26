From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Fri, 26 Feb 2021 10:09:36 -0600
Subject: [Buildroot] [PATCH 3/4] package/python3: Allow host-python ncurses
In-Reply-To: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
References: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <20210226160937.16082-3-conrad.ratschan@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Diffoscope tool has a runtime dependency on the curses module in
Python. Buildroot disables curses support for host-python3. This patch
allows for ncurses to be a configurable option for the host-python3
package like it is for the target python3 package. An additional patch
is added to fix the ncurses include path as it previously was not
correct when not cross compiling.

Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
---
 ...-ncurses-include-when-not-cross-comp.patch | 35 +++++++++++++++++++
 package/python3/Config.in.host                |  5 +++
 package/python3/python3.mk                    |  8 ++++-
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 package/python3/0035-configure.ac-Fix-ncurses-include-when-not-cross-comp.patch

diff --git a/package/python3/0035-configure.ac-Fix-ncurses-include-when-not-cross-comp.patch b/package/python3/0035-configure.ac-Fix-ncurses-include-when-not-cross-comp.patch
new file mode 100644
index 0000000000..15834772d0
--- /dev/null
+++ b/package/python3/0035-configure.ac-Fix-ncurses-include-when-not-cross-comp.patch
@@ -0,0 +1,35 @@
+From 9f10c2f660ab24d622b66a58d14dd7522b120d6d Mon Sep 17 00:00:00 2001
+From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
+Date: Tue, 2 Feb 2021 09:45:57 -0600
+Subject: [PATCH] configure.ac: Fix ncurses include when not cross compiling
+
+When not cross compiling, the ncurses include path used by configure.ac
+is hardcoded to a path on the user's development machine. Change this
+path to use ${prefix} so that it can use a host folder path specified
+by Buildroot.
+
+Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 07bceda..0398da5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5271,7 +5271,11 @@ fi
+ # first curses header check
+ ac_save_cppflags="$CPPFLAGS"
+ if test "$cross_compiling" = no; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
++  if test "x${prefix}" = "xNONE" ; then
++    CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
++  else
++    CPPFLAGS="$CPPFLAGS -I${prefix}/include/ncursesw -I${prefix}/include/ncurses"
++  fi
+ fi
+ 
+ AC_CHECK_HEADERS(curses.h ncurses.h)
+-- 
+2.17.1
+
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..dc463e51b6 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -13,4 +13,9 @@ config BR2_PACKAGE_HOST_PYTHON3_SSL
 	help
 	  _ssl module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_CURSES
+	bool "curses"
+	help
+	  curses module for Python3.
+
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 63d6c3f535..9187fb8220 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-curses \
 	--disable-codecs-cjk \
 	--disable-nis \
 	--enable-unicodedata \
@@ -47,6 +46,13 @@ else
 HOST_PYTHON3_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
+HOST_PYTHON3_DEPENDENCIES += host-ncurses
+HOST_PYTHON3_CONF_OPTS += --enable-curses
+else
+HOST_PYTHON3_CONF_OPTS += --disable-curses
+endif
+
 PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
-- 
2.17.1
