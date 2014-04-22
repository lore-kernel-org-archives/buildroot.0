From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Apr 2014 18:41:08 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add host-zic dependency
In-Reply-To: <20140422175244.5efaa18d@skate>
References: <1398181285-4260-1-git-send-email-ps.report@gmx.net>
 <20140422175244.5efaa18d@skate>
Message-ID: <20140422164108.GA3601@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-22 17:52 +0200, Thomas Petazzoni spake thusly:
> Dear Peter Seiderer,
> 
> On Tue, 22 Apr 2014 17:41:25 +0200, Peter Seiderer wrote:
> 
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > index 11b167a..2606e25 100644
> > --- a/package/postgresql/postgresql.mk
> > +++ b/package/postgresql/postgresql.mk
> > @@ -29,6 +29,9 @@ endif
> >  ifeq ($(BR2_PACKAGE_TZDATA),y)
> >  	POSTGRESQL_DEPENDENCIES += tzdata
> >  	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
> > +else
> > +	POSTGRESQL_DEPENDENCIES += host-zic
> > +	POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
> >  endif
> 
> I'm not entirely sure to understand how this works. If
> BR2_PACKAGE_TZDATA is not enabled, where will host-zic find the
> time-zone informations?

host-zin only builds the 'zic' program, which pacakge can access using
$(ZIC), so host-zip (our package) does not need the tz-data itslef.

But postgresql needs the time zone info. It can use either the system
ones, or it has a limited set bundled in its source tree, in:
    postgresql-9.3.3/src/timezone/data/

That's what the error message hints at:

    When cross-compiling, either use the option --with-system-tzdata to use
    existing time-zone data, or set the environment variable ZIC to a zic
    program to use during the build.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
