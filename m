From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 11:14:58 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <20150417090337.GA27179@vorel-pc>
References: <1429134935-11241-1-git-send-email-petr.vorel@gmail.com>
 <1429134935-11241-2-git-send-email-petr.vorel@gmail.com>
 <55301BBB.4090705@mind.be> <20150417090337.GA27179@vorel-pc>
Message-ID: <5530CF12.20307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 11:03, Petr Vorel wrote:
> Thanks for comments, I'll create new version tonight.
> 
>>  I would say that this package fits better in the linux extensions menu. Even if
>> you just consider this package as a set of kernel modules, I think that from a
>> users perspective it fits better together with the kernel.
> Sounds reasonable, I'll do it.

 Well, Thomas disagrees, so I guess you shouldn't.

 Anyway, if it does become a Linux extension, the package will stay. One of the
Kconfig options (the package or the linux extension) will be a blind option, and
at that time we can still choose which one will be blind.

[snip]
>>> +# Checks to give errors that the user can understand
>>> +ifeq ($(filter source,$(MAKECMDGOALS)),)
>>> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>>> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
>>> +$(error No kernel defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
>>> +endif
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
>>> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
>>> +$(error No kernel configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
>>> +endif
>>> +endif
>>> +
>>> +endif
> I'd keep the error messages as indication for user.

 If you use kconfig-package you should never get these messages because it
already has that check, on line 70-74:

# FOO_KCONFIG_FILE is required
ifndef $(2)_KCONFIG_FILE
$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
endif


 Oh, now I see that Yann's patch to convert this to ifeq hasn't been applied
yet... So yes in that case the custom check should stay.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
