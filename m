From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:16:12 +0100
Subject: [Buildroot] [PATCH v2] postgresql: new package
In-Reply-To: <20140329115755.33e90c5b@skate>
References: <1395182160-26138-1-git-send-email-ps.report@gmx.net>
 <20140329115755.33e90c5b@skate>
Message-ID: <20140329111612.GC3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2014-03-29 11:57 +0100, Thomas Petazzoni spake thusly:
> On Tue, 18 Mar 2014 23:36:00 +0100, Peter Seiderer wrote:
> > Based on suggested new package by Marco Trapanese ([1]).
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[--SNIP--]
> > +define POSTGRESQL_USERS
> > +	postgres -1 postgres -1 * /srv/pgsql/data /bin/sh postgres PostgreSQL Server
                                                          ^^^^^^^^
Do not add its own group to the additionnal groups, just set it to '-'.

> > +endef
> 
> Is /srv a normal location for databases? Isn't /var used in general?
> 
> > +
> > +define POSTGRESQL_INSTALL_TARGET_FIXUP
> > +	$(INSTALL) -v -dm700 $(TARGET_DIR)/srv/pgsql/data
> 
> -v seems useless.
> 
> Also, is there something that ensures that the /srv/pgsql/data
> directory is owned by the postgres user and group, instead of the
> default root user?

Yes, the mkuser script does chown the homes to the uid:gid of the user:
the output of mkuser is put in the fakeroot script, and mkuser does:

    if [ "${home}" != "-" ]; then
        mkdir -p "${TARGET_DIR}/${home}"
        printf "chown -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
    fi

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
