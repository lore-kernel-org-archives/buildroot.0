From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 11:03:04 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <53C63CD6.6020104@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
 <20140715213125.1b848b48@free-electrons.com>
 <20140716102439.2bcff4ce@free-electrons.com>
 <53C63CD6.6020104@lucaceresoli.net>
Message-ID: <20140716110304.749a1a2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 16 Jul 2014 10:50:30 +0200, Luca Ceresoli wrote:

> How do the autobuilders handle the same situation for the Linux or
> Barebox custom configuration files? E.g.:
> 
>    # BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
>    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""
> 
> This would fail in the same way. Obvious enough, since for exim I just
> copied the same checks...
> 
> Do the autobuilders have a special handling for the kernel and
> bootloaders? If that's the case, of course it would not be viable to do
> it for each and every package.

Since the Linux kernel and bootloader options do not start with
BR2_PACKAGE_* they are not part of the randpackageconfig randomization,
and therefore the autobuilders never build the Linux kernel or the
bootloaders.

We however have a similar situation with other packages, in which case
the autobuilder script comes to help, see for example
http://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run#n244.

> > Options:
> >
> >   1/ Have a default value for BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE that
> >      actually works.
> 
> That would be quite simple. Enough to run a build with
> BR2_PACKAGE_EXIM_CUSTOM_CONFIG disabled, pick the config file from
> the build dir, remove the toolchain additions and put the file in
> packace/exim/default-config.

That is one solution.

> I agree options 2 and 3 would be more annoying.

They are possible, we do this for other packages already.

> Another option is:
> 
>    4/ Remove BR2_PACKAGE_EXIM_CUSTOM_CONFIG knob and make exim use the
>       custom configuration only if
>       BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE != "". I assume the
>       autobuilders never set BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE, do
>       they?

Indeed, randpackageconfig only takes care of boolean or tristate
options, so BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE would remain empty in
terms of autobuilder testing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
