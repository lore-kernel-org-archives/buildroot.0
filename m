From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 15:40:42 +0200
Subject: [Buildroot] [PATCH 23/30] package/matchbox: drop useless
 dependencies
In-Reply-To: <5543E904.5010600@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <0f88fac02eba1f18605db80731bfb130d00721cb.1429725549.git.yann.morin.1998@free.fr>
 <5543E50C.2080602@mind.be> <5543E904.5010600@mind.be>
Message-ID: <20150502134042.GD13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 22:58 +0200, Arnout Vandecappelle spake thusly:
> On 01/05/15 22:41, Arnout Vandecappelle wrote:
> > On 22/04/15 20:09, Yann E. MORIN wrote:
> >> xlib-libXft is only needed when building a 'standalone' matchbox, which
> >> means not using matchbox-lib.
> >>
> >> But we *are* building matchbox-lib, and we do not support the standalone
> >> mode (and probably won't, as even upstream says it is ugly, by lack of
> >> theming).
> >>
> >> Similarly, xlib-libXext is only used for its 'xsync' extension, for
> >> which support is entirely commented-out in matchbox.
> >>
> >> So, drop the dependency on xlib-libXft, and make it explicit we're not
> >> building either standalone modes; drop xlib-libXext.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> ---
> >>  package/matchbox/Config.in   | 1 -
> >>  package/matchbox/matchbox.mk | 6 +++++-
> >>  2 files changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> >> index 9d8d060..fa186e9 100644
> >> --- a/package/matchbox/Config.in
> >> +++ b/package/matchbox/Config.in
> >> @@ -4,7 +4,6 @@ menuconfig BR2_PACKAGE_MATCHBOX
> >>  	depends on BR2_USE_MMU # fork()
> >>  	select BR2_PACKAGE_FONTCONFIG
> >>  	select BR2_PACKAGE_EXPAT
> >> -	select BR2_PACKAGE_XLIB_LIBXEXT
> >>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
> >>  	select BR2_PACKAGE_MATCHBOX_LIB
> >>  	help
> >> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> >> index 4ec3fb5..bce9520 100644
> >> --- a/package/matchbox/matchbox.mk
> >> +++ b/package/matchbox/matchbox.mk
> >> @@ -11,7 +11,11 @@ MATCHBOX_LICENSE = GPLv2+
> >>  MATCHBOX_LICENSE_FILES = COPYING
> >>  
> >>  MATCHBOX_DEPENDENCIES = matchbox-lib
> >> -MATCHBOX_CONF_OPTS = --enable-expat --disable-composite
> >> +MATCHBOX_CONF_OPTS = \
> >> +	--enable-expat \
> >> +	--disable-composite \
> >> +	--disable-standalone \
> >> +	--disable-standalone-xft
> > 
> >  So, is the dependency on xlib_libXft a few lines lower still relevant? If so,
> > comment on it in the commit message.
> 
>  It actually is, configure checks for it and it is used in the code. So
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> but I'd still like it to be mentioned in the commit message.

Well, not sure. AFAICS, checks for libxft are done only when either
standalone or standalone-xft is specified. Also, Xft is only used in
src/mbtheme-standalone.c, which as its name implies, is the standalone
mode.

So, I'll remove that dependency in the patch that disable standalone
mode (pending a test-build without libXft, but pretty confident it'll
work, nothing selects it in matchbox, I never manually selected it, and
all my previous builds were successfull).

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
