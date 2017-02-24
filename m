From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Feb 2017 16:36:01 +0100
Subject: [Buildroot] [PATCH] package/htop: not available for uClibc static
	builds
Message-ID: <1487950561-29105-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

htop wants to use backtrace() when available.

However, on uClibc this causes two problems:

  - backtrace() is not in libc but in a separate library, libubacktrace
  - backtrace() uses dladdr() which is not available for static builds

The first point is easy to solve with a bit of hackery in configure.ac,
with AC_SEARCH_LIBS([backtrace], [ubacktrace] ...).

The second point is more tricky, as this can not easily be solved with
simple autotools macros. Instead, we just shoehorn -ldl in the LIBS
variable from htop.mk when doing a uClibc static build.

Fixes:
    http://autobuild.buildroot.org/results/cde/cdea351fad7a0f61ddec3e6a141da8da0523a902/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
It is to be noted that a dynamic build does not need -lubacktrace.
Weird...
---
 package/htop/0001-check-backtrace-lib.patch | 18 ++++++++++++++++++
 package/htop/htop.mk                        |  6 ++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/htop/0001-check-backtrace-lib.patch

diff --git a/package/htop/0001-check-backtrace-lib.patch b/package/htop/0001-check-backtrace-lib.patch
new file mode 100644
index 0000000..f019d2a
--- /dev/null
+++ b/package/htop/0001-check-backtrace-lib.patch
@@ -0,0 +1,18 @@
+diff --git a/configure.ac b/configure.ac
+index eb055b5..2864e91 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -59,7 +59,12 @@ AC_HEADER_STDC
+ AC_CHECK_HEADERS([stdlib.h string.h strings.h sys/param.h sys/time.h unistd.h],[:],[
+   missing_headers="$missing_headers $ac_header"
+ ])
+-AC_CHECK_HEADERS([execinfo.h],[:],[:])
++AC_CHECK_HEADERS([execinfo.h],
++    # Some libces (e.g. uClibc) may have backtrace() in a helper library
++    [AC_SEARCH_LIBS([backtrace], [ubacktrace],
++        [], [AC_MSG_ERROR([cannot find a library providing backtrace()])])],
++    [:])
++
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ # ----------------------------------------------------------------------
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index adc5090..42daa68 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,12 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncurses5-confi
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
 
+HTOP_AUTORECONF = YES
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_STATIC_LIBS),yy)
+HTOP_CONF_OPTS += LIBS=-ldl
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 HTOP_CONF_OPTS += --enable-unicode
 else
-- 
2.7.4
