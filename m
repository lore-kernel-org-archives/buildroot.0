From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 12 Jul 2011 16:48:41 +0200
Subject: [Buildroot] [PATCH] udev: bump to 172
In-Reply-To: <20110712154743.4edadd5e@skate>
References: <4E1C4070.4020908@visionsystems.de> <20110712154743.4edadd5e@skate>
Message-ID: <4E1C5EC9.8020409@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.07.2011 15:47, schrieb Thomas Petazzoni:
> Hello,
>
> Thanks Yegor for this patch. It's really great to have a modern version
> of udev in Buildroot.

At this place I would like to thank Heiko Zuerker for making the patch, I was basing mine on.

>> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/udev/Config.in            |   39 +--------
>>  package/udev/libvolume_id.la.tmpl |   35 --------
>>  package/udev/udev.mk              |  150 ++++++--------------------------------
>>  3 files changed, 32 insertions(+), 192 deletions(-)
>>  delete mode 100644 package/udev/libvolume_id.la.tmpl
>>
>> Index: b/package/udev/Config.in
>> ===================================================================
>> --- a/package/udev/Config.in
>> +++ b/package/udev/Config.in
>> @@ -5,37 +5,12 @@
>>  
>>  	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
>>  
>> -config BR2_PACKAGE_UDEV_UTILS
>> -	bool "udev-utils"
>> -	depends on BR2_PACKAGE_UDEV
>> +config BR2_PACKAGE_UDEV_ALL_EXTRAS
>> +	bool "enable all extras"
>> +	depends on BR2_PACKAGE_UDEV && BR2_PACKAGE_ACL && BR2_PACKAGE_LIBUSB && BR2_PACKAGE_LIBUSB_COMPAT && BR2_PACKAGE_USBUTILS && BR2_PACKAGE_HWDATA
> I'm wondering whether we should turn this into :
>
> 	depends on BR2_PACKAGE_UDEV
> 	select BR2_PACKAGE_ACL
> 	select BR2_PACKAGE_LIBUSB
> 	select BR2_PACKAGE_LIBUSB_COMPAT
> 	select BR2_PACKAGE_USBUTILS
> 	select BR2_PACKAGE_HWDATA
>
> Because all those dependencies are not really obvious.
>
>> +comment "some additional udev extras require acl and libusb to be built"
>> +        depends on !BR2_PACKAGE_ACL || !BR2_PACKAGE_LIBUSB || !BR2_PACKAGE_LIBUSB_COMPAT || !BR2_PACKAGE_USBUTILS || !BR2_PACKAGE_HWDATA
> The message does not match the dependencies: it doesn't say anything
> about libusb-compat, usbutils and hwdata. But see above, I think
> "select" style dependencies would be better.

So do I. Fixed.

> I have tried building your package. Just udev itself works fine, but
> udev with extras doesn't work, you forgot the libglib2 dependency :
>
> checking for GLIB... no
> configure: error: Package requirements (glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0) were not met:
> No package 'glib-2.0' found
> No package 'gobject-2.0' found

Fixed. I had glibc already activated because of some other package. As always :-)

Thanks for review.

Best regards,
Yegor
