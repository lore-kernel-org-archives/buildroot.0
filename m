From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:45:46 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
References: <y>
	<1406635032-34970-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140729234546.3c466ac6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, Yann, All,

On Tue, 29 Jul 2014 13:57:12 +0200, Karoly Kasza wrote:

> +# When libfuse is available, openvmtools can build vmblock-fuse, so
> +# make sure that libfuse gets built first.
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +OPENVMTOOLS_DEPENDENCIES += libfuse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps LDFLAGS="-L$(TARGET_DIR)/usr/lib"
> +OPENVMTOOLS_CONF_OPT += --with-procps
> +OPENVMTOOLS_DEPENDENCIES += procps-ng
> +else
> +OPENVMTOOLS_CONF_OPT += --without-procps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> +OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
> +OPENVMTOOLS_CONF_OPT += --with-dnet
> +OPENVMTOOLS_DEPENDENCIES += libdnet
> +else
> +OPENVMTOOLS_CONF_OPT += --without-dnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
> +OPENVMTOOLS_CONF_OPT += --with-pam
> +OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
> +OPENVMTOOLS_DEPENDENCIES += linux-pam
> +else
> +OPENVMTOOLS_CONF_OPT += --without-pam
> +endif

Here I have a question not necessarily directly for you Karoly, but for
other Buildroot developers. We have a good example here of some
dependencies being automatic (libfuse), some dependencies having their
own package sub-options (procps, dnet, pam). Do we want to have this
separation of treatment ? What is the rationale to do one or the other
in this specific case ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
