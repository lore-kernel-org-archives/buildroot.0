From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Nov 2019 10:22:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/postgresql: enable data
 checksums by default for initdb
In-Reply-To: <20191121101552.6845-1-p.debruijn@unilogic.nl>
References: <20191121101552.6845-1-p.debruijn@unilogic.nl>
Message-ID: <20191125102221.14f54a75@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu, 21 Nov 2019 11:15:52 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
>
> This makes PostgreSQL as robust as possible by default
>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/postgresql/S50postgresql      | 2 +-
>  package/postgresql/postgresql.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> index 3c0c520..ce72e12 100644
> --- a/package/postgresql/S50postgresql
> +++ b/package/postgresql/S50postgresql
> @@ -7,7 +7,7 @@ umask 077
>
>  if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
>  	echo "Initializing postgresql data base..."
> -	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8'
> +	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8 -o --data-checksums'

Thanks for the patch, but I believe buildroot is about providing a very
basic/minimum setup as starting point customized projects and the
postgresql documentation states ([1]):

	 Enabling checksums may incur a noticeable performance penalty.

And I think not everyone (specially for embedded projects) will accept this
performance vs. data security tradeoff..., same applies to your
locale/en_US.UTF-8 suggestion (not everyone will be happy/use en_US and I
hope no one will run a non-customized production project)...

Regards,
Peter

[1] https://www.postgresql.org/docs/12/app-initdb.html

>  	echo "done"
>  fi
>
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> index 4bbe742..2f5d2a9 100644
> --- a/package/postgresql/postgresql.service
> +++ b/package/postgresql/postgresql.service
> @@ -17,7 +17,7 @@ StandardError=syslog
>  SyslogIdentifier=postgres
>  PIDFile=/var/lib/pgsql/postmaster.pid
>
> -ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8; fi"
> +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=en_US.UTF-8 -o --data-checksums; fi"
>  ExecStart=/usr/bin/postgres -D /var/lib/pgsql
>  ExecReload=/usr/bin/kill -HUP $MAINPID
>  KillMode=mixed
