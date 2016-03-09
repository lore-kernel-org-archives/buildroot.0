From: Alan Yaniger <alan@tkos.co.il>
Date: Wed, 9 Mar 2016 11:21:49 +0200
Subject: [Buildroot] [PATCH 1/2] Set PGROOT dir owner to be "postgres".
In-Reply-To: <20160307092908.6334a90b@free-electrons.com>
References: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
 <20160307045142.GM2877@tarshish>
 <20160307092908.6334a90b@free-electrons.com>
Message-ID: <20160309092148.GC14938@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I see what my error was. I installed the rootfs on my SSD by copying
it from a partition on a USB-disk which I had mounted. Then I ran "cp"
to copy from the mounted partition to the SSD, and I forgot to use the -p
option to preserve attributes. When I installed after the "fix", I used "tar" to
install, which preserved the ownership.

I changed the state of the patch to "Rejected" in Patchwork.

Alan

On 07/03/16 09:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 7 Mar 2016 06:51:42 +0200, Baruch Siach wrote:
> 
> > On Sun, Mar 06, 2016 at 10:29:09PM +0200, Alan Yaniger wrote:
> > > Without setting the owner of /var/lib/pgsql to the user "postgres", 
> > > the postgres server fails to start on boot.
> > > 
> > > Signed-off-by: Alan Yaniger <alan@tkos.co.il>
> > > ---
> > >  package/postgresql/postgresql.mk | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > > index 444c1b1..5906ce9 100644
> > > --- a/package/postgresql/postgresql.mk
> > > +++ b/package/postgresql/postgresql.mk
> > > @@ -17,6 +17,10 @@ POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
> > >  POSTGRESQL_AUTORECONF = YES
> > >  POSTGRESQL_CONF_OPTS = --disable-rpath
> > >  
> > > +define POSTGRESQL_PERMISSIONS
> > > +	/var/lib/pgsql d 755 postgres postgres - - - - -
> > > +endef
> > 
> > A better place for this IMO would be near POSTGRESQL_USERS below.
> 
> Well, there is already a POSTGRESQL_USERS:
> 
> define POSTGRESQL_USERS
>         postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
> endef
> 
> And this should already create /var/lib/pgsql, owned by the
> postgres:postgres user.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Alan Yaniger
Tk Open Systems, Ltd
Telephone: 0546-841-481
Skype: alanyaniger
http://tkos.co.il
