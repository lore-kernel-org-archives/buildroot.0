From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 01:15:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel targe etc...
References: <20070731145959.C5111A4595@busybox.net><20070731161525.GB9378@aon.at>
	<0707312219520.11633@somehost>
Message-ID: <00ae01c7d3fa$8fbc1020$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Cristian Ionescu-Idbohrn" <cristian.ionescu-idbohrn@axis.com>
To: <buildroot@uclibc.org>
Sent: Tuesday, July 31, 2007 10:24 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot: target/device target/device/Atmel targe etc...


> On Tue, 31 Jul 2007, Bernhard Fischer wrote:
> 
>> You broke using snapshots.
>>
>> []
>> bzcat /tmp/buildroot_trunk/.down/uClibc-snapshot.tar.bz2 | tar -C /tmp/buildroot_trunk/toolchain_build_i386   -xf -
>> toolchain/patch-kernel.sh /tmp/buildroot_trunk/toolchain_build_i386/uClibc  uClibc.\*.patch
>> Aborting.  'uClibc.*.patch' is not a directory.
> 
> Even non-snapshots are broken :(  This seems to be the place where it
> happens:
> 
> ,----
> | ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
> | toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch
> | else
> | toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc.\*.patch
> | endif
> `----
> 
> Reversing $(UCLIBC_PATCH_DIR) to toolchain/uClibc/ unbreaks it.
> 
> 


I test built an x86 and avr32 toolchain before submitting, but missed out on the snapshot.
Do not see that non-snapshots are broken.    make uclibc-unpacked executes normally on my system.
Pls submit the error message if you really see this.

The problem is that UCLIBC_PATCH_DIR is empty when there is a snapshot.
UCLIBC_PATCH_DIR:=toolchain/uClibc/
will fix that (tested make uclibc-unpacked with and without snapshot right now)

gdb seems to have the same problem.
gcc snapshot should have the PATCH_DIR set already.

Best Regards
Ulf Samuelsson 
