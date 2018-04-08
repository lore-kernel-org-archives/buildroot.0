From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Apr 2018 13:56:02 +0200
Subject: [Buildroot] [PATCH] package/kmod: enable compression in host
 variant
In-Reply-To: <20180408132847.095b0d27@windsurf>
References: <20180408081231.24250-1-yann.morin.1998@free.fr>
 <20180408132847.095b0d27@windsurf>
Message-ID: <20180408115602.GB2327@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-08 13:28 +0200, Thomas Petazzoni spake thusly:
> On Sun,  8 Apr 2018 10:12:31 +0200, Yann E. MORIN wrote:
> > When the modules are compressed by the kernel at install, it needs a
> > depmod with compression support to br able to generate the modules.dep
> > and associated files.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/kmod/kmod.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> > index e1149b7b65..c6264e16ab 100644
> > --- a/package/kmod/kmod.mk
> > +++ b/package/kmod/kmod.mk
> > @@ -9,7 +9,7 @@ KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
> >  KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
> >  KMOD_INSTALL_STAGING = YES
> >  KMOD_DEPENDENCIES = host-pkgconf
> > -HOST_KMOD_DEPENDENCIES = host-pkgconf
> > +HOST_KMOD_DEPENDENCIES = host-pkgconf host-xz host-zlib
> 
> It is a bit annoying to add those dependencies unconditionally :-/

Yep, bt we can't automatically know whether the user will be using
compressed modules or not. And by the time we can look at the kernel's
.config file, it is too late to add those dependencies to host-kmod.

The alternative is to add new options to linux/Config.in to enable
module compression (which one, or none), and automatically derive the
extra needed dependencies.

TBH, I'm not too fond of either solution...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
