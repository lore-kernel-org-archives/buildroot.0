From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 19:39:16 +0200
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <20121118174000.0fe79ef6@skate>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121118174000.0fe79ef6@skate>
Message-ID: <50A91D44.5060104@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

18.11.2012 18:40, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 18 Nov 2012 02:15:13 +0200, Stefan Fr?berg wrote:
>
>> +# linux-pam must be built first if user has custom
>> +# BusyBox .config file and that file has also login
>> +# applet (CONFIG_LOGIN) enabled.
>> +ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p" $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
>> +BUSYBOX_DEPENDENCIES += linux-pam
>> +endif
> I don't think this will work nicely. BR2_PACKAGE_BUSYBOX_CONFIG is the
> source for the Busybox configuration, but the user can do "make
> busybox-menuconfig" do adjust it. In this case, the contents of the
> BR2_PACKAGE_BUSYBOX_CONFIG file and the contents of the real
> configuration file used by Busybox are different. If the latter has
> CONFIG_LOGIN, but not the former, then you will not link against
> linux-pam while you should.
I tested this and it seems that no matter what you do in make
busybox-menuconfig the
(enable login or disable login) the settings from
BR2_PACKAGE_BUSYBOX_CONFIG will
always override.
So even if setting CONFIG_LOGIN disabled from make busybox-menuconfig it
will still
build linux-pam first.

I try to get the logic of this thing:

First busybox is extracted and it copies $(BUSYBOX_CONFIG_FILE) (really
a BR2_PACKAGE_BUSYBOX_CONFIG)
over to just extracted output/busybox-xyz/.config and replacing it. That
will be done in BUSYBOX_POST_EXTRACT_HOOKS.

(BR2_PACKAGE_BUSYBOX_CONFIG here being either the default
package/busybox/busybox-xyz.x.config
 or user provided custom .config)

Then buildroot makes some of it's own changes to that
output/busybox/.config inside BUSYBOX_CONFIGURE_CMDS

Then build.

So what  make busybox-menuconfig   actually does is change 
output/busybox-xyz/.config.

So instead of getting CONFIG_LOG setting from BR2_PACKAGE_BUSYBOX_CONFIG
(aka BUSYBOX_CONFIG_FILE inside busybox.mk)
I should get it from output/busybox-xyz/.config (aka
BUSYBOX_BUILD_CONFIG inside busybox.mk).

And that CONFIG_LOGIN checking should be done after buybox tarball has
been extracted but by then, it is already too late for
determining dependencies ....
Aarrggggh!


> It is really difficult to have dependencies that are needed only when
> some specific Busybox features are enabled.
Tell me about it.
What IMHO is needed, is some function or way to get these kinds of
information.
Just before dependencies are determined.

There should be KCONFIG_GET_OPT or something similar inside
package/pkg-utils.mk
(like there already is KCONFIG_ENABLE_OPT, KCONFIG_DISABLE_OPT and
KCONFIG_SET_OPT)
that would help to determine not only buildroot features but also linux
features and any
else package that use kconfig like stuff.

It would also help in case of  various package conflicts (say if busybox
unzip applet and real unzip are mistakenly
being installed, then this could be detected beforehand)

Regards
Stefan


> Best regards,
>
> Thomas
