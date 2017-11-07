From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 07 Nov 2017 15:28:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <20171106233821.2a5aed3b@windsurf>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf> <59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf> <5A005FF1.5000204@petroprogram.com>
 <2241958e-38c2-6075-1d08-a129e1124251@mind.be>
 <20171106233821.2a5aed3b@windsurf>
Message-ID: <5A01B500.6020007@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Well, the only reason seems to be that TurboVNC configuration is not 
happy untill the following
conditions are met:

TJPEG_INCLUDE_DIR = <path_to_include>/turbojepg.h
TJPEG_LIBRARY = <path_to_lib>/libturbojpeg

So why is it looking those and not jpeg,h or libjpeg ? Let's do some 
detective work :-)

First, looking from my gentoo installation (that only has libjpeg-turbo) 
I can see that:
/usr/include
-----------------
jpeglib.h
turbojpeg.h

and
/usr/lib
----------------
libjpeg.so -> libjpeg.so.62.2.0
libjpeg.so.62 -> libjpeg.so.62.2.0
libjpeg.so.62.2.0
libturbojpeg.so -> libturbojpeg.so.0.1.0
libturbojepg.so.0 -> libturbojpeg.so.0.1.0
libturbojpeg.so.0.1.0

Funny, I always tought that jpeglib.h and all the libjpeg.* would be
just symlinks to turbojpeg.h and libturbojpeg

So why does my gentoo libjpeg-turbo installation have separate
jpeg.h and libjpeg.* files instead of just symlinks?

It appears to be that libjpeg-turbo library contains actually
*two* JPEG API's!

jpeg.h and libjpeg.* being the standard (but SIMD accelerated), API 
compatible
implementation like you mentioned and that can just be dropped to 
replace vanilla jpeg.

And then there is another API called TurboJPEG (turbojpeg.h and 
libturbojpeg.*) that is
also bundled with libjpeg-turbo library and that's what the TurboVNC is 
using.

Performance wise there is no difference between the two API's but 
according to below link,
TurboJPEG API provides some features that are not easy to implement with 
standard libjpeg API

https://libjpeg-turbo.org/About/TurboJPEG

So what now?
Try to ask upstream if can use SIMD accelerated, standard libjpeg API 
(jpeg.h, libjpeg.*) instead of
TurboJPEG API ??? (maybe not possible if TurboVNC indeed needs some of 
the TurboJPEG API's stuff)

Dang .... maybe I just try to temporarily symlink turbojpeg.h 
libturbojpeg.* to libjpeg API using version
of the accelerated library and see where it starts to complaining ....

-S-

7.11.2017, 0:38, Thomas Petazzoni kirjoitti:
> Hello,
>
> On Mon, 6 Nov 2017 23:19:00 +0100, Arnout Vandecappelle wrote:
>
>>> 1. TurboVNC really does depend of turbo-jpeg, that's one of the reasons it's so
>>> fast.
>>> So for now I have made it "depends on BR2_PACKAGE_JPEG_TURBO" so that turbovnc
>>> package will only appear to menu only if jpeg-turbo has been also selected.
>>> Is that okay?
>>   Yes, there is no other way. However, please do add a comment (separately from
>> the toolchain comments) that it needs jpeg-turbo.
> I still would like to challenge why it needs jpeg-turbo. libjpeg and
> jpeg-turbo are supposed to be API compatible, so how can TurboVNC need
> one rather than the other? I can understand that TurboVNC's performance
> might be horrible with the regular libjpeg, but I don't get why it
> wouldn't work.
>
> Stefan?
>
> Thomas
