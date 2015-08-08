From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 08 Aug 2015 14:23:04 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: add support for gcc
 version dependency
In-Reply-To: <20150805121441.13c3a165@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804194948.GV3647@free.fr>
 <20150805121441.13c3a165@free-electrons.com>
Message-ID: <1439036584.12501.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni, Yann Y. Marin,

On Mi, 2015-08-05 at 12:14 +0200, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Tue, 4 Aug 2015 21:49:48 +0200, Yann E. MORIN wrote:
> 
> > That's not true for the BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 
> > toolchain:
> > 
> >     $ ./host/opt/ext-toolchain/bin/aarch64-linux-gnu-gcc --version
> >     aarch64-linux-gnu-gcc (crosstool-NG linaro-1.13.1-4.9-2014.09 -
> >     Linaro GCC 4.9-2014.09) 4.9.2 20140904 (prerelease)
> > 
> > Here's a better sed-expr that should match it too, as well as the 
> > other
> > gcc versions; we'll make the assumption that the version string is 
> > right
> > after the first closing parenthesis:
> > 
> >     sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/; 
> > s/\.[[:digit:]]+$//;'
> > 
> > Explanations;
> > 
> >   - 1!d
> >       - delete if not line 1  (i.e. your 'head -n1')
> > 
> >   - s/^[^)]+\) ([^[:space:]]+).*/\1/
> >       - eat all until the first ')' character followed by a space
> >       - match as many non-space chars as possible
> >       - eat all the remaining chars on the line
> >       - replace by the matched expression
> > 
> >   - s/\.[[:digit:]]+$//
> >       - eat a dot followed by as many digits as possible up to the 
> > end
> >         of line
> >       - replace with nothing
> 
> Thanks! I've used your regexp, and also copy/pasted your explanation
> into the code. I just had to replace $ by $$ to cope with make 
> escaping.

This regex does not produce the version string 5 for my GCC 5.2
toolchain built with BR and included as external toolchain.

$ output/host/usr/bin/arm-linux-gcc --version
    arm-linux-gcc (Buildroot 2015.08-rc1-01365-gec8cd42) 5.2.0
    Copyright (C) 2015 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There
    is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
    PURPOSE.

$ output/host/usr/bin/arm-linux-gcc --version | sed -r -e '1!d;
s/^[^)]+\) ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$$//;'
    5.2

Best regards
J?rg Krause
