From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 29 May 2007 22:25:07 +0200
Subject: [Buildroot] Ogg and Vorbis patch
In-Reply-To: <465AD791.2040108@teamboyce.co.uk>
References: <465AD791.2040108@teamboyce.co.uk>
Message-ID: <20070529202507.GC30684@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 28, 2007 at 02:22:25PM +0100, Rod Boyce wrote:
>All,
>
>So attached is my libogg and libvorbis patch.  I have had a lot of 
>trouble with the libvorbis code and I have included a patch to the 
>install script to solve the problem of locating the library under 
>/usr/lib or /usr/loca/lib also when compiling libvorbisfile I had lots 
>of problems figuring out exactly the right combination of configure 
>parameters and changes for library paths when compiling.  I believe I 
>have got it correct now I am not a configure expert so I might have 
>missed something obvious and I'll always ope to suggestions so here is 
>the patch hopefully for inclusion into the build-root system.
>
>Regards,
>Rod Boyce

>diff ./package/Config.in ./package/Config.in
>--- ./package/Config.in	2007-05-25 17:08:32.583594165 +0100
>+++ ./package/Config.in	2007-05-25 15:22:03.475398547 +0100
>@@ -239,12 +239,14 @@
> 	  Support for audio libraries and applications
> 
> if BR2_AUDIO_SUPPORT
> source "package/asterisk/Config.in"
> source "package/libid3tag/Config.in"
> source "package/libmad/Config.in"
>+source "package/libogg/Config.in"
> source "package/libsndfile/Config.in"
> source "package/madplay/Config.in"
> source "package/mpg123/Config.in"
>+source "package/libvorbis/Config.in"
> endif
> 
> menuconfig BR2_GRAPHIC_SUPPORT
>diff ./package/libogg/Config.in ./package/libogg/Config.in
>--- ./package/libogg/Config.in	1970-01-01 01:00:00.000000000 +0100
>+++ ./package/libogg/Config.in	2007-05-28 09:48:44.482856755 +0100
>@@ -0,0 +1,8 @@
>+config BR2_PACKAGE_LIBOGG
>+	bool "libogg"
>+	default n
>+	help
>+	  Open source container format for Vorbis audio format files
>+
>+	  http://xiph.org/ogg/
>+
>diff ./package/libogg/libogg.mk ./package/libogg/libogg.mk
>--- ./package/libogg/libogg.mk	1970-01-01 01:00:00.000000000 +0100
>+++ ./package/libogg/libogg.mk	2007-05-28 09:51:15.461670563 +0100
>@@ -0,0 +1,80 @@
>+#############################################################
>+#
>+# libogg
>+#
>+#############################################################
>+LIBOGG_VERSION=1.1.3
>+LIBOGG_LIBVER=0.5.3
>+LIBOGG_SOURCE=libogg-$(LIBOGG_VERSION).tar.gz
>+LIBOGG_SITE=http://downloads.xiph.org/releases/ogg/
>+LIBOGG_DIR=$(BUILD_DIR)/${shell basename $(LIBOGG_SOURCE) .tar.gz}

No. This is something like
$(BUILD_DIR)/libogg-$(LIBOGG_VERSION)

->+LIBOGG_WORKDIR=$(BUILD_DIR)/libogg-$(LIBOGG_VERSION)

What's the deal with WORKDIR ?

>+LIBOGG_CAT:=$(ZCAT)
>+
>+$(DL_DIR)/$(LIBOGG_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(LIBOGG_SITE)/$(LIBOGG_SOURCE)
>+
>+$(LIBOGG_DIR)/.unpacked: $(DL_DIR)/$(LIBOGG_SOURCE)
>+	$(LIBOGG_CAT) $(DL_DIR)/$(LIBOGG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

You forgot a CONFIG_UPDATE here.

>+	touch $(LIBOGG_DIR)/.unpacked

Please touch $@ since i find this easier to read (and it is less error
prone).
>+
>+$(LIBOGG_DIR)/.configured: $(LIBOGG_DIR)/.unpacked
>+	(cd $(LIBOGG_DIR); rm -rf config.cache; \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--disable-docs \
>+		--prefix=/usr \
>+		--sysconfdir=/etc \
>+		$(DISABLE_NLS) \
>+		--exec-prefix=$(STAGING_DIR)/usr/bin \
>+		--libdir=$(STAGING_DIR)/lib \
>+		--includedir=$(STAGING_DIR)/include \
>+		--datadir=$(STAGING_DIR)/usr/share \
>+	);
>+	touch $(LIBOGG_DIR)/.configured

Please touch $@ since i find this easier to read (and it is less error
prone).

>+
>+$(LIBOGG_WORKDIR)/libogg.la: $(LIBOGG_DIR)/.configured
>+	rm -f $@
>+	$(MAKE) CC=$(TARGET_CC) -C $(LIBOGG_WORKDIR)
>+
>+$(STAGING_DIR)/lib/libogg.so.$(LIBOGG_LIBVER): $(LIBOGG_WORKDIR)/libogg.la
>+	@mkdir -p $(STAGING_DIR)/include/ogg

using $(STAGING_DIR)/include is deprecated. Rather use
$(STAGING_DIR)/usr/include.

>+	@mkdir -p $(STAGING_DIR)/lib

This sounds more appropriate for usr/lib

>+	@cp -dpf $(LIBOGG_DIR)/include/ogg/config_types.h $(STAGING_DIR)/include/ogg/
>+	@cp -dpf $(LIBOGG_DIR)/include/ogg/ogg.h $(STAGING_DIR)/include/ogg/
>+	@cp -dpf $(LIBOGG_DIR)/include/ogg/os_types.h $(STAGING_DIR)/include/ogg/
>+	@cp -dpf $(LIBOGG_DIR)/src/.libs/libogg.a $(STAGING_DIR)/lib/
>+	@cp -dpf $(LIBOGG_DIR)/src/.libs/libogg.la $(STAGING_DIR)/lib/
>+	@cp -dpf $(LIBOGG_DIR)/src/.libs/libogg.so.$(LIBOGG_LIBVER) $(STAGING_DIR)/lib/
>+	@ln -sf $(STAGING_DIR)/lib/libogg.so.$(LIBOGG_LIBVER) $(STAGING_DIR)/lib/libogg.so.0
>+	@ln -sf $(STAGING_DIR)/lib/libogg.so.$(LIBOGG_LIBVER) $(STAGING_DIR)/lib/libogg.so

No need to hide those away. Please remove.
>+
>+
>+$(TARGET_DIR)/lib/libogg.so.$(LIBOGG_LIBVER): $(STAGING_DIR)/lib/libogg.so.$(LIBOGG_LIBVER)
>+	cp -dpf $(STAGING_DIR)/lib/libogg.so* $(TARGET_DIR)/lib;
>+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libogg.so*
>+	@rm -rf $(TARGET_DIR)/usr/share/doc/libogg-$(LIBOGG_VERSION)
>+	touch -c $(TARGET_DIR)/lib/libogg.so.$(LIBOGG_LIBVER)

I'm pretty sure that strip updates the time-stamp, so rm first, then
strip and remove the touch.

>+
>+libogg:	uclibc $(TARGET_DIR)/lib/libogg.so.$(LIBOGG_LIBVER)
>+
>+libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
>+
>+libogg-clean:
>+	@if [ -d $(LIBOGG_WORKDIR)/Makefile ] ; then \
>+		$(MAKE) -C $(LIBOGG_WORKDIR) clean ; \
>+	fi;

just
	-$(MAKE) -C $(LIBOGG_WORKDIR) clean
and drop the if.
[snip]
