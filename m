From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 00:06:00 +0100
Subject: [Buildroot] [PATCH] pinentry: fix ncurses' unsafe header path
In-Reply-To: <1425055087-9334-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 27 Feb 2015 16:38:07 +0000")
References: <1425055087-9334-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87vbinymxz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > pinentry sets the NCURSES_INCLUDE variable in the Makefile to
 > /usr/include/ncurses and that causes problems when cross-compiling
 > because it fails with an error like this one:

 > Making all in curses
 > make[3]: Entering directory `/br/output/build/pinentry-0.9.0/curses'
 > /br/output/host/usr/bin/mips64el-ctng_n64-linux-gnu-gcc -DHAVE_CONFIG_H
 > -I. -I..  -I/usr/include/ncursesw -I../pinentry -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall  -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -Wall -Wcast-align
 > -Wshadow -Wstrict-prototypes -Wno-pointer-sign -c pinentry-curses.c
 > mips64el-ctng_n64-linux-gnu-gcc: ERROR: unsafe header/library path used
 > in cross-compilation: '/usr/include/ncursesw'
 > make[3]: *** [pinentry-curses.o] Error 1

 > Fixes:

 >   http://autobuild.buildroot.net/results/5b9/5b9b53a37f7cf4bab4d989f852726a0f0885605f/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/pinentry/pinentry.mk |    1 +
 >  1 files changed, 1 insertions(+), 0 deletions(-)

 > diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
 > index f34cc0e..b38ebb4 100644
 > --- a/package/pinentry/pinentry.mk
 > +++ b/package/pinentry/pinentry.mk
 > @@ -21,6 +21,7 @@ endif
 
 >  # pinentry-ncurses backend
 >  ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
 > +PINENTRY_CONF_ENV += inetutils_cv_includedir_ncurses=$(STAGING_DIR)/usr/include/ncurses

Thanks, but we don't actually install anything under
$(STAGING_DIR)/usr/include/ncurses (it is directly in
$(STAGING_DIR)/usr/include). Looking at the configure script, the
documented way of not adding a special -I for ncurses is simply to pass
--with-ncurses-include-dir=none so I've changed it to use that instead.

-- 
Bye, Peter Korsgaard
