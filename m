From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 1 Aug 2007 23:57:39 -0700 (PDT)
Subject: [Buildroot] DirectFB Fails with wrong File Format erro rfor
 libsysfs
In-Reply-To: <11959125.post@talk.nabble.com>
References: <11959125.post@talk.nabble.com>
Message-ID: <11959410.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,
 

  After i renamed the libsysfs.* from my root /usr/lib/libsysfs to something
else, compileation continued. but later got struct at 

cp -dpf
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libdirect*
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libfusion*
/home/guru/project/original/toolchains/buildroot/project_build_arm/uclibc/root/usr/lib/
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libdirect*':
No such file or directory
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/lib/libfusion*':
No such file or directory
make: ***
[/home/guru/project/original/toolchains/buildroot/project_build_arm/uclibc/root/usr/lib/libdirectfb.so]
Error 1

  
   I looked through the $(BUILD_DIR)/staging_dir/usr/lib & found that the
files are actually copied to $(BUILD_DIR)/staging_dir/lib/. Find attached
the details of directfb.mk file & let me know what changes i shld make.


Regards
Gururaja

**********directfb.mk*****************************

<snip>
<snip>

$(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
	touch -c $(STAGING_DIR)/lib/libdirectfb.so

$(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(STAGING_DIR)/usr/lib/libfusion*
$(TARGET_DIR)/usr/lib/
	cp -rdpf $(STAGING_DIR)/usr/lib/directfb-* $(TARGET_DIR)/usr/lib/
	-$(STRIP) --strip-unneeded \
		$(TARGET_DIR)/usr/lib/libdirectfb.so \
		$(TARGET_DIR)/usr/lib/libdirect.so \
		$(TARGET_DIR)/usr/lib/libfusion.so

directfb: uclibc jpeg libpng freetype libsysfs
$(TARGET_DIR)/usr/lib/libdirectfb.so
<snip>


-- 
View this message in context: http://www.nabble.com/DirectFB-Fails-with-wrong-File-Format-erro-rfor-libsysfs-tf4204376.html#a11959410
Sent from the BuildRoot mailing list archive at Nabble.com.
