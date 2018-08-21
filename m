From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2018 23:47:40 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: change systemd service type
 to notify
In-Reply-To: <20180629183101.9705-1-joseph.kogut@gmail.com>
References: <20180629183101.9705-1-joseph.kogut@gmail.com>
Message-ID: <20180821214740.GQ15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2018-06-29 11:31 -0700, Joseph Kogut spake thusly:
> During activation, pg_ctl uses exec to start the db server, which causes
> the service to never finish activating when Type=forking. Upstream
> recommends configuring --with-systemd and using Type=notify.
> 
> https://www.postgresql.org/docs/10/static/server-start.html
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

As I said on IRC, this should be actually two patches:

  - the first to add the missing conditional code in the .mk;

  - the second to change the type of the unit file.

But see below for an actual question...

> ---
>  package/postgresql/postgresql.mk      |  8 ++++++++
>  package/postgresql/postgresql.service | 12 ++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 94b3e60e59..70c667dc0e 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -70,6 +70,14 @@ else
>  POSTGRESQL_CONF_OPTS += --without-ldap
>  endif
>  
> +# required for postgresql.service Type=notify
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +POSTGRESQL_DEPENDENCIES += systemd

Is it a build-time dependency at all, or is it needed only at runtime?

Regards,
Yann E. MORIN.

> +POSTGRESQL_CONF_OPTS += --with-systemd
> +else
> +POSTGRESQL_CONF_OPTS += --without-systemd
> +endif
> +
>  define POSTGRESQL_USERS
>  	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
>  endef
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> index 4a96258684..53e6f84f00 100644
> --- a/package/postgresql/postgresql.service
> +++ b/package/postgresql/postgresql.service
> @@ -3,7 +3,7 @@ Description=PostgreSQL database server
>  After=network.target
>  
>  [Service]
> -Type=forking
> +Type=notify
>  
>  # start timeout disabled because initdb may run a little
>  # longer (eg. 5 minutes on RaspberryPi)
> @@ -12,13 +12,17 @@ TimeoutStartSec=0
>  User=postgres
>  Group=postgres
>  
> +StandardOutput=syslog
> +StandardError=syslog
>  SyslogIdentifier=postgres
>  PIDFile=/var/lib/pgsql/postmaster.pid
>  
>  ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> -ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
> -ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
> -ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
> +ExecStart=/usr/bin/postgres -D /var/lib/pgsql
> +ExecReload=/usr/bin/kill -HUP $MAINPID
> +KillMode=mixed
> +KillSignal=SIGINT
> +TimeoutSec=0
>  
>  [Install]
>  WantedBy=multi-user.target
> -- 
> 2.18.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
