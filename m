From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 30 Jul 2007 16:54:59 +0200
Subject: [Buildroot] svn
	commit:trunk/buildroot/target/device/Atmel/u-boot
References: <20070729070516.A15AEA461B@busybox.net>
	<20070730101704.GI23273@aon.at>
Message-ID: <026701c7d2c2$c9020670$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: <buildroot@uclibc.org>
Cc: <ulf@atmel.com>
Sent: Monday, July 30, 2007 12:17 PM
Subject: Re: [Buildroot] svn commit:trunk/buildroot/target/device/Atmel/u-boot


> On Sun, Jul 29, 2007 at 12:05:16AM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-07-29 00:05:13 -0700 (Sun, 29 Jul 2007)
>>New Revision: 19312
>>
>>Log:
>>Reintroduce ATMEL_MIRROR in u-boot
>>
>>Modified:
>>   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
>>
>>
>>Changeset:
>>Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
>>===================================================================
>>--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk 2007-07-29 06:51:35 UTC (rev 19311)
>>+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk 2007-07-29 07:05:13 UTC (rev 19312)
>>@@ -8,6 +8,8 @@
>> #
>> #############################################################
>> UBOOT_VERSION:=1.2.0-atmel
>>+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
>>+#"))
> 
> This is redundant.
> What about doing this once, cleanly?
> 
> target/device/Atmel/Makefile.in would be the obvious place where i'd put
> this once and for all..
>

The AVR32 patches for the toolchain is 6-8 MB and I would like to avoid that.
I am working on a patch that will allow you to download prepatched source
for the AVR32 (binutils, gcc, uclibc and gdb).
Therefore, ATMEL_MIRROR needs to be set before the toolchain is built.

The first version had ATMEL_MIRROR set in each of the files.
The I moved to a common definition, which has to be before that,
so I put it in "package/Makefile.in", and this was reverted.
Since it needs to be available before the toolchain is built, 
Stephen suggested to have it in each toolchain Makefile, resulting in the
"VENDOR" patches, which I agree should be less vendor specific.

I spend some time thinking about  this today (while waiting on the tees of the local golfcourse)
and I think that the best idea is to have another option in the 
"Toolchain type" menu so you can select an externally prepatched toolchain.
(X) Buildroot toolchain
(  )  Prepatched toolchain source
(  )  External Toolchain

If you select "Prepatched toolchain source", then you get to select vendor as a choice.
Otherwise it is hidden.
Then the 
VENDOR_SITE
VENDOR_SUFFIX
VENDOR_RELEASE
strings are set.

VENDOR_SITE could be set to $(BR2_ATMEL_MIRROR) if an Atmel 
prepatched toolchain is selected.

If it is implemented this way, then ATMEL_MIRROR could be set
once in the "target/device/Atmel/Makefile.in"

Best Regards
Ulf Samuelsson
