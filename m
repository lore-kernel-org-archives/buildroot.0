From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:52:20 +0100
Subject: [Buildroot] [git commit] ncurses: install 256 color terminfo files
 unconditionally
Message-ID: <20180107225230.48A0E83652@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09dd9d1755ee321514ad1e47fe3b70aa63201395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are three 256 color terminfo files that buildroot only installs
if ncurses is configured with wide character support, which also
enables ext-color. There is a fourth 256 color terminfo file that does
not depend on wchar suport and is always installed.

This changes that to always install all four 256 color terminfo files.

When ncurses has ext-colors enabled,it allows 256 fg and bg colors at
the same time. Without ext-colors, it is still possible to use the 256
color terminfo files and one can get a combination of fb and bg colors
that equals up to 256, e.g. 256 fg colors on one background or 16 fg
and 16 bg colors.

In short, the 256 color files work fine without wchar or ext-color
support and support more colors than the normal xterm, etc.  terminfo
files. It's common today for the default terminal to use
xterm-256color and it's nice if thinks like vim and top work out of
the box.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 94c8c9a..e63b6e4 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -50,6 +50,7 @@ NCURSES_TERMINFO_FILES = \
 	d/dumb \
 	l/linux \
 	p/putty \
+	p/putty-256color \
 	p/putty-vt100 \
 	s/screen \
 	s/screen-256color \
@@ -59,6 +60,8 @@ NCURSES_TERMINFO_FILES = \
 	v/vt200 \
 	v/vt220 \
 	x/xterm \
+	x/xterm+256color \
+	x/xterm-256color \
 	x/xterm-color \
 	x/xterm-xfree86
 
@@ -97,10 +100,6 @@ NCURSES_LINK_STAGING_LIBS = \
 NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC)
 
 NCURSES_CONF_OPTS += --enable-ext-colors
-NCURSES_TERMINFO_FILES += \
-	p/putty-256color \
-	x/xterm+256color \
-	x/xterm-256color
 
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
