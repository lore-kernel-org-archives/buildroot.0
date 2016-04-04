From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Apr 2016 20:47:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/turbolua: new package
In-Reply-To: <1459763682-29799-2-git-send-email-m.niestroj@grinn-global.com>
References: <1459763682-29799-1-git-send-email-m.niestroj@grinn-global.com>
 <1459763682-29799-2-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <20160404204746.615ebd59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Apr 2016 11:54:42 +0200, Marcin Niestroj wrote:

> diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
> new file mode 100644
> index 0000000..a742097
> --- /dev/null
> +++ b/package/turbolua/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_TURBOLUA
> +	bool "turbolua"
> +	depends on BR2_PACKAGE_LUAJIT
> +	# Turbolua program within thumb2 system receives "Illegal
> +	# instruction" and "Segmentation fault" errors.
> +	depends on !BR2_ARM_INSTRUCTIONS_THUMB2

Ok, so there is probably no inherent problem, it's just that it happens
to not work. What I dislike a bit with such dependency is that you
probably don't have tested on the full range of architectures that are
supported in Buildroot. So I generally prefer when we add such
dependencies when the software can really technically not work on the
architecture, not when there is some random bug that prevents it.

But oh well, I won't oppose to this dependency being added.


> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SSL = openssl
> +else
> +SSL = none
> +endif

The namespace of variables is global, so SSL is not a good variable
named, it should be TURBOLUA_SSL.

> +define TURBOLUA_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) SSL="$(SSL)" \
> +		LUAJIT_VERSION="$(LUAJIT_VERSION)" -C $(@D) all
> +endef
> +
> +define TURBOLUA_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) SSL="$(SSL)" LDCONFIG=true \
> +		LUAJIT_VERSION="$(LUAJIT_VERSION)" \
> +		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
> +endef

What about defining:

TURBOLUA_MAKE_OPTS = \
	$(TARGET_CONFIGURE_OPTS) \
	SSL=$(if $(BR2_PACKAGE_OPENSSL),openssl,none) \
	LUAJIT_VERSION="$(LUAJIT_VERSION)"

and use it in the build and install steps ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
