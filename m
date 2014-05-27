From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 27 May 2014 06:46:25 +0200
Subject: [Buildroot] [PATCH 1/1] WIP: libudev: New package
References: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
 <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
 <20140526211909.GA13529@free.fr>
Message-ID: <1uhd5bxpm4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140526211909.GA13529 at free.fr: 

>> +     depends on !BR2_INIT_SYSTEMD
>> +     depends on !BR2_PACKAGE_EUDEV
> 
> Maybe replace those two 'depends on' with simply:
> 
>     depends on !BR2_PACKAGE_HAS_UDEV

I think we need to distinguish between the need for a daemon managing /dev 
and libudev. Currently a lot of packages depend on BR2_PACKAGE_HAS_UDEV 
although libudev should be enough for them. For libcec & xbmc I can confirm 
this for sure, I suppose this is also valid for mesa3d, maybe others.

Libcec, for example, needs a patch like this for configure.ac though:

-    REQUIRES="$REQUIRES udev"
+    REQUIRES="$REQUIRES libudev"

As several packages (systemd, eudev, libudev) can provide libudev we should 
add a new provider BR2_PACKAGE_HAS_LIBUDEV and let xbmc, libcec, mesa, ... 
depend on it instead of BR2_PACKAGE_HAS_UDEV. With this change in place 
adding your suggestion makes sense.

What do you think?

>> +LIBUDEV_VERSION = v1.6
>> +LIBUDEV_SITE = $(call github,gentoo,eudev,$(LIBUDEV_VERSION))
>> +LIBUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
>> +LIBUDEV_LICENSE_FILES = COPYING
> 
> I was wondering if we could somehow keep this in sync with the eudev
> package, to avoid duplicating the versions, so we can bump both in a
> single change.

My plan is to merge libudev to the eudev package, a bump patch for eudev 
v1.6 was already posted by sagaert.

>> +     --disable-introspection \
> 
> Would it be possible to build the library with introspection?
> That would require adding gobject-introspection, though...
> But I'm not too fluent in udev itself, so I won;t complain! ;-)

I?ll have a look.

Regards, Bernd
