From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 10:37:36 +0200
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207813956.6817.405.camel@nigel-x60> (Nigel Kukard's message of
	"Thu\, 10 Apr 2008 07\:52\:36 +0000")
References: <1207813956.6817.405.camel@nigel-x60>
Message-ID: <87k5j6aywf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 Nigel> Hi Guys,
 Nigel> Could someone lend me some tips on improving my rpm.mk file, I"m not
 Nigel> happy to commit it yet as it looks scrappy. I've spent a few hours
 Nigel> looking over it and reading the gnu make manpage.

 Nigel> As I think another chap pointed out, Makefiles are not shell scripts,
 Nigel> but what is the right way then to install? I know $(INSTALL) but
 Nigel> makefile equiv for for i in xxxx yyy zzz?

 Nigel> -N

 Nigel> #############################################################
 Nigel> #
 Nigel> # rpm
 Nigel> #
 Nigel> #############################################################
 Nigel> RPM_VERSION:=5.0.3
 Nigel> RPM_SOURCE:=rpm-$(RPM_VERSION).tar.gz
 Nigel> RPM_SITE:=http://rpm5.org/files/rpm/rpm-5.0/
 Nigel> RPM_DIR:=$(BUILD_DIR)/rpm-$(RPM_VERSION)
 Nigel> RPM_CAT:=$(ZCAT)
 Nigel> RPM_BINARIES:=rpm
 Nigel> RPM_LIBS:=librpmio-5.0.so librpmdb-5.0.so librpm-5.0.so librpmbuild-5.0.so librpmmisc-5.0.so

You could use patsubst, E.G.:

RPM_LIBS=$(patsubst %,lib%-5.0.so,rpmio rpmdb rpm rpmbuild rpmmisc)

 Nigel> $(DL_DIR)/$(RPM_SOURCE):
 Nigel> 	$(WGET) -P $(DL_DIR) $(RPM_SITE)/$(RPM_SOURCE)

 Nigel> rpm-source: $(DL_DIR)/$(RPM_SOURCE)

 Nigel> $(RPM_DIR)/.unpacked: $(DL_DIR)/$(RPM_SOURCE)
 Nigel> 	$(RPM_CAT) $(DL_DIR)/$(RPM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 Nigel> 	find $(RPM_DIR) -name '*.rej' | xargs --no-run-if-empty rm

What are those .rej files?

 Nigel> 	toolchain/patch-kernel.sh $(RPM_DIR) package/rpm/ rpm\*.patch
 Nigel> 	touch $@

 Nigel> 		#perl -pi -e 's|#![^ ]+ |#!/bin/|' installplatform; 

Please use sed for replacing text.

 Nigel> $(RPM_DIR)/.configured: $(RPM_DIR)/.unpacked

It looks like you need to depend on beecrypt and neon installing into
STAGING_DIR.

 Nigel> 	(cd $(RPM_DIR); rm -rf config.cache; \
 Nigel> 		autoreconf; \
 Nigel> 		$(TARGET_CONFIGURE_OPTS) \
 Nigel> 		$(TARGET_CONFIGURE_ARGS) \
 Nigel> 		CFLAGS="$(CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
 Nigel> 		LDFLAGS="-lz" \
 Nigel> 		ac_cv_va_copy=yes \
 Nigel> 		./configure \
 Nigel> 		--target=$(GNU_TARGET_NAME) \
 Nigel> 		--host=$(GNU_TARGET_NAME) \
 Nigel> 		--build=$(GNU_HOST_NAME) \
 Nigel> 		--prefix=$(STAGING_DIR)/usr \
 Nigel> 		--exec_prefix=$(STAGING_DIR) \
 Nigel> 		--libdir=$(STAGING_DIR)/usr/lib \
 Nigel> 		--includedir=$(STAGING_DIR)/usr/include \
 Nigel> 		--bindir=/usr/bin \
 Nigel> 		--sbindir=/usr/sbin \
 Nigel> 		--libexecdir=/usr/lib \
 Nigel> 		--sysconfdir=/etc \
 Nigel> 		--datadir=/usr/share \
 Nigel> 		--localstatedir=/var \
 Nigel> 		--mandir=/usr/man \
 Nigel> 		--infodir=/usr/info \

Is all of this needed? Normally you just need to set prefix=/usr and
use DESTDIR when installing into STAGING_DIR / TARGET_DIR.

 Nigel> 		--program-prefix= \
 Nigel> 		--disable-build-versionscript \
 Nigel> 		--without-selinux \
 Nigel> 		--without-python \

We have a python package. Maybe we should add something like the
DISABLE_NLS stuff for it?

 Nigel> 		--without-perl \
 Nigel> 		$(DISABLE_NLS) \
 Nigel> 	)
 Nigel> 	touch $@

 Nigel> $(RPM_DIR)/.built: $(RPM_DIR)/.configured
 Nigel> 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(RPM_DIR)
 Nigel> 	touch $@

 Nigel> RPM_STAGING_LIBS:=$(addprefix $(STAGING_DIR)/usr/lib/,$(RPM_LIBS))
 Nigel> RPM_STAGING_BINARIES:=$(addprefix $(STAGING_DIR)/usr/bin/, $(addprefix $(GNU_TARGET_NAME)-,$(RPM_BINARIES)))

 Nigel> $(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES): $(RPM_DIR)/.built
 Nigel> 	$(MAKE) prefix=$(STAGING_DIR) \
 Nigel> 	    exec_prefix=$(STAGING_DIR) \
 Nigel> 	    bindir=$(STAGING_DIR)/usr/bin \
 Nigel> 	    sbindir=$(STAGING_DIR)/usr/sbin \
 Nigel> 	    libexecdir=$(STAGING_DIR)/usr/lib \
 Nigel> 	    datadir=$(STAGING_DIR)/usr/share \
 Nigel> 	    sysconfdir=$(STAGING_DIR)/etc \
 Nigel> 	    sharedstatedir=$(STAGING_DIR)/com \
 Nigel> 	    localstatedir=$(STAGING_DIR)/var \
 Nigel> 	    libdir=$(STAGING_DIR)/usr/lib \
 Nigel> 	    includedir=$(STAGING_DIR)/usr/include \
 Nigel> 	    infodir=$(STAGING_DIR)/usr/info \
 Nigel> 	    mandir=$(STAGING_DIR)/usr/man \

Is this needed? Doesn't make install support DESTDIR=$(STAGING_DIR)?
 Nigel> 	    -C $(RPM_DIR) install

 Nigel> RPM_TARGET_LIBS:=$(addprefix $(TARGET_DIR)/usr/lib/,$(RPM_LIBS))
 Nigel> RPM_TARGET_BINARIES:=$(addprefix $(TARGET_DIR)/usr/bin/,$(RPM_BINARIES))


 Nigel> $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES): $(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES)
 Nigel> 	mkdir -p $(TARGET_DIR)/usr/lib/rpm
 Nigel> 	for i in $(RPM_BINARIES); do cp -pf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$i $(TARGET_DIR)/usr/bin/$$i; done

Well, RPM_BINARIES=rpm, so if you don't forsee more programs to be
added, just drop the loop.

 Nigel> 	for i in $(RPM_LIBS); do cp -pf $(STAGING_DIR)/usr/lib/$$i $(TARGET_DIR)/usr/lib/$$i; done

cp -pf $(RPM_STAGING_LIBS) $(TARGET_DIR)/usr/lib ?

 Nigel> ifeq ($(BR2_HAVE_MANPAGES),y)
 Nigel> 	mkdir -p $(STAGING_DIR)/usr/man/man{1,8}
 Nigel> 	for i in gendiff; do gzip -9 < $(STAGING_DIR)/usr/man/man1/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man1/$i.1.gz; done
 Nigel> 	for i in rpm rpmbuild rpm2cpio; do gzip -9 < $(STAGING_DIR)/usr/man/man8/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man8/$i.8.gz; done
 Nigel> endif

 Nigel> rpm: libbeecrypt libneon libpopt $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES)

The rpm target shouldn't depend on the full installation in TARGET_DIR
of libeecrypt / libneon / libpopt, instead the configure target should
depend on those libraries installing into $(STAGING_DIR).

 Nigel> rpm-clean:
 Nigel> 	rm -f $(TARGET_DIR)/bin/rpm
 Nigel> 	for i in $(BIN_PROGS) $(BIN2_PROGS); do rm -f $(TARGET_DIR)/usr/bin/$$i; done

What are BIN_PROGS / BIN2_PROGS?

Why not simply rm -f $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES) instead?
 Nigel> 	for i in $(LIBS); do rm -f $(TARGET_DIR)/usr/lib/$$i; done
 Nigel> 	rm -rf $(TARGET_DIR)/usr/lib/rpm
 Nigel> 	-$(MAKE) -C $(RPM_DIR) clean

What about the manpages?

 Nigel> rpm-dirclean:
 Nigel> 	rm -rf $(RPM_DIR)
 Nigel> #############################################################
 Nigel> #
 Nigel> # Toplevel Makefile options
 Nigel> #
 Nigel> #############################################################
 Nigel> ifeq ($(strip $(BR2_PACKAGE_RPM)),y)
 Nigel> TARGETS+=rpm
 Nigel> endif

-- 
Bye, Peter Korsgaard
