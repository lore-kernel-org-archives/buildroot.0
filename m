From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Thu, 24 Jul 2008 13:12:58 +0100
Subject: [Buildroot] Cannot build a worling alsactl or alsamixer using
	buildroot
Message-ID: <200807241312.59136.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the information of others, we have fixed this problem, or rather worked 
out the correct set of make values to make it work.

There are two values in the alsa-lib.mk file that need to be correct.

If you are an OABI built kernel, make sure you do not have -mabi=aapcs-linux 
set in your CFLAGS.

If you are an EABI built kernel, make sure you do have -mabi=aapcs-linux set 
in your CFLAGS.

Then in both cases, in the ./configure part make sure you add 

--with-versioned=no

We have tried this with 1.0.15 alsa-utils and alsa-lib and all is working, 
alsamixer, aplay etc. 

Thanks to the others who have posted about these problems. This is just a 
summary of their work.

Cheers,

Dirk

Working 1.0.15 alsa-lib.mk file (OABI Kernel)

#############################################################
#
# alsa-lib
#
#############################################################
ALSA_LIB_VERSION = 1.0.15
ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
ALSA_LIB_AUTORECONF = NO
ALSA_LIB_INSTALL_STAGING = YES
ALSA_LIB_INSTALL_TARGET = YES
ALSA_LIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) 
LDFLAGS=-L$(STAGING_DIR)/usr/lib install
ALSA_LIB_CONF_ENV =
ALSA_LIB_CONF_OPT 
= --build=$(GNU_HOST_NAME) --with-versioned=no --enable-shared --enable-static --prefix=/usr --sysconfdir=/etc --disable-docs --disable-python 
$(DISABLE_NLS)
ALSA_LIB_DEPENDENCIES = uclibc

ifeq ($(BR2_arm),y)
ALSA_LIB_CONF_ENV += CFLAGS="$(TARGET_CFLAGS)"
endif

ifeq ($(BR2_SOFT_FLOAT),y)
	ALSA_LIB_CONF_OPT += --with-softfloat
	ALSA_LIB_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lm"
endif

$(eval $(call AUTOTARGETS,package,alsa-lib))

$(ALSA_LIB_TARGET_INSTALL_TARGET): $(ALSA_LIB_TARGET_INSTALL_STAGING)
	$(call MESSAGE,"Installing to target")
	mkdir -p $(TARGET_DIR)/usr/share/alsa $(TARGET_DIR)/usr/lib/alsa-lib
	cp -dpf $(STAGING_DIR)/usr/lib/libasound.so* $(TARGET_DIR)/usr/lib/
	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
	find $(TARGET_DIR)/usr/lib/alsa-lib/ -regextype 
posix-egrep -regex '.*((\.la)|(\.a))[~]{0,1}' -delete
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) 
$(TARGET_DIR)/usr/lib/alsa-lib/smixer/*.so
	$(Q)touch $@

$(ALSA_LIB_TARGET_UNINSTALL):
	$(call MESSAGE,"Uninstalling")
	-rm -f $(TARGET_DIR)/usr/lib/libasound*.so*
	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib/
	$(ALSA_LIB_MAKE_ENV) $(MAKE) $(ALSA_LIB_UNINSTALL_STAGING_OPT) -C 
$(@D)/$(ALSA_LIB_SUBDIR)
	$(Q)-rm $(@D)/$(ALSA_LIB_SUBDIR)/.stamp_target_installed
	$(Q)-rm $(@D)/$(ALSA_LIB_SUBDIR)/.stamp_staging_installed
