From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Aug 2018 17:31:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <20180821142226.2309-1-vadim4j@gmail.com>
References: <20180821142226.2309-1-vadim4j@gmail.com>
Message-ID: <87r2irvljb.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

Vadim Kochan writes:

> From: Vadim Kochan <vadim.kochan@petcube.com>
>
> Add gettext-tiny package from the sabotage-linux project:
>
> gettext-tiny provides lightweight replacements for tools typically used
> from the GNU gettext suite, which is incredibly bloated and takes a lot
> of time to build (in the order of an hour on slow devices). the most
> notable component is msgfmt which is used to create binary translation
> files in the .mo format out of textual input files in .po format. this
> is the most important tool for building software from source, because it
> is used from the build processes of many software packages.

Thanks. gettext is indeed a huge CPU cycles drain.

> Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>

[...]

> +GETTEXT_TINY_VERSION = f733dd3fdd7be973f523a464165aae827a17d838
> +GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
> +GETTEXT_TINY_LICENSE = MIT
> +GETTEXT_TINY_INSTALL_STAGING = YES
> +GETTEXT_TINY_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +LIBINTL=MUSL
> +endif
> +
> +ifeq ($(BR2_ENABLE_LOCALE),)
> +GETTEXT_TINY_DEPENDENCIES = libiconv
> +endif
> +
> +define GETTEXT_TINY_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		LIBINTL=$(LIBINTL) \
> +		$(TARGET_CONFIGURE_OPTS)
> +endef
> +
> +define GETTEXT_TINY_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR=$(STAGING_DIR) prefix=/usr install
> +endef
> +
> +define GETTEXT_TINY_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) prefix=/usr install
> +endef
> +
> +$(eval $(generic-package))

What about a host package? Would it be feasible to replace host-gettext
with host-gettext-tiny?

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
