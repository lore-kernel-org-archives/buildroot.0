From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Mar 2013 19:10:06 +0100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
In-Reply-To: <20130313083725.4605312e@skate>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
 <20130313083725.4605312e@skate>
Message-ID: <201303131910.06613.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Przemyslaw, Thomas, All,

On Wednesday 13 March 2013 Thomas Petazzoni wrote:
> On Wed, 13 Mar 2013 14:14:17 +1100, Przemyslaw Wrzos wrote:
> > I'm finding that when using Crosstool-NG, the toolchain often seems to
> > rebuild unnecessarily.
[--SNIP--]
> Isn't this caused by the following dependency
> $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)

Yes, and this dependency is here on purpose: we can't configure the
crosstool-NG backend until we first have the Buildroot config.

> I don't think we should depend on the Buildroot configuration here. It
> tries to be too smart by triggering the rebuild of the toolchain
> whenever the Buildroot configuration has changed, but this isn't
> normally done in Buildroot, so I'd say this dependency on
> $(BUILDROOT_CONFIG) shouldn't be there. Cc'ing Yann on this one.

Well, the .config file should not change if the toolchain options in
Buildroot have not changed.

That's the purpose of the .timestamp trick: if the .config did change,
then we leave the new .config, and that will kick in the rebuild of the
toolchain. OTOH, if the .config did not change, then we restore the
previous .config, and as the date of the .config has not changed, the
dependency is fulfilled, and the toolchain would not be re-built.

This *is* needed to catch tolchain changes. Admitedly, the internal backend
does not do that, but I think it is better to do it rather than not.

I have just checked that, and indeed, if I just change package options
without touching toolchain-related features, the toolchain is not rebuilt.

Now, getting the Buildroot version in the crostool-NG backend is arguably
usefull, especially if using (as is currently the case) the complete
version string. I personally find it useful, but I agree this can be seen
as an annoyance (note: I am not impacted, because I usually build the
toolchain directly with ct-ng, and use that as an external toolchain).

Maybe we can switch to using the short Buildroot version string, which
does not include the git cset in it. I'll propose a patch to this effect
shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
