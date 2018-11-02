From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 22:51:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/davici: new package
In-Reply-To: <20181024175936.27574-1-jared.bents@rockwellcollins.com>
References: <20181024175936.27574-1-jared.bents@rockwellcollins.com>
Message-ID: <20181102225121.0c731e7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Oct 2018 12:59:36 -0500, Jared Bents wrote:
> This patch adds davici which is an alternative implementation of the
> VICI client protocal used by Strongswan.  It targets better integration
> with software stacks and uses a asynchronous, non-blocking API that can
> be integrated in third-party main dispatching loops without the use of
> threads.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

I've applied, with a few changes, see below.

>  package/Config.in          |  1 +
>  package/davici/Config.in   | 18 ++++++++++++++++++
>  package/davici/davici.hash |  3 +++
>  package/davici/davici.mk   | 20 ++++++++++++++++++++

An entry to the DEVELOPERS file was missing.

> diff --git a/package/davici/Config.in b/package/davici/Config.in
> new file mode 100644
> index 0000000000..9dfa0ec130
> --- /dev/null
> +++ b/package/davici/Config.in
> @@ -0,0 +1,18 @@
> +comment "davici needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_DAVICI
> +	bool "davici"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_STRONGSWAN

Here I hesitated between keeping your select, or switching to a
"depends on". Indeed, in the case of this library, it's pretty clear
that the user willing to use it will know that he needs strongswan. But
it's a matter of taste, so in the end, I kept your select.

> +DAVICI_VERSION = v1.3
> +DAVICI_SITE = $(call github,strongswan,davici,$(DAVICI_VERSION))
> +DAVICI_LICENSE = LGPL-2.1

The license is LGPL-2.1+, the source files carry the "or later"
indication.

> +DAVICI_LICENSE_FILES = COPYING
> +DAVICI_DEPENDENCIES = strongswan
> +DAVICI_INSTALL_STAGING=YES

Missing spaces around the = sign.

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
