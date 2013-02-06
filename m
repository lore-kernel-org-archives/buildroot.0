From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 20:00:10 +0100
Subject: [Buildroot] [PATCH 4/7] package/libedit2: new package
In-Reply-To: <5110390A.1040708@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <d4a01f43840a933d1829c6e453378c995be77f4e.1359993560.git.yann.morin.1998@free.fr>
 <5110390A.1040708@mind.be>
Message-ID: <201302062000.10836.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Monday 04 February 2013 Arnout Vandecappelle wrote:
> On 04/02/13 17:01, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >   package/Config.in                                  |    1 +
> >   package/libedit2/Config.in                         |    9 +++
> >   package/libedit2/libedit2-01-Makefile.patch        |   25 +++++++
> >   package/libedit2/libedit2-02-el.c-issetugid.patch  |   24 ++++++
> >   package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch |   40 +++++++++++
> >   .../libedit2/libedit2-04-readline.h-stdio.patch    |   17 +++++
> >   .../libedit2/libedit2-08-readline-history.h.patch  |   20 +++++
> >   .../libedit2/libedit2-10-define_SIZE_T_MAX.patch   |   18 +++++
> >   .../libedit2/libedit2-12-libedit-Makefile.patch    |   54 ++++++++++++++
> >   package/libedit2/libedit2-20-fortify.patch         |   23 ++++++
> 
>   Any chance of using libedit_2.11-20080614-5.debian.tar.bz2 instead?

Hey! ;-)
Yes, I'll look at it.

> > diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
> > new file mode 100644
> > index 0000000..b9ca41e
> > --- /dev/null
> > +++ b/package/libedit2/libedit2.mk
[--SNIP--]
> > +define POST_PATCH_PERMISSIONS
>   Start the name with LIBEDIT2

Done.

> > +	chmod +x $(@D)/libedit/makelist
> > +endef
> > +
> > +LIBEDIT2_POST_PATCH_HOOKS += POST_PATCH_PERMISSIONS
> > +
> > +define LIBEDIT2_FIX_VIS_H_INCLUDE
> > +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/filecomplete.c
> 
>   If you use s,foo,bar, instead of s/foo/bar/ you don't need to quote /. 

Granted. I usualy do not do that, as I sometime have paths that do contain
commas, and would broke anyway, so I always explicitly quote '/'.

> Also, the ; is redundant.

I like it that all my sed expressions are properly terminated, even if
it is not mandatory. It is very annoying to me that, when there are two
or more expressions, they are all terminated, save for the last one...

> > +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/history.c
> > +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/readline.c
>   Three times the same sed rule => just apply once to all files.

Done.

> > +endef
> > +LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
> > +
> > +LIBEDIT2_PMAKE_ARGS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
>   We normally use _OPTS, not _ARGS.  (There is TARGET_CONFIGURE_ARGS but 
> it's just plain wrong.)

OK, although I disagree. Those are really 'arguments' to the command (as
we have when we declare in C: "main( int argc, char** argv )" ). But OK,
I'll change to keep in sync with the Buildroot naming scheme. ;-)

> > +                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \
>   Redundant trailing \.

Yep.

[--SNIP--]
> > +# $1: DESTDIR to install into
> > +# Can't use pmake to install, it wants to be root. sigh... :-(
> > +define LIBEDIT2_INSTALL_CMDS
> > +	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
> > +	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
> > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
> > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
> > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
> > +	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
> > +	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)
>   This doesn't seem right: LIBEDIT2_VERSION is 2.11-20080614, but you 
> just installed 2.11...

Hmmm... Lemme check...

> > +	ln -sf libedit.so.$(LIBEDIT2_VERSION_MAJOR) $(1)/usr/lib/libedit.so
> > +	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
> > +	if [ "$(BR2_HAVE_DOCUMENTATION)" = "y" ]; then                                              \
>   This condition is redundant, because the finalize step will remove man 
> anyway if !BR2_HAVE_DOCUMENTATION.

OK.

> > +	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el; \
> > +	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.3 $(1)/usr/share/man/man5/editrc.5el;     \
> > +	    for lnk in $(LIBEDIT2_MAN_LINKS); do                                                    \
> > +	        ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;                           \
> > +	    done;                                                                                   \
> > +	fi
> > +endef
>   A perfect candidate to use the unified TARGET/STAGING install commands!

But for now, we do not have this option. ;-)

> > +#	cd $(@D)/libedit; pmake install incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)
> > +#	cd $(@D)/libedit/readline; pmake incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)
>   Redundant comments.

Yep, Thomas already mentionned it, but I forgot to remove them. Sorry.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
