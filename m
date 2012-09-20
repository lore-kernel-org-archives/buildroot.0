From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Sep 2012 11:27:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120919164706.0e38b54d@skate>
 <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
Message-ID: <505AE171.50405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/12 08:10, Waldemar.Rymarkiewicz at tieto.com wrote:
>> >Why when udev is available you don't do need libusb? Also, if udev is
>> >available, you need to add it to the list of dependencies.
> This is how pcsc-lite  ./configure  works.
>
> Firstly, libudev and libusb can't be used together. That means if you --enable-libusb you have to --disable-libudev (by default is enabled) explicitly.
>
> Secondly,  ./configure gives priority to libudev to be used if found, otherwise it searches for libusb.
>
> Finally, Neither libusb nor libudev can be found then no usb devices are used (serial only). Then --disable-libudev --disable-libusb will still compile.

  In that case, it should be:

if UDEV=y
    --enable-libudev --disable-libusb
    DEPS += udev
else
if LIBUSB=y
    --enable-libusb --disable-libudev
    DEPS += libusb
else
    --disable-libusb --disable-libudev
endif
endif

  This gives buildroot complete control over the process.  We generally want
explicit --enable and --disable options, to avoid accidents with forgotten
dependencies (they would mean that the compilation result is dependent on
the order in which things are compiled, and we want to avoid that at all
cost).


> The only concern I have now it that user has to know this dependencies and select libusb or libudev explicitly. So wandering if not to require libusb or libudev in this package. What's your opinion?

  udev _has_ to be selected explicitly - it's consequences are too far-reaching to allow
selecting it behind the scenes, IMHO.

  For libusb, you could add a config option in PCSC to force enabling of
libusb.  Make that option 'depends on !BR2_PACKAGE_UDEV' because it isn't
needed if udev exists.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
