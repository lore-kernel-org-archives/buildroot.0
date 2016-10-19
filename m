From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 19 Oct 2016 18:23:12 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
	enabled
In-Reply-To: <20161019145904.6a82c434@free-electrons.com>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
 <20161018172543.20a693fa@free-electrons.com>
 <CAJtjsKbAHTY4LwuS=oGpxhCf=hCupmk0Si7-kCTnA3YYtFbgfA@mail.gmail.com>
 <20161019145904.6a82c434@free-electrons.com>
Message-ID: <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2016 at 2:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 19 Oct 2016 14:42:45 +0200, Johan Oudinet wrote:
>
>> >> -AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
>> >> +# If either locale or libglib2 is defined, avahi needs libintl.
>> >> +AVAHI_MAKE_OPTS += \
>> >> +     $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_LIBGLIB2),LIBS=-lintl)
>> >
>> > Hum, I wondering if it wouldn't be nicer to rely on the fact that the
>> > Config.in of those packages enable BR2_PACKAGE_GETTEXT when necessary.
>> > So maybe we should instead rely on BR2_PACKAGE_GETTEXT=y, with
>> > something like:
>> >
>> > ifeq ($(BR2_PACKAGE_GETTEXT),y)
>> > AVAHI_DEPENDENCIES += gettext
>> > AVAHI_MAKE_OPTS += LIBS=-lintl
>> > endif
>> >
>> > (and of course, remove the gettext dependency added conditionally on
>> > BR2_NEEDS_GETTEXT_IF_LOCALE).
>> >
>> > It would be necessary to also test this with musl and glibc
>> > configurations, with gettext enabled, to make sure it doesn't break.
>> >
>> > And if it works, then we should update the Buildroot manual, which has
>> > a section on the gettext integration.
>>
>> Good idea. I'm trying it and if it works, I'll send a patch serie. One
>> to modify the documentation, and one to update every packet that
>> integrates gettext.
>
> Could you please send the documentation patch alone first, so we can
> validate the approach (i.e not only me, but also other folks in
> Buildroot), before you spend time on reworking all the packages. This
> way, we can all agree on the new approach first.
>

Sure. However, It does break if I activate gettext with glibc:
----------8<----------8<----------8<----------8<----------8<----------
>>> avahi 0.6.32 Building
PATH="/home/johan/Documents/buildroot/output-glibc/host/bin:/home/johan/Documents/buildroot/output-glibc/host/sbin:/home/johan/Documents/buildroot/output-glibc/host/usr/bin:/home/johan/Documents/buildroot/output-glibc/host/usr/sbin:/home/johan/cov-analysis-linux64-6.6.1/bin:/home/johan/bin:/home/johan/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 /usr/bin/make -j9 LIBS=-lintl -C
/home/johan/Documents/buildroot/output-glibc/build/avahi-0.6.32/
/usr/bin/make  all-recursive
Making all in common
make[4]: Nothing to be done for 'all'.
Making all in avahi-common
/bin/bash ../libtool  --tag=CC   --mode=link
/home/johan/Documents/buildroot/output-glibc/host/usr/bin/i686-pc-linux-gnu-gcc
-std=gnu99 -I.. '-DDEBUG_TRAP=__asm__("int $3")' -pthread
-DAVAHI_LOCALEDIR=\"/usr/share/locale\" -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -DDISABLE_SYSTEMD
-std=c99 -Wall -W -Wextra -pedantic -pipe -Wformat
-Wold-style-definition -Wdeclaration-after-statement -Wfloat-equal
-Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes
-Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels
-Wpointer-arith -Wbad-function-cast -Wcast-qual -Wcast-align
-Wwrite-strings -fdiagnostics-show-option -Wno-cast-qual
-fno-strict-aliasing   -version-info 8:3:5  -o libavahi-common.la
-rpath /usr/lib libavahi_common_la-malloc.lo
libavahi_common_la-address.lo libavahi_common_la-alternative.lo
libavahi_common_la-error.lo libavahi_common_la-strlst.lo
libavahi_common_la-domain.lo libavahi_common_la-timeval.lo
libavahi_common_la-simple-watch.lo libavahi_common_la-thread-watch.lo
libavahi_common_la-rlist.lo libavahi_common_la-utf8.lo
libavahi_common_la-i18n.lo  -pthread   -lintl
libtool: link: /home/johan/Documents/buildroot/output-glibc/host/usr/bin/i686-pc-linux-gnu-gcc
-std=gnu99 -shared  -fPIC -DPIC  .libs/libavahi_common_la-malloc.o
.libs/libavahi_common_la-address.o
.libs/libavahi_common_la-alternative.o
.libs/libavahi_common_la-error.o .libs/libavahi_common_la-strlst.o
.libs/libavahi_common_la-domain.o .libs/libavahi_common_la-timeval.o
.libs/libavahi_common_la-simple-watch.o
.libs/libavahi_common_la-thread-watch.o
.libs/libavahi_common_la-rlist.o .libs/libavahi_common_la-utf8.o
.libs/libavahi_common_la-i18n.o   -lintl  -pthread -Os -pthread
-pthread -Wl,-soname -Wl,libavahi-common.so.3 -o
.libs/libavahi-common.so.3.5.3
/home/johan/Documents/buildroot/output-glibc/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
cannot find -lintl
----------8<----------8<----------8<----------8<----------8<----------

However, if I don't manually select the gettext package, it won't be
selected and the build is a success. I'm not sure when it makes sense
to manually select gettext?
-- 
Johan
