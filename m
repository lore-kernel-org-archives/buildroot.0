From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 07:49:45 +0200
Subject: [Buildroot] [git commit] ncmpc: new package
Message-ID: <20140708085415.E3E189D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59bf5cfbf49ebc0926ba25093ce94f1d59b31240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/ncmpc/Config.in |   18 ++++++++++++++++++
 package/ncmpc/ncmpc.mk  |   15 +++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9beab7a..8e1c391 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -20,6 +20,7 @@ menu "Audio and video applications"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
 	source "package/musepack/Config.in"
+	source "package/ncmpc/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
new file mode 100644
index 0000000..324d8f7
--- /dev/null
+++ b/package/ncmpc/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NCMPC
+	bool "ncmpc"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBMPDCLIENT
+	select BR2_PACKAGE_NCURSES
+	help
+	  ncmpc is a fully featured MPD client, which runs in a terminal
+	  (using ncurses). Its goal is to provide a keyboard oriented
+	  and consistent interface to MPD, without wasting resources.
+
+	  http://www.musicpd.org/clients/ncmpc/
+
+comment "ncmpc needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
new file mode 100644
index 0000000..21ac0ae
--- /dev/null
+++ b/package/ncmpc/ncmpc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# ncmpc
+#
+################################################################################
+
+NCMPC_VERSION_MAJOR = 0
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).21
+NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.gz
+NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
+NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
+NCMPC_LICENSE = GPLv2+
+NCMPC_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
