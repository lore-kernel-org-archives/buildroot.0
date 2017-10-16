From: Cam Hutchison <camh@xdna.net>
Date: Mon, 16 Oct 2017 12:13:51 +1100
Subject: [Buildroot] [PATCH 1/1] package/ncurses: Add option to install
	extra terminfo files.
Message-ID: <20171016011351.15816-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to ncurses to install extra user-configured terminfo
files. By default, only a small number of vital terminfo files are
installed on the target. This allows a build to specify the terminfo
files it needs.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/ncurses/Config.in  | 10 ++++++++++
 package/ncurses/ncurses.mk |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 92be16435a..cabec4793e 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -23,4 +23,14 @@ config BR2_PACKAGE_NCURSES_TARGET_PROGS
 	help
 	  Include ncurses programs in target (clear, reset, tput, ...)
 
+config BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO
+	string "additional terminfo files to install"
+	help
+	  Whitespace separated list of terminfo files to install on the
+	  target. A small number of vital terminfo files are always
+	  installed. This list is in addition to the vital ones.
+
+	  The terminfo filenames should have the single letter path
+	  prefix. e.g. t/tmux.
+
 endif
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 94c8c9ade3..9ab81f2421 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -60,7 +60,8 @@ NCURSES_TERMINFO_FILES = \
 	v/vt220 \
 	x/xterm \
 	x/xterm-color \
-	x/xterm-xfree86
+	x/xterm-xfree86 \
+	$(BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO)
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
-- 
2.11.0
