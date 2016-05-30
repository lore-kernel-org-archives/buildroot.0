From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 09:55:39 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <20160530070635.GA27560@airbook.vandijck-laurijssen.be> (Kurt Van
 Dijck's message of "Mon, 30 May 2016 09:06:35 +0200")
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
Message-ID: <87mvn82d50.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > Some shells' builtin umask does not print 2 leading 0's for the umask.
 > Not doing so would break the comparison.
 > This patch makes sure that the umask has (at least) 4 digits.

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 > ---
 >  Makefile | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/Makefile b/Makefile
 > index 63502d0..9a36769 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -26,7 +26,7 @@
 
 >  # Trick for always running with a fixed umask
 >  UMASK = 0022
 > -ifneq ($(shell umask),$(UMASK))
 > +ifneq ($(shell printf "%04o\n" `umask`),$(UMASK))

Thanks, but with at least zsh this doesn't work:

zsh --version
zsh 5.0.7 (x86_64-pc-linux-gnu)

umask
022

printf "%04o\n" $(umask)
0026

It seems like the printf arguments are always handled as decimal.

It does work on bash though:

bash --version
GNU bash, version 4.3.33(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

umask
0022

printf "%04o\n" $(umask)
0022

It seems we need to use the base#number syntax, E.G. 8#`umask` to get
zsh to interprete it as octal, but bash doesn't seem to like it :/

But the real question is why this happens in the first place? We do set
SHELL=bash, so all of this should be running under bash where it works.

What shell are you using and how is your setup?

-- 
Bye, Peter Korsgaard
