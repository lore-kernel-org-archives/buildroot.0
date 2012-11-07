From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 22:51:40 +0100
Subject: [Buildroot] [PATCH v2] package: add libpthsem
In-Reply-To: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <509AD7EC.6060508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/12 10:05, Gregory Hermant wrote:
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> +config BR2_PACKAGE_LIBPTHSEM
> +	bool "libpthsem"
> +	select BR2_PACKAGE_ARGP_STANDALONE
> +	help
> +	  GNU pth is a user mode multi threading library. pthsem is an extend
> +	  version, with support for semaphores added.

  If it is similar to pth, then it will probably not work on half our
architectures...

> +
> +	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
[snip]
> diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
> new file mode 100644
> index 0000000..4fc9095
> --- /dev/null
> +++ b/package/libpthsem/libpthsem.mk
> @@ -0,0 +1,33 @@
> +#############################################################
> +#
> +# libpthsem
> +#
> +#############################################################
> +
> +LIBPTHSEM_VERSION = 2.0.8
> +LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
> +LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth/
> +LIBPTHSEM_LICENSE = LGPLv2.1+
> +LIBPTHSEM_LICENSE_FILES = COPYING
> +LIBPTHSEM_AUTORECONF = YES
> +LIBPTHSEM_INSTALL_STAGING = YES
> +LIBPTHSEM_DEPENDENCIES = argp-standalone
> +
> +define LIBPTHSEM_STAGING_LIBPTHSEM_CONFIG_FIXUP
> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/pthsem-config
> +	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/pthsem-config

  The \' quotes are redundant here, no?  And isn't one $(SED) enough if you
leave out the ^ in the beginning?  Then prefix=.* will match both of them.

> +endef
> +
> +LIBPTHSEM_POST_INSTALL_STAGING_HOOKS += LIBPTHSEM_STAGING_LIBPTHSEM_CONFIG_FIXUP
> +
> +define LIBPTHSEM_REMOVE_CONFIG_SCRIPTS
> +	$(RM) -f $(TARGET_DIR)/usr/bin/pthsem-config
> +endef

  Good idea, I guess there are plenty of packages that should have this as well...


  Regards,
  Arnout

> +
> +ifneq ($(BR2_HAVE_DEVFILES),y)
> +LIBPTHSEM_POST_INSTALL_TARGET_HOOKS += LIBPTHSEM_REMOVE_CONFIG_SCRIPTS
> +endif
> +
> +
> +$(eval $(autotools-package))
> +

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
