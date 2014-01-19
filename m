From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 12:51:24 +0100
Subject: [Buildroot] [PATCH 2/2] Update MySQL client package
In-Reply-To: <CA+kK6Wt+nNbrUuOp1Ymq0KzRZfG5CAZQAa+9KK6w=S0mV+D16Q@mail.gmail.com>
References: <CA+kK6Wt+nNbrUuOp1Ymq0KzRZfG5CAZQAa+9KK6w=S0mV+D16Q@mail.gmail.com>
Message-ID: <20140119115124.GA3387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-01-18 19:24 -0200, Marcelo Gutierrez spake thusly:
> Changes v1 -> v2:
>         - fix comments following new policy
>         - rename patches
>         - remove useless hook points
>         - add the URL to the home of MySQL
>         - add commit-log description to the patches
>         - install host tools to $(HOST_DIR)/usr/bin
>         - fix only builds the required program
> 
> 
> Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>

The patch is space-mangled: tabs were replaced by spaces.
So we can't apply it.

Please fix your mailer, or better yet, use 'git send-email' to send your
patches.

However, still a few comments, below...

> ---
>  package/mysql_client/Config.in                     |   20 +++++++--
>  package/mysql_client/S60mysqld                     |   25 +++++++++++
>  .../mysql_client-Fix-gen_lex_hash-execution.patch  |   28 ++++++++++++
>  .../mysql_client-ac_stack_direction-is-unset.patch |   15 +++++++

As I said in my previous review, the patches should be named as:
    mysql_client-0000-ac_stack_direction-is-unset.patch
    mysql_client-0001-Fix-gen_lex_hash-execution.patch

Ie. they should be numbered.

I know the existing patches are not, so just provide a preliminary patch
that renames them, please.

>  package/mysql_client/mysql_client.mk               |   47 +++++++++++++++++++-
>  5 files changed, 130 insertions(+), 5 deletions(-)
>  create mode 100644 package/mysql_client/S60mysqld
>  create mode 100644
> package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
>  create mode 100644
> package/mysql_client/mysql_client-ac_stack_direction-is-unset.patch
> 
> diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
> index 543bed1..8ebe70f 100644
> --- a/package/mysql_client/Config.in
> +++ b/package/mysql_client/Config.in
> @@ -1,13 +1,25 @@
> -config BR2_PACKAGE_MYSQL_CLIENT
> -       bool "MySQL client"
> +config BR2_PACKAGE_MYSQL
> +       bool "MySQL"

You can't rename the option: it should match the name of the package.
The package infrastructure uses that to decide if a package should be
built or not.

But since the mysql_client package may now also be able to build the
server part, it could make sense to rename the package. But even then,
it should be done in a different patch, eg:
  - patch-1: rename the package and the existing patches
  - patch-3: add support for building the server

In patch-1, don;t forget to add the option in Config.in.legacy.

>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_MMU # fork()
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_PACKAGE_NCURSES
>         select BR2_PACKAGE_READLINE
>         help
> -         MySQL client
> +         The MySQL Open Source Database System
> +         http://www.mysql.com/
> 
> -comment "MySQL client needs a toolchain w/ C++, threads"
> +comment "MySQL server and MySQL client needs a toolchain w/ C++, threads"

What about just:
    "MySQL needs a toolchain w/ C++, threads"

>         depends on BR2_USE_MMU
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_MYSQL
> +
> +config BR2_PACKAGE_MYSQL_CLIENT
> +        bool "MySQL client"
> +
> +config BR2_PACKAGE_MYSQL_CLIENT_SERVER
> +       bool "MySQL server"
> +
> +endif

What if neither the client nor the server is selected? Does that make
sense? If not, then always build the client (as we currently do), and
make the server an option (as you did in your previous patch).

> diff --git a/package/mysql_client/S60mysqld b/package/mysql_client/S60mysqld
> new file mode 100644
> index 0000000..38e1c41
> --- /dev/null
> +++ b/package/mysql_client/S60mysqld
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +#
> +# Starts mysqld.
> +#
> +
> +case "$1" in
> +       start)
> +               /usr/bin/mysqld_safe &
> +               ;;
> +       stop)
> +               if test -f /var/lib/mysql/mysqld.pid ; then
> +                       PID=`cat /var/lib/mysql/mysqld.pid`
> +                       kill $PID
> +               fi
> +               ;;
> +       restart)
> +               $0 stop
> +               $0 start
> +               ;;
> +       *)
> +               echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
> +               ;;
> +esac
> +
> +exit 0

"exit 0" is not needed.

> diff --git a/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
> b/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
> new file mode 100644
> index 0000000..377cabb
> --- /dev/null
> +++ b/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
> @@ -0,0 +1,28 @@
> +When MySQL server is enabled, I first compile the tool with the host gcc
> +and then copy into the "$(HOST_DIR)/usr/bin/" folder

This is more descriptive, as it states the reason, and explains the fix:

    Makefile: fix cross-compiling the server

    MySQL Makefile believes it can run code it just compiled, to
    generate a header. This does not work for cross-compilation.

    Instead, use a pre-installed host-version of the required tool.

[--SNIP--]
> diff --git a/package/mysql_client/mysql_client.mk
> b/package/mysql_client/mysql_client.mk
> index bd4c565..127f65e 100644
> --- a/package/mysql_client/mysql_client.mk
> +++ b/package/mysql_client/mysql_client.mk
> @@ -14,6 +14,15 @@ MYSQL_CLIENT_AUTORECONF = YES
>  MYSQL_CLIENT_LICENSE = GPLv2
>  MYSQL_CLIENT_LICENSE_FILES = README COPYING
> 
> +
> +ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
> +MYSQL_CLIENT_DEPENDENCIES += host-mysql_client
> +HOST_MYSQL_CLIENT_DEPENDENCIES =
> +
> +HOST_MYSQL_CLIENT_CONF_OPT = \
> +       --with-embedded-server
> +endif
> +
>  MYSQL_CLIENT_CONF_ENV = \
>         ac_cv_sys_restartable_syscalls=yes \
>         ac_cv_path_PS=/bin/ps \
> @@ -25,15 +34,50 @@ MYSQL_CLIENT_CONF_ENV = \
> 
>  MYSQL_CLIENT_CONF_OPT = \
>         --without-ndb-binlog \
> -       --without-server \
>         --without-docs \
>         --without-man \
>         --without-libedit \
>         --without-readline \
> +       --without-libedit \
> +       --disable-dependency-tracking \
>         --with-low-memory \
> +       --with-atomic-ops=up \
>         --enable-thread-safe-client \
> +       --without-query-cache \
> +       --without-plugin-partition \
> +       --without-plugin-daemon_example \
> +       --without-plugin-ftexample \
> +       --without-plugin-archive \
> +       --without-plugin-blackhole \
> +       --without-plugin-example \
> +       --without-plugin-federated \
> +       --without-plugin-ibmdb2i \
> +       --without-plugin-innobase \
> +       --without-plugin-innodb_plugin \
> +       --without-plugin-ndbcluster \

I would move all those new options in the
ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y) below...

>         $(ENABLE_DEBUG)
> 
> +ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
> +       MYSQL_CLIENT_CONF_OPT += --with-embedded-server

... here    ^^^

> +define HOST_MYSQL_CLIENT_BUILD_CMDS
> +       $(MAKE) -C $(@D)/include my_config.h
> +       $(MAKE) -C $(@D)/mysys libmysys.a
> +       $(MAKE) -C $(@D)/strings libmystrings.a
> +       $(MAKE) -C $(@D)/vio libvio.a
> +       $(MAKE) -C $(@D)/dbug libdbug.a
> +       $(MAKE) -C $(@D)/regex libregex.a
> +       $(MAKE) -C $(@D)/sql gen_lex_hash
> +endef
> +
> +define HOST_MYSQL_CLIENT_INSTALL_CMDS
> +       $(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
> +endef
> +
> +else
> +MYSQL_CLIENT_CONF_OPT += --without-server
> +endif
> +
>  define MYSQL_CLIENT_REMOVE_TEST_PROGS
>         rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
>  endef
> @@ -46,3 +90,4 @@ MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS +=
> MYSQL_CLIENT_REMOVE_TEST_PROGS
>  MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
> 
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

This is getting really good! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
