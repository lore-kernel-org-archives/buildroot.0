From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 07:52:36 +0000
Subject: [Buildroot] advice on makefile
Message-ID: <1207813956.6817.405.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

Could someone lend me some tips on improving my rpm.mk file, I"m not
happy to commit it yet as it looks scrappy. I've spent a few hours
looking over it and reading the gnu make manpage.

As I think another chap pointed out, Makefiles are not shell scripts,
but what is the right way then to install? I know $(INSTALL) but
makefile equiv for for i in xxxx yyy zzz?

-N
-------------- next part --------------
#############################################################
#
# rpm
#
#############################################################
RPM_VERSION:=5.0.3
RPM_SOURCE:=rpm-$(RPM_VERSION).tar.gz
RPM_SITE:=http://rpm5.org/files/rpm/rpm-5.0/
RPM_DIR:=$(BUILD_DIR)/rpm-$(RPM_VERSION)
RPM_CAT:=$(ZCAT)
RPM_BINARIES:=rpm
RPM_LIBS:=librpmio-5.0.so librpmdb-5.0.so librpm-5.0.so librpmbuild-5.0.so librpmmisc-5.0.so


$(DL_DIR)/$(RPM_SOURCE):
	$(WGET) -P $(DL_DIR) $(RPM_SITE)/$(RPM_SOURCE)

rpm-source: $(DL_DIR)/$(RPM_SOURCE)

$(RPM_DIR)/.unpacked: $(DL_DIR)/$(RPM_SOURCE)
	$(RPM_CAT) $(DL_DIR)/$(RPM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	find $(RPM_DIR) -name '*.rej' | xargs --no-run-if-empty rm
	toolchain/patch-kernel.sh $(RPM_DIR) package/rpm/ rpm\*.patch
	touch $@

		#perl -pi -e 's|#![^ ]+ |#!/bin/|' installplatform; 
$(RPM_DIR)/.configured: $(RPM_DIR)/.unpacked
	(cd $(RPM_DIR); rm -rf config.cache; \
		autoreconf; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		CFLAGS="$(CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
		LDFLAGS="-lz" \
		ac_cv_va_copy=yes \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=$(STAGING_DIR)/usr \
		--exec_prefix=$(STAGING_DIR) \
		--libdir=$(STAGING_DIR)/usr/lib \
		--includedir=$(STAGING_DIR)/usr/include \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/man \
		--infodir=/usr/info \
		--program-prefix= \
		--disable-build-versionscript \
		--without-selinux \
		--without-python \
		--without-perl \
		$(DISABLE_NLS) \
	)
	touch $@

$(RPM_DIR)/.built: $(RPM_DIR)/.configured
	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(RPM_DIR)
	touch $@

RPM_STAGING_LIBS:=$(addprefix $(STAGING_DIR)/usr/lib/,$(RPM_LIBS))
RPM_STAGING_BINARIES:=$(addprefix $(STAGING_DIR)/usr/bin/, $(addprefix $(GNU_TARGET_NAME)-,$(RPM_BINARIES)))

$(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES): $(RPM_DIR)/.built
	$(MAKE) prefix=$(STAGING_DIR) \
	    exec_prefix=$(STAGING_DIR) \
	    bindir=$(STAGING_DIR)/usr/bin \
	    sbindir=$(STAGING_DIR)/usr/sbin \
	    libexecdir=$(STAGING_DIR)/usr/lib \
	    datadir=$(STAGING_DIR)/usr/share \
	    sysconfdir=$(STAGING_DIR)/etc \
	    sharedstatedir=$(STAGING_DIR)/com \
	    localstatedir=$(STAGING_DIR)/var \
	    libdir=$(STAGING_DIR)/usr/lib \
	    includedir=$(STAGING_DIR)/usr/include \
	    infodir=$(STAGING_DIR)/usr/info \
	    mandir=$(STAGING_DIR)/usr/man \
	    -C $(RPM_DIR) install

RPM_TARGET_LIBS:=$(addprefix $(TARGET_DIR)/usr/lib/,$(RPM_LIBS))
RPM_TARGET_BINARIES:=$(addprefix $(TARGET_DIR)/usr/bin/,$(RPM_BINARIES))


$(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES): $(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES)
	mkdir -p $(TARGET_DIR)/usr/lib/rpm
	for i in $(RPM_BINARIES); do cp -pf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$i $(TARGET_DIR)/usr/bin/$$i; done
	for i in $(RPM_LIBS); do cp -pf $(STAGING_DIR)/usr/lib/$$i $(TARGET_DIR)/usr/lib/$$i; done
ifeq ($(BR2_HAVE_MANPAGES),y)
	mkdir -p $(STAGING_DIR)/usr/man/man{1,8}
	for i in gendiff; do gzip -9 < $(STAGING_DIR)/usr/man/man1/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man1/$i.1.gz; done
	for i in rpm rpmbuild rpm2cpio; do gzip -9 < $(STAGING_DIR)/usr/man/man8/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man8/$i.8.gz; done
endif

rpm: libbeecrypt libneon libpopt $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES)

rpm-clean:
	rm -f $(TARGET_DIR)/bin/rpm
	for i in $(BIN_PROGS) $(BIN2_PROGS); do rm -f $(TARGET_DIR)/usr/bin/$$i; done
	for i in $(LIBS); do rm -f $(TARGET_DIR)/usr/lib/$$i; done
	rm -rf $(TARGET_DIR)/usr/lib/rpm
	-$(MAKE) -C $(RPM_DIR) clean

rpm-dirclean:
	rm -rf $(RPM_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_RPM)),y)
TARGETS+=rpm
endif
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/b659e3fd/attachment.pgp 
