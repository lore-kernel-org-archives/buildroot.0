From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 19 Sep 2007 17:16:24 -0700 (PDT)
Subject: [Buildroot] libusb now compile - patch
In-Reply-To: <a63ecaf0709190929h6296331epf5388fc46e0922a1@mail.gmail.com>
References: <a63ecaf0709190929h6296331epf5388fc46e0922a1@mail.gmail.com>
Message-ID: <12788591.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Sushi Sensei,
Thanks for the patch. Now i am able to build libusb. unfortunately when i
try to build usbutils i get an error saying 

<snip>
checking for usb_get_string_simple in -lusb... no
configure: error: get libusb 0.1.8 or newer
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/usbutils-0.72/.configured]
Error 1

When i looked at config.log inside build_arm/usbutils-0.72 folder i got
this.


onfigure:5074: checking for usb_get_string_simple in -lusb
configure:5104:
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe 
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/
-isysroot /home/guru/project/original/bldrt/buildroot/build_arm/staging_dir
-mtune=arm9tdmi -o conftest -g -O2   conftest.c -lusb   >&5
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.1/../../../../arm-linux-uclibcgnueabi/bin/ld:
cannot find -lusb
collect2: ld returned 1 exit status
configure:5110: $? = 1
configure: failed program was:

Seems ls is not able to find proper -lusb libraries

Let me know if you need any more info. Waiting for your reply.

Regards
Gururaja




Sushi Sensei wrote:
> 
> -- 
> ------------------------------------------------------
> --- Timeo Danaos et dona ferentes ---
> ------------------------------------------------------
> 
> Index: package/libusb/libusb.mk
> ===================================================================
> --- package/libusb/libusb.mk	(revisi??n: 19893)
> +++ package/libusb/libusb.mk	(copia de trabajo)
> @@ -43,6 +43,7 @@
>  		--prefix=/ \
>  		--disable-debug \
>  		--disable-build-docs \
> +		--libdir $(LIBUSB_DIR)/.libs \
>  	)
>  	touch $@
>  
> @@ -52,8 +53,7 @@
>  
>  $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
>  	mkdir -p $(TARGET_DIR)/usr/lib
> -	cp -dpf $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
> -	rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
> +	cp -dpf $(LIBUSB_DIR)/.libs/libusb*.so.* $(TARGET_DIR)/usr/lib
>  
>  libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
>  
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/libusb-now-compile---patch-tf4482125.html#a12788591
Sent from the BuildRoot mailing list archive at Nabble.com.
