From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 28 Nov 2019 22:38:33 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <20191128111542.5132-1-p.debruijn@unilogic.nl>
References: <20191128111542.5132-1-p.debruijn@unilogic.nl>
Message-ID: <20191128223833.702e9baf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu, 28 Nov 2019 12:15:42 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Currently the service is called postgresql, but other filesystem
> references are called pgsql, which is inconsistent and confusing.
>
> Given that at least Debian uses postgresql in the filesystems
> as well I would suggest moving the filesystem reference to align
> with the service name as opposed to the other way around.
>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/postgresql/Config.in          | 2 +-
>  package/postgresql/S50postgresql      | 8 ++++----
>  package/postgresql/postgresql.mk      | 4 ++--
>  package/postgresql/postgresql.service | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index e548d3c..2f677da 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_POSTGRESQL
>  	  database system.
>
>  	  Enable the readline package to gain readline support in
> -	  pgsql (the command line interpreter), which offers
> +	  psql (the command line interpreter), which offers

+1 for fixing this typo (which dates back to my initial submission from 2014)
in a separate patch...

>  	  command history and edit functions.
>
>  	  Enable the zlib package to gain builtin compression for
> diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> index 1ece4fc..8d7ad34 100644
> --- a/package/postgresql/S50postgresql
> +++ b/package/postgresql/S50postgresql
> @@ -5,20 +5,20 @@
>
>  umask 077
>
> -if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
> +if [ ! -f /var/lib/postgresql/PG_VERSION ]; then
>  	echo "Initializing postgresql data base..."
> -	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
> +	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/postgresql'

-1 for this change as /var/lib/pgsql is the suggested/common default location, see e.g. [1],
and is saving 5 characters at many location from the script ;-)

Regards,
Peter

[1] https://www.postgresql.org/docs/12/storage-file-layout.html

>  	echo "done"
>  fi
>
>  start() {
>  	printf "Starting postgresql: "
> -	su - postgres -c '/usr/bin/pg_ctl start -w -D /var/lib/pgsql -l logfile'
> +	su - postgres -c '/usr/bin/pg_ctl start -w -D /var/lib/postgresql -l logfile'
>  	echo "OK"
>  }
>  stop() {
>  	printf "Stopping postgresql: "
> -	su - postgres -c '/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast'
> +	su - postgres -c '/usr/bin/pg_ctl stop -D /var/lib/postgresql -m fast'
>  	echo "OK"
>  }
>  restart() {
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 858cd69..5a4ffe6 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -102,11 +102,11 @@ endif
>  POSTGRESQL_CONF_ENV += CFLAGS="$(POSTGRESQL_CFLAGS)"
>
>  define POSTGRESQL_USERS
> -	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
> +	postgres -1 postgres -1 * /var/lib/postgresql /bin/sh - PostgreSQL Server
>  endef
>
>  define POSTGRESQL_INSTALL_TARGET_FIXUP
> -	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
> +	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/postgresql
>  	$(RM) -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
>  endef
>
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> index 53e6f84..7698558 100644
> --- a/package/postgresql/postgresql.service
> +++ b/package/postgresql/postgresql.service
> @@ -15,10 +15,10 @@ Group=postgres
>  StandardOutput=syslog
>  StandardError=syslog
>  SyslogIdentifier=postgres
> -PIDFile=/var/lib/pgsql/postmaster.pid
> +PIDFile=/var/lib/postgresql/postmaster.pid
>
> -ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> -ExecStart=/usr/bin/postgres -D /var/lib/pgsql
> +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/postgresql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/postgresql; fi"
> +ExecStart=/usr/bin/postgres -D /var/lib/postgresql
>  ExecReload=/usr/bin/kill -HUP $MAINPID
>  KillMode=mixed
>  KillSignal=SIGINT
