From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 28 Aug 2009 19:09:27 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090827074957.GB19075@mx.loc>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
	<20090827074957.GB19075@mx.loc>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, August 27, 2009 12:50 AM, Bernhard Reutner-Fischer wrote:
> On Wed, Aug 26, 2009 at 05:50:55PM -0400, H Hartley Sweeten wrote:
>> diff a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
>> --- a/toolchain/external-toolchain/ext-tool.mk
>> +++ b/toolchain/external-toolchain/ext-tool.mk
>> @@ -205,12 +205,26 @@
>>  EXTERNAL_LIBS+=libstdc++.so
>>  endif
>>  
>> -SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
>> +# We need to pass the -march= option in order to get the correct
>> +# multilib sysroot with CROSS-gcc -print-sysroot.
>> +ifneq ($(CC_TARGET_ARCH_),)
>> +SYSROOT_CFLAGS=-march=$(CC_TARGET_ARCH_)
>> +endif
> 
> Not that i'd care, but you should always check against (and of course
> use) the full set of flags anyway.

For my particular toolchain the only option that determines the correct
sysroot for "my" architecture is the -march=armv4t one.  For complete
support I agree that all the flags should be used. But, TARGET_CFLAGS
can't be used since it includes "--sysroot $(STAGING_DIR)".

>> Every time I press Enter after that I get:
>>
>> sh (441): undefined instruction: pc=0007514c
>> Code: e1530001 9a00006f e1110002 0a000071 (e16f2f13)
>>
>> Please press Enter to activate this console.
>>
>> I'm not sure how to figure out what the undefined instruction was but my
>> guess is it's an ARMv5T instruction.  It seems like something in the busybox
>> build did not honor the TARGET_CFLAGS that were setup for my build.
>>
>> TARGET_CFLAGS= -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/bigguiness/buildroot/build_arm/staging_dir/
>> 
>> Does anyone have any ideas on this?
> 
> see above. Sounds most likely like an incorrectly used toolchain. I'd
> usually say that you should go bug the people who provide that
> toolchain (or use the internal toolchain ;), but i'm pretty sure that
> in this particular case you just use it incorrectly.

I think I'm using the toolchain correctly.  If I create a dummy init program
and replace sbin/init with it I don't get any error messages.

I have narrowed down what application is dying during the init, it appears
to be hotplug.  The hotplug.mk file does the build by:

$(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)
	$(MAKE) CROSS=$(TARGET_CROSS) DEBUG=false KLIBC=false \
	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
	    TARGET_DIR=$(TARGET_DIR) -C $(HOTPLUG_DIR)
	$(STRIPCMD) $(HOTPLUG_DIR)/hotplug
	touch -c $(HOTPLUG_DIR)/hotplug

TARGET_CFLAGS is not passed to the underlying Makefile.  The Makefile then appends
a number of options to CFLAGS and does:

hotplug: hotplug.c
	$(CC) $(CFLAGS) $(LDFLAGS) hotplug.c -o hotplug
	$(STRIPCMD) hotplug

End of the day this all boils down to the following on my system:

/usr/bin/make -j1 CROSS=/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi- DEBUG=false KLIBC=false \
            KERNEL_INCLUDE_DIR=/home/bigguiness/buildroot/build_arm/staging_dir/usr/include \
            TARGET_DIR=/home/bigguiness/buildroot/project_build_arm/ep9307/root -C /home/bigguiness/buildroot/build_arm/diethotplug-0.5
make[1]: Entering directory `/home/bigguiness/buildroot/build_arm/diethotplug-0.5'
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc -pipe -Wall -Wshadow -Wstrict-prototypes -Os -fomit-frame-pointer -D_GNU_SOURCE -s -Wl,-warn-common hotplug.c -o hotplug
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-strip -s --remove-section=.note --remove-section=.comment hotplug
make[1]: Leaving directory `/home/bigguiness/buildroot/build_arm/diethotplug-0.5'
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-strip --remove-section=.comment --remove-section=.note /home/bigguiness/buildroot/build_arm/diethotplug-0.5/hotplug
touch -c /home/bigguiness/buildroot/build_arm/diethotplug-0.5/hotplug

The -march=armv4t (and --sysroot for that matter) is missing.  I have looked at
a number of other packages and seen similar problems.  The only ones that appear
to be ok are the ones that use AUTOTARGETS since the .stamp_configured rule
uses $(TARGET_CONFIGURE_ENV) which has the correct flags.  This is assuming
that the ./configure step correctly passes the flags into the resulting Makefile.

So basically I'm still stuck... I can kind of see what the problem is but I'm
still not sure how to fix it...

Any ideas?

Regards,
Hartley
