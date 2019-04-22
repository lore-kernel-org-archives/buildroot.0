From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:28:09 +0200
Subject: [Buildroot] [git commit] package/ncmpc: fix build with NLS
Message-ID: <20190422202330.5FA658147F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fc5380863f1bd4e848d7b5d5b47ef3cda42c133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d53978fb30d77cb4d10921bf721eff3d066567ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-meson.build-link-with-lintl-if-needed.patch | 38 ++++++++++++++++++++++
 package/ncmpc/ncmpc.mk                             |  7 +++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
new file mode 100644
index 0000000000..248086fb65
--- /dev/null
+++ b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
@@ -0,0 +1,38 @@
+From 21ad6bf2bcb0745c25a28637449a72eee883a8e2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Apr 2019 19:19:10 +0200
+Subject: [PATCH] meson.build: link with lintl if needed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d53978fb30d77cb4d10921bf721eff3d066567ce
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent as upstream already rejected the first patch
+on atomic: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
+---
+ meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 2e6defc..28e9d29 100644
+--- a/meson.build
++++ b/meson.build
+@@ -42,6 +42,7 @@ else
+ endif
+ conf.set('ENABLE_NLS', enable_nls)
+ if enable_nls
++  intl_dep = cc.find_library('intl', required: false)
+   conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
+   subdir('po')
+ endif
+@@ -356,6 +357,7 @@ ncmpc = executable('ncmpc',
+     boost_dep,
+     pcre_dep,
+     curses_dep,
++    intl_dep,
+     lirc_dep,
+     libmpdclient_dep,
+   ],
+-- 
+2.20.1
+
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 88cf313249..f0fe3fe374 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -8,7 +8,12 @@ NCMPC_VERSION_MAJOR = 0
 NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).34
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
-NCMPC_DEPENDENCIES = boost host-pkgconf libmpdclient ncurses
+NCMPC_DEPENDENCIES = \
+	boost \
+	host-pkgconf \
+	libmpdclient \
+	ncurses \
+	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
