From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 13:43:55 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <1381311986-11533-1-git-send-email-alvaro.gamez@hazent.com>
References: <4FCD4B90.3020007@mind.be>
 <1381311986-11533-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20131009134355.44ae2733@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Wed,  9 Oct 2013 11:46:26 +0200, Alvaro G. M wrote:
> From: Alvaro G. M. <alvaro.gamez@hazent.com>
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
> 
> I recovered an old patch from Thomas (http://lists.busybox.net/pipermail/buildroot/2012-June/054467.html)
> and upgraded it to the stable version of xml-rpc-c.
> Some of the original patches are not needed on this version, so I've mostly just deleted
> a patch files, upgraded download address and version and modified patch offsets so they apply
> without any warning.
> 
>  package/Config.in                                  |  1 +
>  package/libxmlrpc/Config.in                        | 10 +++++++
>  .../libxmlrpc/libxmlrpc-fix-gennmtab-build.patch   | 25 ++++++++++++++++
>  .../libxmlrpc-fix-non-cplusplus-build.patch        | 27 +++++++++++++++++
>  .../libxmlrpc/libxmlrpc-fix-non-wchar-build.patch  | 24 +++++++++++++++
>  .../libxmlrpc-use-correct-curl-config.patch        | 22 ++++++++++++++

It would be good to use a number in the patch file names, such as:

	libxmlrpc-01-<something>.patch
	libxmlrpc-02-<somethingelse>.patch

> new file mode 100644
> index 0000000..ef41041
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -0,0 +1,34 @@
> +#############################################################

Those lines should have 80 #

> +#
> +# libxmlrpc
> +#
> +#############################################################

One empty line between the header and the first variable.

> +LIBXMLRPC_VERSION = 1.25.26
> +LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
> +LIBXMLRPC_SITE = "http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/1.25.26"
> +LIBXMLRPC_INSTALL_STAGING = YES
> +LIBXMLRPC_DEPENDENCIES = libcurl

Can you add LIBXMLRPC_LICENSE and LIBXMLRPC_LICENSE_FILES ?

> +LIBXMLRPC_CONF_OPT = \
> +	$(if $(BR2_USE_WCHAR),,ac_cv_header_wchar_h=no) \
> +	$(if $(BR2_INSTALL_LIBSTDCPP),,--disable-cplusplus) \
> +	have_curl_config=$(STAGING_DIR)/usr/bin/curl-config \
> +	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config
> +
> +# Our package uses autoconf, but not automake, so we need to pass
> +# those variables at compile time as well.
> +LIBXMLRPC_MAKE_ENV = \
> +	CC_FOR_BUILD="$(HOSTCC)" \
> +	LD_FOR_BUILD="$(HOSTLD)" \
> +	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
> +	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
> +
> +define LIBXMLRPC_REMOVE_DEVFILE
> +	$(RM) $(TARGET_DIR)/usr/bin/xmlrpc-c-config
> +endef

Hum, maybe this should use the <pkg>_CONFIG_SCRIPTS mechanism instead
(if xmlrpc-c-config is a shell script).

> +
> +ifeq ($(BR2_HAVE_DEVFILES),)
> +LIBXMLRPC_POST_INSTALL_TARGET_HOOKS += LIBXMLRPC_REMOVE_DEVFILE
> +endif
> +
> +$(eval $(autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
