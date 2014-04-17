From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 17 Apr 2014 13:19:39 +0100
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs editor
In-Reply-To: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
Message-ID: <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a lightweight Emacs clone useful for embedded systems. I nabbed
the help2man disable patch from OpenEmbedded.

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>

---
v2 - review comments
- fixup dependancies
- add s-o-b tag to patch
- fix whitespace

v3
- fix typo for DEPENDENCIES
- force AUTORECONF
- remove +=
- use BR2_GNU_MIRROR
- rename patch to zile-0001-remove-help2man.patch
---
 package/Config.in                            |  1 +
 package/zile/Config.in                       | 13 ++++++++++++
 package/zile/zile-0001-remove-help2man.patch | 30 ++++++++++++++++++++++++++++
 package/zile/zile.mk                         | 15 ++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/zile/Config.in
 create mode 100644 package/zile/zile-0001-remove-help2man.patch
 create mode 100644 package/zile/zile.mk

diff --git a/package/Config.in b/package/Config.in
index 51f2515..825aa73 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1124,6 +1124,7 @@ source "package/uemacs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/vim/Config.in"
 endif
+source "package/zile/Config.in"
 endmenu
 
 endmenu
diff --git a/package/zile/Config.in b/package/zile/Config.in
new file mode 100644
index 0000000..163b44d
--- /dev/null
+++ b/package/zile/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ZILE
+	bool "zile"
+	select BR2_PACKAGE_LIBGC
+	depends on BR2_USE_MMU # fork()
+	help
+	  Zile is Lossy Emacs
+
+	  GNU Zile (Zile Is Lossy Emacs) is a lightweight Emacs clone. Every
+	  Emacs user should feel at home with Zile. Zile is aimed at small
+	  footprint systems (a typical binary is about 100Kb) and quick editing
+	  sessions (it starts up and shuts down instantly).
+
+	  http://www.gnu.org/software/zile/
diff --git a/package/zile/zile-0001-remove-help2man.patch b/package/zile/zile-0001-remove-help2man.patch
new file mode 100644
index 0000000..d397543
--- /dev/null
+++ b/package/zile/zile-0001-remove-help2man.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
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
index 0000000..07226c6
--- /dev/null
+++ b/package/zile/zile.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# Zile
+#
+################################################################################
+
+ZILE_VERSION = 2.4.11
+ZILE_SITE = $(BR2_GNU_MIRROR)/zile
+ZILE_LICENSE = GPLv1+
+ZILE_LICENSE_FILES = COPYING
+ZILE_AUTORECONF = YES
+ZILE_CONF_OPT = --without-help2man
+ZILE_DEPENDENCIES = libgc
+
+$(eval $(autotools-package))
-- 
1.9.2
