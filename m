From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 22 Sep 2014 22:54:50 +0200
Subject: [Buildroot] [PATCH] util-linux: disable more command for host build
Message-ID: <1411419290-32334-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following compile error (in case neither curses or ncurses
development files are installed on the build host):

text-utils/more.c: In function ?screen?:
text-utils/more.c:692:4: warning: implicit declaration of function ?my_putstring? [-Wimplicit-function-declaration]
text-utils/more.c:692:4: warning: nested extern declaration of ?my_putstring? [-Wnested-externs]
text-utils/more.c: In function ?initterm?:
text-utils/more.c:1798:3: warning: implicit declaration of function ?my_setupterm? [-Wimplicit-function-declaration]
text-utils/more.c:1798:3: warning: nested extern declaration of ?my_setupterm? [-Wnested-externs]
text-utils/more.c:1806:5: warning: implicit declaration of function ?my_tgetnum? [-Wimplicit-function-declaration]
text-utils/more.c:1806:5: warning: nested extern declaration of ?my_tgetnum? [-Wnested-externs]
text-utils/more.c:1806:22: error: ?TERM_LINES? undeclared (first use in this function)
text-utils/more.c:1806:22: note: each undeclared identifier is reported only once for each function it appears in
text-utils/more.c:1807:23: error: ?TERM_COLS? undeclared (first use in this function)
text-utils/more.c:1816:4: warning: implicit declaration of function ?my_tgetflag? [-Wimplicit-function-declaration]
text-utils/more.c:1816:4: warning: nested extern declaration of ?my_tgetflag? [-Wnested-externs]
text-utils/more.c:1816:34: error: ?TERM_HARD_COPY? undeclared (first use in this function)
text-utils/more.c:1821:20: error: ?TERM_EAT_NEW_LINE? undeclared (first use in this function)
text-utils/more.c:1827:23: error: ?TERM_AUTO_RIGHT_MARGIN? undeclared (first use in this function)
text-utils/more.c:1828:25: error: ?TERM_CEOL? undeclared (first use in this function)
text-utils/more.c:1829:4: warning: implicit declaration of function ?my_tgetstr? [-Wimplicit-function-declaration]
text-utils/more.c:1829:4: warning: nested extern declaration of ?my_tgetstr? [-Wnested-externs]
text-utils/more.c:1829:25: error: ?TERM_CLEAR_TO_LINE_END? undeclared (first use in this function)
text-utils/more.c:1830:23: error: ?TERM_CLEAR? undeclared (first use in this function)
text-utils/more.c:1831:24: error: ?TERM_STANDARD_MODE? undeclared (first use in this function)
text-utils/more.c:1832:23: error: ?TERM_EXIT_STANDARD_MODE? undeclared (first use in this function)
text-utils/more.c:1833:31: error: ?TERM_STD_MODE_GLITCH? undeclared (first use in this function)
text-utils/more.c:1842:20: error: ?TERM_UNDERLINE? undeclared (first use in this function)
text-utils/more.c:1843:23: error: ?TERM_OVER_STRIKE? undeclared (first use in this function)
text-utils/more.c:1845:27: error: ?TERM_UNDERLINE_CHAR? undeclared (first use in this function)
text-utils/more.c:1848:21: error: ?TERM_ENTER_UNDERLINE? undeclared (first use in this function)
text-utils/more.c:1850:17: error: ?TERM_EXIT_UNDERLINE? undeclared (first use in this function)
text-utils/more.c:1862:29: error: ?TERM_PAD_CHAR? undeclared (first use in this function)
text-utils/more.c:1864:22: error: ?TERM_HOME? undeclared (first use in this function)
text-utils/more.c:1867:21: error: ?TERM_CURSOR_ADDRESS? undeclared (first use in this function)
text-utils/more.c:1869:10: warning: implicit declaration of function ?my_tgoto? [-Wimplicit-function-declaration]
text-utils/more.c:1869:10: warning: nested extern declaration of ?my_tgoto? [-Wnested-externs]
text-utils/more.c:1869:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
text-utils/more.c:1876:24: error: ?TERM_CLEAR_TO_SCREEN_END? undeclared (first use in this function)
text-utils/more.c:1877:27: error: ?TERM_LINE_DOWN? undeclared (first use in this function)
text-utils/more.c: In function ?reset_tty?:
text-utils/more.c:2142:3: warning: implicit declaration of function ?tputs? [-Wimplicit-function-declaration]
text-utils/more.c:2142:3: warning: nested extern declaration of ?tputs? [-Wnested-externs]
make[4]: *** [text-utils/more-more.o] Error 1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7376886..28c96a7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -96,7 +96,7 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--enable-libuuid \
 	--disable-agetty --disable-cramfs --disable-fallocate \
 	--disable-fsck --disable-libblkid --disable-libmount \
-	--disable-login --disable-mount --disable-partx \
+	--disable-login --disable-mount --disable-more --disable-partx \
 	--disable-pivot_root --disable-rename --disable-schedutils \
 	--disable-su --disable-switch_root --disable-unshare \
 	--disable-uuidd --disable-wall --without-ncurses
-- 
1.8.1.4
