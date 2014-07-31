From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Aug 2014 00:13:58 +0200
Subject: [Buildroot] [PATCH v2] postgresql: add systemd service file
In-Reply-To: <20140611223342.6d8f9291@free-electrons.com>
References: <1400620611-7625-1-git-send-email-ps.report@gmx.net>
 <20140611223342.6d8f9291@free-electrons.com>
Message-ID: <20140801001358.7ebe331b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

Another ping about this patch :-)

Thanks,

Thomas

On Wed, 11 Jun 2014 22:33:42 +0200, Thomas Petazzoni wrote:
> Eric,
> 
> As our systemd person, could you review this patch, and give your
> comments and/or Acked-by/Reviewed-by as appropriate?
> 
> Thanks,
> 
> Thomas
> 
> On Tue, 20 May 2014 23:16:51 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - add '-w' (wait) to pg_ctl start command (to ensure pid
> >     file generation)
> > ---
> >  package/postgresql/postgresql.mk      |  8 ++++++++
> >  package/postgresql/postgresql.service | 24 ++++++++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 package/postgresql/postgresql.service
> > 
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > index b331737..cf4700a 100644
> > --- a/package/postgresql/postgresql.mk
> > +++ b/package/postgresql/postgresql.mk
> > @@ -58,4 +58,12 @@ define POSTGRESQL_INSTALL_INIT_SYSV
> >  		$(TARGET_DIR)/etc/init.d/S50postgresql
> >  endef
> >  
> > +define POSTGRESQL_INSTALL_INIT_SYSTEMD
> > +        $(INSTALL) -D -m 644 package/postgresql/postgresql.service \
> > +                $(TARGET_DIR)/etc/systemd/system/postgresql.service
> > +        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +        ln -fs ../postgresql.service \
> > +                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
> > +endef
> > +
> >  $(eval $(autotools-package))
> > diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> > new file mode 100644
> > index 0000000..4a96258
> > --- /dev/null
> > +++ b/package/postgresql/postgresql.service
> > @@ -0,0 +1,24 @@
> > +[Unit]
> > +Description=PostgreSQL database server
> > +After=network.target
> > +
> > +[Service]
> > +Type=forking
> > +
> > +# start timeout disabled because initdb may run a little
> > +# longer (eg. 5 minutes on RaspberryPi)
> > +TimeoutStartSec=0
> > +
> > +User=postgres
> > +Group=postgres
> > +
> > +SyslogIdentifier=postgres
> > +PIDFile=/var/lib/pgsql/postmaster.pid
> > +
> > +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> > +ExecStart=/usr/bin/pg_ctl start -D /var/lib/pgsql -w -l /var/lib/pgsql/logfile
> > +ExecReload=/usr/bin/pg_ctl reload -D /var/lib/pgsql
> > +ExecStop=/usr/bin/pg_ctl stop -D /var/lib/pgsql -m fast
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> 
> 
> 



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
