From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:45:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libtalloc: new package
In-Reply-To: <20200327150225.15277-1-jared.bents@rockwellcollins.com>
References: <20200327150225.15277-1-jared.bents@rockwellcollins.com>
Message-ID: <20200329214531.662c1124@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jared,

On Fri, 27 Mar 2020 10:02:25 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> libtalloc is a hierarchical, reference counted memory pool
> system with destructors. It is the core memory allocator
> used in Samba.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Thanks for this new iteration.

> +config BR2_PACKAGE_LIBTALLOC
> +	bool "libtalloc"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # python
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
> +	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

I don't understand why you have added these gazillions of dependencies.
BR2_USE_MMU is indeed needed, as fork() is used.

But the other dependencies, I don't understand:

 - Python is only an optional dependency of your package, so there's no
   reason to replicate Python's dependencies.

 - cmocka and gnutls are not dependencies either.

 - It builds fine with musl.

So, unless you have a good justification (a build failure), please drop
all those dependencies, and keep only the BR2_USE_MMU.

Of course, if that's indeed the case, you can drop the Config.in
comment as well.


> +define LIBTALLOC_CONFIGURE_CMDS
> +	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;

Final semi-colon not needed.

> +	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;

Final semi-colon not needed.

I am not sure it is such a great idea to share the waf options cache
with Samba though.

> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(LIBTALLOC_CONF_ENV) \
> +		./buildtools/bin/waf configure \
> +			--prefix=/usr \
> +			--sysconfdir=/etc \
> +			--localstatedir=/var \
> +			--with-libiconv=$(STAGING_DIR)/usr \
> +			--cross-compile \
> +			--cross-answers=$(@D)/cache.txt \
> +			--hostcc=gcc \
> +			--disable-rpath \
> +			--disable-rpath-install \
> +			--bundled-libraries='!asn1_compile,!compile_et' \
> +			$(LIBTALLOC_CONF_OPTS) \
> +	)
> +endef

Here, we're not using the waf-package infrastructure properly. In fact,
you almost don't use anything of it.

One thing that makes it not possible to use it as-is is that the waf
script is not in ./waf, but in ./buildtools/bin/waf. To make this work,
add a preparation patch that does this in pkg-waf.mk:

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a32d5dab33..5579f2bef0 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -46,7 +46,7 @@ ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
 $(2)_WAF = $$(HOST_DIR)/bin/waf
 else
-$(2)_WAF = ./waf
+$(2)_WAF ?= ./waf
 endif
 
 $(2)_BUILD_OPTS                                ?=

Then in libtalloc.mk, you can do:

LIBTALLOC_WAF = ./buildtools/bin/waf

and then, drop your custom LIBTALLOC_CONFIGURE_CMDS.

> +
> +define LIBTALLOC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D)
> +endef

Why don't you use waf here ?

> +define LIBTALLOC_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBTALLOC_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef

Same question.

At the end, your libtalloc.mk should look like this:

################################################################################
#
# libtalloc
#
################################################################################

LIBTALLOC_VERSION = 2.3.1
LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
LIBTALLOC_INSTALL_STAGING = YES
LIBTALLOC_CFLAGS = $(TARGET_CFLAGS)
LIBTALLOC_LDFLAGS = $(TARGET_LDFLAGS)
LIBTALLOC_CONF_ENV = \
	CFLAGS="$(LIBTALLOC_CFLAGS)" \
	LDFLAGS="$(LIBTALLOC_LDFLAGS)" \
	XSLTPROC=false \
	WAF_NO_PREFORK=1
LIBTALLOC_CONF_OPTS = \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-libiconv=$(STAGING_DIR)/usr \
	--cross-compile \
	--cross-answers=$(@D)/cache.txt \
	--hostcc=gcc \
	--disable-rpath \
	--disable-rpath-install \
	--bundled-libraries='!asn1_compile,!compile_et'

ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
endif

ifeq ($(BR2_PACKAGE_PYTHON3),y)
LIBTALLOC_PYTHON = \
	PYTHON="$(HOST_DIR)/bin/python3" \
	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
LIBTALLOC_DEPENDENCIES += host-python3 python3
LIBTALLOC_CONF_ENV += \
	$(LIBTALLOC_PYTHON)
# There is not a --enable-python configuration option
else
LIBTALLOC_CONF_OPTS += --disable-python
endif

LIBTALLOC_WAF = ./buildtools/bin/waf

define LIBTALLOC_POPULATE_WAF_CACHE
	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt
	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt
endef

LIBTALLOC_PRE_CONFIGURE_HOOKS += LIBTALLOC_POPULATE_WAF_CACHE

$(eval $(waf-package))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
