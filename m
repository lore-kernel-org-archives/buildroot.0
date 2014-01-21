From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Tue, 21 Jan 2014 21:46:17 -0200
Subject: [Buildroot] [PATCH v3, 3/3] add support for building the server
In-Reply-To: <20140121222717.GE3455@free.fr>
References: <1390313407-3495-2-git-send-email-kuyurix@gmail.com>
 <1390313407-3495-3-git-send-email-kuyurix@gmail.com>
 <20140121222717.GE3455@free.fr>
Message-ID: <CA+kK6Wt1SajT+u7pyXqCGe6enKb7XEwC-VvCbimWzp1CXxBq3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,


+define HOST_MYSQL_BUILD_CMDS
> +        $(MAKE) -C $(@D)/include my_config.h
> +        $(MAKE) -C $(@D)/mysys libmysys.a
> +        $(MAKE) -C $(@D)/strings libmystrings.a
> +        $(MAKE) -C $(@D)/vio libvio.a
> +        $(MAKE) -C $(@D)/dbug libdbug.a
> +        $(MAKE) -C $(@D)/regex libregex.a
> +        $(MAKE) -C $(@D)/sql gen_lex_hash
>


Hmmm... When I suggested we only build the required stuff, I did not
> expect this would amount to so many single-line calls.
>
> I wonder if it is worth keeping this. So, is it much faster to only
> build the above, compared to building everything? If so, we just keep
> the above lines, otherwise, we should just keep the default host build
> commands.


I can confirm you that compiles faster, since, we just need generate
gen_lex_hash binary file, but if you want to keep the default host build
commands, just let me know.

I noticed that you enable the server with: --with-embedded-server
> but you disable it with: --without-server
>

http://dev.mysql.com/doc/refman/5.1/en/source-configuration-options.html

I based on source configuration options:

To compile just the MySQL client libraries and client programs and not the
> server, use the --without-server option
>

To build the embedded MySQL library (libmysqld.a), use the
> --with-embedded-server option
>

endef
>
> else
> +MYSQL_CONF_OPT += \
> +     --without-server
> +endif
>

I think, I should add --without-embedded-server like this:

MYSQL_CONF_OPT += \
+     --without-server
+     --without-embedded-server

What about ...?


Best,
Marcelo Gutierrez



2014/1/21 Yann E. MORIN <yann.morin.1998@free.fr>

> Marcelo, All,
>
> Subject should have been something like:
>     mysql: add option to build the server
>
> On 2014-01-21 14:10 +0000, Marcelo Guti?rrez spake thusly:
> > Add support for building MySQL
> >
> > Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
>
> Still a few comments...
>
> [--SNIP--]
> > diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> > index 229e050..56e7e6e 100644
> > --- a/package/mysql/Config.in
> > +++ b/package/mysql/Config.in
> > @@ -12,3 +12,10 @@ config BR2_PACKAGE_MYSQL
> >  comment "MySQL needs a toolchain w/ C++, threads"
> >       depends on BR2_USE_MMU
> >       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +if BR2_PACKAGE_MYSQL
> > +
> > +config BR2_PACKAGE_MYSQL_SERVER
> > +        bool "MySQL server"
>
> Leading tab, not spaces.
>
> Maybe add a bit of help here:
>     help
>       Install the MySQL server on the target.
>
> [--SNIP--]
> > diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
> > index aaf6ba9..a418eb2 100644
> > --- a/package/mysql/mysql.mk
> > +++ b/package/mysql/mysql.mk
> > @@ -14,6 +14,15 @@ MYSQL_AUTORECONF = YES
> >  MYSQL_LICENSE = GPLv2
> >  MYSQL_LICENSE_FILES = README COPYING
> >
> > +ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
> > +MYSQL_DEPENDENCIES += host-mysql
> > +HOST_MYSQL_DEPENDENCIES =
> > +
> > +HOST_MYSQL_CONF_OPT = \
> > +        --with-embedded-server
> > +endif
>
> Maybe this ifeq-block can be moved in the other one, below?
>
> I noticed that you enable the server with: --with-embedded-server
> but you disable it with: --without-server
>
> There is a mismatch between the --with and the --without options. Is
> that normal?
>
> >  MYSQL_CONF_ENV = \
> >       ac_cv_sys_restartable_syscalls=yes \
> >       ac_cv_path_PS=/bin/ps \
> > @@ -25,7 +34,6 @@ MYSQL_CONF_ENV = \
> >
> >  MYSQL_CONF_OPT = \
> >       --without-ndb-binlog \
> > -     --without-server \
> >       --without-docs \
> >       --without-man \
> >       --without-libedit \
> > @@ -34,6 +42,44 @@ MYSQL_CONF_OPT = \
> >       --enable-thread-safe-client \
> >       $(ENABLE_DEBUG)
> >
> > +ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
> > +        MYSQL_CONF_OPT += \
>
> No indentation on that first line.
>
> > +        --disable-dependency-tracking \
> > +        --with-atomic-ops=up \
> > +        --with-embedded-server \
> > +        --without-query-cache \
> > +        --without-plugin-partition \
> > +        --without-plugin-daemon_example \
> > +        --without-plugin-ftexample \
> > +        --without-plugin-archive \
> > +        --without-plugin-blackhole \
> > +        --without-plugin-example \
> > +        --without-plugin-federated \
> > +        --without-plugin-ibmdb2i \
> > +        --without-plugin-innobase \
> > +        --without-plugin-innodb_plugin \
> > +        --without-plugin-ndbcluster
>
> We usually indent with one tab in continuation lines.
>
> > +define HOST_MYSQL_BUILD_CMDS
> > +        $(MAKE) -C $(@D)/include my_config.h
> > +        $(MAKE) -C $(@D)/mysys libmysys.a
> > +        $(MAKE) -C $(@D)/strings libmystrings.a
> > +        $(MAKE) -C $(@D)/vio libvio.a
> > +        $(MAKE) -C $(@D)/dbug libdbug.a
> > +        $(MAKE) -C $(@D)/regex libregex.a
> > +        $(MAKE) -C $(@D)/sql gen_lex_hash
>
> These should be indented with a tab, not spaces.
>
> > +endef
>
> Hmmm... When I suggested we only build the required stuff, I did not
> expect this would amount to so many single-line calls.
>
> I wonder if it is worth keeping this. So, is it much faster to only
> build the above, compared to building everything? If so, we just keep
> the above lines, otherwise, we should just keep the default host build
> commands.
>
> > +define HOST_MYSQL_INSTALL_CMDS
> > +        $(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
>
> One tab, not spaces.
>
> > +endef
> > +
> > +else
> > +MYSQL_CONF_OPT += \
> > +     --without-server
> > +endif
> > +
> > +
> >  define MYSQL_REMOVE_TEST_PROGS
> >       rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
> >  endef
>
> It looks like you somehow lost the final line in your refactoring:
>     $(eval $(host-autotools-package))
>
> Really, thank you for staying on-board through these iterations!
> We're getting pretty close on that last patch! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140121/2e8301af/attachment.html>
