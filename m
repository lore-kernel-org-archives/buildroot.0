From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 00:37:12 +0200
Subject: [Buildroot] [PATCH 1/2] X11/odroidc2-driver: New Package.
In-Reply-To: <trinity-122b1f64-5a75-4714-b1e0-471c25487584-1476738693195@3capp-mailcom-bs01>
References: <20161013174124.9639-1-daggs@gmx.com>
 <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
 <trinity-122b1f64-5a75-4714-b1e0-471c25487584-1476738693195@3capp-mailcom-bs01>
Message-ID: <5c997397-22ef-70f1-9a92-c1b7466de872@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 23:11, daggs wrote:

[snip]
>>  You forgot to select or depend on ODROID_MALI. I think the appropriate approach
>> is to select it in this case. Then of course you do have to add the reverse
>> dependencies:
>> 	depends on BR2_aarch64 || BR2_ARM_EABIHF # odroid-mali
>> 	depends on BR2_TOOLCHAIN_USES_GLIBC # odroid-mali
> will do.
> 
[snip]
>>> +comment "xf86-video-odroidc2 needs egl support from odroid-mali and ARM64 arch"
>>> +	depends on !BR2_PACKAGE_ODROID_MALI || !BR2_aarch64
>>
>>  This should become a glibc + NPTL threads comment instead.
> why? are we sure this won't work for uclibc or musl?

 Because of the 'select BR2_PACKAGE_ODROID_MALI' you have a dependency on glibc.

 Oh, and we don't mention arch dependencies in the comment, so it should be
	depend on BR2_aarch64
	depends on !BR2_TOOLCHAIN_USES_GLIBC

[snip]
>>> +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
>>> +XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
>>> +	odroid-mali \
>>> +	xproto_fontsproto \
>>> +	xproto_xproto \
>>
>>  You also select dri2proto, is that not needed? But actually, I don't see any
>> inclusion of either of these three proto packages, only of xserver stuff (and a
>> few that I can't place, like ump.h)
> ump.h is part of the x11 egl pkg.
> I've added the above deps based on compilation errors I've got.

 I suspect that it actually comes from the headers of odroid-mali. If that is
the case, it would be better to put the dependency in odroid-mali itself
(conditional on using the X11 version, of course).

>>
>>> +	mesa3d \
>>> +	xserver_xorg-server
>>> +
>>> +define XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
>>> +        $(INSTALL) -m 0644 -D $(@D)/src/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
>>
>>  Hm, not sure about this one. If all packages do that we get conflicts. For e.g.
>> the Vivante X11 driver, we put in the help text what you have to add to
>> xorg.conf to make it work.
> alternatively one can us the turbofb X11 driver to X to work do I based the pkg on that. 
> can I see the expected result in the Vivante X11 driver?

 Well, you picked the _only_ driver that installs a xorg.conf... We just haven't
noticed when Scott Fann contributed that driver.

 Regards,
 Arnout

> 
>>
>>> +endef
>>> +
>>> +XDRIVER_XF86_VIDEO_ODROIDC2_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
>>> +
>>> +$(eval $(autotools-package))
>>>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
