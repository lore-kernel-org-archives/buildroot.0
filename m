From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 13:13:45 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <20190803093858.144555-2-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 3 Aug 2019 11:38:56 +0200")
References: <20190803093858.144555-1-titouan.christophe@railnova.eu>
 <20190803093858.144555-2-titouan.christophe@railnova.eu>
Message-ID: <87lfwaec2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Since version 1.5, it is possible to build mosquitto as a static lib.
 > However, the broker still needs a toolchain with support for shared libraries,
 > because it contains code to dynamically load modules at runtime. This
 > code makes use of dlfcn.h, which is only available for dylib enabled
 > systems.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 >  package/mosquitto/Config.in    |  9 +++------
 >  package/mosquitto/mosquitto.mk | 12 ++++++++++++
 >  2 files changed, 15 insertions(+), 6 deletions(-)

 > diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
 > index c7373d9a84..8f2561c2d8 100644
 > --- a/package/mosquitto/Config.in
 > +++ b/package/mosquitto/Config.in
 > @@ -1,6 +1,5 @@
 >  config BR2_PACKAGE_MOSQUITTO
 >  	bool "mosquitto"
 > -	depends on !BR2_STATIC_LIBS # builds .so
 >  	help
 >  	  Mosquitto is an open source message broker that implements
 >  	  the MQ Telemetry Transport protocol versions 3.1 and
 > @@ -16,12 +15,10 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 >  	bool "install the mosquitto broker"
 >  	default y
 >  	depends on BR2_USE_MMU # fork()
 > +	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
 >  	depends on BR2_PACKAGE_MOSQUITTO
 >  	help
 >  	  Build and install the mosquitto broker onto target.
 
 > -comment "mosquitto broker needs a system with MMU"
 > -	depends on BR2_PACKAGE_MOSQUITTO && !BR2_USE_MMU
 > -
 > -comment "mosquitto needs a toolchain w/ dynamic library"
 > -	depends on BR2_STATIC_LIBS
 > +comment "mosquitto broker needs a system with MMU; toolchain w/ dynamic library"
 > +	depends on BR2_PACKAGE_MOSQUITTO && (!BR2_USE_MMU || BR2_STATIC_LIBS)

Not your fault, but this message should not mention MMU (as the user
cannot change it) and only be displayed if mosquitto && mmu && static.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
