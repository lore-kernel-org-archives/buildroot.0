From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 17:47:34 +0100
Subject: [Buildroot] [PATCH] package/radlib: New package
In-Reply-To: <1453220389.3109.32.camel@intel.com>
References: <1453220389.3109.32.camel@intel.com>
Message-ID: <20160119174734.664e230c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution. See my review below for some comments.

On Tue, 19 Jan 2016 16:19:49 +0000, Kinsella, Ray wrote:
> radlib is a rapid application development library for unix
> multi-process applications. It uses SYS V IPC facilities and
> FIFOs to provide an RTOS-like, event-driven, distributed
> framework. Processes may be run as daemons or have a controlling
> terminal.
> 
> Signed-off-by: Ray Kinsella <ray.kinsella at intel.com<mailto:ray.kinsella@intel.com>>

There is an issue here with SoB line, it should include this mailto:
thing.

> diff --git a/package/Config.in b/package/Config.in
> index b04c690..b971494 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1216,6 +1216,7 @@ endif
>         source "package/protobuf-c/Config.in"
>         source "package/qhull/Config.in"
>         source "package/qlibc/Config.in"
> +        source "package/radlib/Config.in"

Indentation problem.

>         source "package/startup-notification/Config.in"
>         source "package/tz/Config.in"
>         source "package/tzdata/Config.in"
> diff --git a/package/radlib/0001-cross_compile_link_bug.patch b/package/radlib/0001-cross_compile_link_bug.patch
> new file mode 100644
> index 0000000..a532f93
> --- /dev/null
> +++ b/package/radlib/0001-cross_compile_link_bug.patch

All patches should have a description + Signed-off-by line.

> @@ -0,0 +1,163 @@
> +diff -Naur a/debug/Makefile.am b/debug/Makefile.am
> +--- a/debug/Makefile.am        2016-01-12 14:33:24.655252603 +0000
> ++++ b/debug/Makefile.am        2016-01-12 14:33:37.858601971 +0000
> +@@ -27,8 +27,8 @@
> + endif
> +
> + # define library directories
> +-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
> +-INCLUDES         += -I$(prefix)/include -I/usr/include
> ++raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib
> ++INCLUDES         += -I$(prefix)/include

This remains completely wrong. Contrary to what you do in your .mk
file, --prefix should *NOT* be $(STAGING_DIR)/usr or $(TARGET_DIR)/usr.
It should be just "/usr". And therefore those -I$(prefix)/include and
-L$(prefix)/lib are totally wrong.

> +-if CROSSCOMPILE
> +-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
> +-endif
> ++#if CROSSCOMPILE
> ++#raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
> ++#endif

Why ?

> +diff -Naur a/debug/Makefile.in b/debug/Makefile.in
> +--- a/debug/Makefile.in        2016-01-12 14:33:24.655252603 +0000
> ++++ b/debug/Makefile.in        2016-01-12 14:34:05.062321796 +0000
> +@@ -43,7 +43,7 @@
> + @MYSQL_TRUE at am__append_4 = -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
> + @MYSQL_FALSE@@PGRESQL_TRUE at am__append_5 = -L$(prefix)/pgsql/lib
> + @MYSQL_FALSE@@PGRESQL_TRUE at am__append_6 = -I$(prefix)/pgsql/include
> +- at CROSSCOMPILE_TRUE@am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
> ++#@CROSSCOMPILE_TRUE at am__append_7 = $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o

Same.

> diff --git a/package/radlib/Config.in b/package/radlib/Config.in
> new file mode 100644
> index 0000000..2ca1617
> --- /dev/null
> +++ b/package/radlib/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_RADLIB
> +       bool "radlib"
> +       select BR2_PACKAGE_SQLITE
> +       select BR2_PACKAGE_SQLITE_NO_SYNC

Why do you force this NO_SYNC option ?

> +       help
> +         radlib is a rapid application development library for unix
> +         multi-process applications. It uses SYS V IPC facilities and
> +         FIFOs to provide an RTOS-like, event-driven, distributed framework.
> +         Processes may be run as daemons or have a controlling terminal.
> +
> +         http://sourceforge.net/projects/radlib/
> +
> +if BR2_PACKAGE_RADLIB
> +
> +config BR2_PACKAGE_RADLIB_MYSQL$

Incorrect trailing $.

> +       bool "Enable MYSQL support in Radlib"
> +       select BR2_PACKAGE_MYSQL
> +       help$

Ditto. Also, if you select BR2_PACKAGE_MYSQL, you must replicate all
the "depends on" of BR2_PACKAGE_MYSQL. I would therefore rather suggest
you to remove this option, and simply enable MySQL support in the .mk
file if BR2_PACKAGE_MYSQL=y.

> diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
> new file mode 100644
> index 0000000..ccbd532
> --- /dev/null
> +++ b/package/radlib/radlib.hash
> @@ -0,0 +1 @@

You need to indicate here in a comment where the hash is coming from.

> +sha256  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66  radlib-2.12.0.tar.gz
> diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
> new file mode 100644
> index 0000000..3dc48f8
> --- /dev/null
> +++ b/package/radlib/radlib.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# RADLib

Lowercase.

> +#
> +################################################################################
> +
> +RADLIB_VERSION = 2.12.0
> +RADLIB_SOURCE = radlib-$(RADLIB_VERSION).tar.gz

This variable is not needed here, as what you're using is the default
value.

> +RADLIB_SITE = http://downloads.sourceforge.net/radlib
> +RADLIB_INSTALL_STAGING = YES
> +RADLIB_LICENSE = BSD 2 Clause

BSD-2c

> +RADLIB_LICENSE_FILES = COPYING
> +RADLIB_DEPENDENCIES += sqlite

= is sufficient here.

> +
> +RADLIB_CONF_OPTS += --enable-sqlite --prefix=$(STAGING_DIR)/usr

If --enable-sqlite exists, then presumably it means that the sqlite
support is optional, no? If it is, then please make it optional.

Also, as said above --prefix=$(STAGING_DIR)/usr is completely wrong.
--prefix must be /usr, and it is already set to this value by the
autotools-package infrastructure, so you have nothing to do here.

"prefix" denotes where the software will be found while running on the
target. Certainly $(STAGING_DIR) doesn't exist once running on the
target!

So you must always use --prefix=/usr, and at installation time, pass
DESTDIR=$(TARGET_DIR) or DESTDIR=$(STAGING_DIR) to have things
installed not in /usr, but in $(TARGET_DIR)/usr or $(STAGING_DIR)/usr
respectively. All of this is done automatically for you by the
autotools-package infrastructure.

> +
> +ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
> +RADLIB_CONF_OPTS += --enable-mysql

This is wrong because it doesn't guarantee you that mysql has been
built before. You need to put "mysql" in RADLIB_DEPENDENCIES to have
this guarantee. Also, when something is not enabled, you should disable
it explicitly to avoid invalid auto-detection.

So, together with my suggestion of removing the
BR2_PACKAGE_RADLIB_MYSQL option, this would give:

ifeq ($(BR2_PACKAGE_MYSQL),y)
RADLIB_CONF_OPTS += --enable-mysql
RADLIB_DEPENDENCIES += mysql
else
RADLIB_CONF_OPTS += --disable-mysql
endif

This is the fairly canonical way of handling optional dependencies in
Buildroot packages. We use this construct all over the place.

> +endif
> +
> +define RADLIB_INSTALL_STAGING_CMDS
> +       $(MAKE) exec_prefix=$(STAGING_DIR) install -C $(@D)/
> +endef
> +
> +define RADLIB_INSTALL_TARGET_CMDS
> +       $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)/
> +endef

Those two variables definition should not be needed.

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Why do you call host-autotools-package here? For which reason do you
need a host variant of this package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
