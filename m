From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:15 -0000
Subject: [Buildroot] [git commit] package/ncurses: add option to install
 extra terminfo files
Message-ID: <20180305200712.3033E810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d020aeb60470c2ebf77cf10688e3d02cf0d3d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to ncurses to install extra user-configured terminfo
files. By default, only a small number of vital terminfo files are
installed on the target. This allows a build to specify the terminfo
files it needs.

Signed-off-by: Cam Hutchison <camh@xdna.net>
[Thomas: qstrip the variable before using it.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncurses/Config.in  | 10 ++++++++++
 package/ncurses/ncurses.mk |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index bb45bd8dc0..297b2ee415 100644
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
index 32ee085314..eccfbecb8b 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -63,7 +63,8 @@ NCURSES_TERMINFO_FILES = \
 	x/xterm+256color \
 	x/xterm-256color \
 	x/xterm-color \
-	x/xterm-xfree86
+	x/xterm-xfree86 \
+	$(call qstrip,$(BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO))
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
