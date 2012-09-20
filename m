From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Thu, 20 Sep 2012 09:10:26 +0300
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <20120919164706.0e38b54d@skate>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120919164706.0e38b54d@skate>
Message-ID: <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> +# libudev has a priority over libusb
>> +ifneq ($(BR2_PACKAGE_UDEV),y)
>> +PCSC_LITE_CONF_OPT += --disable-libudev
>> +
>> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
>> +PCSC_LITE_CONF_OPT += --enable-libusb
>> +PCSC_LITE_DEPENDENCIES += libusb
>> +else
>> +PCSC_LITE_CONF_OPT += --disable-libusb
>> +endif
>> +
>> +endif
>
>Can you detail this? I haven't looked at pcsc-lite itself, but this
>looks strange. So if it is correct, it anyway needs a more detailed
>comment.
>
>Why when udev is available you don't do need libusb? Also, if udev is
>available, you need to add it to the list of dependencies.

This is how pcsc-lite  ./configure  works. 

Firstly, libudev and libusb can't be used together. That means if you --enable-libusb you have to --disable-libudev (by default is enabled) explicitly.

Secondly,  ./configure gives priority to libudev to be used if found, otherwise it searches for libusb.

Finally, Neither libusb nor libudev can be found then no usb devices are used (serial only). Then --disable-libudev --disable-libusb will still compile. 

The only concern I have now it that user has to know this dependencies and select libusb or libudev explicitly. So wandering if not to require libusb or libudev in this package. What's your opinion?

Thanks,
/Waldek
