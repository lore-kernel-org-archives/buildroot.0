From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:20:35 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/freeswitch-mod-bcg729: new
 package
In-Reply-To: <20171004210224.12763-3-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
 <20171004210224.12763-3-bernd.kuhls@t-online.de>
Message-ID: <ee641e60-305f-8a53-8b4e-1e1601a5dc3e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-10-17 23:02, Bernd Kuhls wrote:
> This package is based on the bcg729 library from Belledonne
> Communications which is wrapped into a freeswitch module to provide a
> native G729.A codec.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +config BR2_PACKAGE_FREESWITCH_MOD_BCG729
> +	bool "freeswitch-mod-bcg729"
> +	depends on BR2_PACKAGE_FREESWITCH
> +	select BR2_PACKAGE_LIBBCG729
> +	help
> +	  FreeSWITCH G.729A module using the opensource bcg729
> +	  implementation by Belledonne Communications.
> +
> +	  https://github.com/xadhoom/mod_bcg729
[snip]
> +################################################################################
> +#
> +# freeswitch-mod-bcg729
> +#
> +################################################################################
> +
> +FREESWITCH_MOD_BCG729_VERSION = c504eea91f225014380ae17c00b35e7173e316ad
> +FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,$(FREESWITCH_MOD_BCG729_VERSION))
> +FREESWITCH_MOD_BCG729_LICENSE = MPL-1.1
> +FREESWITCH_MOD_BCG729_LICENSE_FILES = LICENSE
> +FREESWITCH_MOD_BCG729_DEPENDENCIES = freeswitch libbcg729
> +
> +# instead of patching the not cross-compile friendly Makefile from
> +# upstream we issue the necessary build commands ourselves
> +define FREESWITCH_MOD_BCG729_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-I$(STAGING_DIR)/usr/include/freeswitch \
> +		-fPIC -fomit-frame-pointer -fno-exceptions \
> +		-c $(@D)/mod_bcg729.c -o $(@D)/mod_bcg729.o
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-fPIC -fomit-frame-pointer -fno-exceptions \
> +		-shared -Xlinker -x -lm -lbcg729 -Wl,-Bdynamic \
> +		-o $(@D)/mod_bcg729.so $(@D)/mod_bcg729.o

 Since this clearly only works with dynamic libraries, I think it's worth adding
this explicitly as a dependency in Config.in. Of course, the dependency is
implicit already through freeswitch, but who knows, maybe freeswitch itself may
loose it one day.

 Regards,
 Arnout

> +endef
> +
> +define FREESWITCH_MOD_BCG729_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/mod_bcg729.so $(TARGET_DIR)/usr/lib/freeswitch/mod/mod_bcg729.so
> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
