From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:10:48 +0200
Subject: [Buildroot] iproute2 binaries getting linked against libelf,
 which is not available in target
In-Reply-To: <021201d64596$e75979a0$b60c6ce0$@ipcomm.de>
References: <021201d64596$e75979a0$b60c6ce0$@ipcomm.de>
Message-ID: <20200618211048.00347d62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 19:35:48 +0200 (CEST)
Andreas Hilse <andreas.hilse@ipcomm.de> wrote:

> I found an issue with buildroot 2020.02.x concerning iproute2 binaries
> being linked against libelf.
> 
> According to iproute2.mk it should only link against libelf if
> BR2_PACKAGE_ELFUTILS is selected.
> But it also links against libelf without that option selected and thus
> renders the created binaries unusable in the target system.
> 
> After digging further I found that this is due to the iproute2 configure
> script detecting libelf being available in the used toolchain
> (crosstool-ng companion library).

So your crosstool-ng toolchain comes with more libraries than just the
C library ? Buildroot really expects external toolchains to be "pure"
toolchains, i.e with only the C library and no other additional library.

> After finding out I can work around this issue.
> I thought this might be a thing to be addressed in buildroot, but I'm not
> sure how to approach it.

There is no provision in the iproute2 configure script to explicitly
disable a functionality. So we would have to patch this configure
script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
