From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 22:55:21 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind
 Config.in.host
In-Reply-To: <20181226223005.71dca29a@windsurf>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181226223005.71dca29a@windsurf>
Message-ID: <20181226215521.GL14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Carlos, All,

On 2018-12-26 22:30 +0100, Thomas Petazzoni spake thusly:
> On Sun, 23 Dec 2018 15:19:48 -0200, Carlos Santos wrote:
> > The plan for the future is:
> > 
> >  * All host packages have a Config.in.host option.
> > 
> >  * The host packages that are only build dependencies of other packages
> >    have a blind Config.in.host option
> > 
> >  * The host packages that are useful by themselves continue to have a
> >    visible Config.in.host option.
> > 
> > host-waf gets a blind Config.in.host, because it exists only to build
> > Waf-based packages that set <PKG>_NEEDS_EXTERNAL_WAF to YES.
> > 
> > A help text is included to document the package, only, since it is not
> > shown in the configuration menu.
> > 
> > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> > ---
> > Changes v1->v2:
> >   - Explain the motivation in the commit message
> 
> In fact the commit message doesn't explain the actual motivation. What
> prompted you to add a blind Config.in.host option for waf
> specifically ? Is this just a part of "let's start adding blind option
> for all host packages", or is there a specific issue with host-waf that
> this blind Config.in.host option will allow to solve ?
> 
> I.e: I am all in favor of this change, but I'm just curious to
> understand why you did it in the first place.

Well, I am not really happy with that, though: do we really plan on
having packages really select all the host tools they need?

If so, do we really envision autotools-based packages selecting
host-autoconf, host-automake, host-libtool? And then packages that use
host-pkgconf you should also select it...

Also, what about host-cmake, which is conditionally built, but for which
we do not have the info in kconfig? (well, we can argue we'd have to do
like we do for host-gcc, but still). Oh, and host-tar, host-flex,
host-bison, and so on... :-/

So, no, I'm not happy with that direction...

    config BR2_PACKAGE_FOO
        bool "foo"
        select BR2_PACKAGE_HOST_AUTOCONF
        select BR2_PACKAGE_HOST_AUTOMAKE
        select BR2_PACKAGE_HOST_LIBTOOL
        select BR2_PACKAGE_MAYBE_HOST_TAR
        select BR2_PACKAGE_MAYBE_HOST_FLEX_FOR_KCONFIG
        select BR2_PACKAGE_MAYBE_HOST_BISON_FOR_KCONFIG
        select BR2_PACKAGE_HOST_PKGCONF

Unles we're planning on hiding that away into meta-config, like:

    config BR2_PACKAGE_FOO
        bool "foo"
        select BR2_AUTOTOOLS_PACKAGE # mimick $(eval $(autotools-package))
        select BR2_PACKAGE_HOST_PKGCONF_BECAUSE_IT_S_NOT_MANDATORY

And still, the optionally-required host packages like tar, flex et al.
are not covered...

Meh... :-(

> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index 16b474fc9d..3644436fe3 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -64,6 +64,7 @@ menu "Host utilities"
> >  	source "package/uboot-tools/Config.in.host"
> >  	source "package/util-linux/Config.in.host"
> >  	source "package/vboot-utils/Config.in.host"
> > +	source "package/waf/Config.in.host"
> >  	source "package/xorriso/Config.in.host"
> >  	source "package/zip/Config.in.host"
> >  	source "package/zstd/Config.in.host"
> 
> I'm not sure it's really nice to include all the host packages
> Config.in.host files inside the "Host utilities" menu. In practice,
> it's a blind option so it doesn't matter much, but it will clutter a
> lot this list, making it difficult to see which one is there to be
> really visible in menuconfig, and which one is here just so that the
> kconfig machinery knows about all those blind options.
> 
> I think I would prefer a new list, at the bottom of
> package/Config.in.host, outside of the Host utilities menu.
> 
> Let's see what Arnout/Peter/Yann have to say about this.

If we have to have it, then indeed, let's at least move it away of the
user-selectable ones, into its own section, yes.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
