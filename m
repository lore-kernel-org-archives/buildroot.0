From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 17:29:55 +0200
Subject: [Buildroot] [PATCH v2] postgresql: add systemd service file
In-Reply-To: <1400620611-7625-1-git-send-email-ps.report@gmx.net>
References: <1400620611-7625-1-git-send-email-ps.report@gmx.net>
Message-ID: <543A9E73.3030206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/14 23:16, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Looks good. It has two things that aren't present in the sysvinit start script,
though:

- the -w option mentioned below;

- the Reload option (sysvinit just restarts).

 But both are a good idea.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - add '-w' (wait) to pg_ctl start command (to ensure pid
>     file generation)
> ---
>  package/postgresql/postgresql.mk      |  8 ++++++++
>  package/postgresql/postgresql.service | 24 ++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/postgresql/postgresql.service
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index b331737..cf4700a 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -58,4 +58,12 @@ define POSTGRESQL_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S50postgresql
>  endef
>  
> +define POSTGRESQL_INSTALL_INIT_SYSTEMD
> +        $(INSTALL) -D -m 644 package/postgresql/postgresql.service \
> +                $(TARGET_DIR)/etc/systemd/system/postgresql.service
> +        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +        ln -fs ../postgresql.service \
> +                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> new file mode 100644
> index 0000000..4a96258
> --- /dev/null
> +++ b/package/postgresql/postgresql.service
> @@ -0,0 +1,24 @@
> +[Unit]
> +Description=PostgreSQL database server
> +After=network.target
> +
> +[Service]
> +Type=forking
> +
> +# start timeout disabled because initdb may run a little
> +# longer (eg. 5 minutes on RaspberryPi)
> +TimeoutStartSec=0
> +
> +User=postgres
> +Group=postgres
> +
> +SyslogIdentifier=postgres
> +PIDFile=/var/lib/pgsql/postmaster.pid
> +
> +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> +ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
> +ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
> +ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
> +
> +[Install]
> +WantedBy=multi-user.target
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
