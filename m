From: Mikhail Peselnik <bas@bmail.ru>
Date: Mon, 27 Jul 2015 17:46:50 +0300
Subject: [Buildroot] [PATCH 2/2] package/xterm: compile with libXft support
	when it selected
In-Reply-To: <1438008410-1465-1-git-send-email-bas@bmail.ru>
References: <1438008410-1465-1-git-send-email-bas@bmail.ru>
Message-ID: <1438008410-1465-2-git-send-email-bas@bmail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libXft (FreeType) library is selected, xterm will use it.
host-pkgcong is used to search for libXft during configure, so it
is in the dependencies.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
---
 package/xterm/xterm.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 778b40c..e7afff2 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -7,11 +7,19 @@
 XTERM_VERSION = 314
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = ncurses xlib_libXaw
+XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
 XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+XTERM_DEPENDENCIES += xlib_libXft
+XTERM_CONF_OPTS += --enable-freetype \
+	--with-freetype-config=auto
+else
+XTERM_CONF_OPTS += --disable-freetype
+endif
+
 $(eval $(autotools-package))
-- 
2.4.6
