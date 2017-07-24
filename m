From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:27:16 +0200
Subject: [Buildroot] [PATCH 3/3] grep: remove musl build workaround
In-Reply-To: <f9b18f3f76137e6c4de2d0a72154ec79223019d9.1500868794.git.baruch@tkos.co.il>
References: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
 <f9b18f3f76137e6c4de2d0a72154ec79223019d9.1500868794.git.baruch@tkos.co.il>
Message-ID: <20170724182716.6b515984@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 06:59:54 +0300, Baruch Siach wrote:
> Commit de903755d79e (grep: fix build failure for musl) added
> --with-included-regex to configure options in musl builds. The commit log
> mentions build failure because grep configure doesn't detect the missing libc
> regex support. Unfortunately, the commit log adds no details on said build
> failure, or any autobuilder reference. The autobuilder didn't record
> any grep build failure for version 2.20 that was current at the time.
> 
> Build with musl succeeds nowadays, so remove the workaround.

I tried to research a bit for this one, but couldn't find anything.
Even grep 2.20 had m4/regex.m4 that was checking if there is a working
regex implementation in the C library, and if not falls back on using
the gnulib provided version. And this AC_RUN_IFELSE() test properly
defaults to assuming that the libc doesn't provide a regex
implementation when cross-compiling (because AC_RUN_IFELSE tests can't
be executed when cross compiling).

So I'm a bit puzzled why this was needed in the first place. I've
applied, and we'll see if anyone complains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
