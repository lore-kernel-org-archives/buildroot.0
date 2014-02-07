From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 07 Feb 2014 21:34:34 +0100
Subject: [Buildroot] [PATCH v7 0/4] udev is now provided by systemd or
 eudev
In-Reply-To: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <52F5435A.3080700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/14 14:21, Eric Le Bihan wrote:
> This series converts udev to a virtual package, either provided by systemd or
> eudev.
> 
> Starting with version 183, udev has been merged into systemd. This forces the
> use of systemd as the init system if /dev is to be dynamically managed by
> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
> systemd, so it can be used with any init system.
> 
> Systemd has been bumped to v207 and a new eudev package has been added.
> Version 1.3 of eudev is in sync with systemd v207.
> 
> The bump of systemd to v207 also introduces new options, like the activation
> of the journal gateway.
> 
> In the end:
> 
>   - if systemd is selected as init system, the /dev management will handled by
>     udev. No other choice possible.
>   - if busybox or SysV is chosen, the user can choose to manage /dev
>     statically, or dynamically using mdev or eudev.

 Hi Eric,

 I'm very happy with this patch series, it really cleans things up a lot.
I first had some reservations about how the choices were organised in the
menus, but after trying out a few things it turns out to work pretty well.

 I do agree with the comments Thomas has made, though. However, I
wouldn't want to stop this series to go into 2014.02-rc1, so I propose
that Peter still merges it for the release and that these small things
are fixed in follow-up patches.

 I have one more remark about the way the udev virtual package is
implemented. We found out for the opengl packages that there is a better
way to do it, something like:

udev/Config.in:

config BR2_PACKAGE_HAS_UDEV
        bool

config BR2_PACKAGE_PROVIDES_UDEV
        depends on BR2_PACKAGE_HAS_UDEV
        string


udev/udev.mk:

UDEV_SRC =
UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))

ifeq ($(UDEV_DEPENDENCIES),)
define UDEV_CONFIGURE_CMDS
        echo "No Udev implementation selected. Configuration error."
        exit 1
endef
endif


eudev/Config.in:

...
if BR2_PACKAGE_EUDEV
config BR2_PACKAGE_PROVIDES_UDEV
	default "eudev"
endif



 That moves all the provider logic to the provider itself, which for
instance makes it possible for BR2_EXTERNAL to provide an alternative
udev implementation (e.g. a different udev version, which could be _very_
relevant).


 I repeat, though: this can be done as a follow-up patch.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
