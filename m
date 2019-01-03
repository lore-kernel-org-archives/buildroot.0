From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:50:52 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind
 Config.in.host
In-Reply-To: <20181226215521.GL14286@scaer>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181226223005.71dca29a@windsurf> <20181226215521.GL14286@scaer>
Message-ID: <20190103225052.3feb76c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Arnout in Cc. Arnout, there's some discussion on one of your favorite
topic: Config.in.host options for all packages. Read on below.

On Wed, 26 Dec 2018 22:55:21 +0100, Yann E. MORIN wrote:

> > I.e: I am all in favor of this change, but I'm just curious to
> > understand why you did it in the first place.  
> 
> Well, I am not really happy with that, though: do we really plan on
> having packages really select all the host tools they need?
> 
> If so, do we really envision autotools-based packages selecting
> host-autoconf, host-automake, host-libtool? And then packages that use
> host-pkgconf you should also select it...
> 
> Also, what about host-cmake, which is conditionally built, but for which
> we do not have the info in kconfig? (well, we can argue we'd have to do
> like we do for host-gcc, but still). Oh, and host-tar, host-flex,
> host-bison, and so on... :-/

Meh, I hadn't thought of conditional packages like host-tar, host-cmake
and so on.

> So, no, I'm not happy with that direction...
> 
>     config BR2_PACKAGE_FOO
>         bool "foo"
>         select BR2_PACKAGE_HOST_AUTOCONF
>         select BR2_PACKAGE_HOST_AUTOMAKE
>         select BR2_PACKAGE_HOST_LIBTOOL
>         select BR2_PACKAGE_MAYBE_HOST_TAR
>         select BR2_PACKAGE_MAYBE_HOST_FLEX_FOR_KCONFIG
>         select BR2_PACKAGE_MAYBE_HOST_BISON_FOR_KCONFIG
>         select BR2_PACKAGE_HOST_PKGCONF
> 
> Unles we're planning on hiding that away into meta-config, like:
> 
>     config BR2_PACKAGE_FOO
>         bool "foo"
>         select BR2_AUTOTOOLS_PACKAGE # mimick $(eval $(autotools-package))
>         select BR2_PACKAGE_HOST_PKGCONF_BECAUSE_IT_S_NOT_MANDATORY
> 
> And still, the optionally-required host packages like tar, flex et al.
> are not covered...
> 
> Meh... :-(

Indeed, I understand the "Meh" here. I hadn't really realized what it
would mean to have Config.in.host options for all packages, and
properly selected by all its users.

But still, there are a number of cases where it would really help, so
that a given host package can be aware that another host package has
been built with a given feature (or not). Or precisely to force that a
certain host package is built with a given option. For example, in
host-python, we had situations where only a given package needed
host-python to be built with FOO support, and since we don't have any
BR2_PACKAGE_HOST_PYTHON_FOO option, our only choice was to
unconditionally enable FOO support in host-python, adding build time to
everyone, even if FOO in host-python might only be needed for one
obscure package.

It seems like we don't have a very conclusive decision on this topic at
this point.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
