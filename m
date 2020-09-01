From: Joachim Wiberg <troglobit@gmail.com>
Date: Tue,  1 Sep 2020 07:38:59 +0200
Subject: [Buildroot] [PATCH v2] package/mg: new package
Message-ID: <20200901053858.156993-1-troglobit@gmail.com>
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
Changes v1 -> v2:
  - mg2a -> mg in mg.mk comment (suggested by Thomas Pettazoni)
  - Fix copy-paste in mg.hash comment (suggested by Gilles Talis)
  - Add mg to my DEVELOPERS entry (suggested by Gilles)
  - Update my last name in DEVELOPERS
  - Drop install+gzip of tutorial (Gilles and Thomas)
  - Simplify mg.mk, standard install target is sufficient
  - Add `--with-curses` to MG_CONF_OPTS (Gilles and Thomas)
  - Run test-pkg, 5/6 OK (cortex m4 SKIPPED) (Gilles)

---
 DEVELOPERS           |  3 ++-
 package/Config.in    |  1 +
 package/mg/Config.in | 18 ++++++++++++++++++
 package/mg/mg.hash   |  5 +++++
 package/mg/mg.mk     | 19 +++++++++++++++++++
 5 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/mg/Config.in
 create mode 100644 package/mg/mg.hash
 create mode 100644 package/mg/mg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..e016774ee9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1280,9 +1280,10 @@ F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
-N:	Joachim Nilsson <troglobit@gmail.com>
+N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/mg/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
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
index 0000000000..758a5232d4
--- /dev/null
+++ b/package/mg/mg.hash
@@ -0,0 +1,5 @@
+# From https://github.com/troglobit/mg/releases/tag/v3.4
+md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
+# Locally computed:
+sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
+sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
new file mode 100644
index 0000000000..e3b79da006
--- /dev/null
+++ b/package/mg/mg.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mg
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
+MG_CONF_OPTS += --with-curses
+else
+MG_CONF_OPTS += --without-curses
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1
