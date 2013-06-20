From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2013 18:25:04 +0200
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
Message-ID: <51C32CE0.9050902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/13 09:18, Thomas Weininger wrote:
> Hi,
> 
> I'm using Buildroot Git version 28ab11d7855a1b85e4be15cd9c86ad0838fa1cb1 
> from 2013-06-06. I tried to change the package/i2c-tools/i2c-tools.mk in 
> order to build an extra package called py-smbus, which is part of 
> i2c-tools but not built by default. Considering the i2c-tools README 
> http://www.lm-sensors.org/browser/i2c-tools/trunk/README?rev=6171 I added 
> EXTRA="py-smbus" to the make options.
> 
> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
> 
> index 1589d04..403b96d 100644
> 
> --- a/package/i2c-tools/i2c-tools.mk
> 
> +++ b/package/i2c-tools/i2c-tools.mk
> 
> @@ -9,7 +9,7 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
> 
> I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
> 
>   define I2C_TOOLS_BUILD_CMDS
> 
> - $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> 
> + $(MAKE) $(TARGET_CONFIGURE_OPTS) EXTRA="py-smbus" -C $(@D)

 Can you try if
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		EXTRA="py-smbus" -C $(@D)
works?

 The problem is that the PATH doesn't get propagated, so the Makefile is using
the system's python instead of buildroot's python.

 By the way, you should also add

I2C_TOOLS_DEPENDENCIES = host-python

to make sure the cross-python is built before i2c-tools.


 If you get this working, it would be nice if you could send a patch that adds
a configure option for py-smbus.


 Regards,
 Arnout

 
> 
> endef
> 
>   define I2C_TOOLS_INSTALL_TARGET_CMDS

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
