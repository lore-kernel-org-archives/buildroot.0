From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Mar 2013 08:37:25 +0100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
Message-ID: <20130313083725.4605312e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Przemyslaw Wrzos,

On Wed, 13 Mar 2013 14:14:17 +1100, Przemyslaw Wrzos wrote:

> I'm finding that when using Crosstool-NG, the toolchain often seems to
> rebuild unnecessarily.
> 
> The condition seems to trigger if any change is made to the main
> buildroot configuration file (even though the change is unrelated to the
> toolchain) and a new git commit is made (or uncommitted changes are
> introduced into the build tree). As far as I can tell this is caused by
> one of the CTNG_FIX_BUILDROOT_CONFIG_SED rules used to modify the
> crosstool-NG configuration (found in
> toolchain/toolchain-crosstool-ng/crosstool-ng.mk).
> 
> The rule is:
>     CTNG_FIX_BUILDROOT_CONFIG_SED +=
> s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
> 
> The problem is its dependence on BR2_VERSION_FULL which changes every
> time a git commit is made.
> 
> I'm not sure what the best way to tackle this is. Perhaps allowing the
> user to specify a fixed TOOLCHAIN_PKGVERSION in the ctng-menuconfig, the
> above rule would then become something like:
>         CTNG_FIX_BUILDROOT_CONFIG_SED +=
> s:^(CT_TOOLCHAIN_PKGVERSION)="(\s*)":\1="buildroot
> $(BR2_VERSION_FULL)":;
> 
> Otherwise we could use BR2_VERSION instead. This would still trigger an
> unnecessary rebuild every time the buildroot version is bumped but that
> would happen a lot less often.
> 
> Any suggestions on the best way to tackle this issue?

Isn't this caused by the following dependency

$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)

I don't think we should depend on the Buildroot configuration here. It
tries to be too smart by triggering the rebuild of the toolchain
whenever the Buildroot configuration has changed, but this isn't
normally done in Buildroot, so I'd say this dependency on
$(BUILDROOT_CONFIG) shouldn't be there. Cc'ing Yann on this one.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
