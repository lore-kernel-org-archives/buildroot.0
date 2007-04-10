From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 10 Apr 2007 15:11:13 +0200
Subject: [Buildroot] eric,
	please comment [was: [buildroot] Re: BSP patch]
References: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
	<20070410080525.GB13906@aon.at>
	<001d01c77b59$33037980$dcc4af0a@atmel.com>
	<20070410102946.GB15274@aon.at>
	<002301c77b60$51d44090$dcc4af0a@atmel.com>
	<20070410120053.GA16257@aon.at>
Message-ID: <009601c77b74$6854a8f0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




> Ulf,
> 
> [most of the stuff below should IMO be discussed on the list; please
> drop the parts you don't want in the archives and push to the list if
> it's ok with you. TIA]
> 
> On Tue, Apr 10, 2007 at 01:06:25PM +0200, Ulf Samuelsson wrote:
> 
>>>>Have been working on upgrading to a later version of buildroot/u-boot/linux
>>>>so now I can build:
>>>>* Bootstrap
>>>>* U-Boot
>>>>* Linux        - The current linux26.mk needs to be extensively
>>>>                      modified in order to be really useful.
>>> 
>>> Were your patches against linux26.mk in the tarball you sent to me and
> 
> Just glanced on your patch-tarball for a minute:
> - there are three *.orig* patches. cruft?
>  find ./ -name "*orig*"


I think either you are looking at the wrong patch, or I resend the wrong patch.
I may have sent all my stuff, to show where I am going, but that was 
intended as a preview, not a true patch submission

The patch I am referring to is only doing a few things:
1) Adding BR2_HOSTNAME    ( I already changed from BR2_BOARDNAME)
    because I wanted to separate the build from the board definition.
    This allows me to build several versions of root file system for the same board by having different hostnames.
    The definition is in the buildroot .config file.
    The contents of the TARGET_BUILD_DIR is dependent on the hostname, and not the boardname.
2) Adding TARGET_BUILD_DIR and BINARIES_DIR to "world" in the Makefile
3) Creates those two directories when first run
4) Adds definition of TARGET_BUILD_DIR and BINARIES_DIR in package/Makefile.in

> - wrong or missing prefix for BOARDNAME and BOARDPATH.
>  Please correct those to
>  BR2_BOARD_NAME
>  BR2_BOARD_PATH
>  we already use them for i386, thanks.

BR2_BOARD_PATH is used by x86, but not BR2_BOARD_NAME
As explained above, the purpose of the thing is not to define a board,
rather the configuration of the root file system.

BOARDNAME is a stripped BR2_BOARDNAME.
    I think you get the ' " ' character otherwise.

> I don't like the idea of the tftpboot dir.
> The user has to populate the tftpboot dir by hand anyway, i don't see
> why we should hardcode to create a /tftpboot which will need manual
> interaction anyway. Changing the default to /tftpboot may result in
> grief for folks who have / mounted ro as opposed to /var.
> 

Yes, but that is not part of the submitted patch.
I understand that this needs to be optional.
I would like the capability to copy to a download directory.
I talked to someone which would like to be able to ftp any 
updated binaries to his target system...

> 
> ./Atmel/target_device_Atmel_Linux_linux.mk.patch
> is a duplicate of
> target/linux26.mk
> Your changes will have to be merged into the latter.
> 
Already done that in my latest reincarnation, but that is not submitted yet.
> 
>>> Eric some days ago? I'm curious as to why you need extensive changes
>>> since linux26.mk seems relatively generic to me..
>>> 
>>No  linux26.mk, makes a lot of things fixed, that I want to have programmable.
>>
>>I want to 
>>* build it in the TARGET_BUILD_DIR directory.
>>* select the kernel I want to build in a Config.in.
>>   There may or may not be patches for the version currently
>>    promoted by the linux26.mk.
> 
> We'll remove the standalone kernel-headers then.
> This is not true, linux26.mk does not promote a version. What makes you
> believe it does?

linux-2.6.19 seems to be hard coded...

>>* I want to *download* the linux patch I want to apply instead of storing
>>   it in the buildroot image.
> 
> How do you know which patch(es) to download?

I specify that in a board specific file.

>>* I want to select zImage/vmlinux/bzImage etc in my target files
>>    not fix it in linux26.mk. Also added support for uImage
> 
> This, again, is not true. Please read the comment next to
> LINUX26_FORMAT.

You are right. 


>>    which will run mkimage on the uImage.
>>    This could be sloppy, I am not sure what an "zImage" is
>>    Maybe this is the same as running mkimage on uImage
> 
> It's a "small" resp. "normal" image as opposed to a "big" (bzImage). Let me
> refer to the kernel-docs for further information..
> 

Question is really:
    Is a mkimage'd uImage the same as a zImage?
    I have no clue, so I just added the things I know works and that is to 
    vmlinux->linux-bin->linux.bin.gz->mkimage

>>* I do not like the naming convention for the linux kernel use
>>    I *need* to know for which CPU the kernel is built.
>>    My name looks like
>>    at91sam9260ek-linux-2.6.20.4-2007-04-09.gz
> 
> ok. Still "at91sam9260ek" is not a cpu, is it?
"at91sam9260ek" is the name of the board, but it is really arbitrary.
Could be "ulfs-configurated-linux-2.6.20.4-2007-04-09.gz" if I set BR2_HOSTNAME to "ulfs-configurated"

The definition should be: 
    $(HOSTNAME)-linux-$(LINUX26_VERSION)-$(DATE).gz
    The name defines really the combination of .config's for  linux, buildroot and busybox
    and can be anything the user so decides.

> A cpu is something you can (oversimplified) pass as -mmcu / -mtune to
> gcc. An arch is an instruction-set family, a board is a conglomerate
> from instruction-set and other stuff.
> 


>>* I do not like that using external toolchain and internal toolchains
>>    result in different file names.
> 
> I don't do external toolchains, but can you give an example?
> 
In "package/Makefile.in" the symbol IMAGE is defined to be
IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)        if using buildroot
IMAGE:=$(BASE_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX) if using external toolchain


>>* Building an "-rcN" kernel is complex because if you
>>    want to build 2.6.21-rc1 you have to download 2.6.20 and
>>    patch against that, and not against 2.6.21 which does not exist.
> 
> read target/linux26.mk and notice that there is a distinction between
> DOWNLOAD_LINUX26_VERSION and LINUX26_VERSION.
> 

It has to do with how I select the linux kernel in my Config.in.

>>* I like to have the result into the $(BINARIES_DIR) directory
>>    as well as the /tftpboot directory.
>>* I do NOT want the kernel stored in the root file system
>>* I added a function to copy the linux/buildroot/busybox ".config" files
>>    into the "$(TARGET_DIR)/boot" directory, so you can take
>>    the file system and reproduce the system.
>>    This assumes that everything is built at the same time.
>>* Fixed a bug involving removing "-default" when adding modules
>>
>>>>* Root file system
>>>>for most of my boards but I need this patch applied before I can submit.
>>>>Also added a few applications ported by the AVR32 project:
>>>>* alsa-utils, alsa-lib, joe editor, fbset, etc. 
>>>>
>>>>Would really like to be able to restart this...
>>> 
>>> Please make sure that you wrap the applications that are provided by
>>> busybox in the appropriate BR2_PACKAGE_BUSYBOX_HIDE_OTHERS.
>>>
>>I do not think that they do this, unless the editor "Joe" counts.
>>Will check.
> 
> It counts :). See package/Config.in
> if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
> # busybox has an editor..
> source "package/nano/Config.in"
> endif
> 

OK...


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
