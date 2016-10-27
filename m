From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 27 Oct 2016 00:06:36 -0400
Subject: [Buildroot] [RFC v3 2/3] mariadb: new package
In-Reply-To: <20160927015304.5937-3-bluemrp9@gmail.com>
References: <20160927015304.5937-1-bluemrp9@gmail.com>
 <20160927015304.5937-3-bluemrp9@gmail.com>
Message-ID: <CA+-urNR3_MEEbP9cPUj+FBJQ0MDA-w2wuN5XKi=s69Dy+nHmng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Mon, Sep 26, 2016 at 9:53 PM, Ryan Coe <bluemrp9@gmail.com> wrote:
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> new file mode 100644
> index 0000000..bac38c2
> --- /dev/null
> +++ b/package/mariadb/mariadb.mk
> @@ -0,0 +1,113 @@
> +################################################################################
> +#
> +# mariadb
> +#
> +################################################################################
> +
> +MARIADB_VERSION = 10.1.17
> +MARIADB_SOURCE = mariadb-$(MARIADB_VERSION).tar.gz
> +MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
> +MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
> +MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
> +MARIADB_INSTALL_STAGING = YES
> +
> +MARIADB_DEPENDENCIES = \
> +       host-mariadb \
> +       ncurses \
> +       openssl \
> +       zlib \
> +       libaio \
> +       libxml2 \
> +       readline
> +
> +# We won't need unit tests
> +MARIADB_CONF_OPTS += -DWITH_UNIT_TESTS=0
> +
> +# Mroonga needs libstemmer. Some work still needs to be done before it can be
> +# included in buildroot. Disable it for now.
> +MARIADB_CONF_OPTS += -DWITHOUT_MROONGA=1
> +
> +# This value is determined automatically during straight compile by compiling
> +# and running a test code. You cannot do that during cross-compile. However the
> +# stack grows downward in most if not all modern systems. The only exception I
> +# am aware of is PA-RISC which is not supported by buildroot. Therefore it makes
> +# sense to hardcode the value. If an arch is added the stack of which grows up
> +# one should expect unpredictable behavior at run time.
> +MARIADB_CONF_OPTS += -DSTACK_DIRECTION=-1
> +
> +# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
> +# when it comes to cross-compilation we shall disable it and also disable TokuDB.
> +MARIADB_CONF_OPTS += -DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1
> +
> +# Make it explicit that we are cross-compiling
> +MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
> +

The next time you re-spin your patch, could you add the following lines to it?

# Explicitly disable dtrace to avoid detection of a host version
MARIADB_CONF_OPTS += -DENABLE_DTRACE=0

With this change, mariadb appears to build and run fine for me.

Also, fwiw, I didn't apply the other patches in the series since it
didn't look like BR2_PACKAGE_HAS_MYSQL was propagated to all of the
packages that depended on mysql. I just deleted the mysql package
completely and changed all references to mariadb.

Thanks,
Frank

> +ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
> +MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
> +else
> +MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
> +endif
> +
> +MARIADB_CONF_OPTS += \
> +       -DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
> +       -DINSTALL_DOCREADMEDIR=share/doc/mariadb-$(MARIADB_VERSION) \
> +       -DINSTALL_MANDIR=share/man \
> +       -DINSTALL_MYSQLSHAREDIR=share/mysql \
> +       -DINSTALL_MYSQLTESTDIR=share/mysql/test \
> +       -DINSTALL_PLUGINDIR=lib/mysql/plugin \
> +       -DINSTALL_SBINDIR=sbin \
> +       -DINSTALL_SCRIPTDIR=bin \
> +       -DINSTALL_SQLBENCHDIR=share/mysql/bench \
> +       -DINSTALL_SUPPORTFILESDIR=share/mysql \
> +       -DMYSQL_DATADIR=/var/lib/mysql \
> +       -DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
> +
> +# Some helpers must be compiled for host in order to crosscompile mariadb for
> +# the target. They are then included by import_executables.cmake which is
> +# generated during the build of the host helpers. It is not necessary to build
> +# the whole host package, only the "import_executables" target.
> +# -DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
> +# must then be passed to cmake during target build.
> +# see also https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
> +HOST_MARIADB_MAKE_OPTS = import_executables
> +
> +MARIADB_CONF_OPTS += \
> +       -DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
> +
> +# Don't install host-mariadb. We just need to build import_executable
> +# Therefore only run 'true' and do nothing, not even the default action.
> +HOST_MARIADB_INSTALL_CMDS = true
> +
> +ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
> +define MARIADB_USERS
> +       mysql -1 mysql -1 * /var/lib/mysql - - MySQL Server
> +endef
> +
> +define MARIADB_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 0755 package/mariadb/S97mysqld \
> +               $(TARGET_DIR)/etc/init.d/S97mysqld
> +endef
> +
> +define MARIADB_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/mariadb/mysqld.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mysqld.service
> +endef
> +endif
> +
> +define MARIADB_POST_INSTALL
> +       mkdir -p $(TARGET_DIR)/var/lib/mysql
> +       $(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
> +               $(TARGET_DIR)/etc/mysql/my.cnf
> +       # We don't need this on the target as it's only useful in staging
> +       $(RM) $(TARGET_DIR)/usr/bin/mysql_config
> +       # Remove test suite
> +       $(RM) -r $(TARGET_DIR)/usr/share/mysql/test
> +endef
> +
> +MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
> new file mode 100644
> index 0000000..cd30831
> --- /dev/null
> +++ b/package/mariadb/mysqld.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=MySQL database server
> +
> +[Service]
> +ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
> +ExecStart=/usr/bin/mysqld_safe
> +Restart=always
> +User=mysql
> +RuntimeDirectory=mysql
> +RuntimeDirectoryMode=0755
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/oracle-mysql/Config.in b/package/oracle-mysql/Config.in
> index 0622a13..1c2d33b 100644
> --- a/package/oracle-mysql/Config.in
> +++ b/package/oracle-mysql/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_ORACLE_MYSQL
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_MMU # fork()
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_PACKAGE_MARIADB
>         select BR2_PACKAGE_NCURSES
>         select BR2_PACKAGE_READLINE
>         help
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
