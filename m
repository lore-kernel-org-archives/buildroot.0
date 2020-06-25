From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:09:06 +0200
Subject: [Buildroot] [RFC v9 05/10] toolchain/toolchain-ext: glibc
 cpe-info support
In-Reply-To: <20200616170341.45098-5-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-5-matthew.weber@rockwellcollins.com>
Message-ID: <20200625130906.322fd564@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 12:03:36 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  $(1)-cpe-info: PKG=$(2)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +$(1)-cpe-info: toolchain
> +endif
>  $(1)-cpe-info:
>  ifeq ($$($(2)_TYPE),target)
> +ifneq ($$($(2)_NAME),toolchain-external)
> +ifneq ($(findstring TOOLCHAIN_EXTERNAL, $(2)),)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
> +	$$(eval $(2)_VERSION = $$(shell $$(call TOOLCHAIN_CPE_INFO)))
> +	$$(eval $(2)_CPE_ID_VENDOR = gnu)
> +	$$(eval $(2)_CPE_ID_NAME = glibc)
> +	$$(eval $(2)_ACTUAL_SOURCE_SITE = https://github.com/bminor/glibc/releases)
> +	$$(eval $(2)_RAWNAME = glibc)

It is absolutely atrocious to have this stuff directly in the middle of
pkg-generic.mk, and even further only within the $(1)-cpe-info target.

Why isn't this been done inside the external toolchain package itself,
or the external toolchain package infrastructure ?

I think this specific issue of having proper tracking of the target
elements (C library, gcc runtime) of the toolchain is global, and not
just for CPE/CVE tracking: we already do not properly track this in
terms of legal-info for example.

So rather than this one-off hack that solves just the specific case of
CPE tracking for glibc in external toolchains, we need a more global
solution.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
