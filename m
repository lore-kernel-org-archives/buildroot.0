From: kyak <bas@bmail.ru>
Date: Sun, 26 Jul 2015 20:46:36 +0300
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries must be
	set for cross-compiling
Message-ID: <1437932796-16216-1-git-send-email-bas@bmail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mikhail Peselnik <bas@bmail.ru>

These flags need to be set so that the configure script would
correctly use libICE from cross-toolchain rather than from host.
Also, the xterm package is missing the freetype2 dependency, as
noted by Romain Naour.

This fix is similar to "package/efl/libevas: x-includes and x-libraries
must be set for cross-compiling" done by Romain Naour on libecore.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
---
 package/xterm/Config.in | 1 +
 package/xterm/xterm.mk  | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index e17d2c6..f549df4 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XTERM
 	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_FREETYPE
 	help
 	  xterm terminal emulator
 
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 56f692d..f7a332d 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,6 +10,9 @@ XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
-XTERM_CONF_OPTS = --enable-256-color
-
+XTERM_CONF_OPTS = --enable-256-color \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--with-freetype-cflags=$(STAGING_DIR)/usr/include \
+	--with-freetype-libs=$(STAGING_DIR)/usr/lib
 $(eval $(autotools-package))
-- 
2.4.6
