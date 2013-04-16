From: Greg Beresford <greg.beresford@zbdsolutions.com>
Date: Tue, 16 Apr 2013 12:47:22 +0100
Subject: [Buildroot] Problem with external toolchain sysroot and eclipse
In-Reply-To: <6119D107D82B0940B389FAED3F2DDE6615882483@Ansuz.hms.se>
References: <6119D107D82B0940B389FAED3F2DDE66158823C4@Ansuz.hms.se>
 <20130416093325.57cfc00e@skate>
 <6119D107D82B0940B389FAED3F2DDE6615882483@Ansuz.hms.se>
Message-ID: <BF980CD5635D994FA25831A4A9C113BF132BF1CE39@THHS2E12BE9X.hostedservice2.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lars Dunemark,

On 16 April 2013 12:16, Lars Dunemark wrote:

> Eg absolute path works:
> $ ./output/host/usr/bin/arm-none-linux-gnueabi-gcc
> arm-none-linux-gnueabi-gcc: fatal error: no input files
>
> and using PATH failes:
> $ pwd
> /media/build/source/buildroot
> $ arm-none-linux-gnueabi-gcc
> /media/build/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc: No such
> file or directory

It looks like making the external toolchain wrapper relocatable has broken it for use outside of buildroot. If you add the wrapper directory to your path and invoke the wrapper as arm-linux-gcc (for example), execution will enter the 'else' on line 76 of ext-toolchain-wrapper.c. This sets basename to arm-linux-gcc, which is fine, but it also sets absbasedir to whatever $(pwd)/../.. resolves to which then gets used when calculating the sysroot directory, resulting in gcc not having the real sysroot in its search paths.

The above all works fine if the wrapper is invoked with an absolute path. (I've not tried with a relative path with slashes in.)

I've got a patch with a fix which calculates absbasedir from /proc/self/exe. (I don't know of any other way of reliably getting the path to the current executable.) My C is rusty though, so it might need to be fixed up before it's applied. Also, I don't know if there was there a reason for avoiding the basename and dirname functions from libgen.h. I've not sent a properly git formatted patch before, (and I can't send email from my development machine), so it'll be a day or so before I can put a properly formatted patch together, or you can just pull it from the badly formatted patch in this email: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/54942

Regards
Greg Beresford


Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. ZBD Displays accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. ZBD Displays Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine Road, Malvern,  Worcestershire, WR14 3SZ, UK

______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
For more information please visit http://www.symanteccloud.com
______________________________________________________________________
