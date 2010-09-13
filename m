From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 13 Sep 2010 23:31:56 +0200
Subject: [Buildroot] [PATCH 1/2] introducing util-linux-ng as
 replacement for util-linux
In-Reply-To: <20100911190133.460ab01f@surf>
References: <1284195279-6225-1-git-send-email-marcus.osdoba@googlemail.com>	<1284195279-6225-2-git-send-email-marcus.osdoba@googlemail.com>
	<20100911190133.460ab01f@surf>
Message-ID: <4C8E984C.2040405@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 11.09.2010 19:01, schrieb Thomas Petazzoni:
>
>>   ...0001-replace-bcopy-bzero-index-and-rindex.patch |  418 ++++++++++++++++++++
>>   .../0002-Allow-linking-with-uClibc.patch           |   26 ++
> Are those two patches submitted upstream ?
You are right. They went upstream 2009. I will remove these patches for 
the next review round.

>> --- /dev/null
>> +++ b/package/util-linux-ng/Config.in
>> @@ -0,0 +1,47 @@
>> +config BR2_PACKAGE_UTIL_LINUX_NG
>> +	bool "util-linux-ng"
>> +	depends on (BR2_PROGRAM_INVOCATION&&  BR2_LARGEFILE)
>> +	help
>> +	  Fork of util-linux which consists of essential Linux utilities.
>> +
>> +	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
>> +	  http://userweb.kernel.org/~kzak/util-linux-ng/
>> +
>> +comment "util-linux-ng requires a toolchain with PROGRAM_INVOCATION support"
>> +	depends on !BR2_PROGRAM_INVOCATION
>> +
>> +comment "util-linux-ng requires a toolchain with LARGEFILE support"
>> +	depends on !BR2_LARGEFILE
> The 'old' util-linux version also needed gettext when locale support was
> enabled. It isn't the case with this new version ?
I read that disable-nls removes all gettext dependancy. To avoid some 
trouble I disabled it for the first version.
Let me know if you like to have the nls option in the introductory 
version. I guess activating it if BR2_LOCALE and BR2_GETTEXT is set is 
the right way.
I think nls is not that important in embedded environments. It just used 
to function.  That's way I look at this with prio 2.

>> +if BR2_PACKAGE_UTIL_LINUX_NG
>> +comment "utils selection"
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
>> +	bool "The library and tools for blkid support."
>> +	help
>> +	 This package provides the recent blkid support
>> +	 (parallel versions exist in e2fsprogs and busybox)
> Tab + 2 spaces before each line of the help text.
Acked.

>> +
>> +config BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID
>> +	bool "The library and tools for uuid support."
>> +	help
>> +	 This package provides the recent uuid support
>> +	 (parallel versions exist in e2fsprogs and busybox)
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS
>> +	bool "Devices mount/unmounting utilities"
>> +	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID&&  BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
>> +	help
>> +	 This package contains utilities to mount/unmount devices.
>> +	 Also provided by busybox.
> So, shouldn't it be hidden when BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is no ?
I don't think so. Maybe someone likes to compare the busybox vs. the 
"mainstream" version. So you should be able to install both.
The busybox binary still can be launched with the applet parameter to be 
behave like mount. That's why I added the comment. In fact it is only 
visibible when BUSYBOX_SHOW_OTHERS is true. So the user should know, 
that he gains some redundancy if busybox remains enabled.
The same for LIBUUID. But this is a library, so maybe it's better here 
to forbid installing both. Let me know.

>
>> +#############################################################
>> +#
>> +# UTIL_LINUX_NG
>> +#
>> +#############################################################
>> +UTIL_LINUX_NG_VERSION=2.17.2
>> +UTIL_LINUX_NG_MAJORVERSION=2.17
> Minor thing:
>
> UTIL_LINUX_NG_VERSION=$(UTIL_LINUX_NG_MAJORVERSION).2
Acked.

>> +UTIL_LINUX_NG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL_LINUX_NG_MAJORVERSION)
>> +UTIL_LINUX_NG_SOURCE=util-linux-ng-$(UTIL_LINUX_NG_VERSION).tar.bz2
>> +#UTIL_LINUX_NG_INSTALL_STAGING = YES
>> +UTIL_LINUX_NG_CONF_OPT=--disable-use-tty-group \
>> +                       --enable-shared \
>> +                       --without-libiconv-prefix \
>> +                       --without-libintl-prefix \
>> +                       --disable-rpath \
>> +                       --disable-nls \
> Not needed, the options already contains $(DISABLE_NLS), which will
> contain the right value depending on whether we want NLS support or not.
See comment above. I read somewhere that disable nls removes need for 
gettext.
I will  cross check this.

>> +                       --disable-schedutils \
>> +                       --disable-doc
>> +
>> +UTIL_LINUX_NG_DEPENDENCIES=e2fsprogs
>> +UTIL_LINUX_NG_LIBTOOL_PATCH = NO
> Minor: please be consistent with regard to the spaces. Either no spaces
> before and after =, or spaces before and after. My preference is for
> having spaces, but that's just my own.
Acked - if you accept indents in if-blocks ;-)

>> +# make util-linux-ng win over links to busybox binary
>> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>> +  UTIL_LINUX_NG_DEPENDENCIES+=busybox
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_NCURSES),y)
>> +  ifneq ($(BR2_USE_WCHAR),y)
>> +    UTIL_LINUX_NG_CONF_OPT+=--with-ncurses
> Sounds strange. When wide char is not available, you need to enable
> ncurses ? Why ?
>
> It also lacks:
>
> UTIL_LINUX_NG_DEPENDENCIES += curses
Honestly, I dont't know. I took the original dependancy introduced by 
Daniel Mierswa:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/16587/match=util+linux+ng
I'll will change (and test) to just activate ncurses --with-ncurses when 
BR_NCURSES is available. Which sounds more logical now...

> The rest seems ok to me.
>
> Thanks again!
No problem. I needed this for xfsprogs. Feel free to review this patch, 
too ;-)

Regards,
Marcus
