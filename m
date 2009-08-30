From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 30 Aug 2009 13:03:18 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
	<20090827074957.GB19075@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
Message-ID: <20090830110318.GD7953@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 28, 2009 at 07:09:27PM -0400, H Hartley Sweeten wrote:
>On Thursday, August 27, 2009 12:50 AM, Bernhard Reutner-Fischer wrote:
>> On Wed, Aug 26, 2009 at 05:50:55PM -0400, H Hartley Sweeten wrote:
>>> diff a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
>>> --- a/toolchain/external-toolchain/ext-tool.mk
>>> +++ b/toolchain/external-toolchain/ext-tool.mk
>>> @@ -205,12 +205,26 @@
>>>  EXTERNAL_LIBS+=libstdc++.so
>>>  endif
>>>  
>>> -SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
>>> +# We need to pass the -march= option in order to get the correct
>>> +# multilib sysroot with CROSS-gcc -print-sysroot.
>>> +ifneq ($(CC_TARGET_ARCH_),)
>>> +SYSROOT_CFLAGS=-march=$(CC_TARGET_ARCH_)
>>> +endif
>> 
>> Not that i'd care, but you should always check against (and of course
>> use) the full set of flags anyway.
>
>For my particular toolchain the only option that determines the correct
>sysroot for "my" architecture is the -march=armv4t one.  For complete
>support I agree that all the flags should be used. But, TARGET_CFLAGS
>can't be used since it includes "--sysroot $(STAGING_DIR)".

If you would look at my tree then you would see why these live in
TARGET_CC_FLAGS, TARGET_LD_FLAGS :P
>
>>> Every time I press Enter after that I get:
>>>
>>> sh (441): undefined instruction: pc=0007514c
>>> Code: e1530001 9a00006f e1110002 0a000071 (e16f2f13)

>I have narrowed down what application is dying during the init, it appears
>to be hotplug.  The hotplug.mk file does the build by:

>The -march=armv4t (and --sysroot for that matter) is missing.  I have looked at
>a number of other packages and seen similar problems.  The only ones that appear
>to be ok are the ones that use AUTOTARGETS since the .stamp_configured rule
>uses $(TARGET_CONFIGURE_ENV) which has the correct flags.  This is assuming
>that the ./configure step correctly passes the flags into the resulting Makefile.
>
>So basically I'm still stuck... I can kind of see what the problem is but I'm
>still not sure how to fix it...

two options come to mind:
-) use busybox
-) use TARGET_CONFIGURE_ENV for "hotplug" (i.e. configure that package
correctly)
>
>Any ideas?

Your buildroot lacks some tweaks that you should pick from my tree
(IMO).

HTH,
