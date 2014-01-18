From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 10:20:56 +0100
Subject: [Buildroot] [PATCH v2 00/12] Introducing XBMC
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <oktpqaxbuu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote in
news:1389831355-19983-1-git-send-email-maxime.hadjinlian at gmail.com: 

> This is the v2 of the series introducing XBMC with the different
> comments taken into accounts.
> Note that the packages already commited were ommited this time.

Hi,

currently I am syncing your patches with my local stuff, which compiles 
current git snapshots of xbmc gotham. Because of the new features present 
in gotham, most notably the new audio engine and, added by a currently not-
committed patch, yadif deinterlacing[1], I would like to suggest to keep 
gotham in mind when adding new libraries to buildroot.

Right now I stumbled across fribidi, which is a required dependency for 
gotham, it also needs to be included in libass, this patch for libass.mk is 
enough: 

-LIBASS_DEPENDENCIES = freetype fontconfig libenca
+LIBASS_DEPENDENCIES = freetype fontconfig libenca fribidi

These are the files for the fribidi package:

Config.in
-------------------------
config BR2_PACKAGE_FRIBIDI
       bool "fribidi"
       help
         Free Implementation of the Unicode BiDi algorithm for Hebrew 
and/or Arabic languages.

         http://fribidi.org

fribidi.mk
-------------------------
FRIBIDI_VERSION = 0.19.5
FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.bz2
FRIBIDI_SITE = http://fribidi.org/download
FRIBIDI_INSTALL_STAGING = YES

FRIBIDI_CONF_OPT = \
        --with-glib=no

$(eval $(autotools-package))

Please consider to include fribidi in your patch set.

Regards, Bernd

[1] http://forum.xbmc.org/showthread.php?tid=165707
