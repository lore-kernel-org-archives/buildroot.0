From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 8 Jul 2008 06:07:21 -0700 (PDT)
Subject: [Buildroot] [patch] alsa-lib, alsa-utils update
In-Reply-To: <408540dd0806252227r7b261bffr5f9af71834730af@mail.gmail.com>
References: <408540dd0806252227r7b261bffr5f9af71834730af@mail.gmail.com>
Message-ID: <18338812.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have updated the patches slightly to fix the build for me.  I hope these
are ok.

The patches are applied.  I have also raised a feature ticket in buildroot
 0004014 Alsa-Lib and Alsa-Utils are not the latest versions or using
package build system

Cheers
Dan
http://www.nabble.com/file/p18338812/alsa-lib-utils.patch
alsa-lib-utils.patch 


Matthew Dombroski wrote:
> 
> Bump version to 1.0.16 for both alsa-utils, alsa-lib
> Rewrite for newer package build system
> 
> any comments?
> 
> ~Matthew
> 
> Index: alsa-lib/alsa-lib.mk
> ===================================================================
> --- alsa-lib/alsa-lib.mk	(revision 21977)
> +++ alsa-lib/alsa-lib.mk	(working copy)
> @@ -3,85 +3,43 @@
>  # alsa-lib
>  #
>  #############################################################
> -ALSA_LIB_VERSION:=1.0.14a
> -ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
> -ALSA_LIB_SITE:=ftp://ftp.alsa-project.org/pub/lib
> -ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)
> -ALSA_LIB_CAT:=$(BZCAT)
> -ALSA_LIB_BINARY:=libasound.so.2.0.0
> -ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
> +ALSA_LIB_VERSION = 1.0.16
> +ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
> +ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
> +ALSA_LIB_AUTORECONF = NO
> +ALSA_LIB_INSTALL_STAGING = YES
> +ALSA_LIB_INSTALL_TARGET = YES
> +ALSA_LIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
> LDFLAGS=-L$(STAGING_DIR)/usr/lib install
> +ALSA_LIB_CONF_ENV = 
> +ALSA_LIB_CONF_OPT = --build=$(GNU_HOST_NAME) --enable-shared
> --enable-static --prefix=/usr --sysconfdir=/etc --disable-docs
> --disable-python $(DISABLE_NLS) 
> +ALSA_LIB_DEPENDENCIES = uclibc 
>  
>  ifeq ($(BR2_arm),y)
> -ALSA_LIB_ABI:=-mabi=aapcs-linux
> -else
> -ALSA_LIB_ABI:=
> +ALSA_LIB_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux"
>  endif
>  
>  ifeq ($(BR2_SOFT_FLOAT),y)
> -	SOFT_FLOAT=--with-softfloat
> +ALSA_LIB_CONF_OPT += --with-softfloat
>  endif
>  
> -$(DL_DIR)/$(ALSA_LIB_SOURCE):
> -	$(WGET) -P $(DL_DIR) $(ALSA_LIB_SITE)/$(ALSA_LIB_SOURCE)
> +$(eval $(call AUTOTARGETS,package,alsa-lib))
>  
> -$(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
> -	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
> -	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/alsa-lib/
> alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
> -	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
> -	touch $@
> -
> -$(ALSA_LIB_DIR)/.configured: $(ALSA_LIB_DIR)/.unpacked
> -	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
> -		$(TARGET_CONFIGURE_ARGS) \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS) $(ALSA_LIB_ABI)" \
> -		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
> -		./configure \
> -		--target=$(GNU_TARGET_NAME) \
> -		--host=$(GNU_TARGET_NAME) \
> -		--build=$(GNU_HOST_NAME) \
> -		--prefix=/usr \
> -		--sysconfdir=/etc \
> -		--enable-shared \
> -		--enable-static \
> -		--disable-docs \
> -		$(SOFT_FLOAT) \
> -		$(DISABLE_NLS) \
> -	)
> -	touch $@
> -
> -$(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
> -	$(MAKE) -C $(ALSA_LIB_DIR)
> -	touch -c $@
> -
> -$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY):
> $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
> -	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
> -	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g"
> $(STAGING_DIR)/usr/lib/libasound.la
> -
> -$(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY):
> $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
> +$(ALSA_LIB_TARGET_INSTALL_TARGET): $(ALSA_LIB_TARGET_INSTALL_STAGING)
> +	$(call MESSAGE,"Installing to target")
>  	mkdir -p $(TARGET_DIR)/usr/share/alsa $(TARGET_DIR)/usr/lib/alsa-lib
>  	cp -dpf $(STAGING_DIR)/usr/lib/libasound.so* $(TARGET_DIR)/usr/lib/
>  	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
>  	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/*
> $(TARGET_DIR)/usr/lib/alsa-lib/
> +	find $(TARGET_DIR)/usr/lib/alsa-lib/ -regextype posix-egrep -regex
> '.*((\.la)|(\.a))[~]{0,1}' -delete
>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
> $(TARGET_DIR)/usr/lib/alsa-lib/smixer/*.so
> -	touch -c $@
> +	$(Q)touch $@
>  
> -alsa-lib: uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
> +$(ALSA_LIB_TARGET_UNINSTALL):
> +	$(call MESSAGE,"Uninstalling")
> +	-rm -f $(TARGET_DIR)/usr/lib/libasound*.so*
> +	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib/
> +	$(ALSA_LIB_MAKE_ENV) $(MAKE) $(ALSA_LIB_UNINSTALL_STAGING_OPT) -C
> $(@D)/$(ALSA_LIB_SUBDIR)
> +	$(Q)-rm $(@D)/$(ALSA_LIB_SUBDIR)/.stamp_target_installed
> +	$(Q)-rm $(@D)/$(ALSA_LIB_SUBDIR)/.stamp_staging_installed
>  
> -alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
> -
> -alsa-lib-clean:
> -	rm -f $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
> -	-$(MAKE) -C $(ALSA_LIB_DIR) clean
> -
> -alsa-lib-dirclean:
> -	rm -rf $(ALSA_LIB_DIR)
> -#############################################################
> -#
> -# Toplevel Makefile options
> -#
> -#############################################################
> -ifeq ($(strip $(BR2_PACKAGE_ALSA_LIB)),y)
> -TARGETS+=alsa-lib
> -endif
> 
> Index: alsa-utils/alsa-utils.mk
> ===================================================================
> --- alsa-utils/alsa-utils.mk	(revision 21977)
> +++ alsa-utils/alsa-utils.mk	(working copy)
> @@ -3,41 +3,16 @@
>  # alsa-utils
>  #
>  #############################################################
> -ALSA_UTILS_VERSION:=1.0.14
> -ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
> -ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
> -ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
> -ALSA_UTILS_CAT:=$(BZCAT)
> -ALSA_UTILS_BINARY:=alsactl/alsactl
> -ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
> +ALSA_UTILS_VERSION = 1.0.16
> +ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
> +ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
> +ALSA_UTILS_AUTORECONF = NO
> +ALSA_UTILS_INSTALL_STAGING = YES
> +ALSA_UTILS_INSTALL_TARGET = YES
> +ALSA_UTILS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
> LDFLAGS=-L$(STAGING_DIR)/usr/lib install
> +ALSA_UTILS_CONF_OPT = --build=$(GNU_HOST_NAME) --prefix=/usr
> $(DISABLE_NLS) 
> +ALSA_UTILS_DEPENDENCIES = uclibc alsa-lib
>  
> -$(DL_DIR)/$(ALSA_UTILS_SOURCE):
> -	$(WGET) -P $(DL_DIR) $(ALSA_UTILS_SITE)/$(ALSA_UTILS_SOURCE)
> -
> -$(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
> -	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
> -	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/
> alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
> -	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
> -	touch $@
> -
> -$(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
> -	(cd $(ALSA_UTILS_DIR); rm -f config.cache; \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(TARGET_CONFIGURE_ARGS) \
> -		CFLAGS="$(TARGET_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)" \
> -		./configure \
> -		--target=$(GNU_TARGET_NAME) \
> -		--host=$(GNU_TARGET_NAME) \
> -		--build=$(GNU_HOST_NAME) \
> -		--prefix=/usr \
> -	)
> -	touch $@
> -
> -$(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
> -	$(MAKE) CC=$(TARGET_CC) -C $(ALSA_UTILS_DIR)
> -	touch -c $@
> -
>  ALSA_UTILS_TARGETS_ :=
>  ALSA_UTILS_TARGETS_y :=
>  
> @@ -56,41 +31,36 @@
>  ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET) += usr/bin/aseqnet
>  ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) +=
> usr/bin/speaker-test
>  
> -$(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY):
> $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY)
> -	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_UTILS_DIR) install
> -	mkdir -p $(TARGET_DIR)/usr/bin
> -	mkdir -p $(TARGET_DIR)/usr/sbin
> -	for file in $(ALSA_UTILS_TARGETS_y); do \
> +
> +$(eval $(call AUTOTARGETS,package,alsa-utils))
> +
> +$(ALSA_UTILS_TARGET_INSTALL_TARGET): $(ALSA_UTILS_TARGET_INSTALL_STAGING)
> +	$(call MESSAGE,"Installing to target")
> +	$(Q)mkdir -p $(TARGET_DIR)/usr/bin
> +	$(Q)mkdir -p $(TARGET_DIR)/usr/sbin
> +	$(Q)for file in $(ALSA_UTILS_TARGETS_y); do \
>  		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
> +		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
> +		echo "Copy to target: $(TARGET_DIR)/$$file"; \
>  	done
> -	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
> -		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
> -		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
> -		cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/*
> $(TARGET_DIR)/usr/share/alsa/speaker-test/; \
> -		cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/*
> $(TARGET_DIR)/usr/share/sounds/alsa/; \
> -	fi
> -	touch -c $@
> +ifeq ($(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST),y)
> +	$(Q)mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test
> +	$(Q)mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa
> +	$(Q)echo "Copy to target: speaker-test data"
> +	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/*
> $(TARGET_DIR)/usr/share/alsa/speaker-test/
> +	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/*
> $(TARGET_DIR)/usr/share/sounds/alsa/
> +endif
> +	$(Q)touch $@
>  
> -alsa-utils: uclibc alsa-lib ncurses
> $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
> -
> -alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
> -
> -alsa-utils-clean:
> -	for file in $(ALSA_UTILS_TARGETS_y); do \
> +$(ALSA_UTILS_TARGET_UNINSTALL):
> +	$(call MESSAGE,"Uninstalling")
> +	$(Q)for file in $(ALSA_UTILS_TARGETS_y); do \
>  		rm -f $(TARGET_DIR)/$$file; \
> +		echo "Remove: $(TARGET_DIR)/$$file"; \
>  	done
> -	for file in $(ALSA_UTILS_TARGETS_); do \
> -		rm -f $(TARGET_DIR)/$$file; \
> -	done
> -	-$(MAKE) -C $(ALSA_UTILS_DIR) clean
> +	-rm -rf $(TARGET_DIR)/usr/share/alsa/speaker-test/
> +	-rm -rf $(TARGET_DIR)/usr/share/sounds/alsa/
> +	$(ALSA_UTILS_MAKE_ENV) $(MAKE) $(ALSA_UTILS_UNINSTALL_STAGING_OPT) -C
> $(@D)/$(ALSA_UTILS_SUBDIR)
> +	$(Q)-rm $(@D)/$(ALSA_UTILS_SUBDIR)/.stamp_target_installed
> +	$(Q)-rm $(@D)/$(ALSA_UTILS_SUBDIR)/.stamp_staging_installed
>  
> -alsa-utils-dirclean:
> -	rm -rf $(ALSA_UTILS_DIR)
> -#############################################################
> -#
> -# Toplevel Makefile options
> -#
> -#############################################################
> -ifeq ($(strip $(BR2_PACKAGE_ALSA_UTILS)),y)
> -TARGETS+=alsa-utils
> -endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/-patch--alsa-lib%2C-alsa-utils-update-tp18126818p18338812.html
Sent from the BuildRoot mailing list archive at Nabble.com.
