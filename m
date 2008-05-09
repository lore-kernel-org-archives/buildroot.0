From: John Voltz <john.voltz@gmail.com>
Date: Fri, 9 May 2008 12:34:33 -0400
Subject: [Buildroot] x11-input-drivers/xdriver_xf86-input-evdev-1.2.0
	missing inputproto depends
In-Reply-To: <46a136670805090922w7d3b2cebqd558f0fad738eea8@mail.gmail.com>
References: <17146898.post@talk.nabble.com>
	<46a136670805090922w7d3b2cebqd558f0fad738eea8@mail.gmail.com>
Message-ID: <46a136670805090934u308f1d8dufe014f34b4020c60@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another thing, are you building a modular X server or the kdrive/tinyx
server? I don't think kdrive can use the drivers. Change the xorg-server
buildroot makefile configure option from --disable-xorg to --enable-xorg.
And you will be on your own for that one, because I've never done it. Also,
I don't think you'll have any success building it for an ARM target either,
as there is no PC compatible PCI bus on it, which is required for the
drivers and xorg server itself.

John

On Fri, May 9, 2008 at 12:22 PM, John Voltz <john.voltz@gmail.com> wrote:

> The problem is probably not where it is installed, but rather how pkgconfig
> is gathering it's information about the X11 headers. Look at the
> xf86-input-evdev config.log or inside the configure script to see what's
> happening. You can also try adding CFLAGS="-I$(STAGING_DIR)/usr/include/X11"
> to the CONF_OPTS in the buildroot makefile for xf-86-input-evdev.
>
> I never gave any attention to the drivers for X11, you may also want to
> check that the version of xf86-input-evdev is the right one for xorg-7.3. It
> should be 1.1.2. See here:
> http://xorg.freedesktop.org/releases/X11R7.3/src/driver/
>
> John
>
>
> On Fri, May 9, 2008 at 8:29 AM, Hebbar <gururajakr@sanyo.co.in> wrote:
>
>>
>> Hi,
>>
>> i successfully built x11 server and i am using it on my arm926ejs based
>> board. Now i want to use x11 input driver (specifically
>> xdriver_xf86-input-evdev-1.2.0). But the build fails because of missing
>> header files (xorg-server.h, xf86Xinput.h )as below.
>>
>>     What i found was the some of the required header fles from
>> xserver_xorg-server directory are copied to staging_dir/usr/include/x11
>> directory. and also the pkg-config file for xserver_xorg-server  points to
>> staging_dir/usr/include but the x11 files are installed in
>> staging_dir/usr/include/x11.
>>
>> Kindly let me know how to edit the make file inorder to install all the
>> required header files to proper location. If required i can do more
>> testing
>> and changes.
>>
>> TIA
>>
>> Regards
>> Gururaja
>>
>> make[3]: Entering directory
>> `/opt/buildroot/build_arm/xdriver_xf86-input-evdev-1.2.0/src'
>> /bin/sh ../libtool --tag=CC   --mode=compile
>> /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
>> -Os
>> -I/opt/buildroot/build_arm/staging_dir/usr/include
>> -I/opt/buildroot/build_arm/staging_dir/include
>> --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
>> /opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi -msoft-float
>> -DHAVE_CONFIG_H -I. -I..    -Wall -g -O2 -I
>> -I/opt/buildroot/build_arm/staging_dir/usr/include    -I../src -MT
>> evdev_drv_la-evdev.lo -MD -MP -MF .deps/evdev_drv_la-evdev.Tpo -c -o
>> evdev_drv_la-evdev.lo `test -f 'evdev.c' || echo './'`evdev.c
>>  /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
>> -Os -I/opt/buildroot/build_arm/staging_dir/usr/include
>> -I/opt/buildroot/build_arm/staging_dir/include
>> --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
>> /opt/buildroot/build_arm/staging_dir -mtune=arm9tdmi -msoft-float
>> -DHAVE_CONFIG_H -I. -I.. -Wall -g -O2 -I
>> -I/opt/buildroot/build_arm/staging_dir/usr/include -I../src -MT
>> evdev_drv_la-evdev.lo -MD -MP -MF .deps/evdev_drv_la-evdev.Tpo -c evdev.c
>> -fPIC -DPIC -o .libs/evdev_drv_la-evdev.o
>> In file included from evdev.c:36:
>> ../config.h:4:25: error: xorg-server.h: No such file or directory
>> In file included from evdev.c:43:
>> evdev.h:52:24: error: xf86Xinput.h: No such file or directory
>> In file included from evdev.h:74,
>>                 from evdev.c:43:
>>
>> /opt/buildroot/build_arm/staging_dir/usr/include/X11/extensions/XKBstr.h:77:
>> error: expected specifier-qualifier-list before 'Bool'
>>
>> /opt/buildroot/build_arm/staging_dir/usr/include/X11/extensions/XKBstr.h:490:
>> error: expected specifier-qualifier-list before 'Bool'
>>
>> /opt/buildroot/build_arm/staging_dir/usr/include/X11/extensions/XKBstr.h:582:
>> error: expected specifier-qualifier-list before 'Bool'
>> In file included from evdev.c:43:
>> evdev.h:94: error: expected ')' before 'pInfo'
>> evdev.h:114: error: expected specifier-qualifier-list before
>> 'evdev_map_func_f'
>> evdev.h:135: error: expected specifier-qualifier-list before
>> 'evdev_map_func_f'
>> evdev.h:148: error: expected specifier-qualifier-list before
>> 'evdev_map_func_f'
>> evdev.h:182: error: expected specifier-qualifier-list before 'Bool'
>> evdev.h:200: error: expected ')' before 'device'
>> evdev.h:201: error: expected ')' before 'device'
>> evdev.h:202: error: expected ')' before 'device'
>> evdev.h:203: error: expected ')' before 'pInfo'
>> evdev.h:204: error: expected ')' before 'pInfo'
>> evdev.h:205: error: expected ')' before 'pInfo'
>> evdev.h:206: error: expected ')' before 'pInfo'
>> evdev.h:207: error: expected ')' before 'pInfo'
>> evdev.h:208: error: expected ')' before 'pInfo'
>> evdev.h:210: error: expected ')' before 'device'
>> evdev.h:211: error: expected ')' before 'device'
>> evdev.h:212: error: expected ')' before 'device'
>> evdev.h:213: error: expected ')' before 'pInfo'
>> evdev.h:214: error: expected ')' before 'pInfo'
>> evdev.h:215: error: expected ')' before 'pInfo'
>> evdev.h:216: error: expected ')' before 'pInfo'
>> evdev.h:217: error: expected ')' before 'pInfo'
>> evdev.h:218: error: expected ')' before 'pInfo'
>> evdev.h:220: error: expected ')' before 'device'
>> evdev.h:221: error: expected ')' before 'pInfo'
>> evdev.h:222: error: expected ')' before 'device'
>> evdev.h:223: error: expected ')' before 'device'
>> evdev.h:224: error: expected ')' before 'pInfo'
>> evdev.h:237: error: expected declaration specifiers or '...' before '*'
>> token
>> evdev.h:237: error: expected ')' before 'pInfo'
>> evdev.h:238: error: expected declaration specifiers or '...' before '*'
>> token
>> evdev.h:238: error: expected ')' before 'pInfo'
>> evdev.h:245: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapToRelAxis'
>> evdev.h:249: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapToAbsAxis'
>> evdev.h:254: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapToButton'
>> evdev.h:259: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapToButtons'
>> evdev.h:266: error: expected specifier-qualifier-list before
>> 'evdev_parse_map_func_f'
>> evdev.h:270: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapOption'
>> evdev.c:45:18: error: xf86.h: No such file or directory
>> evdev.c:47:24: error: xf86Module.h: No such file or directory
>> evdev.c:48:23: error: mipointer.h: No such file or directory
>> evdev.c:49:24: error: xf86_OSlib.h: No such file or directory
>> evdev.c:52:25: error: xf86_OSproc.h: No such file or directory
>> evdev.c:54: error: expected ')' before 'device'
>> evdev.c:63: error: expected '=', ',', ';', 'asm' or '__attribute__' before
>> 'evdevGetBits'
>> evdev.c:95: error: unknown field 'func' specified in initializer
>> evdev.c:95: error: 'EvdevParseMapToRelAxis' undeclared here (not in a
>> function)
>> evdev.c:95: warning: excess elements in struct initializer
>> evdev.c:95: warning: (near initialization for 'evdev_map_parsers[0]')
>> evdev.c:99: error: unknown field 'func' specified in initializer
>> evdev.c:99: error: 'EvdevParseMapToAbsAxis' undeclared here (not in a
>> function)
>> evdev.c:99: warning: excess elements in struct initializer
>> evdev.c:99: warning: (near initialization for 'evdev_map_parsers[1]')
>> evdev.c:103: error: unknown field 'func' specified in initializer
>> evdev.c:103: error: 'EvdevParseMapToButton' undeclared here (not in a
>> function)
>> evdev.c:103: warning: excess elements in struct initializer
>> evdev.c:103: warning: (near initialization for 'evdev_map_parsers[2]')
>> evdev.c:107: error: unknown field 'func' specified in initializer
>> evdev.c:107: error: 'EvdevParseMapToButtons' undeclared here (not in a
>> function)
>> evdev.c:107: warning: excess elements in struct initializer
>> evdev.c:107: warning: (near initialization for 'evdev_map_parsers[3]')
>> evdev.c:111: error: unknown field 'func' specified in initializer
>> evdev.c:111: warning: excess elements in struct initializer
>> evdev.c:111: warning: (near initialization for 'evdev_map_parsers[4]')
>> evdev.c:116: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevParseMapOption'
>> evdev.c: In function 'EvdevFreeTokens':
>> evdev.c:209: warning: passing argument 1 of 'free' discards qualifiers
>> from
>> pointer target type
>> evdev.c: At top level:
>> evdev.c:219: error: expected ')' before 'pInfo'
>> evdev.c:271: error: expected ')' before 'device'
>> evdev.c:353: error: expected ')' before 'client'
>> evdev.c:375: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevPreInit'
>> evdev.c:462: error: expected ')' before '*' token
>> evdev.c:529: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'InputDriverRec'
>> evdev.c:540: error: expected ')' before 'p'
>> evdev.c:545: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevPlug'
>> evdev.c:554: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'EvdevVersionRec'
>> evdev.c:568: error: expected '=', ',', ';', 'asm' or '__attribute__'
>> before
>> 'XF86ModuleData'
>> make[3]: *** [evdev_drv_la-evdev.lo] Error 1
>> make[3]: Leaving directory
>> `/opt/buildroot/build_arm/xdriver_xf86-input-evdev-1.2.0/src'
>> make[2]: *** [all-recursive] Error 1
>> make[2]: Leaving directory
>> `/opt/buildroot/build_arm/xdriver_xf86-input-evdev-1.2.0'
>> make[1]: *** [all] Error 2
>> make[1]: Leaving directory
>> `/opt/buildroot/build_arm/xdriver_xf86-input-evdev-1.2.0'
>> make: ***
>> [/opt/buildroot/build_arm/xdriver_xf86-input-evdev-1.2.0/.stamp_built]
>> Error
>> 2
>> root at guru_vlinux:/opt/buildroot#
>>
>> --
>> View this message in context:
>> http://www.nabble.com/x11-input-drivers-xdriver_xf86-input-evdev-1.2.0-missing-inputproto-depends-tp17146898p17146898.html
>> Sent from the BuildRoot mailing list archive at Nabble.com.
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080509/571e50b4/attachment.htm 
