From: Assen Stoyanov <softa@ttechgroup.com>
Date: Mon, 7 May 2007 12:41:49 +0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
References: <20070507040012.216F04855E@busybox.net>
Message-ID: <006501c7908b$efb41980$6614a8c0@lap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I Think that "libusb-clean" target of this package is bad in this line:

> + rm -rf $(STAGING_DIR)/lib/pkgconfig

I have a lot of packages (X11R7 related), that uses this directory to put 
their ".pc" files! Please use concrette file (for example libusb.pc) when 
'clean'.
Also I think that the libusbpp lib is created with the HOST CPP compiler if 
there is no selected TARGET CPP compiler in the toolchain.

Best Regards,
Assen Stoyanov

----- Original Message ----- 
From: <sjhill@uclibc.org>
To: <buildroot@uclibc.org>
Sent: Monday, May 07, 2007 7:00
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb


> Author: sjhill
> Date: 2007-05-06 21:00:11 -0700 (Sun, 06 May 2007)
> New Revision: 18574
>
> Log:
> Major clean-up.
>
>
> Modified:
>   trunk/buildroot/package/libusb/libusb.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/libusb/libusb.mk
> ===================================================================
> --- trunk/buildroot/package/libusb/libusb.mk 2007-05-07 03:59:35 UTC (rev 
> 18573)
> +++ trunk/buildroot/package/libusb/libusb.mk 2007-05-07 04:00:11 UTC (rev 
> 18574)
> @@ -8,8 +8,7 @@
> LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
> LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VER)
> LIBUSB_CAT:=$(ZCAT)
> -LIBUSB_BINARY:=libusb.la
> -LIBUSB_TARGET_BINARY:=usr/lib/libusb.so
> +LIBUSB_BINARY:=usr/lib/libusb.so
>
> ifeq ($(BR2_ENDIAN),"BIG")
> LIBUSB_BE:=yes
> @@ -38,23 +37,29 @@
>  --target=$(GNU_TARGET_NAME) \
>  --host=$(GNU_TARGET_NAME) \
>  --build=$(GNU_HOST_NAME) \
> - --prefix=/usr \
> + --prefix=/ \
>  --disable-debug \
>  --disable-build-docs \
>  );
>  touch $(LIBUSB_DIR)/.configured
>
> -$(LIBUSB_DIR)/$(LIBUSB_BINARY): $(LIBUSB_DIR)/.configured
> +$(STAGING_DIR)/$(LIBUSB_BINARY): $(LIBUSB_DIR)/.configured
>  $(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBUSB_DIR)
> + $(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
>
> -$(TARGET_DIR)/$(LIBUSB_TARGET_BINARY): $(LIBUSB_DIR)/$(LIBUSB_BINARY)
> - $(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(TARGET_DIR) install
> - rm -f $(TARGET_DIR)/usr/lib/libusb*.a $(TARGET_DIR)/usr/lib/libusb*.la
> +$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/$(LIBUSB_BINARY)
> + -mkdir -p $(TARGET_DIR)/usr/lib
> + cp -a $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
> + rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
>
> -libusb: uclibc $(TARGET_DIR)/$(LIBUSB_TARGET_BINARY)
> +libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
>
> libusb-clean:
> - rm -f $(TARGET_DIR)/$(LIBUSB_TARGET_BINARY)
> + rm -f $(STAGING_DIR)/bin/libusb-config
> + rm -f $(STAGING_DIR)/includes/usb*.h
> + rm -f $(STAGING_DIR)/lib/libusb*
> + rm -rf $(STAGING_DIR)/lib/pkgconfig
> + rm -f $(TARGET_DIR)/usr/lib/libusb*
>  -$(MAKE) -C $(LIBUSB_DIR) clean
>
> libusb-dirclean:
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.5.467 / Virus Database: 269.6.5/792 - Release Date: 5/6/2007 
> 9:01 PM
>
> 



-- 
No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.467 / Virus Database: 269.6.5/792 - Release Date: 5/6/2007 9:01 PM
