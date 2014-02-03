From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 3 Feb 2014 14:45:15 -0200
Subject: [Buildroot] Mysql: $(ENABLE_DEBUG) is unset
In-Reply-To: <CA+kK6WsurjJPB1wzACqx1bNO1GYBRK+u1DAPZXfKCQoNVYiJEA@mail.gmail.com>
References: <CA+kK6WsurjJPB1wzACqx1bNO1GYBRK+u1DAPZXfKCQoNVYiJEA@mail.gmail.com>
Message-ID: <CA+kK6WujspDnZ_nc_j=mbVopwbeqaM1B0_Noi2c6+2s9kQVMzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Ther are two possible solution:

1) Remove $(ENABLE_DEBUG) option

2) Change Config.in: add option to compile MySQL with debug support


config BR2_PACKAGE_MYSQL
bool "MySQL"
depends on BR2_INSTALL_LIBSTDCPP
depends on BR2_USE_MMU # fork()
depends on BR2_TOOLCHAIN_HAS_THREADS
select BR2_PACKAGE_NCURSES
select BR2_PACKAGE_READLINE
help
 The MySQL Open Source Database System

 http://www.mysql.com/

comment "MySQL needs a toolchain w/ C++, threads"
depends on BR2_USE_MMU
depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

if BR2_PACKAGE_MYSQL

config BR2_PACKAGE_MYSQL_DEBUG
bool " MySQL with support for debugging "
default n
help
 This is necessary to output a trace log.

endif

This is just a draft. I wanna know, what do you think?

Best,
Marcelo

2014-02-03 Marcelo Gutierrez <kuyurix@gmail.com>:
> Hi all,
>
> Configuration options defined in  mysql.mk file, $(ENABLE_DEBUG) is unset.
>
> MYSQL_CONF_OPT = \
> --without-ndb-binlog \
> --without-server \
> --without-docs \
> --without-man \
> --without-libedit \
> --without-readline \
> --with-low-memory \
> --enable-thread-safe-client \
> $(ENABLE_DEBUG)
