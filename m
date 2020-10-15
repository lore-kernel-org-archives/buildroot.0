From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:16:57 +0200
Subject: [Buildroot] [PATCH v4] package/libtalloc: new package
In-Reply-To: <20201015200609.20205-1-dgouarin@gmail.com>
References: <20201014170254.6184-1-dgouarin@gmail.com>
 <20201015200609.20205-1-dgouarin@gmail.com>
Message-ID: <20201015221657.7a224c6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

Thanks for this new iteration!

On Thu, 15 Oct 2020 22:06:08 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> talloc is a hierarchical, reference counted memory pool system with destructors.
> It is the core memory allocator used in Samba.
> 
> Signed-off-by: David GOUARIN <dgouarin@thalesgroup.com>
> 
> Change v1 -> v2:
>   - merge with work from jared.bents at rockwellcollins.com, as sujested by Matthew Weber
>     http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com
> 
> Change v2 -> v4: (no v3, resubmitting the whole patch series)
>   - fix build with BR2_PARANOID_UNSAFE_PATH (Thomas review)
>   - add hashes of license files (Thomas)
>   - license is GPL-3.0+ for both talloc and pytalloc (Thomas)
>   - remove useless --prefix and --libdir (Thomas)

Your changelog should be below the --- sign...

> 
> ---

... here.


> +LIBTALLOC_VERSION = 2.3.1
> +LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
> +LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
> +LIBTALLOC_LICENSE = GPL-3.0+
> +LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
> +LIBTALLOC_INSTALL_STAGING = YES
> +
> +LIBTALLOC_CONF_OPTS += --cross-compile \
> +		--cross-answers=$(@D)/cache.txt \
> +		--hostcc=gcc \
> +		--with-libiconv=$(HOST_DIR)/usr # waf will search by default in /usr/local with causes an error at configure step when BR2_COMPILER_PARANOID_UNSAFE_PATH is set

This is almost certainly not correct: HOST_DIR/usr contains libraries
compiled for the host... but you're building libtalloc for the target.

So unless libiconv is only used by libtalloc to build host binaries,
this looks wrong. If it's using the target libiconv, you should use
--with-libiconv=$(STAGING_DIR)/usr. However, keep in mind that libiconv
is not provided by all C libraries: with the uClibc C library built
without locale support, you would have to enable the
BR2_PACKAGE_LIBICONV option, and depend on libiconv. See for example
the package/acsccid package.

Other than this issue, the rest looks good.

However, please send libtalloc and freeradius-server as a series: the
latter depends on the former.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
