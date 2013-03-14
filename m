From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Mar 2013 08:48:16 +0100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
In-Reply-To: <201303131910.06613.yann.morin.1998@free.fr>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
 <20130313083725.4605312e@skate>
 <201303131910.06613.yann.morin.1998@free.fr>
Message-ID: <20130314084816.00d23bd7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 13 Mar 2013 19:10:06 +0100, Yann E. MORIN wrote:

> > Isn't this caused by the following dependency
> > $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
> 
> Yes, and this dependency is here on purpose: we can't configure the
> crosstool-NG backend until we first have the Buildroot config.

Hum there are many other places in Buildroot that can't be done until
we have the Buildroot config and still we don't have this Buildroot
configuration dependency. I think this dependency is useless because of
the big:

ifeq ($(BR2_HAVE_DOT_CONFIG),y)
[... do all the normal build stuff... ]
endif

that we have in the main Makefile.

> > I don't think we should depend on the Buildroot configuration here. It
> > tries to be too smart by triggering the rebuild of the toolchain
> > whenever the Buildroot configuration has changed, but this isn't
> > normally done in Buildroot, so I'd say this dependency on
> > $(BUILDROOT_CONFIG) shouldn't be there. Cc'ing Yann on this one.
> 
> Well, the .config file should not change if the toolchain options in
> Buildroot have not changed.

Which .config, crosstool-ng one, or Buildroot one?

> That's the purpose of the .timestamp trick: if the .config did change,
> then we leave the new .config, and that will kick in the rebuild of the
> toolchain. OTOH, if the .config did not change, then we restore the
> previous .config, and as the date of the .config has not changed, the
> dependency is fulfilled, and the toolchain would not be re-built.
> 
> This *is* needed to catch tolchain changes. Admitedly, the internal backend
> does not do that, but I think it is better to do it rather than not.

I'm not sure to agree here. The Buildroot policy is: we don't even try
to rebuild whatever would be needed when there are configuration
changes. For example, when there is a change of toolchain
configuration, you will with your code maybe rebuild the toolchain, but
not the entire userspace.

So either we do it completely, and correctly, or we don't do it. And as
far I as remember, the Buildroot project position on this has always
been: it is too complex to achieve entirely correctly, so we just don't
do it.

> Maybe we can switch to using the short Buildroot version string, which
> does not include the git cset in it. I'll propose a patch to this effect
> shortly.

I think the real fix is to just comply with the Buildroot principle of
not trying to magically adapt to configuration changes.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
