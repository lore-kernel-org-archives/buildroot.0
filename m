From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 20 Sep 2012 09:36:39 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120919164706.0e38b54d@skate>
 <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
Message-ID: <CAHXCMM+5Uu4vdB+kQrke15PJRki-k-meNg=E1_Ai8TceNYZbtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

2012/9/20  <Waldemar.Rymarkiewicz@tieto.com>:
[...]
> Firstly, libudev and libusb can't be used together. That means if you --enable-libusb you have to --disable-libudev (by default is enabled) explicitly.
>
> Secondly,  ./configure gives priority to libudev to be used if found, otherwise it searches for libusb.
>
> Finally, Neither libusb nor libudev can be found then no usb devices are used (serial only). Then --disable-libudev --disable-libusb will still compile.
>
> The only concern I have now it that user has to know this dependencies and select libusb or libudev explicitly. So wandering if not to require libusb or libudev in this package. What's your opinion?

If i don't misunderstand, here, the dependency can be explicitly
express as a choice in the menuconfig:

choice BR2_PACKAGE_PCSC_LITE_HWLIBS
  prompt "hardware access/detection" # or whatever more suitable
  default BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUDEV
config BR2_PACKAGE_PCSC_LITE_HWLIBS_NONE
  bool "none"
config BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUSB
  bool "libusb"
  select BR2_PACKAGE_LIBUSB
config BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUDEV
  bool "libudev"
  select BR2_PACKAGE_UDEV
endchoice

Then, it is easy to know in the *.mk file which support should be enabled.

Note:
While writing this, I'm also wondering if the dependency on udev may
be conditioned by the device management chosen.


Regards,

-- 
Sam
