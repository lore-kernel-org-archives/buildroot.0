From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 31 Oct 2015 10:22:08 +0900
Subject: [Buildroot] [PATCH v4 1/1] gauche: new package
Message-ID: <201510310122.t9V1M8CT023045@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gauche is an R7RS Scheme implementation developed to be a handy script
interpreter, which allows programmers and systemadministrators to write
small to large scripts for their daily chores. Quick startup, built-in
system interface, native multilingual support are some of its goals.

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v3 -> v4 (reflect comment from Arnout)
- fix some miss spell in help text.
- fix comment in patch file.
- add patch file for configure.ac (same fix with configure).
- fix GAUCHE_LICENSE
Changes v2 -> v3
- add comment to patch file why I touch configure directly instead of
  configure.ac
Changes v1 -> v2
- change help description to written in project's web page.
- add brief description and SoB in patch file.
- change depens on BR2_TOOLCHAIN_HAS_THREADS -> 
    BR2_TOOLCHAIN_HAS_THREADS_NPTL.
- add brief description why "-std=gnu99" needed in GAUCHE_CONF_ENV.
- add depends on BR2_ARCH_HAS_ATOMICS (Boehm gc need this).
- add # fork() to 'depends on BR2_USE_MMU'.
- remove empty comment line in hash file.
- remove unnecessary GAUCHE_CONF_OPTS.
---
 package/Config.in                                  |    1 +
 package/gauche/0001-fix-so-suffix.patch            |   18 ++++++++++++++++++
 .../gauche/0002-fix-so-suffix-configure-ac.patch   |   16 ++++++++++++++++
 package/gauche/Config.in                           |   18 ++++++++++++++++++
 package/gauche/gauche.hash                         |    2 ++
 package/gauche/gauche.mk                           |   19 +++++++++++++++++++
 6 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 package/gauche/0001-fix-so-suffix.patch
 create mode 100644 package/gauche/0002-fix-so-suffix-configure-ac.patch
 create mode 100644 package/gauche/Config.in
 create mode 100644 package/gauche/gauche.hash
 create mode 100644 package/gauche/gauche.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..f0cd4ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
new file mode 100644
index 0000000..77bb355
--- /dev/null
+++ b/package/gauche/0001-fix-so-suffix.patch
@@ -0,0 +1,18 @@
+With uclibc or musl configuration, $host does not match to '*-linux-gnu*'.
+I touch configure instead of configure.ac because autoreconf failed
+by version mismatch of autotools.
+
+Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+
+diff -ur a/configure b/configure
+--- a/configure	2014-07-20 15:15:05.000000000 +0900
++++ b/configure	2015-10-20 21:52:32.791442291 +0900
+@@ -6843,7 +6843,7 @@
+     SHLIB_MAIN_LDFLAGS=""
+     SHLIB_OK=ok
+     ;;
+-  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
++  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
+     SHLIB_SO_CFLAGS="-fPIC"
+     SHLIB_SO_LDFLAGS="$rpath -shared -o"
+     SHLIB_SO_SUFFIX="so"
diff --git a/package/gauche/0002-fix-so-suffix-configure-ac.patch b/package/gauche/0002-fix-so-suffix-configure-ac.patch
new file mode 100644
index 0000000..f9b4459
--- /dev/null
+++ b/package/gauche/0002-fix-so-suffix-configure-ac.patch
@@ -0,0 +1,16 @@
+With uclibc or musl configuration, $host does not match to '*-linux-gnu*'.
+
+Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+
+diff -ur a/configure.ac b/configure.ac
+--- a/configure.ac	2015-10-21 21:33:17.370000200 +0900
++++ b/configure.ac	2015-10-21 21:33:39.784110527 +0900
+@@ -572,7 +572,7 @@
+     SHLIB_MAIN_LDFLAGS=""
+     SHLIB_OK=ok
+     ;;
+-  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
++  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
+     SHLIB_SO_CFLAGS="-fPIC"
+     SHLIB_SO_LDFLAGS="$rpath -shared -o"
+     SHLIB_SO_SUFFIX="so"
diff --git a/package/gauche/Config.in b/package/gauche/Config.in
new file mode 100644
index 0000000..eee6a78
--- /dev/null
+++ b/package/gauche/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GAUCHE
+	bool "gauche"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_ARCH_HAS_ATOMICS
+	help
+	  Gauche is an R7RS Scheme implementation developed to be a
+	  handy script interpreter, which allows programmers and
+	  systemadministrators to write small to large scripts for their
+	  daily chores. Quick startup, built-in system interface, native
+	  multilingual support are some of its goals.
+
+	  http://practical-scheme.net/gauche/
+
+comment "gauche needs a toolchain w/ NPTL"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
new file mode 100644
index 0000000..9ec106a
--- /dev/null
+++ b/package/gauche/gauche.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149  Gauche-0.9.4.tgz
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
new file mode 100644
index 0000000..92e9ff4
--- /dev/null
+++ b/package/gauche/gauche.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gauche
+#
+################################################################################
+
+GAUCHE_VERSION = 0.9.4
+GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
+GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
+GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
+GAUCHE_LICENSE_FILES = COPYING
+GAUCHE_DEPENDENCIES = host-gauche
+
+# Checking c99 support in configure fails without WCHAR. But we do not
+# need WCHAR at gauche runtime, so explicitly specify here.
+GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
-- 
1.7.1

============================================================
    Hiroshi Kawashima
