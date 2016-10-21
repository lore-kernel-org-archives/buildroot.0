From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 22 Oct 2016 00:39:45 +0200
Subject: [Buildroot] [PATCH 2/2] postgresql: enable ldap support for
 pg_service.conf
In-Reply-To: <ed73fb23-f2f2-caaa-1387-4a867d85d5f6@mind.be>
References: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
 <1476893310-25852-2-git-send-email-cdf123@cdf123.net>
 <ed73fb23-f2f2-caaa-1387-4a867d85d5f6@mind.be>
Message-ID: <20161022003945.76d546ce@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Chris,

On Fri, 21 Oct 2016 21:14:16 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 19-10-16 18:08, Chris Frederick wrote:
> > Just needed to add --with-ldap to POSTGRESQL_CONF_OPTS and add openldap
> > to POSTGRESQL_DEPENDENCIES when BR2_PACKAGE_OPENLDAP is on
> > 
> > Signed-off-by: Chris Frederick <cdf123@cdf123.net>
> > ---
> >  package/postgresql/postgresql.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > index 7179bbe..ab615d0 100644
> > --- a/package/postgresql/postgresql.mk
> > +++ b/package/postgresql/postgresql.mk
> > @@ -57,6 +57,11 @@ POSTGRESQL_DEPENDENCIES += openssl
> >  POSTGRESQL_CONF_OPTS += --with-openssl
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> > +POSTGRESQL_DEPENDENCIES += openldap
> > +POSTGRESQL_CONF_OPTS += --with-ldap
> 
>  Same here: add --without-ldap.

Not needed for this option (as with openssl), because there is no
auto detection in case the option is not given (as opposed to the
readline and zlib options), see [1] for discussion of this...

Should have added a comment about this back in 2014...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2014-March/093215.html

> 
>  Regards,
>  Arnout
> 
> > +endif
> > +
> >  define POSTGRESQL_USERS
> >  	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
> >  endef
> > 
> 
