From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 18:19:43 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add an option to build the
 server
In-Reply-To: <1445179920-2413-2-git-send-email-mathstuf@gmail.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
 <1445179920-2413-2-git-send-email-mathstuf@gmail.com>
Message-ID: <20151018181943.4faaefe2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

On Sun, 18 Oct 2015 10:52:00 -0400, Ben Boeckel wrote:
> Unfortunately, postgresql upstream doesn't have a configure option for
> this. Instead, to get bits of the build, compiling and installing
> different subdirectories is the preferred way.
> 
> The directories come from those used in the FreeBSD port.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Just to clarify: in our current packaging, we build and install both
server and client?


> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index e9b8f48..2560a49 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -18,5 +18,21 @@ config BR2_PACKAGE_POSTGRESQL
>  
>  	  http://www.postgresql.org

As I suggested, doing:

	select BR2_PACKAGE_POSTGRESQL_CLIENT if !BR2_PACKAGE_POSTGRESQL_SERVER

woudl be good.

> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index a42fe73..76a6377 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -58,6 +58,21 @@ POSTGRESQL_DEPENDENCIES += openssl
>  POSTGRESQL_CONF_OPTS += --with-openssl
>  endif
>  
> +POSTGRESQL_BUILD_DIRECTORIES =
> +POSTGRESQL_INSTALL_DIRECTORIES =

Not needed, variables are empty by default.

> +
> +ifeq ($(BR2_PACKAGE_POSTGRESQL_CLIENT),y)
> +
> +POSTGRESQL_CLIENT_DIRECTORIES += config src/include src/interfaces src/port \
> +				 src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
> +				 src/backend

Lines are a bit too long. What about instead:

POSTGRESQL_CLIENT_DIRECTORIES = \
	config src/include src/interfaces src/port src/backend \
	src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \

> +POSTGRESQL_BUILD_DIRECTORIES += $(POSTGRESQL_CLIENT_DIRECTORIES)
> +POSTGRESQL_INSTALL_DIRECTORIES += $(POSTGRESQL_CLIENT_DIRECTORIES)
> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_POSTGRESQL_SERVER),y)
> +
>  define POSTGRESQL_USERS
>  	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
>  endef
> @@ -89,4 +104,37 @@ define POSTGRESQL_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
>  endef
>  
> +POSTGRESQL_SERVER_DIRECTORIES = src/common src/timezone src/backend \
> +				src/backend/utils/mb/conversion_procs \
> +				src/backend/snowball src/backend/replication/libpqwalreceiver \
> +				src/bin/initdb src/bin/pg_ctl \
> +				src/bin/pg_controldata src/bin/pg_resetxlog src/pl \
> +				src/bin/pg_basebackup

Ditto.

> +
> +POSTGRESQL_INSTALL_DIRECTORIES += $(POSTGRESQL_SERVER_DIRECTORIES)
> +POSTGRESQL_BUILD_DIRECTORIES += src/port $(POSTGRESQL_SERVER_DIRECTORIES)

Is it problematic if src/port gets installed in the server case? If
not, then you don't need to have this difference between
POSTGRESQL_INSTALL_DIRECTORIES and POSTGRESQL_BUILD_DIRECTORIES.

> +
> +endif
> +
> +define POSTGRESQL_BUILD_CMDS
> +	for dir in $(POSTGRESQL_BUILD_DIRECTORIES); do \
> +		echo $${dir}; \

Left-over debugging?

> +		$(MAKE) -C $(@D)/$${dir} || exit 1; \
> +	done

Could you use a foreach loop instead ?

	$(foreach d,$(POSTGRESQL_BUILD_DIRECTORIES),\
		$(MAKE) -C $(@D)/$(d)$(sep))

> +endef
> +
> +define POSTGRESQL_INSTALL_TARGET_CMDS
> +	for dir in $(POSTGRESQL_INSTALL_DIRECTORIES); do \
> +		echo $${dir}; \
> +		$(MAKE) -C $(@D)/$${dir} DESTDIR=$(TARGET_DIR) install || exit 1; \
> +	done

Ditto.

> +endef
> +
> +define POSTGRESQL_INSTALL_STAGING_CMDS
> +	for dir in $(POSTGRESQL_INSTALL_DIRECTORIES); do \
> +		echo $${dir}; \
> +		$(MAKE) -C $(@D)/$${dir} DESTDIR=$(STAGING_DIR) install || exit 1; \
> +	done

Ditto.

Also, above the definition of POSTGRESQL_CLIENT_DIRECTORIES or
POSTGRESQL_SERVER_DIRECTORIES, can you add a comment with a reference
to the postgresql documentation that says which directories should be
built/installed for the client and server cases? This way if we need to
update the postgresql package in the future, we can do it by looking at
the documentation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
