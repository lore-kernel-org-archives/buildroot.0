From: bruce bushby <bruce.bushby@gmail.com>
Date: Sun, 6 Feb 2011 13:17:03 +0000
Subject: [Buildroot] Package make logs and autoreconf
In-Reply-To: <AANLkTimo5Mz8_n0NJ3mBr84q0s5DPPdN3RMPrnegkR7j@mail.gmail.com>
References: <AANLkTimo5Mz8_n0NJ3mBr84q0s5DPPdN3RMPrnegkR7j@mail.gmail.com>
Message-ID: <AANLkTinkkSJuy260sDwBqLSDBW4zmw6pdMT+iAzK+N1v@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've made some progress trying to add "rabbitmq-c" client to my buildroot.

This is my "mk file":
#############################################################
#
# rabbitmq
#
#############################################################
RABBITMQ_VERSION = 0.01
RABBITMQ_SOURCE = rabbitmq-$(RABBITMQ_VERSION).tar.gz
RABBITMQ_SITE = http://www.veritrack.co.uk/static/images

RABBITMQ_AUTORECONF = YES

RABBITMQ_INSTALL_STAGING = YES
RABBITMQ_INSTALL_TARGET = YES
RABBITMQ_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
RABBITMQ_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)

RABBITMQ_LIBTOOL_PATCH = YES

RABBITMQ_CONF_OPT =
RABBITMQ_DEPENDENCIES = $(if $(BR2_PACKAGE_POPT),popt)

$(eval $(call AUTOTARGETS,package,rabbitmq))
$(eval $(call AUTOTARGETS,package,rabbitmq,host))



However when I run make I get:
/opt/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/opt/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
-DHAVE_CONFIG_H -I. -I..    -I../librabbitmq -I./unix -I../librabbitmq -pipe
-Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/opt/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
-I/opt/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/include
-Wall -MT process.o -MD -MP -MF .deps/process.Tpo -c -o process.o `test -f
'unix/process.c' || echo './'`unix/process.c
unix/process.c:53:19: fatal error: spawn.h: No such file or directory
compilation terminated.
make[4]: *** [process.o] Error 1
make[4]: *** Waiting for unfinished jobs....
mv -f .deps/consume.Tpo .deps/consume.Po
make[4]: Leaving directory `/opt/buildroot/output/build/rabbitmq-0.01/tools'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/opt/buildroot/output/build/rabbitmq-0.01/tools'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/opt/buildroot/output/build/rabbitmq-0.01'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/buildroot/output/build/rabbitmq-0.01'
make: *** [/opt/buildroot/output/build/rabbitmq-0.01/.stamp_built] Error 2
root at varm:/opt/buildroot#



I also tried it with the uClibc daily snapshot.....same issue

So I tried doing a find for "spawn.h":
root at varm:/opt/buildroot# find . -name "*spawn.h*" | grep "\/spawn"
./output/build/host-m4-1.4.15/lib/spawn.h
./output/build/m4-1.4.15/lib/spawn.h
./output/build/bison-2.4.3/lib/spawn.h
root at varm:/opt/buildroot#


Any ideas?

Thanks
Bruce



On Sun, Feb 6, 2011 at 10:53 AM, bruce bushby <bruce.bushby@gmail.com>wrote:

> Hi
>
> I've going through the docs about adding packages and added a few simple
> ones that only requires "tar extract, configure & make" .... however one of
> my packages requires "autoreconf".
>
> When I run make it stops with:
> make: *** No rule to make target `""', needed by `rabbitmq-depends'. Stop.
>
> Is there a log file showing what commands buildroot ran?
>
> If I take the same package on my linux pc and run "tar extract, autoreconf
> -i, ./configure ,make" .. it compiles ok. It does require "popt.h" ... but
> I'm not seeing this missing dependency in the output...hence wanting to find
> some logs?
>
> Thanks
> Bruce
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110206/fe37eea7/attachment.html>
