From: Clark Rawlins <clark.rawlins@escient.com>
Date: Mon, 04 Jan 2010 08:01:44 -0500
Subject: [Buildroot] [PATCH] Permit building grub with an external
 toolchain.
In-Reply-To: <1262526218.23927.27.camel@venture>
References: <1262472376.23927.19.camel@venture>
	<1262477625.23193.2.camel@coalu.atr>
	<1262484948.23927.25.camel@venture>
	<1262491694.23193.10.camel@coalu.atr>
	<1262526218.23927.27.camel@venture>
Message-ID: <1262610104.3853.6.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is my attempt to use the autotools macros.
I look forward to any discussion, suggestions for improvement etc.

I attach the whole file since it is effectively a rewrite.  If it is
acceptable I will submit as a git diff against head.  

On Sun, 2010-01-03 at 08:43 -0500, Clark Rawlins wrote:
> Okay,
> 
> I've started looking at this but it isn't clear to me how to handle the
> following:
> 
> $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
> 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
> 	rm -f $(GRUB_DIR)/$(GRUB_BINARY)
> 	$(MAKE) CC=$(TARGET_CC) CFLAGS+=-static -C $(GRUB_DIR)/grub grub
> 	mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
> 	mv $(GRUB_DIR)/$(GRUB_BINARY) $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
> 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)/grub
> 
> This builds everything dynamically linked first then builds the grub binary statically.
> Is the right way to do this to override the target after/before calling the autotools macro?
> 
> 
> On Sun, 2010-01-03 at 05:08 +0100, Lionel Landwerlin wrote:
> > Here is one example :
> > 
> > http://git.buildroot.org/buildroot/commit/?id=21bab8862f3c2906af347e5a993ce4cd36c1b063
> > 
> > You can find a lot like this in the recent git history.
> > I'm think to the new infrastructure because it provides all the glue to
> > configure the package, especially the 2 lines you added.
> > 
> > Regards,
> > 
> > 
> > Le samedi 02 janvier 2010 ? 21:15 -0500, Clark Rawlins a ?crit :
> > > I could give that a shot.  I thought as a start I would go with the
> > > smallest change possible.  Any suggestions for an example to look at for
> > > switching grub to the autotools macros?
> > > 
> > > 
> > > On Sun, 2010-01-03 at 01:13 +0100, Lionel Landwerlin wrote:
> > > > Le samedi 02 janvier 2010 ? 17:46 -0500, Clark Rawlins a ?crit :
> > > > > Grub build failed at the link stage because it
> > > > > couldn't find libcurses. Adding these variable
> > > > > invocations to the configure line make it work.
> > > > > 
> > > > > Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
> > > > > ---
> > > > >  target/x86/grub/grub.mk |    2 ++
> > > > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > > > > 
> > > > > diff --git a/target/x86/grub/grub.mk b/target/x86/grub/grub.mk
> > > > > index af46244..21f089f 100644
> > > > > --- a/target/x86/grub/grub.mk
> > > > > +++ b/target/x86/grub/grub.mk
> > > > > @@ -81,6 +81,8 @@ $(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
> > > > >  $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
> > > > >  	(cd $(GRUB_DIR); rm -rf config.cache; \
> > > > >  		$(TARGET_CONFIGURE_OPTS) \
> > > > > +		$(TARGET_CONFIGURE_ARGS) \
> > > > > +		$(TARGET_CONFIGURE_ENV) \
> > > > >  		CFLAGS="$(TARGET_CFLAGS)" \
> > > > >  		CPPFLAGS="$(GRUB_CFLAGS)" \
> > > > >  		./configure $(QUIET) \
> > > > 
> > > > Maybe you should consider switching grub to the autotool infrastructure.
> > > > 
> > > > -- 
> > > > Lionel Landwerlin
> > > > 
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > 
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
GRUB_SUPPORTED_ARCH=n
ifeq ($(ARCH),i386)
GRUB_SUPPORTED_ARCH=y
endif
ifeq ($(ARCH),i486)
GRUB_SUPPORTED_ARCH=y
endif
ifeq ($(ARCH),i586)
GRUB_SUPPORTED_ARCH=y
endif
ifeq ($(ARCH),i686)
GRUB_SUPPORTED_ARCH=y
endif
ifeq ($(ARCH),x86_64)
GRUB_SUPPORTED_ARCH=y
endif
ifeq ($(GRUB_SUPPORTED_ARCH),y)
#############################################################
#
# grub
#
#############################################################
GRUB_VERSION:=0.97
GRUB_SOURCE:=grub_$(GRUB_VERSION).orig.tar.gz
GRUB_PATCH:=grub_$(GRUB_VERSION)-35.diff.gz
GRUB_SITE:=http://snapshot.debian.net/archive/2008/03/29/debian/pool/main/g/grub/
GRUB_BINARY:=grub/grub
GRUB_TARGET_BINARY:=sbin/grub
GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz

GRUB_AUTORECONF=NO
GRUB_INSTALL_TARGET=YES
GRUB_INSTALL_STAGING=YES

GRUB_CFLAGS=-DSUPPORT_LOOPDEV
ifeq ($(BR2_LARGEFILE),)
GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
endif

GRUB_CONF_ENV=\
	CFLAGS="$(TARGET_CFLAGS) $(GRUB_CFLAGS)" \
	CPPFLAGS="$(TARGET_CFLAGS) $(GRUB_CFLAGS)" \
	CXXFLAGS="$(TARGET_CXXFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	FCFLAGS="$(TARGET_FCFLAGS)" \

GRUB_CONFIG-$(BR2_TARGET_GRUB_SPLASH) += --enable-graphics
GRUB_CONFIG-$(BR2_TARGET_GRUB_DISKLESS) += --enable-diskless
GRUB_CONFIG-$(BR2_TARGET_GRUB_3c595) += --enable-3c595
GRUB_CONFIG-$(BR2_TARGET_GRUB_3c90x) += --enable-3c90x
GRUB_CONFIG-$(BR2_TARGET_GRUB_davicom) += --enable-davicom
GRUB_CONFIG-$(BR2_TARGET_GRUB_e1000) += --enable-e1000
GRUB_CONFIG-$(BR2_TARGET_GRUB_eepro100) += --enable-eepro100
GRUB_CONFIG-$(BR2_TARGET_GRUB_epic100) += --enable-epic100
GRUB_CONFIG-$(BR2_TARGET_GRUB_forcedeth) += --enable-forcedeth
GRUB_CONFIG-$(BR2_TARGET_GRUB_natsemi) += --enable-natsemi
GRUB_CONFIG-$(BR2_TARGET_GRUB_ns83820) += --enable-ns83820
GRUB_CONFIG-$(BR2_TARGET_GRUB_ns8390) += --enable-ns8390
GRUB_CONFIG-$(BR2_TARGET_GRUB_pcnet32) += --enable-pcnet32
GRUB_CONFIG-$(BR2_TARGET_GRUB_pnic) += --enable-pnic
GRUB_CONFIG-$(BR2_TARGET_GRUB_rtl8139) += --enable-rtl8139
GRUB_CONFIG-$(BR2_TARGET_GRUB_r8169) += --enable-r8169
GRUB_CONFIG-$(BR2_TARGET_GRUB_sis900) += --enable-sis900
GRUB_CONFIG-$(BR2_TARGET_GRUB_tg3) += --enable-tg3
GRUB_CONFIG-$(BR2_TARGET_GRUB_tulip) += --enable-tulip
GRUB_CONFIG-$(BR2_TARGET_GRUB_tlan) += --enable-tlan
GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840

GRUB_CONFIG_OPT=$(GRUB_CONFIG-y) --disable-auto-linux-mem-opt

define GRUB_APPLY_DEBIAN_PATCHES
	for i in `grep -v "^#" $(GRUB_DIR)/debian/patches/00list`; do \
		cat $(GRUB_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB_DIR); \
	done
endef

GRUB_POST_PATCH_HOOKS = GRUB_APPLY_DEBIAN_PATCHES

define GRUB_CONFIGURE_CMDS
	(cd $(GRUB_SRCDIR) && rm -rf config.cache && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	$(GRUB_CONF_ENV) \
	./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/ \
		--mandir=/usr/man \
		--infodir=/usr/info \
		$(DISABLE_DOCUMENTATION) \
		$(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
		$(DISABLE_IPV6) \
		$(QUIET) $(GRUB_CONF_OPT) \
	)
endef

define GRUB_BUILD_STATIC_TARGETS
	rm -f $(GRUB_SRCDIR)/$(GRUB_BINARY)
	$(MAKE) CC=$(TARGET_CC) CFLAGS+=-static -C $(GRUB_SRCDIR)/grub grub
	mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
	mv $(GRUB_SRCDIR)/$(GRUB_BINARY) $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_SRCDIR)/grub
endef

GRUB_POST_BUILD_HOOKS = GRUB_BUILD_STATIC_TARGETS

define GRUB_INSTALL_BOOT_FILES
	test -d $(TARGET_DIR)/boot/grub || mkdir -p $(TARGET_DIR)/boot/grub
	cp $(GRUB_SRCDIR)/stage1/stage1 $(GRUB_SRCDIR)/stage2/*1_5 $(GRUB_SRCDIR)/stage2/stage2 $(TARGET_DIR)/boot/grub/
endef

define GRUB_INSTALL_SPLASHIMAGE
	test -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) || \
		cp $(GRUB_SPLASHIMAGE) $(TARGET_DIR)/boot/grub/
endef

GRUB_POST_INSTALL_TARGET_HOOKS = GRUB_INSTALL_BOOT_FILES

ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
	GRUB_POST_INSTALL_TARGET_HOOKS += GRUB_INSTALL_SPLASHIMAGE
endif

define GRUB_UNINSTALL_TARGET_CMDS
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_SRCDIR) uninstall
	-$(MAKE) -C $(GRUB_SRCDIR) clean
	rm -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) \
		$(TARGET_DIR)/sbin/$(GRUB_BINARY) \
		$(TARGET_DIR)/boot/grub/{stage{1,2},*1_5}
endef

$(eval $(call AUTOTARGETS,target/x86,grub))

endif
