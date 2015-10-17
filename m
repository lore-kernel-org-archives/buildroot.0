From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 23:13:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] nwipe: new package
In-Reply-To: <1445114199-14261-1-git-send-email-charles@dyfis.net>
References: <1445114199-14261-1-git-send-email-charles@dyfis.net>
Message-ID: <20151017211352.GD32247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2015-10-17 15:36 -0500, Charles Duffy spake thusly:
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>

Thanks for this new package. :-)

I have a few comments about it, see below...

> diff --git a/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch b/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
> new file mode 100644
> index 0000000..3cbec94
> --- /dev/null
> +++ b/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
> @@ -0,0 +1,167 @@
> +From 834f12c6e0c452756ad272e11a4ca984adb95468 Mon Sep 17 00:00:00 2001
> +From: Charles Duffy <charles@dyfis.net>
> +Date: Wed, 14 Oct 2015 16:26:30 -0500
> +Subject: [PATCH 1/2] Move from loff_t to off64_t for musl libc support (#11)
> +
> +Using musl libc, the loff_t type is unavailable. This is only exported by the
> +kernel when building with GNU_SOURCE, so there's an argument to be made that
> +it's desired behavior; see http://www.openwall.com/lists/musl/2013/01/23/6 for
> +discussion on this point.
> +
> +Signed-off-by: Charles Duffy <chaduffy@cisco.com>

I see you have tried to push that patch upstream, so it would be nice to
add the URL to the merge request:
    https://github.com/martijnvanbrummelen/nwipe/pull/14

[--SNIP--]
> diff --git a/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> new file mode 100644
> index 0000000..c08ec0d
> --- /dev/null
> +++ b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> @@ -0,0 +1,43 @@
> +From 2b95d0023754db95b66a4dc08f881e0e61ceaef0 Mon Sep 17 00:00:00 2001
> +From: Charles Duffy <charles@dyfis.net>
> +Date: Wed, 14 Oct 2015 16:24:01 -0500
> +Subject: [PATCH 2/2] Add libintl, libuuid dependencies to allow parted static
> + link (#12)
> +
> +libparted requires libuuid; both require libintl. Static builds currently fail
> +with link errors due to these missing dependencies.
> +
> +Signed-off-by: Charles Duffy <chaduffy@cisco.com>

Ditto:
    https://github.com/martijnvanbrummelen/nwipe/pull/13

[--SNIP--]
> diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
> new file mode 100644
> index 0000000..a36a709
> --- /dev/null
> +++ b/package/nwipe/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_NWIPE
> +	bool "nwipe"
> +	depends on BR2_USE_MMU # fork()

nwipe itself does not use fork(), so you don;t need that depends.

> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_PARTED
> +	select BR2_USE_WCHAR # parted
> +	help
> +	  nwipe thoroughly overwrites block devices, forked from a component at
> +	  the core of the venerable DBAN.
> +
> +	  https://github.com/martijnvanbrummelen/nwipe
> +
> +comment "nwipe needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU

Not needed, no use of fork().

> +	depends on !BR2_USE_WCHAR
> diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
> new file mode 100644
> index 0000000..58f560f
> --- /dev/null
> +++ b/package/nwipe/nwipe.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# nwipe
> +#
> +################################################################################
> +
> +NWIPE_VERSION = 0.17

You should probably use the latest commit. 0.17 is more than one-year
old, and there have been a few fixes applied to the tree since then.

> +NWIPE_SITE = $(call github,martijnvanbrummelen,nwipe,$(NWIPE_VERSION))
> +NWIPE_DEPENDENCIES = ncurses parted host-pkgconf
> +NWIPE_LICENSE = GPLv2

Indeed, it is not v2+.

> +NWIPE_LICENSE_FILES = COPYING
> +NWIPE_AUTORECONF = YES

We usually add a comment that explains why we need to autoreconf:

    # Straight our of the repository, no ./configure
    NWIPE_AUTORECONF = YES

Care to fix and respin, please?  Thanks! :-)

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.6.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
