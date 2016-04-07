From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Thu, 7 Apr 2016 12:03:46 +0000
Subject: [Buildroot] [PATCH v4 3/3] package/radlib: reworked autotools
 with pkg-config
In-Reply-To: <57058F7C.7000708@mind.be>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-4-git-send-email-ray.kinsella@intel.com>
 <57058F7C.7000708@mind.be>
Message-ID: <1460030625.3176.22.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-04-07 at 00:36 +0200, Arnout Vandecappelle wrote:
> Do this in three separate patches: one that sets subdir-objects, one
> that adds 
> pkg-config, and one that adds mysql-config.

Ok then, use a hook for the rename. 

Might make more sense to do one patch for pkg-config with subdir
-objects, because these are linked - which subdir objects you get
depends on pkg-config?

And then another patch for mysql-config. So two patches?

> 
> > +-AC_ARG_ENABLE(mysql,
> > +-[  --enable-mysql                 include radlib MySQL database
> > support],
> 
>   Why would you remove this? An enable option is as good as a with
> option.

The original feedback I got was that the autotools implementation for
radlib was hopelessly screwed up. I was trying to strike a balance
between limiting changes but improving the overall flows. 

I used with 'with' instead of 'enable' because of the semantics ...

If a package _must_ be available on the platform for it available to
choose then 'with' makes more sense than 'enable'. Radlib supports more
than one back end so selecting a backend by indicating 'with' made more
sense to me. 'enable' is typically for features whereas 'with', is
typically used to indicate building 'with' a given package. 

That said I am agnoistic, I am happy to revert to AC_ARG_ENABLE to
reduce the patch. 

> 
> > +-[case "${enableval}" in
> > +-  yes) mysql=true ;;
> > +-  no)  mysql=false ;;
> > +-  *) mysql=false ;;
> > +-esac],[mysql=false])
> 
>   So you keep the above, and here just add
> 
> if test x"$mysql" = xtrue; then
>    AC_PATH_PROG(...)
>    if test "x$MYSQL_CONFIG" != "x"; then
>      ...
>    else
>      mysql=false
>    fi
> fi
> 
> (indentation in this file seems to be with two spaces instead of
> tabs).

np, will fix. 

> 
>   And of course the same story for pg.

ok.

> > +-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
> 
>   Keep this, there is no reason to replace it by HAVE_MYSQL.

Ok - I am pretty sure I got feedback to change these conditionals to
HAVE_, but no problem I can fix. 


> > + # define include directories
> > +-INCLUDES = \
> > ++AM_CFLAGS = \
> 
>   Why does this need to be changed?

I will investigate ...
The original INCLUDES was pulling in host directories. 
Not sure why the switch to AM_CFLAGS

> 
> > + 		-I$(top_srcdir)/h \
> > + 		-D_GNU_SOURCE
> > +
> 
>   Did you forget to add $(SQLITE3_CFLAGS) etc?

nope, no special include is needed for SQLITE.


>   Removing the CROSSCOMPILE part should be a separate patch.

ok

> 
> > ++raddebug_LDFLAGS = -L../src/.libs \
> > ++		$(SQLITE3_LIBS) \
> > ++		$(MYSQL_LIBS) \
> > ++		$(POSTGRESQL_LIBS)
> > +diff --git a/msgRouter/Makefile.am b/msgRouter/Makefile.am
> [snip]
> 
>   Same here.
> 
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> [snip]
> 
>   Same here.
> 
> 
> 
>   Regards,
>   Arnout
> 
