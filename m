From: Will Newton <will.newton@gmail.com>
Date: Thu, 12 Oct 2006 11:21:57 +0100
Subject: [Buildroot] gettext fixes
In-Reply-To: <20061012101533.GB2704@zelow.no>
References: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
	<20061011164707.GA28171@aon.at>
	<87a5b0800610120213m388e948v2eeb57a629d304cc@mail.gmail.com>
	<20061012101533.GB2704@zelow.no>
Message-ID: <87a5b0800610120321k6509bebsec35656c4f9136fd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/12/06, Thomas Lundquist <lists@zelow.no> wrote:

> > No, I'm just building libintl so I can build other things that require
> > it such as glib.
>
> I am trying to build glib2.0 and it barfed on missing gettext or gettext
> support in the libc but I have enabled it for uClibc in the config.
>
> isn't it enough? (Using 0.9.28 so it may lack some of the needed
> features?)

I'm using a more recent snapshot of uClibc but I think 0.9.28 should
work. I've attached the makefile I'm using for glib. I hope you can
find it useful, it isn't very polished...

You will need to change the values of glib_cv_stack_grows and
glib_cv_uscore for your arch I would imagine.
-------------- next part --------------
#############################################################
#
# libglib2.x
#
#############################################################
LIBGLIB2_VER_MAJOR:=2.12
LIBGLIB2_VER_MINOR:=4
LIBGLIB2_VER:=$(LIBGLIB2_VER_MAJOR).$(LIBGLIB2_VER_MINOR)

LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VER).tar.bz2
LIBGLIB2_SITE:=ftp://ftp.gtk.org/pub/glib/$(LIBGLIB2_VER_MAJOR)/
LIBGLIB2_CAT:=bzcat
LIBGLIB2_DIR:=$(BUILD_DIR)/glib-$(LIBGLIB2_VER)
LIBGLIB2_BINARY:=libglib-2.0.so


$(DL_DIR)/$(LIBGLIB2_SOURCE):
	 $(WGET) -P $(DL_DIR) $(LIBGLIB2_SITE)/$(LIBGLIB2_SOURCE)

libglib2-source: $(DL_DIR)/$(LIBGLIB2_SOURCE)

$(LIBGLIB2_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
	$(LIBGLIB2_CAT) $(DL_DIR)/$(LIBGLIB2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(LIBGLIB2_DIR) package/libglib2/ \*.patch*
	$(CONFIG_UPDATE) $(LIBGLIB2_DIR)
	touch $(LIBGLIB2_DIR)/.unpacked

$(LIBGLIB2_DIR)/.configured: $(LIBGLIB2_DIR)/.unpacked
	(cd $(LIBGLIB2_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		LDFLAGS=-L$(STAGING_DIR)/usr/lib \
		./configure \
		glib_cv_stack_grows=yes \
		glib_cv_monotonic_clock=yes \
		glib_cv_uscore=yes \
		ac_cv_func_posix_getpwuid_r=yes \
		--host=$(REAL_GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=$(STAGING_DIR) \
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
		$(DISABLE_NLS) \
		--enable-shared \
	);
	touch $(LIBGLIB2_DIR)/.configured

$(LIBGLIB2_DIR)/.libs/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/.configured
	$(MAKE) CC=$(TARGET_CC) -C $(LIBGLIB2_DIR)

$(STAGING_DIR)/lib/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/.libs/$(LIBGLIB2_BINARY)
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
	    -C $(LIBGLIB2_DIR) install;

$(TARGET_DIR)/lib/$(LIBGLIB2_BINARY): $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY)
	cp -a $(STAGING_DIR)/usr/lib/libglib*.so.* $(TARGET_DIR)/usr/lib/
	cp -a $(STAGING_DIR)/usr/lib/libgmodule*.so.* $(TARGET_DIR)/usr/lib/
	cp -a $(STAGING_DIR)/usr/lib/libgobject*.so.* $(TARGET_DIR)/usr/lib/

libglib2: uclibc libintl $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)

libglib2-clean:
	-rm -f $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)
	-$(MAKE) -C $(LIBGLIB2_DIR) clean

libglib2-dirclean:
	rm -rf $(LIBGLIB2_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_LIBGLIB2)),y)
TARGETS+=libglib2
endif
