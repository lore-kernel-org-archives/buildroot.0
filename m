From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 23:35:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/linux	toolchain/uClibc
In-Reply-To: <1191013162.5322.243.camel@elrond.atmel.sweden>
References: <20070928161816.E75B7A6889@busybox.net>
	<20070928165823.GN20951@aon.at>
	<1191013162.5322.243.camel@elrond.atmel.sweden>
Message-ID: <20070928213552.GD20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 10:59:22PM +0200, Ulf Samuelsson wrote:
>fre 2007-09-28 klockan 18:58 +0200 skrev Bernhard Fischer:
>> On Fri, Sep 28, 2007 at 09:18:16AM -0700, ulf at uclibc.org wrote:
>> >Author: ulf
>> >Date: 2007-09-28 09:18:16 -0700 (Fri, 28 Sep 2007)
>> >New Revision: 20085
>> >
>> >Log:
>> >Add administration for linux,uclibc and main
>> >
>> >Modified:
>> >   trunk/buildroot/Makefile
>> >   trunk/buildroot/target/linux/Makefile.in
>> >   trunk/buildroot/toolchain/uClibc/uclibc.mk
>> >
>> >
>> > 	cp $(shell find ./target/ -name $@) .config
>> > 	-@$(MAKE) oldconfig
>> > 
>> >+configured: dirs host-sed kernel-headers uclibc-configured busybox-config linux26-config
>> 
>> This is not adequate (external binary toolchains). Please be careful
>> 
>The purpose of the thing is to untar all the packages needing
>configuration, and the external binary toolchains does not need that.
>Can you explain further?

Will this work for external binary toolchains? I'm not sure if all of
those are wrapped in guards (and no, don't add them, please), so it
has to have different prerequisites depending on this fact.

>> Would have been nice if you had repaired that whitespace damage while
>> you touched that file..
>
>We should go out drinking, since you are picking up all the tabs :-)

;)
>I'll fix that...

You already did, thanks.

>> This whole block is suspicious. Previously, you could do a fresh
>> checkout and make uclibc-menuconfig and all was well, no superfluous
>> directories were made and all was clean, bright and shiny.
>
>> 
>> Please rethink this patch. A short glance leads me to believe that it's
>> not conceptually clean.
>> > 
>
>
>It is a matter of taste.
>If you do 
>make menuconfig
>make uclibc-menuconfig
>
>The previous behaviour would allow you to do the menuconfig immediately.

Yes, and this is a feature. Please make sure that you don't add a
regression in this area.

>The current behavour will start the build so that it is more or
>less equivalent to the position it would be if you type "make"
>and the build stopped just before uclibc-configuration.

Yes, this is a bug. There is no need to waste my time nor disk-space 
until i can start to configure buildroot, busybox, uclibc or the kernel.

>Everything in the config aadministration becomes easier
>if the unpack stuff depends on the dirs, and host-sed,
>but it may make sense to remove the kernel headers.
>
>uclibc-configured used to depend on kernel-headers, 
>but I do not understand why, right now.

uclibc-configured is just a short-hand for convenience.
Please read the uclibc.mk and understand it's interaction with the
kernel-headers. Before you do this, please revert the patch above and
play with it locally.

>$(UCLIBC_DIR)/.configured already depend on
>$(LINUX_HEADERS_DIR)/.configured

TIA,
