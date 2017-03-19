From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Mar 2017 18:06:14 +0100
Subject: [Buildroot] [PATCH] package/ifupdown-scripts: new package
In-Reply-To: <20170319150212.11fa6742@free-electrons.com>
References: <1489916894-2692-1-git-send-email-yann.morin.1998@free.fr>
 <20170319150212.11fa6742@free-electrons.com>
Message-ID: <20170319170614.GC3734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-19 15:02 +0100, Thomas Petazzoni spake thusly:
> Looks good to me overall. A couple of questions/comments below.
> 
> On Sun, 19 Mar 2017 10:48:14 +0100, Yann E. MORIN wrote:
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
> Do we know why we were doing this in a target-finalize hook? After all,
> skeleton is also a package, so it could also have done this stuff in
> its install-target command. Is it simply a legacy of the time where
> this was done outside of the skeleton package? Or did we have a true
> reason to use a target finalize hook?

In 7a6b83a2 (skeleton: New package), those settings were moved into the
skeleton package, from system/system.mk where they were indeed defined
as target-finalize hooks.

So yes, historical reasons.

> > +# Package automatically enabled by the selected init-system,
> > +# either busybox, sysv-init or systemd (w/o networkd).
> > +# We use a little trick to hide the package when not available,
> > +# but still show it when needed (except it is forced in this case)
> > +
> > +config BR2_PACKAGE_IFUPDOWN_SCRIPTS
> > +	bool
> > +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS_DUMMY
> > +
> > +config BR2_PACKAGE_IFUPDOWN_SCRIPTS_DUMMY
> > +	bool "ifupdown-scripts" if BR2_PACKAGE_IFUPDOWN_SCRIPTS
> 
> I don't understand why we want this trick. Just make this package a
> hidden package, and that's it. The skeleton package is also hidden, and
> it works just fine.

Hmm... Not sure why I did that (it was 9 months ago)... Fixed.

> > +config BR2_PACKAGE_SYSTEMD_IFUPDOWN_SCRIPTS
> > +	bool
> > +	default y
> > +	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
> > +	select BR2_PACKAGE_IFUPDOWN_SCRIPTS
> 
> What about replacing this with:
> 
> 	select BR2_PACKAGE_IFUPDOWN_SCRIPTS if !BR2_PACKAGE_SYSTEMD_NETWORKD
> 
> on the main BR2_PACKAGE_SYSTEMD option?

Yep, works too. Fixed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
