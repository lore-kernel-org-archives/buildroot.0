From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 21 Oct 2015 22:35:59 +0900
Subject: [Buildroot] [PATCH v1 1/1] gauche: new package
Message-ID: <201510211335.t9LDZxji001496@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gauche is a Scheme scripting engine aiming at being a handy tool
that helps programmers and system administrators to write small
to large scripts quickly.

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
Please allow me to patch 'configure' directly instead of configure.ac
due to incompatibility of autotools version of gauche assumed.
---
 package/Config.in                       |    1 +
 package/gauche/0001-fix-so-suffix.patch |   12 ++++++++++++
 package/gauche/Config.in                |   14 ++++++++++++++
 package/gauche/gauche.hash              |    3 +++
 package/gauche/gauche.mk                |   20 ++++++++++++++++++++
 5 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/gauche/0001-fix-so-suffix.patch
 create mode 100644 package/gauche/Config.in
 create mode 100644 package/gauche/gauche.hash
 create mode 100644 package/gauche/gauche.mk

diff --git a/package/Config.in b/package/Config.in
index 7392363..eb92ead 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,6 +459,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
new file mode 100644
index 0000000..18d0bd5
--- /dev/null
+++ b/package/gauche/0001-fix-so-suffix.patch
@@ -0,0 +1,12 @@
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
diff --git a/package/gauche/Config.in b/package/gauche/Config.in
new file mode 100644
index 0000000..ad61c3f
--- /dev/null
+++ b/package/gauche/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GAUCHE
+	bool "gauche"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Gauche is a Scheme scripting engine aiming at being a handy tool
+	  that helps programmers and system administrators to write small
+	  to large scripts quickly.
+
+	  http://practical-scheme.net/gauche/
+
+comment "gauche needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
new file mode 100644
index 0000000..9d19671
--- /dev/null
+++ b/package/gauche/gauche.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+#
+sha256 7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149  Gauche-0.9.4.tgz
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
new file mode 100644
index 0000000..a329724
--- /dev/null
+++ b/package/gauche/gauche.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# gauche
+#
+################################################################################
+
+GAUCHE_VERSION = 0.9.4
+GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
+GAUCHE_SITE = http://prdownloads.sourceforge.net/gauche
+GAUCHE_LICENSE = BSD
+GAUCHE_LICENSE_FILES = COPYING
+GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+GAUCHE_DEPENDENCIES = host-gauche
+GAUCHE_CONF_OPTS = \
+	--enable-ipv6 \
+	--enable-threads=default \
+	--enable-multibyte=utf-8
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
-- 
1.7.1

============================================================
    Hiroshi Kawashima
