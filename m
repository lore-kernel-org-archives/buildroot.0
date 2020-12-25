From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Dec 2020 21:42:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: fix static build
 with cjson
In-Reply-To: <20201223185039.2883616-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 23 Dec 2020 19:50:39 +0100")
References: <20201223185039.2883616-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnx5d3dc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/98e0bccf3e1a964bb6a52265bd6f11a681ec220d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > ---
 >  ...onfig.mk-fix-static-build-with-cjson.patch | 37 +++++++++++++++++++
 >  1 file changed, 37 insertions(+)
 >  create mode 100644 package/mosquitto/0004-config.mk-fix-static-build-with-cjson.patch

 > diff --git
 > a/package/mosquitto/0004-config.mk-fix-static-build-with-cjson.patch
 > b/package/mosquitto/0004-config.mk-fix-static-build-with-cjson.patch
 > new file mode 100644
 > index 0000000000..c4f98f65d4
 > --- /dev/null
 > +++ b/package/mosquitto/0004-config.mk-fix-static-build-with-cjson.patch
 > @@ -0,0 +1,37 @@
 > +From eabde6538bc54f6bfde6b7945aeb70833efbbcb7 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Wed, 23 Dec 2020 18:49:28 +0100
 > +Subject: [PATCH] config.mk: fix static build with cjson
 > +
 > +Add -lcjson to CLIENT_LDFLAGS to fix the following failure when building
 > +statically:
 > +
 > +/home/buildroot/autobuild/instance-0/output-1/host/bin/microblazeel-buildroot-linux-uclibc-gcc
 > rr_client.o client_props.o client_shared.o pub_shared.o
 > sub_client_output.o ../lib/libmosquitto.a -o mosquitto_rr -static
 > -L../lib -lssl -lcrypto -lpthread -lcares
 > -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib
 > -lssl
 > -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib
 > -lz -latomic -lpthread -lcrypto -lz -latomic -lpthread
 > +/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 > sub_client_output.o: in function `json_print':
 > +(.text+0xe4): undefined reference to `cJSON_CreateObject'
 > +
 > +Fixes:
 > + - http://autobuild.buildroot.org/results/98e0bccf3e1a964bb6a52265bd6f11a681ec220d
 > +
 > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +[Upstream status: https://github.com/eclipse/mosquitto/pull/1976]
 > +---
 > + config.mk | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/config.mk b/config.mk
 > +index a807c606..65400382 100644
 > +--- a/config.mk
 > ++++ b/config.mk
 > +@@ -367,7 +367,7 @@ ifeq ($(WITH_CJSON),yes)
 > + 	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON
 > + 	CLIENT_LDADD:=$(CLIENT_LDADD) -lcjson
 > + 	CLIENT_STATIC_LDADD:=$(CLIENT_STATIC_LDADD) -lcjson
 > +-	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS)
 > ++	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS) -lcjson


It is a bit odd that to have to add it to LDFLAGS, when it is already
added to LDADD above, and LDADD _IS_ used:

mosquitto_rr : rr_client.o client_shared.o client_props.o pub_shared.o sub_client_output.o
        ${CROSS_COMPILE}${CC} $(CLIENT_LDFLAGS) $^ -o $@ $(CLIENT_LDADD)

I guess it is because we are passing a custom value for
CLIENT_STATIC_LDADD on the make command line. Seems like passing
CLIENT_STATIC_LDADD is indeed the simplest way to ensure -lz is also
passed, but perhaps we can just add -lcjson to it as well if enabled?

-- 
Bye, Peter Korsgaard
