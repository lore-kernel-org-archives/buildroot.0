From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jun 2017 14:55:27 +0200
Subject: [Buildroot] [PATCH] package/ifupdown-scripts: new package
In-Reply-To: <e46f59ca-cf2f-f2fe-accf-6586c17f78f4@mind.be>
References: <1489916894-2692-1-git-send-email-yann.morin.1998@free.fr>
 <e46f59ca-cf2f-f2fe-accf-6586c17f78f4@mind.be>
Message-ID: <20170604125527.GB3944@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Sorry to come back so late on this one...

On 2017-03-19 23:18 +0100, Arnout Vandecappelle spake thusly:
> On 19-03-17 10:48, Yann E. MORIN wrote:
> > The ifupdown scripts can be used independently of the init system, be it
> > sysv, busybox or systemd; they could even be used when there is no init
> > system (i.e. the user is providing his own).
> > 
> > Currently, those ifupdown scripts are bundled in the skeleton.
> > 
> > But we soon will have a skeleton specific to systemd, so we would be
> > missing those scripts (when systemd-networks is not enabled).
> > 
> > So, move those scripts to their own package.
> > 
> > This new package is selected by the various init systems that need it.
> 
>  I'd like to challenge this one.
[--SNIP--]

I see what you mean and where you're going, but as you can see in the
patch, it's not the init system that do the select, but really the
packages: ifupdown or systemd (without networkd).

The only init system that does the select is the busybox init system.,
when it should be the package that does it.

In that, the commit message is misleading; it should not mentikon init
systems at all. My bad. I'll rework the commit message.

>  Therefore, I would propose to make the package freely selectable, i.e. not
> selected by nor depend on anything.

I disagree on that one: we want to have a default behaviour that just
work when busybox is selected as init system (and thus as the network
manager), or when ifupdown is selected as the network manager.

I'd like we also keep backward compatibility with existing defconfig
files, if at all possible.

> Perhaps the only exception is that we want
> to depend on !BR2_PACKAGE_SYSTEMD_NETWORKD because the two systemd services will
> slightly conflict with each other (actually I don't think they will...).

Yes, they would. At least, having both on my system somehow broke it.
I'd have to reproduce to be sure, though...

>  Maybe I'm wrong and S40networking is still needed for the lo interface, or
> network-manager still uses the scripts in /etc/network/*.d. Even in that case, I
> think one may want to enable this package e.g. when BR2_INIT_NONE - when you use
> some custom init system, you still may want to call ifup to start the network.
> In that case the init script won't be installed, but /etc/network is still relevant.

So many things to test! ;-) Meh...

> > This means that, no longer being part of the skeleton but being selected
> > by the init systems, they are now available even when a custom skeleton
> > is used, like our initscripts are.
> > 
> > Previously, the systemd service was provided by systemd, while the syv
> > startup script was provided by initscripts. Both are moved to this new
> > ifupdown-scripts package for consistency with the other scripts. We
> > still intall the systemd service file because ifupdown-scripts cannot be
> > enabled when systemd-networkd is enabled.
> > 
> > Instead of being a target-finalize hook, the scripts are installed as
> > any other package are, with a package install-target command.
> 
> [snip]
> > diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
> > index e683201..74be59f 100644
> > --- a/package/ifupdown/Config.in
> > +++ b/package/ifupdown/Config.in
> > @@ -5,6 +5,7 @@ config BR2_PACKAGE_IFUPDOWN
> >  	# Default/our uclibc lacks wordexp()
> >  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> >  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> > +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS
> 
>  Doesn't this lead to a circular dependency when BR2_PACKAGE_SYSTEMD_NETWORKD is
> selected?
> 
>  Also, I wonder why you do this for the ifupdown package, but not for busybox
> ifupdown...

Because there is not prompt for busybox ifupdown? Instead, we assume
that if Busybox is selected, then we would use its ifupdown incarnation.

But this is flawed, if one provides its own busybox config that does not
enable ifupdown. Not that this is fundamentally different than what we
currently do, anyway...

> >  	# runtime for ip binary
> >  	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
> >  	# runtime for run-parts
> [snip]
> > diff --git a/system/Config.in b/system/Config.in
> > index 3ddf843..4fc037b 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -103,6 +103,7 @@ config BR2_INIT_BUSYBOX
> >  	bool "BusyBox"
> >  	select BR2_PACKAGE_BUSYBOX
> >  	select BR2_PACKAGE_INITSCRIPTS
> > +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS
> >  
> >  config BR2_INIT_SYSV
> >  	bool "systemV"
> 
>  Even if you disagree with everything I wrote and keep things like you put them
> now, the package should definitely also be selected when BR2_INIT_SYSV.

I don't think it should. It should only be selected by ifupdown.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
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
