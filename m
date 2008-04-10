From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 11:32:51 +0000
Subject: [Buildroot] advice on makefile
Message-ID: <1207827171.6817.432.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>  Nigel> $(DL_DIR)/$(RPM_SOURCE):
>  Nigel> 	$(WGET) -P $(DL_DIR) $(RPM_SITE)/$(RPM_SOURCE)
> 
>  Nigel> rpm-source: $(DL_DIR)/$(RPM_SOURCE)
> 
>  Nigel> $(RPM_DIR)/.unpacked: $(DL_DIR)/$(RPM_SOURCE)
>  Nigel> 	$(RPM_CAT) $(DL_DIR)/$(RPM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  Nigel> 	find $(RPM_DIR) -name '*.rej' | xargs --no-run-if-empty rm
> 
> What are those .rej files?

RPM5 v4.4.9 contained .rej files in the tar.gz, which made patch-kernel
choke.  Dirty I know ... but yea


>  Nigel> 	toolchain/patch-kernel.sh $(RPM_DIR) package/rpm/ rpm\*.patch
>  Nigel> 	touch $@
> 
>  Nigel> 		#perl -pi -e 's|#![^ ]+ |#!/bin/|' installplatform; 
> 
> Please use sed for replacing text.

Removed that line. it was hanging around from my previous cleanup ... :\


>  Nigel> $(RPM_DIR)/.configured: $(RPM_DIR)/.unpacked
> 
> It looks like you need to depend on beecrypt and neon installing into
> STAGING_DIR.

I do this later on....
rpm: libbeecrypt libneon libpopt ...

Problem is I don't want to depend on the fixed library names .... would
you suggest I depend on  $(STAGING_DIR)/usr/lib/libbeecrypt.so ... etc?



>  Nigel> 	(cd $(RPM_DIR); rm -rf config.cache; \
>  Nigel> 		autoreconf; \
>  Nigel> 		$(TARGET_CONFIGURE_OPTS) \
>  Nigel> 		$(TARGET_CONFIGURE_ARGS) \
>  Nigel> 		CFLAGS="$(CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
>  Nigel> 		LDFLAGS="-lz" \
>  Nigel> 		ac_cv_va_copy=yes \
>  Nigel> 		./configure \
>  Nigel> 		--target=$(GNU_TARGET_NAME) \
>  Nigel> 		--host=$(GNU_TARGET_NAME) \
>  Nigel> 		--build=$(GNU_HOST_NAME) \
>  Nigel> 		--prefix=$(STAGING_DIR)/usr \
>  Nigel> 		--exec_prefix=$(STAGING_DIR) \
>  Nigel> 		--libdir=$(STAGING_DIR)/usr/lib \
>  Nigel> 		--includedir=$(STAGING_DIR)/usr/include \
>  Nigel> 		--bindir=/usr/bin \
>  Nigel> 		--sbindir=/usr/sbin \
>  Nigel> 		--libexecdir=/usr/lib \
>  Nigel> 		--sysconfdir=/etc \
>  Nigel> 		--datadir=/usr/share \
>  Nigel> 		--localstatedir=/var \
>  Nigel> 		--mandir=/usr/man \
>  Nigel> 		--infodir=/usr/info \
> 
> Is all of this needed? Normally you just need to set prefix=/usr and
> use DESTDIR when installing into STAGING_DIR / TARGET_DIR.

I can try filter it out a bit, but 4.4.9 was very very picky.


>  Nigel> 		--program-prefix= \
>  Nigel> 		--disable-build-versionscript \
>  Nigel> 		--without-selinux \
>  Nigel> 		--without-python \
> 
> We have a python package. Maybe we should add something like the
> DISABLE_NLS stuff for it?

Lets get rpm in without python, then improve on the extras later :)



>  Nigel> 		--without-perl \
>  Nigel> 		$(DISABLE_NLS) \
>  Nigel> 	)
>  Nigel> 	touch $@
> 
>  Nigel> $(RPM_DIR)/.built: $(RPM_DIR)/.configured
>  Nigel> 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(RPM_DIR)
>  Nigel> 	touch $@
> 
>  Nigel> RPM_STAGING_LIBS:=$(addprefix $(STAGING_DIR)/usr/lib/,$(RPM_LIBS))
>  Nigel> RPM_STAGING_BINARIES:=$(addprefix $(STAGING_DIR)/usr/bin/, $(addprefix $(GNU_TARGET_NAME)-,$(RPM_BINARIES)))
> 
>  Nigel> $(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES): $(RPM_DIR)/.built
>  Nigel> 	$(MAKE) prefix=$(STAGING_DIR) \
>  Nigel> 	    exec_prefix=$(STAGING_DIR) \
>  Nigel> 	    bindir=$(STAGING_DIR)/usr/bin \
>  Nigel> 	    sbindir=$(STAGING_DIR)/usr/sbin \
>  Nigel> 	    libexecdir=$(STAGING_DIR)/usr/lib \
>  Nigel> 	    datadir=$(STAGING_DIR)/usr/share \
>  Nigel> 	    sysconfdir=$(STAGING_DIR)/etc \
>  Nigel> 	    sharedstatedir=$(STAGING_DIR)/com \
>  Nigel> 	    localstatedir=$(STAGING_DIR)/var \
>  Nigel> 	    libdir=$(STAGING_DIR)/usr/lib \
>  Nigel> 	    includedir=$(STAGING_DIR)/usr/include \
>  Nigel> 	    infodir=$(STAGING_DIR)/usr/info \
>  Nigel> 	    mandir=$(STAGING_DIR)/usr/man \
> 
> Is this needed? Doesn't make install support DESTDIR=$(STAGING_DIR)?

4.4.9 was a nightmare ... I started from scratch, then added line by
line. I'll try 5.0.x and filter out.


>  Nigel> 	    -C $(RPM_DIR) install
> 
>  Nigel> RPM_TARGET_LIBS:=$(addprefix $(TARGET_DIR)/usr/lib/,$(RPM_LIBS))
>  Nigel> RPM_TARGET_BINARIES:=$(addprefix $(TARGET_DIR)/usr/bin/,$(RPM_BINARIES))
> 
> 
>  Nigel> $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES): $(RPM_STAGING_LIBS) $(RPM_STAGING_BINARIES)
>  Nigel> 	mkdir -p $(TARGET_DIR)/usr/lib/rpm
>  Nigel> 	for i in $(RPM_BINARIES); do cp -pf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$i $(TARGET_DIR)/usr/bin/$$i; done
> 
> Well, RPM_BINARIES=rpm, so if you don't forsee more programs to be
> added, just drop the loop.

yea ... i'm busy trying to determine if more are required


> 
>  Nigel> ifeq ($(BR2_HAVE_MANPAGES),y)
>  Nigel> 	mkdir -p $(STAGING_DIR)/usr/man/man{1,8}
>  Nigel> 	for i in gendiff; do gzip -9 < $(STAGING_DIR)/usr/man/man1/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man1/$i.1.gz; done
>  Nigel> 	for i in rpm rpmbuild rpm2cpio; do gzip -9 < $(STAGING_DIR)/usr/man/man8/$(GNU_TARGET_NAME)-$i.1 > $(TARGET_DIR)/usr/man/man8/$i.8.gz; done
>  Nigel> endif
> 
>  Nigel> rpm: libbeecrypt libneon libpopt $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES)
> 
> The rpm target shouldn't depend on the full installation in TARGET_DIR
> of libeecrypt / libneon / libpopt, instead the configure target should
> depend on those libraries installing into $(STAGING_DIR).


I looked in some other .mk's and saw they normally depend on the package
name?


>  Nigel> rpm-clean:
>  Nigel> 	rm -f $(TARGET_DIR)/bin/rpm
>  Nigel> 	for i in $(BIN_PROGS) $(BIN2_PROGS); do rm -f $(TARGET_DIR)/usr/bin/$$i; done
> 
> What are BIN_PROGS / BIN2_PROGS?

cruft left over ...


-N


-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/07c8bf3e/attachment.pgp 
