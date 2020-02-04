From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 13:57:34 +0100
Subject: [Buildroot] [PATCH] package/grep: fix busybox aliasing
In-Reply-To: <1580813230-11405-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 4 Feb 2020 11:47:10 +0100")
References: <1580813230-11405-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87pneuldc1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > When grep package is selected, it should be installed at the same exact
 > location where busybox installs it too, this way the grep/egrep/fgrep
 > executables will end up overwriting the busybox provided ones.
 > Busybox installs *grep executables in /bin, grep package in /usr/bin.

 > Moreover, egrep/fgrep is using autotools SHELL variable to execve the
 > grep executable with correct options, SHELL is defaulted to /bin/bash
 > which is usually not available on target.

"Moreover" in a commit message is quite a strong hint that the commit is
doing several things ;)

Can you split it up into two commits, one for the prefix issue and one
for the SHELL issue?

I take it that you checked that the configure logic works with
SHELL=/bin/sh when that ISN'T bash?


 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  package/grep/grep.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/grep/grep.mk b/package/grep/grep.mk
 > index 96685b0..7365a57 100644
 > --- a/package/grep/grep.mk
 > +++ b/package/grep/grep.mk
 > @@ -10,6 +10,7 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 >  GREP_LICENSE = GPL-3.0+
 >  GREP_LICENSE_FILES = COPYING
 >  GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 > +GREP_CONF_OPTS = SHELL=/bin/sh --exec-prefix=/
 
 >  # link with iconv if enabled
 >  ifeq ($(BR2_PACKAGE_LIBICONV),y)
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
