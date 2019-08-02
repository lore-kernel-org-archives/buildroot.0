From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 2 Aug 2019 15:18:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <874l30x0fd.fsf@dell.be.48ers.dk>
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
 <871ry518wo.fsf@dell.be.48ers.dk> <87sgqlyxov.fsf@dell.be.48ers.dk>
 <b1957631-ca8b-38ab-9b24-5549e8e13e23@railnova.eu>
 <874l30x0fd.fsf@dell.be.48ers.dk>
Message-ID: <1471a17e-814d-eba7-5756-fe5dd592b5db@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On 8/1/19 7:25 PM, Peter Korsgaard wrote:
> 
> It was afaik just the default arm variant with BR2_STATIC_LIBS enabled.
> 
>   > When I run test-pkg with BR2_PACKAGE_MOSQUITTO=y (and
>   > BR2_PACKAGE_MOSQUITTO_BROKER defaults to y), I see:
>   > """br-arm-full-static [5/6]: OK""".
> 
> Hmm, very odd. With current git HEAD and this patch 1/3 applied and the
> following config:
> 
> BR2_arm=y
> BR2_STATIC_LIBS=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.02-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_MOSQUITTO=y
> 

Indeed, when doing a regular make (and not test-pkg) with this defconfig 
I can reproduce the aforementioned failure.

> (E.G. support/config-fragments/autobuild/br-arm-full-static.config + mosquitto)
> 
> I get the expected failure:
> 
> In file included from security.c:25:0:
> lib_load.h:23:11: fatal error: dlfcn.h: No such file or directory
>   # include <dlfcn.h>
>             ^~~~~~~~~
> compilation terminated.
> Makefile:189: recipe for target 'security.o' failed
> 
> br-arm-full-static-2019.02-rc1.tar.bz2 does not contain a dlfcn.h file,
> so that makes sense.
> 

Now, when looking at mosquitto, I understand that WITH_SHARED_LIBRARY=no 
implies that libmosquitto.so won't be created (and linked against).

However, the failure over here is due to some code in the broker which 
is intended to dynamically load modules at runtime, no matter if 
mosquitto is running inside a statically linked executable or from a dylib.

As such, I suggest then to only make the broker depend on 
BR2_SHARED_LIBS, while still allowing the client lib to be built 
statically, which in my opinion makes sense for embedded targets.
What do you think ?

Kind regards,

Titouan
