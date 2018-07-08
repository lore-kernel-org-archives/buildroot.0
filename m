From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 14:34:12 +0200
Subject: [Buildroot] [PATCH 48/50 v2] package/busybox: invert dependency
 with bash
In-Reply-To: <dd401801-1967-ac20-b714-94139cbe47bf@mind.be>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <d7be2552df2b3ee3f2bd1ffc79f9980f1cb6b2b4.1531043163.git.yann.morin.1998@free.fr>
 <dd401801-1967-ac20-b714-94139cbe47bf@mind.be>
Message-ID: <20180708123412.GE2474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-07-08 13:06 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-18 11:46, Yann E. MORIN wrote:
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  package/bash/bash.mk       | 4 +---
> >  package/busybox/busybox.mk | 1 +
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> > index bb52bf3259..7fb7192e2c 100644
> > --- a/package/bash/bash.mk
> > +++ b/package/bash/bash.mk
> > @@ -6,9 +6,7 @@
> >  
> >  BASH_VERSION = 4.4.18
> >  BASH_SITE = $(BR2_GNU_MIRROR)/bash
> > -# Build after since bash is better than busybox shells
> > -BASH_DEPENDENCIES = ncurses readline host-bison \
> > -	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> > +BASH_DEPENDENCIES = ncurses readline host-bison
> >  BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
> >  BASH_LICENSE = GPL-3.0+
> >  BASH_LICENSE_FILES = COPYING
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index 75a2dc4c6d..0a9af9f17b 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
> >  
> >  # Packages that provide commands that may also be busybox applets:
> >  BUSYBOX_DEPENDENCIES = \
> > +	$(if $(BR2_PACKAGE_BASH),bash) \
> 
>  Actually, which applet does busybox have that bash also provides? The shell,
> obviously, but that's handled by the BR2_SYSTEM_BIN_SH choice...

That dependency has existed for, like, ages now:

    commit 3d7a187f7690d3d42f59f933f5d4aa32c096b7b4
    Author: Eric Andersen <andersen@codepoet.org>
    Date:   Mon Dec 27 21:46:32 2004 +0000

        If both bash and busybox are selected, make certain bash wins
        the fight over who gets to own the /bin/sh symlink
         -Erik
    ---
     package/bash/bash.mk | 6 ++++++
     1 file changed, 6 insertions(+)

But then this series was meant to be more mechanical than not, i.e. just
invert the dependencies without thinking too much about the rationale
behind the dependency. I guess it can safely been dropped now...

Regards,
Yann E. MORIN.

>  I'm going to apply this patch anyway, but it's something to think about.
> 
>  Regards,
>  Arnout
> 
> 
> >  	$(if $(BR2_PACKAGE_BC),bc) \
> >  	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
> >  	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
