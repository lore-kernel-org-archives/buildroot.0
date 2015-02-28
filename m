From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 08:10:48 +0100
Subject: [Buildroot] [git commit] pinentry: fix ncurses' unsafe header path
Message-ID: <20150228071137.B580E800AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63f5f44e6138344b31d81cf8b760ea613b00c75d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pinentry sets the NCURSES_INCLUDE variable in the Makefile to
/usr/include/ncurses and that causes problems when cross-compiling
because it fails with an error like this one:

Making all in curses
make[3]: Entering directory `/br/output/build/pinentry-0.9.0/curses'
/br/output/host/usr/bin/mips64el-ctng_n64-linux-gnu-gcc -DHAVE_CONFIG_H
-I. -I..  -I/usr/include/ncursesw -I../pinentry -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -Wall -Wcast-align
-Wshadow -Wstrict-prototypes -Wno-pointer-sign -c pinentry-curses.c
mips64el-ctng_n64-linux-gnu-gcc: ERROR: unsafe header/library path used
in cross-compilation: '/usr/include/ncursesw'
make[3]: *** [pinentry-curses.o] Error 1

Fixes:

  http://autobuild.buildroot.net/results/5b9/5b9b53a37f7cf4bab4d989f852726a0f0885605f/

[Peter: use --with-ncurses-include-dir=none instead]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/pinentry.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index f34cc0e..c4d83ee 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -21,7 +21,7 @@ endif
 
 # pinentry-ncurses backend
 ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
-PINENTRY_CONF_OPTS += --enable-ncurses
+PINENTRY_CONF_OPTS += --enable-ncurses --with-ncurses-include-dir=none
 PINENTRY_DEPENDENCIES += ncurses
 else
 PINENTRY_CONF_OPTS += --disable-ncurses
