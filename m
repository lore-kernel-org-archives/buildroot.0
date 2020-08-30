From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 30 Aug 2020 11:00:51 +0200
Subject: [Buildroot] [PATCH] package/mg: new package
Message-ID: <20200830090050.889647-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mg is a small Emacs-like editor with no external dependencies except a
standard C library.  It weighs in at 130 kiB and is one of a select few
completely free (public domain) text editors suitable for small and
embedded systems.

This version is based on the OpenBSD Mg, but with more features, one of
which being the no-ncurses/termcap support, which heavily reduces the
impact on a resource constrained system.

Upstream: https://github.com/troglobit/mg/

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/Config.in    |  1 +
 package/mg/Config.in | 18 ++++++++++++++++++
 package/mg/mg.hash   |  5 +++++
 package/mg/mg.mk     | 24 ++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/mg/Config.in
 create mode 100644 package/mg/mg.hash
 create mode 100644 package/mg/mg.mk

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..db2563f789 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2431,6 +2431,7 @@ menu "Text editors and viewers"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
 	source "package/mc/Config.in"
+	source "package/mg/Config.in"
 	source "package/most/Config.in"
 	source "package/nano/Config.in"
 	source "package/uemacs/Config.in"
diff --git a/package/mg/Config.in b/package/mg/Config.in
new file mode 100644
index 0000000000..11e5bdb273
--- /dev/null
+++ b/package/mg/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_MG
+	bool "mg"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Emacs-like text editor (130 kiB)
+
+	  Mg is a MicroEMACS clone with the goal of being compatible
+	  with GNU Emacs, because there should never be any reason to
+	  learn more than one Emacs flavor.
+
+	  Unlike many other editors it does not require ncurses, only a
+	  standard C library, making it suitable for really small and
+	  embedded systems.
+
+	  This version is based on mg2a from OpenBSD, with more features
+	  and, in particular, no requirement on ncurses or termcap.
+
+	  https://github.com/troglobit/mg/
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
new file mode 100644
index 0000000000..6b3c400faa
--- /dev/null
+++ b/package/mg/mg.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
+md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
+# Locally computed:
+sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
+sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
new file mode 100644
index 0000000000..c8df6eddc6
--- /dev/null
+++ b/package/mg/mg.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# mg2a
+#
+################################################################################
+
+MG_VERSION = 3.4
+MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
+MG_LICENSE = Public Domain
+MG_LICENSE_FILES = UNLICENSE
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+MG_DEPENDENCIES += ncurses
+else
+MG_CONF_OPTS += --without-curses
+endif
+
+define MG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/tutorial $(TARGET_DIR)/usr/share/doc/tutorial
+	gzip -9 $(TARGET_DIR)/usr/share/doc/tutorial
+	$(INSTALL) -m 0755 -D $(@D)/src/mg $(TARGET_DIR)/usr/bin/mg
+endef
+
+$(eval $(autotools-package))
-- 
2.25.1
