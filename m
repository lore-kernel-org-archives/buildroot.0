From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 19:25:42 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <b1957631-ca8b-38ab-9b24-5549e8e13e23@railnova.eu> (Titouan
 Christophe's message of "Thu, 1 Aug 2019 19:09:50 +0200")
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
 <871ry518wo.fsf@dell.be.48ers.dk> <87sgqlyxov.fsf@dell.be.48ers.dk>
 <b1957631-ca8b-38ab-9b24-5549e8e13e23@railnova.eu>
Message-ID: <874l30x0fd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Hello Peter,
 > Thank you for reviewing this series !

 > On 8/1/19 12:41 PM, Peter Korsgaard wrote:
 >>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> 
 >> Hi,
 >> 
 >> >> +ifeq ($(BR2_STATIC_LIBS),y)
 >> >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no
 >> >> +else
 >> >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
 >> >> +endif
 >> 
 >> > We actually have 3 variants:
 >> 
 >> > - static only (BR2_STATIC_LIBS)
 >> > - shared only (BR2_SHARED_LIBS)
 >> > - shared and static (BR2_SHARED_STATIC_LIBS)
 >> 
 >> > So I reworked it to take that into consideration and committed, thanks.
 >> 
 >> Sorry, I will have to take that back. I did a test compilation with a
 >> completely static (BR2_STATIC_LIBS) setup, which failed:

 > Could you share the defconfig you have used to obtain that result ?

It was afaik just the default arm variant with BR2_STATIC_LIBS enabled.

 > When I run test-pkg with BR2_PACKAGE_MOSQUITTO=y (and
 > BR2_PACKAGE_MOSQUITTO_BROKER defaults to y), I see:
 > """br-arm-full-static [5/6]: OK""".

Hmm, very odd. With current git HEAD and this patch 1/3 applied and the
following config:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MOSQUITTO=y

(E.G. support/config-fragments/autobuild/br-arm-full-static.config + mosquitto)

I get the expected failure:

In file included from security.c:25:0:
lib_load.h:23:11: fatal error: dlfcn.h: No such file or directory
 # include <dlfcn.h>
           ^~~~~~~~~
compilation terminated.
Makefile:189: recipe for target 'security.o' failed

br-arm-full-static-2019.02-rc1.tar.bz2 does not contain a dlfcn.h file,
so that makes sense.

-- 
Bye, Peter Korsgaard
