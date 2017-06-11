From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 15:47:01 +0200
Subject: [Buildroot] [PATCH v2,1/1] boinc: new package
References: <1490523107-130671-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <l7uv0exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Am Sun, 26 Mar 2017 12:11:47 +0200 schrieb Fabrice Fontaine:

> diff --git a/package/boinc/Config.in b/package/boinc/Config.in
> new file mode 100644
> index 0000000..ca1b283
> --- /dev/null
> +++ b/package/boinc/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_BOINC
> +	bool "boinc"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR

Why is wchar needed? The boinc client can be build with this defconfig:

BR2_x86_i486=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_BOINC=y

$ grep _WCHAR .config
# BR2_TOOLCHAIN_BUILDROOT_WCHAR is not set

> diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
> new file mode 100644
> index 0000000..f15be8c
> --- /dev/null
> +++ b/package/boinc/boinc.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256	
c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d	
boinc-7.6.33.tar.gz
> +sha256	
39dc32290378ab5ed258944b80140adc48613677e1792701d6fbeba1b0aa60e3	
25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch
> +sha256	
d141fba93a0081cd558a20209098b105c7e9dc1cd36d7913873db8bcec79ce66	
bf807980c1b217c0f20668a664806d8727df3239.patch

Please re-download the patches and update their hashes, the files you 
download today differ from the time when you created the package.

> diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
> new file mode 100644
> index 0000000..a01289c
> --- /dev/null
> +++ b/package/boinc/boinc.mk
> @@ -0,0 +1,70 @@
> 
+################################################################################
> +#
> +# boinc
> +#
> 
+################################################################################
> +
> +BOINC_VERSION_MAJOR = 7.6
> +BOINC_VERSION = $(BOINC_VERSION_MAJOR).33

Version 7.6.34 was released meanwhile.

> +# client_release can be used to build the Client and Manager but not 
the Server
> +# part. The Server currently has no versioning (see
> +# https://github.com/BOINC/boinc/pull/1798).
> +BOINC_SITE = \
> +	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/
$(BOINC_VERSION))
> +BOINC_LICENSE = LGPLv3
> +BOINC_LICENSE_FILES = COPYING COPYING.LESSER 

please remove the white-space at the end of the line as reported by 

.git/rebase-apply/patch:150: trailing whitespace.
BOINC_LICENSE_FILES = COPYING COPYING.LESSER 
warning: 1 line adds whitespace errors.

> +BOINC_DEPENDENCIES = host-pkgconf
> +BOINC_INSTALL_STAGING = YES

Are there other packages currently or in planning which use libboinc*.so?

> +BOINC_AUTORECONF = YES
> +BOINC_CONF_OPTS = \
> +	--disable-apps \
> +	--disable-boinczip \
> +	--disable-manager \
> +	--disable-server \
> +	--enable-libraries \
> +	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY)
> +
> +# Fix execinfo.h detection and LDFLAGS
> +BOINC_PATCH += \
> +	https://github.com/BOINC/boinc/
commit/25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch \
> +	https://github.com/BOINC/boinc/commit/
bf807980c1b217c0f20668a664806d8727df3239.patch
> +
> +ifeq ($(BR2_PACKAGE_LIBFCGI),y)
> +BOINC_DEPENDENCIES += libfcgi
> +BOINC_CONF_OPTS += --enable-fcgi
> +else
> +BOINC_CONF_OPTS += --disable-fcgi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_OPENSSL),yy)
> +BOINC_DEPENDENCIES += libcurl openssl
> +BOINC_CONF_OPTS += \
> +	--enable-client \
> +	--with-libcurl=$(STAGING_DIR)/usr/lib \
> +	$(if $(BR2_STATIC_LIBS),--disable-dynamic-client-linkage, \
> +		--enable-dynamic-client-linkage)
> +else
> +BOINC_CONF_OPTS += --disable-client

Does it make any sense to build boinc without the client, i.e. only the 
libraries? Imho we should always select libcurl and openssl, both hard 
dependencies for the boinc client, they do not bring new dependencies 
with them.

The rest of the patch is useful only when the client was built.

> +endif
> +
> +# Remove boinc-client because it is incompatible with buildroot
> +define BOINC_REMOVE_UNNEEDED_FILE
> +	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
> +endef
> +
> +BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
> +
> +define BOINC_INSTALL_INIT_SYSV
> +	 $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
> +		$(TARGET_DIR)/etc/init.d/S99boinc-client
> +endef
> +
> +define BOINC_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/boinc/boinc-client.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/boinc-client.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
boinc-client.service
> +endef
> +
> +$(eval $(autotools-package))

Regards, Bernd
