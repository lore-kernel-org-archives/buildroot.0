From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Mar 2013 19:21:27 +0100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
In-Reply-To: <20130314084816.00d23bd7@skate>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
 <201303131910.06613.yann.morin.1998@free.fr> <20130314084816.00d23bd7@skate>
Message-ID: <201303141921.27713.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 14 March 2013 Thomas Petazzoni wrote:
> On Wed, 13 Mar 2013 19:10:06 +0100, Yann E. MORIN wrote:
> > > Isn't this caused by the following dependency
> > > $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
> > 
> > Yes, and this dependency is here on purpose: we can't configure the
> > crosstool-NG backend until we first have the Buildroot config.
> 
> Hum there are many other places in Buildroot that can't be done until
> we have the Buildroot config and still we don't have this Buildroot
> configuration dependency. I think this dependency is useless because of
> the big:
> 
> ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> [... do all the normal build stuff... ]
> endif
> 
> that we have in the main Makefile.

Indeed, if we do not want to catch toolchain options changes, then the
dependency is superfluous.

> > > I don't think we should depend on the Buildroot configuration here. It
> > > tries to be too smart by triggering the rebuild of the toolchain
> > > whenever the Buildroot configuration has changed, but this isn't
> > > normally done in Buildroot, so I'd say this dependency on
> > > $(BUILDROOT_CONFIG) shouldn't be there. Cc'ing Yann on this one.
> > 
> > Well, the .config file should not change if the toolchain options in
> > Buildroot have not changed.
> 
> Which .config, crosstool-ng one, or Buildroot one?

Let me repjrase this:
    The crosstool-NG's .config should not change if the toolchain
    options in the Buildroot's .config did not change.

[--SNIP discussion about catching changes in toolchain options--]
> > Maybe we can switch to using the short Buildroot version string, which
> > does not include the git cset in it. I'll propose a patch to this effect
> > shortly.
> 
> I think the real fix is to just comply with the Buildroot principle of
> not trying to magically adapt to configuration changes.

I am not a fan, but I agree: let's adhere to the overall philosophy.

I will rework the patch to get rid of the changes-catching heuristic.

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
