From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Sun, 29 Jun 2014 09:59:47 +0000
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <CAAXf6LU3yfD-6mUJ+smNhVDyChPCFv53s7PPVFJYm0A6cdGMgw@mail.gmail.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>,
 <CAAXf6LU3yfD-6mUJ+smNhVDyChPCFv53s7PPVFJYm0A6cdGMgw@mail.gmail.com>
Message-ID: <4881796E12491D4BB15146FE0209CE6464B4B7C8@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> There are other occurrences of MAKE1 in uclibc.mak: for the oldconfig
> step (in SETUP_DOT_CONFIG), configure commands, installation commands,
> and menuconfig step.
> I think these should be replaced by MAKE too (and tested, of course).

I did notice there're many more MAKE1 in use.

But knowing unfortunate fate of uClibc in terms of parallel building I wanted to do minimal changes that still make significant difference in Buildroot usage (i.e. make building faster).
The most time consuming process is uClibc building itself and I made it parallel - that shortens uClibc significantly.

As for other invocations of MAKE1 IMHO there's not much sense in use of parallel make for configuration like "oldconfig" and friends (not much things here are compiled) or "install" (where we only have file copy operations and that's why I don't expect any gain in speed if we run them in parallel).

So I'd prefer to proceed with incremental changes. Once parallel build is proven for all arches by autobuilder (which may disclose issues on arches I haven't try the change yet - I did tests for ARC and x86) we may consider more changes (note I already found that built-in tests won't build in parallel).

What do you think?

-Alexey
