From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:56:49 +0200
Subject: [Buildroot] [PATCH 2/3] New package: c-icap c-icap is an
 implementation of an ICAP server. Squid 3.x proxy server supports it.
In-Reply-To: <1411032426-11463-3-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1411032426-11463-3-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20141005235649.100b5767@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET,

The title of the commit should just be:

	c-icap: new package

On Thu, 18 Sep 2014 11:27:05 +0200, Guillaume GARDET wrote:

> diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
> new file mode 100644
> index 0000000..827bfbf
> --- /dev/null
> +++ b/package/c-icap/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_C_ICAP
> +        bool "c-icap"
> +        help
> +          c-icap is an implementation of an ICAP server. It can be used with 
> +          HTTP proxies that support the ICAP protocol to implement content 
> +          adaptation and filtering services.
> +          Most of the commercial HTTP proxies must support the ICAP protocol.
> +          The open source Squid 3.x proxy server supports it.
> +
> +          http://c-icap.sourceforge.net/
> \ No newline at end of file

Missing new line at the end of the file.

Also, did you check that this package indeed builds with a minimal
toolchain such as
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config ?
It's also good to check if it builds with
http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
and then
http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config.



> diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
> new file mode 100644
> index 0000000..d35d958
> --- /dev/null
> +++ b/package/c-icap/c-icap.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# c-icap
> +#
> +################################################################################
> +
> +C_ICAP_VERSION = 0.3.4
> +C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
> +C_ICAP_SITE = http://downloads.sourceforge.net/c-icap/
> +C_ICAP_INSTALL_STAGING = YES

Is this package really installing some libraries used by other packages?

> +C_ICAP_INSTALL_TARGET = YES

Not needed, this is the default.

The C_ICAP_LICENSE and C_ICAP_LICENSE_FILES variables are missing.

> +C_ICAP_CONF_OPT = --sysconfdir=/etc --with-process-mutexes=posix --enable-large-files

--enable-large-files seems to indicate you at least need largefile
support. Or you should make it optional with something like

ifeq ($(BR2_LARGEFILE),y)
ICAP_CONF_OPTS += --enable-large-files
else
ICAP_CONF_OPTS += --disable-large-files
endif

> +C_ICAP_DEPENDENCIES = 

Not needed, it defaults to empty.

> +define C_ICAP_INSTALL_TARGET_CONFIGS
> +	mkdir -p $(TARGET_DIR)/var/run/c-icap/
> +	mkdir -p $(TARGET_DIR)/tmp/c-icap/
> +	mkdir -p $(STAGING_DIR)/var/run/c-icap/
> +	mkdir -p $(STAGING_DIR)/tmp/c-icap/

Creating these directories in $(STAGING_DIR) is not needed. Just
curious, why is /tmp/c-icap/ necessary?

> +endef
> +
> +C_ICAP_POST_INSTALL_TARGET_HOOKS = C_ICAP_INSTALL_TARGET_CONFIGS
> +
> +$(eval $(autotools-package))
> \ No newline at end of file

Missing newline at end of file.

Could you take those comments into account and send an updated version?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
