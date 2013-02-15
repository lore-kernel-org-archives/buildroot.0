From: Greg Beresford <greg.beresford@zbdsolutions.com>
Date: Fri, 15 Feb 2013 11:22:00 +0000
Subject: [Buildroot] Using external toolchain wrapper outside of buildroot
Message-ID: <BF980CD5635D994FA25831A4A9C113BF1328583EBE@THHS2E12BE9X.hostedservice2.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It looks like making the external toolchain wrapper relocatable may have broken it for use outside of buildroot. If you add the wrapper directory to your path and invoke the wrapper as arm-linux-gcc (for example), execution will enter the 'else' on line 76 of ext-toolchain-wrapper.c. This sets basename to arm-linux-gcc, which is fine, but it also sets absbasedir to whatever $(pwd)/../.. resolves to which then gets used when calculating the sysroot directory, resulting in gcc not having the real sysroot in its search paths.

The above all works fine if the wrapper is invoked with an absolute path. (I've not tried with a relative path with slashes in.)

I've attached a patch with a fix below which calculates absbasedir from /proc/self/exe. (I don't know of any other way of reliably getting the path to the current executable.) My C is rusty though, so it might need to be fixed up before it's applied. (Was there a reason for avoiding the basename and dirname functions from libgen.h?)

Cheers
Greg

zbd
d +44 (0) 1344 292 123  t +44 (0)1344 292 110
w  www.zbdsolutions.com
ZBD Displays Ltd | Building 3 | Kingswood | Kings Ride | Ascot | Berkshire | SL5 8AD | UK
