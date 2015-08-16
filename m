From: Chris Reeves <hello@chris.reeves.io>
Date: Sun, 16 Aug 2015 11:59:11 +0000
Subject: [Buildroot] Installing libpq
Message-ID: <CAJoXuZgkk+nLFHJixMHuFpSDJQTM=G9sJu0TRN9TV2a4+xkYrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm new to using buildroot, trying to create some lightweight containers.
My application requires libpq in order to install psycopg2. I don't really
want to install al of Postgres to get it so I had a go at creating a
package that is basically the equivalent too libpq-dev in the liks of
Ubuntu and Debian.

I basically copied the postgres.mk file and amended to do what I think
should be correct though I must confess I'm not really sure what I'm doing,
here is the libpq.mk file i've created:

LIBPQ_VERSION = 9.4.4
LIBPQ_SOURCE = postgresql-$(LIBPQ_VERSION).tar.bz2
LIBPQ_SITE = http://ftp.postgresql.org/pub/source/v$(LIBPQ_VERSION)
LIBPQ_LICENSE = PostgreSQL
LIBPQ_LICENSE_FILES = COPYRIGHT
LIBPQ_INSTALL_STAGING = YES

ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIBPQ_CONF_OPTS += --disable-thread-safety
endif

ifeq
($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
LIBPQ_CONF_OPTS += --disable-spinlocks
endif

ifeq ($(BR2_PACKAGE_READLINE),y)
LIBPQ_DEPENDENCIES += readline
else
LIBPQ_CONF_OPTS += --without-readline
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
LIBPQ_DEPENDENCIES += zlib
else
LIBPQ_CONF_OPTS += --without-zlib
endif

ifeq ($(BR2_PACKAGE_TZDATA),y)
LIBPQ_DEPENDENCIES += tzdata
LIBPQ_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
else
LIBPQ_DEPENDENCIES += host-zic
LIBPQ_CONF_ENV += ZIC=$$(ZIC)
endif

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBPQ_DEPENDENCIES += openssl
LIBPQ_CONF_OPTS += --with-openssl
endif

define LIBPQ_INSTALL_TARGET_CMDS
$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/interfaces/libpq
DESTDIR=$(TARGET_DIR) install
endef

$(eval $(autotools-package))

This seems to work since I see buildroot install to target:

PATH="/tmp/buildroot/output/host/bin:/tmp/buildroot/output/host/sbin:/tmp/buildroot/output/host/usr/bin:/tmp/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
/usr/bin/make -j2 -C
/tmp/buildroot/output/build/libpq-9.4.4/src/interfaces/libpq
DESTDIR=/tmp/buildroot/output/target install
make[1]: Entering directory
'/tmp/buildroot/output/build/libpq-9.4.4/src/interfaces/libpq'
/bin/mkdir -p '/tmp/buildroot/output/target/usr/lib'
'/tmp/buildroot/output/target/usr/lib/pkgconfig'
/bin/mkdir -p '/tmp/buildroot/output/target/usr/include'
'/tmp/buildroot/output/target/usr/include/postgresql/internal'
'/tmp/buildroot/output/target/usr/share/postgresql'
/usr/bin/install -c -m 755  libpq.so.5.7
'/tmp/buildroot/output/target/usr/lib/libpq.so.5.7'
cd '/tmp/buildroot/output/target/usr/lib' && \
rm -f libpq.so.5 && \
ln -s libpq.so.5.7 libpq.so.5
/usr/bin/install -c -m 644  libpq.a
'/tmp/buildroot/output/target/usr/lib/libpq.a'
/usr/bin/install -c -m 644 libpq.pc
'/tmp/buildroot/output/target/usr/lib/pkgconfig/libpq.pc'
cd '/tmp/buildroot/output/target/usr/lib' && \
rm -f libpq.so && \
ln -s libpq.so.5.7 libpq.so
/usr/bin/install -c -m 644 ./libpq-fe.h
'/tmp/buildroot/output/target/usr/include'
/usr/bin/install -c -m 644 ./libpq-events.h
'/tmp/buildroot/output/target/usr/include'
/usr/bin/install -c -m 644 ./libpq-int.h
'/tmp/buildroot/output/target/usr/include/postgresql/internal'
/usr/bin/install -c -m 644 ./pqexpbuffer.h
'/tmp/buildroot/output/target/usr/include/postgresql/internal'
/usr/bin/install -c -m 644 ./pg_service.conf.sample
'/tmp/buildroot/output/target/usr/share/postgresql/pg_service.conf.sample'
make[1]: Leaving directory
'/tmp/buildroot/output/build/libpq-9.4.4/src/interfaces/libpq'

However the files I expect like the .so's and the headers don't end up in
the rootfs.

I'm not exactly sure what I'm doing wrong.

Any help / pointer in the right would be greatly appreciated :)

Thanks,

Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150816/e83d96b1/attachment.html>
