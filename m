From: Benjamin Tietz <benjamin@micronet24.de>
Date: Thu, 2 Aug 2007 10:01:08 +0200
Subject: [Buildroot] DirectFB Fails with wrong File Format erro rfor
	libsysfs
Message-ID: <20070802080108.GC4820@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Aug 01, 2007 at 11:57:39PM -0700, Hebbar wrote:
> 
> Hi All,
>  
> 
>   After i renamed the libsysfs.* from my root /usr/lib/libsysfs to something
> else, compileation continued. but later got struct at 
> 
> cp -dpf
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libdirect*
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libfusion*
> /home/guru/project/original/toolchains/buildroot/project_build_arm/uclibc/root/usr/lib/
> cp: cannot stat
> `/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libdirect*':
> No such file or directory
> cp: cannot stat
> `/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libfusion*':
> No such file or directory
> make: ***
> [/home/guru/project/original/toolchains/buildroot/project_build_arm/uclibc/root/usr/lib/libdirectfb.so]
> Error 1
> 
>   
>    I looked through the $(BUILD_DIR)/staging_dir/usr/lib & found that the
> files are actually copied to $(BUILD_DIR)/staging_dir/lib/. Find attached
> the details of directfb.mk file & let me know what changes i shld make.
> 
> 
> Regards
> Gururaja
> 
> **********directfb.mk*****************************
> 
> <snip>
> <snip>
> 
> $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
Changing those two lines
> 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
> 	touch -c $(STAGING_DIR)/lib/libdirectfb.so
to
 	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install
 	touch -c $(STAGING_DIR)/usr/lib/libdirectfb.so
makes them install to $(STAGING_DIR)/usr/lib

> 
> $(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
> 	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(STAGING_DIR)/usr/lib/libfusion*
> $(TARGET_DIR)/usr/lib/
> 	cp -rdpf $(STAGING_DIR)/usr/lib/directfb-* $(TARGET_DIR)/usr/lib/
> 	-$(STRIP) --strip-unneeded \
> 		$(TARGET_DIR)/usr/lib/libdirectfb.so \
> 		$(TARGET_DIR)/usr/lib/libdirect.so \
> 		$(TARGET_DIR)/usr/lib/libfusion.so
> 
> directfb: uclibc jpeg libpng freetype libsysfs
> $(TARGET_DIR)/usr/lib/libdirectfb.so
> <snip>
> 
regards
> 
> -- 
> View this message in context: http://www.nabble.com/DirectFB-Fails-with-wrong-File-Format-erro-rfor-libsysfs-tf4204376.html#a11959410
> Sent from the BuildRoot mailing list archive at Nabble.com.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
