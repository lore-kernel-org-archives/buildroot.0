From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:43:55 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <4C4B1C9E.8010600@gmx.net>
References: <4C4613A2.90006@gmx.net> <20100721085822.5d2a34ae@surf>
	<4C4B1C9E.8010600@gmx.net>
Message-ID: <20100730104355.14bb2068@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Jul 2010 19:02:22 +0200
Ossy <ossy1980@gmx.net> wrote:

> I searched some autotargets patch mails in the mailinglist. Nearly
> all of them just modified the package/<pkg-name>/<pkg-name>.mk file.
> I was wondering, that there were no other modifications in the other 
> converted packages like some global pkg index file which marks the
> new package as "use autotargets now and not the old infrastructure
> anymore".

In terms of Makefile, nothing else needs to be done than just the final:

$(eval $(call AUTOTARGETS,package,util-linux-ng))

in the util-linux-ng.mk file.

> UTIL-LINUX-NG_VERSION:=2.17

This needs to be

UTIL_LINUX_NG_VERSION=2.17

> UTIL-LINUX-NG_PATCHLEVEL:=2
> UTIL-LINUX-NG_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL-LINUX-NG_VERSION)
> ifneq ($(UTIL-LINUX-NG_PATCHLEVEL),'')

I'm not sure this test is going to work. It should probably be

ifneq ($(UTIL_LINUX_NG_PATCHLEVEL),)

> UTIL-LINUX-NG_SOURCE:=util-linux-ng-$(UTIL-LINUX-NG_VERSION).$(UTIL-LINUX-NG_PATCHLEVEL).tar.bz2
> else
>    UTIL-LINUX-NG_SOURCE:=util-linux-ng-$(UTIL-LINUX-NG_VERSION).tar.bz2
> endif

> UTIL-LINUX-NG_DIR:=$(BUILD_DIR)/util-linux-ng-$(UTIL-LINUX-NG_VERSION)
> UTIL-LINUX-NG_CAT:=$(BZCAT)
> UTIL-LINUX-NG_BINARY:=$(UTIL-LINUX-NG_DIR)/misc-utils/chkdupexe
> UTIL-LINUX-NG_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/chkdupexe

Get rid of thse four variables.

> UTIL-LINUX-NG_CONF_OPT:=--disable-use-tty-group
> UTIL-LINUX-NG_DEPENDENCIES:=

This empty variable is not needed.

> ifeq ($(BR2_PACKAGE_NCURSES),y)
>    ifeq ($(BR2_USE_WCHAR),n)
>      UTIL-LINUX-NG_CONF_OPT+=--with-ncurses

here you should add
       UTIL_LINUX_NG_DEPENDENCIES += ncurses

to make sure ncurses gets compiled before util-linux-ng, when both are
enabled in the config.

The test ifeq ($(BR2_USE_WCHAR),n) is not going to work. When options
are not enabled, their value is empty, not "n". So this test should be :

	ifneq ($(BR2_USE_WCHAR),y))

Moreover, I haven't thought about it, but I don't see why WCHAR is
playing a role here.

>    endif # BR2_USE_WCHAR
> else
>    UTIL-LINUX-NG_CONF_OPT+=--without-ncurses
> endif # BR2_PACKAGE_NCURSES

Last thing: in the rest of the Buildroot code, we don't do much this
kind of indentation and marking of endif with the initial condition.
Maybe we should, but we don't at the moment.

> ifeq ($(BR2_PACKAGE_ZLIB),n)
>    UTIL-LINUX-NG_CONF_OPT:=--disable-cramfs
> endif

Same thing as above, should be :

 ifeq ($(BR2_PACKAGE_ZLIB),y)
   UTIL_LINUX_NG_DEPENDENCIES += zlib
 else
   UTIL_LINUX_NG_CONF_OPT+=--disable-cramfs
 endif

> I took the original mk file and tried to save the options and 
> dependencies. I was able to activate the util-linux-ng box in the 
> menuconfig and ran make. Unfortunatly the util-linux-ng package isn't 
> touched in any way.

Quite probably because of your variables being named
UTIL-LINUX-NG_something instead of UTIL_LINUX_NG_something.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
