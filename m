From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Nov 2019 09:56:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/postgresql: explicitly use
 en_US.UTF-8 locale for initdb
In-Reply-To: <20191121101538.6788-1-p.debruijn@unilogic.nl>
References: <20191121101538.6788-1-p.debruijn@unilogic.nl>
Message-ID: <20191125095653.108d4925@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu, 21 Nov 2019 11:15:38 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
>
> postgres[290]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
> postgres[290]: pg_ctl: database system initialization failed

Thanks for the patch, but tested with raspberrypi3_64_defconfig (and changed to
glibc), my output is:

[...]
The database cluster will be initialized with locale "C".
The default database encoding has accordingly been set to "SQL_ASCII".
The default text search configuration will be set to "english".
[...]
performing post-bootstrap initialization ... sh: locale: not found
1970-01-01 00:00:16.233 UTC [206] WARNING:  no usable system locales were found
ok
[...]
Success. You can now start the database server using:
[...]

No need for an (additional) locale with my setup (and the warning is, after
a quick look at the source code postgresql-12.1/src/backend/commands/collationcmds.c,
about the missing locale command on the target, nothing your patch can fix)...

Can you provide your failing defconfig file?

Regards,
Peter

>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/postgresql/Config.in          | 2 ++
>  package/postgresql/S50postgresql      | 2 +-
>  package/postgresql/postgresql.service | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index e548d3c..e912249 100644
> --- a/package/postgresql/Config.in./host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/locale
> +++ b/package/postgresql/Config.in
> @@ -17,6 +17,8 @@ config BR2_PACKAGE_POSTGRESQL
>  	  Enable the zlib package to gain builtin compression for
>  	  archives with pg_dump and pg_restore.
>
> +	  NOTE: PostgreSQL needs a working en_US.UTF-8 locale (BR2_GENERATE_LOCALE)
> +
>  	  http://www.postgresql.org
>
>  comment "postgresql needs a toolchain w/ dynamic library, wchar"
> diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> index 1ece4fc..3c0c520 100644
> --- a/package/postgresql/S50postgresql
> +++ b/package/postgresql/S50postgresql
> @@ -7,7 +7,7 @@ umask 077
>
>  if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
>  	echo "Initializing postgresql data base..."
> -	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
> +	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8'
>  	echo "done"
>  fi
>
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> index 53e6f84..4bbe742 100644
> --- a/package/postgresql/postgresql.service
> +++ b/package/postgresql/postgresql.service
> @@ -17,7 +17,7 @@ StandardError=syslog
>  SyslogIdentifier=postgres
>  PIDFile=/var/lib/pgsql/postmaster.pid
>
> -ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8; fi"
>  ExecStart=/usr/bin/postgres -D /var/lib/pgsql
>  ExecReload=/usr/bin/kill -HUP $MAINPID
>  KillMode=mixed
