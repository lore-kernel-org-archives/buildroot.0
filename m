From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 23:01:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
Message-ID: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbsd installs at least one .pc file that contains a -isystem include
path (-isystem /usr.include/bsd), but -isystem is not munged by
pkg-config, so we end up using /usr/include/bsd which is not suitable
for the target. And breaks big time (see failures, below).

But using libbsd is completely optional. In fact, our lldpd.mk did not
even express the dependency on libbsd, so we may well have had builds
without libbsd.

The functionality brought in by using libbsd is very minor (just setting
the neighbour name in /proc/self/smdline), so we just make lldpd not use
libbsd at all. There is no --disable-libbsd or such, so we just patch it
out of configure.ac.

Fixes:
    http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
    http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
    http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Note: this is not for upstream as-is; it's just a workaround for
Buildroot, given how close next release is. After the release, we can
bump lldpd to use a newer upstream (they already worked on this problem,
just in another way).

---
Changes v1 -> v2:
  - slightly expand the commit log  (Arnout)
  - typoes  (Arnout)
---
 .../0002-configure-do-not-check-for-libbsd.patch   | 61 ++++++++++++++++++++++
 package/lldpd/lldpd.mk                             |  2 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 package/lldpd/0002-configure-do-not-check-for-libbsd.patch

diff --git a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
new file mode 100644
index 0000000..4d63274
--- /dev/null
+++ b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
@@ -0,0 +1,61 @@
+From 0801a066cd4a24a858ddfa7c62c7802e0f5533a8 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 14 Aug 2016 12:15:17 +0200
+Subject: [PATCH] configure: do not check for libbsd
+
+libbsd causes build issues because its libbsd-overlay.pc file is borked:
+it contains -isystem in CFLAGS, which is not munged by pkgconf, so we
+end up using the headers of the build machine, causing all sorts of
+hard-to-debug trouble at build time.
+
+lldpd uses libbsd-overlay for a few helper functions, but has fallbacks
+in case it is not available. The only feature that is lost when not using
+it is that the neighbour name is no longer displayed in /proc/self/cmdline.
+As the author of lldpd said on IRC: "people should survive! ;-)"
+
+So we just remove the detection of libbsd altogether.
+
+Fixes:
+    http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
+    http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
+    http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
+    [...]
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dd723b0..45498ce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,25 +165,6 @@ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ AC_FUNC_FORK
+ 
+-# Some functions can be in libbsd
+-PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
+-  _save_CFLAGS="$CFLAGS"
+-  _save_LIBS="$LIBS"
+-  CFLAGS="$CFLAGS $libbsd_CFLAGS"
+-  LIBS="$LIBS $libbsd_LIBS"
+-  AC_MSG_CHECKING([if libbsd can be linked correctly])
+-  AC_LINK_IFELSE([AC_LANG_SOURCE([[int main() { return 0; }]])],
+-    [
+-      AC_MSG_RESULT(yes)
+-      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
+-      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
+-    ],[
+-      AC_MSG_RESULT(no)
+-      CFLAGS="$_save_CFLAGS"
+-      LIBS="$_save_LIBS"
+-    ])
+-], [:])
+-
+ # setproctitle may have an _init function
+ AC_REPLACE_FUNCS([setproctitle])
+ AC_CHECK_FUNCS([setproctitle_init])
+-- 
+2.7.4
+
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 924f2db..7613f9e 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -9,7 +9,7 @@ LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = README.md
-# 0001-build-make-generation-of-atom-glue-compatible-with-o.patch
+# 0002-configure-do-not-check-for-libbsd.patch
 LLDPD_AUTORECONF = YES
 
 # Detection of c99 support in configure fails without WCHAR. To enable
-- 
2.7.4
