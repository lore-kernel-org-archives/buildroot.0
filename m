From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 12:23:35 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <20190718100636.27290-2-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Thu, 18 Jul 2019 12:06:34 +0200")
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
Message-ID: <871ry518wo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 >  package/mosquitto/Config.in    | 4 ----
 >  package/mosquitto/mosquitto.mk | 6 ++++++
 >  2 files changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
 > index 11b6d7891b..7135e86e69 100644
 > --- a/package/mosquitto/Config.in
 > +++ b/package/mosquitto/Config.in
 > @@ -1,6 +1,5 @@
 >  config BR2_PACKAGE_MOSQUITTO
 >  	bool "mosquitto"
 > -	depends on !BR2_STATIC_LIBS # builds .so
 >  	help
 >  	  Mosquitto is an open source message broker that implements
 >  	  the MQ Telemetry Transport protocol versions 3.1 and
 > @@ -22,6 +21,3 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 
 >  comment "mosquitto broker needs a system with MMU"
 >  	depends on BR2_PACKAGE_MOSQUTTO && !BR2_USE_MMU
 > -
 > -comment "mosquitto needs a toolchain w/ dynamic library"
 > -	depends on BR2_STATIC_LIBS
 > diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
 > index 51c0abd0ba..ed72af754a 100644
 > --- a/package/mosquitto/mosquitto.mk
 > +++ b/package/mosquitto/mosquitto.mk
 > @@ -17,6 +17,12 @@ MOSQUITTO_MAKE_OPTS = \
 >  	WITH_WRAP=no \
 >  	WITH_DOCS=no
 
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no
 > +else
 > +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
 > +endif

We actually have 3 variants:

- static only (BR2_STATIC_LIBS)
- shared only (BR2_SHARED_LIBS)
- shared and static (BR2_SHARED_STATIC_LIBS)

So I reworked it to take that into consideration and committed, thanks.

-- 
Bye, Peter Korsgaard
