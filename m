From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 16 Oct 2014 12:57:16 +0200
Subject: [Buildroot] [PATCH v2 6/8] package/mpd: enable support for
	libnfs
In-Reply-To: <20141016114439.6e09d052@free-electrons.com>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>	<1413379134-28918-6-git-send-email-jkrause@posteo.de>
 <20141016114439.6e09d052@free-electrons.com>
Message-ID: <543FA48C.8040601@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/16/2014 11:44 AM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Wed, 15 Oct 2014 15:18:52 +0200, J?rg Krause wrote:
>
>> +ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
>> +PKG_CONFIG_PATH = "$(STAGING_DIR)/usr/lib/pkgconfig"
> This looks wrong, for two reasons:
>
>   *) A package is not allowed to change global variables. Remember that
>      the namespace of variables in global, so if one package is changing
>      a global variable, this change is visible to all other packages.

I have seens this at wpa_supplicant which use it if package dbus is 
selected:

    ifeq ($(BR2_PACKAGE_DBUS),y)
         WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
         WPA_SUPPLICANT_MAKE_ENV = \
             PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"    \
             PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

I copied the last line here. Okay, I see now the difference: 
wpa_supplicant sets it locally to the make environment and I set it 
globally.

>   *) $(STAGING_DIR)/usr/lib/pkgconfig is already the default search path
>      for our pkg-config, so there should be no need to make this tuning.
>      Which problem have you seen?

Without this mpd configuration check does not find libnfs although it is 
build successfully.

    checking for NFS... no
    configure: error: NFS input plugin: libnfs not found

Maybe I should do this?:
     MPD_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141016/81225d83/attachment.html>
