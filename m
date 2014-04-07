From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon,  7 Apr 2014 12:00:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/zile: add Zile is Lossy Emacs editor
In-Reply-To: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
Message-ID: <1396868422-5757-3-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a lightweight Emacs clone useful for embedded systems. I nabbed
the help2man disable patch from OpenEmbedded.

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
Signed-off-by: Alex Benn?e <alex@bennee.com>
---
 package/Config.in                  |  1 +
 package/zile/Config.in             | 14 ++++++++++++++
 package/zile/remove-help2man.patch | 28 ++++++++++++++++++++++++++++
 package/zile/zile.mk               | 13 +++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/zile/Config.in
 create mode 100644 package/zile/remove-help2man.patch
 create mode 100644 package/zile/zile.mk

diff --git a/package/Config.in b/package/Config.in
index 5cdf72b..99b0b96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,6 +1115,7 @@ source "package/uemacs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/vim/Config.in"
 endif
+source "package/zile/Config.in"
 endmenu
 
 endmenu
diff --git a/package/zile/Config.in b/package/zile/Config.in
new file mode 100644
index 0000000..29fb0fc
--- /dev/null
+++ b/package/zile/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_ZILE
+	bool "zile"
+        select BR2_PACKAGE_LIBGC
+	depends on BR2_USE_MMU # fork()
+	help
+	  Zile is Lossy Emacs
+
+          GNU Zile (Zile Is Lossy Emacs) is a lightweight Emacs clone. Every
+          Emacs user should feel at home with Zile. Zile is aimed at small
+          footprint systems (a typical binary is about 100Kb) and quick editing
+          sessions (it starts up and shuts down instantly).
+
+	  http://www.gnu.org/software/zile/
+
diff --git a/package/zile/remove-help2man.patch b/package/zile/remove-help2man.patch
new file mode 100644
index 0000000..c1a63f4
--- /dev/null
+++ b/package/zile/remove-help2man.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/Makefile.am b/Makefile.am
+index 54bc59f..46c2650 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -36,7 +36,6 @@ PERL_BUILDTIME =					\
+ 
+ EXTRA_DIST =						\
+ 	FAQ						\
+-	build-aux/zile-help2man-wrapper			\
+ 	$(PERL_BUILDTIME)
+ 
+ doc_DATA = AUTHORS FAQ NEWS
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 639f59c..8c5123e 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -33,9 +33,3 @@ doc/zile.1: $(srcdir)/doc/zile.1.in doc/Makefile.am config.status
+ 	$(edit) $(abs_srcdir)/doc/zile.1.in >$@.tmp
+ 	mv $@.tmp $@
+ 
+-$(srcdir)/doc/zile.1.in: doc/man-extras build-aux/zile-help2man-wrapper configure.ac $(builddir)/src/zile$(EXEEXT)
+-	@test -d doc || mkdir doc
+-## Exit gracefully if zile.1.in is not writeable, such as during distcheck!
+-	$(AM_V_GEN)if ( touch $@.w && rm -f $@.w; ) >/dev/null 2>&1; then \
+-	  $(srcdir)/build-aux/missing --run $(HELP2MAN) --output=$@ --no-info --name="Zile Is Lossy Emacs" --include $(srcdir)/doc/man-extras $(srcdir)/build-aux/zile-help2man-wrapper; \
+-	fi
diff --git a/package/zile/zile.mk b/package/zile/zile.mk
new file mode 100644
index 0000000..024595c
--- /dev/null
+++ b/package/zile/zile.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Zile
+#
+################################################################################
+
+ZILE_VERSION = 2.4.11
+ZILE_SITE = http://ftp.gnu.org/gnu/zile/
+ZILE_LICENSE = GPLv1+
+ZILE_LICENSE_FILES = COPYING
+ZILE_CONF_OPT += --without-help2man
+
+$(eval $(autotools-package))
-- 
1.9.1
