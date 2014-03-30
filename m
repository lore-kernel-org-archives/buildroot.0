From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 31 Mar 2014 01:34:03 +0200
Subject: [Buildroot] [PATCH v2] postgresql: new package
In-Reply-To: <20140331001355.7ff9e033@skate>
References: <trinity-c87c01cc-1c84-4994-8cbf-a9d3e9175317-1396216441410@3capp-gmx-bs13>, 
 <20140331001355.7ff9e033@skate>
Message-ID: <trinity-60af99f7-7ecb-48f1-81c6-a7e54c7cce3c-1396222443310@3capp-gmx-bs41>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 31. M?rz 2014 um 00:13 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: *** GMX Spamverdacht *** Re: [Buildroot] [PATCH v2] postgresql: new package
>
> Dear Peter Seiderer,
> 
> On Sun, 30 Mar 2014 23:54:01 +0200, Peter Seiderer wrote:
> 
> > > regc_pg_locale.c: In function ?pg_wc_tolower?:
> > > regc_pg_locale.c:658:12: error: dereferencing pointer to incomplete type
> > > regc_pg_locale.c:658:12: error: dereferencing pointer to incomplete type
> > > make[4]: *** [regcomp.o] Erreur 1
> > > make[4]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/postgresql-9.3.3/src/backend/regex ?
> > > 
> > 
> > o.k. I will take a look at it...

Stripped the problem down to this programm:

--- begin: test.c ---
#include <locale.h>
#include <ctype.h>

int f(int c, locale_t l) {
        return isdigit_l(c, l);
}
--- end ---

With (x86_64 on OpenSuse) I get no problem:
gcc -Wall  -D_GNU_SOURCE -c test.c

With the buildroot toolchain:
./host/usr/bin/arm-linux-gcc -Wall -D_GNU_SOURCE -c test.c 
test.c: In function ?f?:
test.c:5:9: error: dereferencing pointer to incomplete type
test.c:6:1: warning: control reaches end of non-void function [-Wreturn-type]

> 
> Thanks!
> 
> > > > +config BR2_PACKAGE_POSTGRESQL
> > > > +   bool "PostgreSQL"
> > > 
> > > should be lower-case.
> > 
> > mhh, did take a look at package/mysql/Config.in: bool "MySQL" and did the same, use the
> > offical name which emphasises the SQL..., but I can change this if lower-case Menu entries
> > are an requirement?
> 
> Yeah, MySQL has been around for a long time, but I have the impression
> that our policy is to use lower-case menu entries everywhere. I don't
> know how hard this rule is, though, so let's see if others share their
> opinion about this. This is clearly not a very important matter.
> 
> > > Also, there are many, many more configuration options. You don't have
> > > to support all of them for a first submission, but if you don't support
> > > a given feature, you should pass --without-<foo> for it so that the
> > > configure script doesn't mistakenly detect a library from the host. So
> > > for example: --without-pam --without-python --without-perl, etc.
> > > 
> > > I see that you're making readline and zlib mandatory dependencies, but
> > > they are not: the package has --without-readline and --without-zlib
> > > options. So instead of mandatory dependencies, you should use:
> > > 
> > > ifeq ($(BR2_PACKAGE_READLINE),y)
> > > POSTGRESQL_CONF_OPT += --with-readline
> > > POSTGRESQL_DEPENDENDENCIES += readline
> > > else
> > > POSTGRESQL_CONF_OPT += --without-readline
> > > endif
> > > 
> > 
> > Did follow the PostgreSQL INSTALL hints stating:
> > 
> >      * The GNU Readline library is used by default. It allows psql (the
> >        PostgreSQL command line SQL interpreter) to remember each command
> >        you type, and allows you to use arrow keys to recall and edit
> >        previous commands. This is very helpful and is strongly
> >        recommended. If you don't want to use it then you must specify the
> >        "--without-readline" option to "configure". As an alternative, you
> >        can often use the BSD-licensed "libedit" library, originally
> >        developed on NetBSD. The "libedit" library is GNU
> >        Readline-compatible and is used if "libreadline" is not found, or
> >        if "--with-libedit-preferred" is used as an option to "configure".
> >        If you are using a package-based Linux distribution, be aware that
> >        you need both the readline and readline-devel packages, if those
> > 
> > and made the default enabled packages mandatory...
> 
> I understand what the PostgreSQL guys say, but this statement is from
> the perspective of a developer who is using the command line pgsql
> tool. On an embedded system, except during development, there is not
> really a need to use pgsql interactively. And even during development,
> you can connect to the embedded PostgreSQL server using a remotely
> executed pgsql binary.
> 
> So I would make the dependency optional, and then in the main Config.in
> option, in the help text, add something like:
> 
> 	  Enable the readline package to gain readline support in
> 	  pgsql, which offers a much nicer user experience.

o.k. will do...

> 
> > The same for zlib:
> > 
> >      * The zlib compression library is used by default. If you don't want
> >        to use it then you must specify the "--without-zlib" option to
> >        "configure". Using this option disables support for compressed
> >        archives in pg_dump and pg_restore.
> > 
> > But I can make readline/zlib optional (with some comment in the
> > Config.in file)?
> 
> Yes, that would be nice I believe.
> 
> > All other features/packages are optional (and disabled as the INSTALL file
> > states):
> > 
> >    The following packages are optional. They are not required in the
> >    default configuration, but they are needed when certain build options
> >    are enabled, as explained below:
> > 
> > So I think there is no need to disable them explicitly?
> 
> See what I explained in my previous reply:
> 
> """
> You don't have to support all of them for a first submission, but if
> you don't support a given feature, you should pass --without-<foo> for
> it so that the configure script doesn't mistakenly detect a library
> from the host.
> """
> 
> Or none of these options are auto-detected, and it's only if a
> --with-<something> or --enable-<something> option is passed that the
> configure script starts looking around to see if the necessary
> dependencies are available or not?
> 

o.k, all of these options have no autodetectino (when I read the statements
in configure.in right)...

> > > > +define POSTGRESQL_USERS
> > > > +   postgres -1 postgres -1 * /srv/pgsql/data /bin/sh postgres PostgreSQL Server
> > > > +endef
> > > 
> > > Is /srv a normal location for databases? Isn't /var used in general?
> > 
> > o.k, will change...
> 
> This really was a question. I have no idea what we prefer to use in
> Buildroot. For example, have you looked where our mysql package puts
> its database stuff?

Your where right with the question, the Linux standard for this is
under /var/lib as given in the LinuxStandardBase/FilesystemHierarchyStandard ([1]):

    var/lib: State information. Persistent data modified by programs as they run, e.g., databases, packaging system metadata, etc.

[1] http://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

Peter

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
