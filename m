From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 19 Jun 2014 10:02:49 +0200
Subject: [Buildroot] [PATCH 0/3] Bump packages before adding libgtk3
In-Reply-To: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140619080247.GA10736@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Wed, Jun 18, 2014 at 06:19:02PM +0200, Hadrien Boutteville wrote:
> Hello all,
>
> I'm currently packaging libgtk3 (work in progress, patch soon), and
> this series bumps pango and libglib2 as it is necessary for libgtk3, and
> add Freetype support to Cairo.
>
> This series is juste compiled-tested, so it's mostly an RFC. I will do
> running tests with libgtk3 and libgtk2.

I also have a WIP packaging for libgtk3 [1], but I have not sent the patch
because libgtk3 depends on at-spi2-core. This package performs some
non-cross-compilable checks in its configure script via this m4 macro, defined
in acinclude.m4:

  DBIND_CHECK_ALIGNOF(dbus_bool_t)

It fails when cross-compiling because it relies on AC_TRY_RUN() [2].

The only (ugly) solution I found was hardcoding some values depending on the
architecture [3]:

  ifeq ($(BR2_i386), y)
  AT_SPI2_CORE_CONF_ENV = ac_cv_alignof_char=1 \
  	ac_cv_alignof_double=4 \
  	ac_cv_alignof_dbind_pointer=4 \
  	ac_cv_alignof_dbind_struct=1 \
  	ac_cv_alignof_dbus_bool_t=4 \
  	ac_cv_alignof_dbus_int16_t=2 \
  	ac_cv_alignof_dbus_int32_t=4 \
  	ac_cv_alignof_dbus_int64_t=4
  endif

How do you deal with this problem?

Best regards,
ELB

[1] https://github.com/elebihan/buildroot/tree/libgtk3-support
[2] https://www.sourceware.org/autobook/autobook/autobook_269.html
[3] https://github.com/elebihan/buildroot/blob/libgtk3-support/package/at-spi2-core/at-spi2-core.mk
