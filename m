From: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Sun, 26 Jan 2020 08:15:53 +0800
Subject: [Buildroot] [PATCH 1/2] package/liboping: remove -Werror build
 flag
In-Reply-To: <CAPi7W81yAtkC3xJPL++Lb-ZP=5yja0KRy00t3ALdp2Q4EGFv6g@mail.gmail.com>
References: <20200124143609.14313-1-nroach44@gmail.com>
 <CAPi7W81yAtkC3xJPL++Lb-ZP=5yja0KRy00t3ALdp2Q4EGFv6g@mail.gmail.com>
Message-ID: <cfe054c8-2874-de9a-a604-763b3157e4d3@nroach44.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 26/1/20 4:04 am, Fabrice Fontaine wrote:
> Dear Nathaniel,
>
> Le ven. 24 janv. 2020 ? 15:36, Nathaniel Roach <nroach44@gmail.com> a ?crit :
>> Same as https://bugs.gentoo.org/675344 - when building, GCC
>> will fail the build due to a truncation warning.
> Can you be more specific on the build failure? For example, by
> providing a link on autobuilder?
> Otherwise, I would prefer an upstreamable solution such as adding a
> --disable-werror option or adding a patch that fixes the issue.
> There is a pending PR on a truncation error on upstream github:
> https://github.com/octo/liboping/pull/50.
> Is it related to your build failure? In this case, I would suggest to
> retrieve this commit.

The error is detailed in the Gentoo bug linked above, and this was their 
fix for it. There is one single build failure on the autobuilders, and 
it's got the same error: 
http://autobuild.buildroot.org/?reason=liboping-1.10.0

In my case the error is more prevalent, probably due to the parallel build:

 >>> liboping 1.10.0 Building
PATH="/home/nroach44/media/code/buildroot/buildroot-git/output/host/bin:/home/nroach44/media/code/buildroot/buildroot-git/output/host/sbin:/home/nroach44/apps/native/wine/latest/usr/local/bin/:/home/nroach44/apps/bin:/usr/sbin:/sbin:/home/nroach44/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" 
/usr/bin/make -j5? -C 
/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/
make[1]: Entering directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0'
Making all in src
make[2]: Entering directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
/usr/bin/make? all-recursive
make[3]: Entering directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
Making all in mans
make[4]: Entering directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src/mans'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src/mans'
make[4]: Entering directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
/bin/bash ../libtool? --tag=CC?? --mode=compile 
/home/nroach44/media/code/buildroot/buildroot-git/output/host/bin/x86_64-nr44-linux-gnu-gcc 
-DHAVE_CONFIG_H -I.?? -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -O3?? -c -o 
liboping_la-liboping.lo `test -f 'liboping.c' || echo './'`liboping.c
/home/nroach44/media/code/buildroot/buildroot-git/output/host/bin/x86_64-nr44-linux-gnu-gcc 
-DHAVE_CONFIG_H -I.?? -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -O3?? -c -o oping.o oping.c
/home/nroach44/media/code/buildroot/buildroot-git/output/host/bin/x86_64-nr44-linux-gnu-gcc 
-DHAVE_CONFIG_H -I.?? -DUSE_NCURSES=1? -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Werror 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3?? 
-c -o noping-oping.o `test -f 'oping.c' || echo './'`oping.c
libtool: compile: 
/home/nroach44/media/code/buildroot/buildroot-git/output/host/bin/x86_64-nr44-linux-gnu-gcc 
-DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -c liboping.c -fPIC 
-DPIC -o .libs/liboping_la-liboping.o
liboping.c: In function 'ping_set_ttl':
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:829:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:842:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c: In function 'ping_set_qos':
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:869:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:885:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [Makefile:582: liboping_la-liboping.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[3]: *** [Makefile:645: all-recursive] Error 1
make[3]: Leaving directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[2]: *** [Makefile:419: all] Error 2
make[2]: Leaving directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[1]: *** [Makefile:382: all-recursive] Error 1
make[1]: Leaving directory 
'/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0'
make: *** [package/pkg-generic.mk:260: 
/home/nroach44/media/code/buildroot/buildroot-git/output/build/liboping-1.10.0/.stamp_built] 
Error 2


I hadn't come across the patch you linked, as the exact error isn't 
posted within it.


I don't mind patching it either way.

>> Remove -Wall and -Werror from Makefile.am and run automake
>> to apply the change
>>
>> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
>> ---
>>   package/liboping/0002-no-werror.patch | 14 ++++++++++++++
>>   package/liboping/liboping.mk          |  1 +
>>   2 files changed, 15 insertions(+)
>>   create mode 100644 package/liboping/0002-no-werror.patch
>>
>> diff --git a/package/liboping/0002-no-werror.patch b/package/liboping/0002-no-werror.patch
>> new file mode 100644
>> index 0000000000..febb2c0335
>> --- /dev/null
>> +++ b/package/liboping/0002-no-werror.patch
>> @@ -0,0 +1,14 @@
>> +--- a/src/Makefile.am
>> ++++ b/src/Makefile.am
>> +@@ -2,10 +2,6 @@ AUTOMAKE_OPTIONS = foreign no-dependencies
>> +
>> + SUBDIRS = mans
>> +
>> +-if COMPILER_IS_GCC
>> +-AM_CFLAGS = -Wall -Werror
>> +-endif
>> +-
>> + include_HEADERS = oping.h
>> + lib_LTLIBRARIES = liboping.la
>> +
>> +
>> diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
>> index 4aa3e30ee8..6e3530fdb0 100644
>> --- a/package/liboping/liboping.mk
>> +++ b/package/liboping/liboping.mk
>> @@ -11,6 +11,7 @@ LIBOPING_INSTALL_STAGING = YES
>>   LIBOPING_CONF_OPTS = --without-perl-bindings
>>   LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
>>   LIBOPING_LICENSE_FILES = COPYING
>> +LIBOPING_AUTORECONF = YES
>>
>>   ifeq ($(BR2_PACKAGE_NCURSES),y)
>>   LIBOPING_DEPENDENCIES += ncurses
>> --
>> 2.20.1
>>
> Best Regards,
>
> Fabrice
