From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Wed, 13 Mar 2013 14:14:17 +1100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm finding that when using Crosstool-NG, the toolchain often seems to
rebuild unnecessarily.

The condition seems to trigger if any change is made to the main
buildroot configuration file (even though the change is unrelated to the
toolchain) and a new git commit is made (or uncommitted changes are
introduced into the build tree). As far as I can tell this is caused by
one of the CTNG_FIX_BUILDROOT_CONFIG_SED rules used to modify the
crosstool-NG configuration (found in
toolchain/toolchain-crosstool-ng/crosstool-ng.mk).

The rule is:
    CTNG_FIX_BUILDROOT_CONFIG_SED +=
s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;

The problem is its dependence on BR2_VERSION_FULL which changes every
time a git commit is made.

I'm not sure what the best way to tackle this is. Perhaps allowing the
user to specify a fixed TOOLCHAIN_PKGVERSION in the ctng-menuconfig, the
above rule would then become something like:
        CTNG_FIX_BUILDROOT_CONFIG_SED +=
s:^(CT_TOOLCHAIN_PKGVERSION)="(\s*)":\1="buildroot
$(BR2_VERSION_FULL)":;

Otherwise we could use BR2_VERSION instead. This would still trigger an
unnecessary rebuild every time the buildroot version is bumped but that
would happen a lot less often.

Any suggestions on the best way to tackle this issue?

Regards,
Przemyslaw Wrzos
