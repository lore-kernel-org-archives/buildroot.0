From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jul 2011 23:51:11 +0200
Subject: [Buildroot] [Patch] Allow file to be built against static libs.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60448FD@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Wed, 20 Jul 2011 04:53:31 +0000")
References: <F9C551623D2CBB4C9488801D14F864C6044668@ex-mb1.corp.adtran.com>
 <87sjq22f6n.fsf@macbook.be.48ers.dk>
 <87oc0q2ddu.fsf@macbook.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C60448FD@ex-mb1.corp.adtran.com>
Message-ID: <87ei1k1v00.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 >> Ehh, drop that, I remembered wrong - We're already doing --enable-
 >> static --disable-shared.

 ANDY> Okay, well, sortta, but not really.  I believe this to be the culprit:

 ANDY> #############################################################
 ANDY> #
 ANDY> # zlib
 ANDY> #
 ANDY> #############################################################
 ANDY> ZLIB_VERSION:=1.2.5
 ANDY> ZLIB_SOURCE:=zlib-$(ZLIB_VERSION).tar.bz2
 ANDY> ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ANDY> ZLIB_INSTALL_STAGING=YES

 ANDY> ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ANDY> ZLIB_PIC :=
 ANDY> ZLIB_SHARED := --static
 ANDY> else
 ANDY> ZLIB_PIC := -fPIC
 ANDY> ZLIB_SHARED := --shared
 ANDY> endif

Yes, this is all fine. The problem is just that we link host stuff
dynamically, but zlib was building the host version in the same was as
the target one (so static if BR2_PREFER_STATIC_LIB), which would then
break host-file when it tried to dynamically link to zlib.

I've fixed that now, thanks for reporting it.

-- 
Bye, Peter Korsgaard
