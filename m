From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:17:50 +0100
Subject: [Buildroot] [PATCH 2/6] Add hdmiservice package for the
 snowball board
In-Reply-To: <1351500073-4351-3-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-3-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <5090520E.9090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 09:41, Gregory Hermant wrote:
[snip]
> diff --git a/package/hdmiservice/hdmiservice.mk b/package/hdmiservice/hdmiservice.mk
> new file mode 100644
> index 0000000..28fc584
> --- /dev/null
> +++ b/package/hdmiservice/hdmiservice.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# hdmiservice
> +#
> +#############################################################
> +HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
> +HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
> +HDMISERVICE_LICENSE = PROPRIETARY

  The header files say it's MIT.  The copyright file is debian/copyright.

  If you're not sure of the license, please just don't specify it, don't
just put a random value!

> +
> +define HDMISERVICE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

  Does it work with $(TARGET_CONFIGURE_OPTS) instead of CC= LD= ?
That's the standard pattern.

> +endef
> +
> +define HDMISERVICE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(TARGET_DIR)/usr/lib/hdmiservice.so
> +	$(INSTALL) -D -m 0755 $(@D)/hdmistart $(TARGET_DIR)/usr/bin/hdmistart

$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install

  We do want the header files as well, so some client can link with
hdmiservice.so.  And you want to install it in staging as well.

> +endef
> +
> +$(eval $(generic-package))

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
