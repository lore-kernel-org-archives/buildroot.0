From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 18:20:42 -0400
Subject: [Buildroot] Problem building usbutils
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909182D84@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com><871w2v9lm9.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE1909182D84@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182DBC@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > 1) usbutils requires libusb This was the easy one. I just needed to 
> > select the libusb package. But, shouldn't the Config.in for usbutils

> > select it automatically?
>
> Yes, fixed in trunk.
>
> > 2) configure for usbutils outputs error: get libusb 0.1.8 or newer 
> > Not sure how to fix this one. The libusb in buildroot is 0.1.12. It 
> > built fine and the library is in my build_arm/staging_dir/usb/lib 
> > directory. For some reason it's not being found. Can anyone offer so

> > insite on what I might have setup wrong?
>
> Strange, it builds here (i386).
>
> Could you provide more details, please?

Hello Peter,

Strange... If I add LDFLAGS="$(TARGET_LDFLAGS)" I can get usbutils to
build.

In usbutils.mk:

$(USBUTILS_DIR)/.configured: $(USBUTILS_DIR)/.unpacked
	(cd $(USBUTILS_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
+		LDFLAGS= "$(TARGET_LDFLAGS)" \
		ac_cv_func_malloc_0_nonnull=yes \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
	)

I guess this is because the configure script for usbutils uses:

ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS
conftest.$ac_ext $LIBS >&5'

To build and link the tests.

Is this the "right" way to fix it?

Thanks,
Hartley
