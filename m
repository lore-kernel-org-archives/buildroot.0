From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 01 Mar 2016 22:46:41 +0100
Subject: [Buildroot] [PATCH/next v9 26/28] package/freeswitch: enable
 mod_imagick, add optional dependencies to imagemagick, libvpx & libyuv
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-27-git-send-email-bernd.kuhls@t-online.de>
 <20160229223122.500e4b53@free-electrons.com>
Message-ID: <17fhqcxu66.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am Mon, 29 Feb 2016 22:31:22 +0100 schrieb Thomas Petazzoni:

> Small typo in the commit log: "enable mod_imagick" -> "enable
> mod_imagemagick".

thanks, updated in v10.

> The commit title is slightly too long. Ideally for such commits, it
> should be:
> 
> """
> package/freeswitch: enable mod_imagemagick

thanks, updated in v10.

> This commit enables mod_imagemagick, which requires imagemagick, libvpx
> and libyux as optional dependencies.

Let's start nitpicking ;)

I think this last part of text is misleading, mod_imagemagick is not 
enabled by this patch, only added to the package ;) The module is only 
enabled if the packages imagemagick, libvpx and libyuv are enabled. These 
packages itself are optional dependencies for the core functions of 
freeswitch, but they are required dependencies for mod_imagemagick. To 
require an optional dependency is an oxymoron ;)
Shall I explain this as detailed as I have written here or shall I just 
remove the ", add optional dependency to *" part of the patch subjects 
without adding further text? I think the code speaks for itself:
http://patchwork.ozlabs.org/patch/589401/

ifeq ($(BR2_PACKAGE_IMAGEMAGICK)$(BR2_PACKAGE_LIBVPX)
$(BR2_PACKAGE_LIBYUV),yyy)
FREESWITCH_DEPENDENCIES += imagemagick libvpx libyuv
FREESWITCH_ENABLED_MODULES += formats/mod_imagick
endif

This means: You get mod_imagick only if you have enabled imagemagick, 
libvpx & libyuv.

Regards, Bernd
