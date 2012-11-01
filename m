From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2012 17:21:23 +0100
Subject: [Buildroot] [PATCH 1/7] docs/manual: update 'adding packages'
	with the new _AVAILABLE symbol
In-Reply-To: <5091D0B8.6050404@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-2-git-send-email-yann.morin.1998@free.fr>
 <5091D0B8.6050404@mind.be>
Message-ID: <201211011721.23581.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 01 November 2012 Arnout Vandecappelle wrote:
> On 09/10/12 01:40, Yann E. MORIN wrote:
> > --- a/docs/manual/adding-packages-autotools.txt
> > +++ b/docs/manual/adding-packages-autotools.txt
> > +12:
> > +13: ifeq ($(BR2_PACKAGE_LIBFOO_FROBBLE),y)
> > +14: LIBFOO_CONF_OPT += --enable-frobble
> > +15: else
> > +16: LIBFOO_CONF_OPT += --disable-frobble
> > +17: endif
> > +18:
> > +19: LIBFOO_CONF_OPT += --with-gazzle-level=$(BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL)
> 
>   This one is going a bit too far...  And if you keep it, it should
> probably have a qstrip.

It's an 'int', so is not quoted in the .config.
(but I'll use a 'string' to address your other comment, so
I'll qstrip it.)

> > +20:
> > +21: ifeq ($(BR2_PACKAGE_LIBFOO_GOO),y)
> > +22: LIBFOO_DEPENDENCIES += goo
> > +23: LIBFOO_CONF_OPT += --enable-goo
> > +24: else
> > +25: LIBFOO_CONF_OPT += --disable-goo
> > +26: endif
> 
>   While you're at it, an automatic enable/disable example would
> be nice too.

What do you mean by "automatic"?

> > --- a/docs/manual/adding-packages-directory.txt
> > +++ b/docs/manual/adding-packages-directory.txt
> > +* The syntax of the +Config.in+ file is the same as the one for the kernel
> > +  Kconfig file. The documentation for this syntax is available at:
> > +  https://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/kbuild/kconfig-language.txt[]
> 
>   http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt

Does this URL always match the latest version in the git tree?

> > +1. The +BR2_PACKAGE_LIBFOO_AVAILABLE+ symbol shall +depends on+ any
> > +other package's +_AVAILABLE+ symbol. It may also depend on any other
> > +symbol, such as toolchain features, but should not directly depend on
> > +any package's main symbol.
> 
>   ... except for _XORG7, _PYTHON, etc.

Well, my opinion (FWIW) is those packages should not be treated
differently just because they are /big/.

(One of) the goal(s) of _AVAILABLE is to allow the user to say either:
  - I want this package, enable whatever dependencies are required.
or:
  - I need this package, but I have to provide a toolchain that has
    such and such feature

_AVAILABLE makes that easy.

Then, it's up to the user to understand what pulling-in a package implies.

> > +config BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL
> > +	int "Gazzle level"
> > +	range 0 10
> 
>   We currently don't have a single range config option, and only one int.
> So the example is a bit contrived...  If you add an extra example, a string
> option that is qstripped in the .mk file is more appropriate.

OK.

> > --- a/docs/manual/adding-packages-generic.txt
> > +++ b/docs/manual/adding-packages-generic.txt
> > @@ -79,11 +102,11 @@ steps should be performed to install the package in the staging space.
> >   +LIBFOO_INSTALL_TARGET_CMDS+ tells what steps should be
> >   performed to install the package in the target space.
> 
>   Shouldn't _DEVICES and _PERMISSIONS be explained?

Da, tovarich!

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
