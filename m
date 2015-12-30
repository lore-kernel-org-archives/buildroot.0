From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:12:04 +0100
Subject: [Buildroot] [PATCH 3/3] core/pkg-virtual: do not check they are
 neabled
In-Reply-To: <7048b92dbba0ba35f610d7863f0c599eca3e3399.1451430505.git.yann.morin.1998@free.fr>
References: <cover.1451430505.git.yann.morin.1998@free.fr>
 <7048b92dbba0ba35f610d7863f0c599eca3e3399.1451430505.git.yann.morin.1998@free.fr>
Message-ID: <20151230101204.0f71f2d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Dec 2015 00:10:40 +0100, Yann E. MORIN wrote:

>  ifeq ($(MAKECMDGOALS),)
> -	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
> +	@if test "$($(PKG)_TYPE)" = "target" \
> +		-a ! "$($(PKG)_IS_VIRTUAL)" = "YES" \

I changed this to:

		-a "$($(PKG)_IS_VIRTUAL)" != "YES" \

which I believe is a bit more logical.

> diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> index 9c68b51..244c1d0 100644
> --- a/package/pkg-virtual.mk
> +++ b/package/pkg-virtual.mk
> @@ -41,6 +41,8 @@ $$(error No implementation selected for virtual package $(1). Configuration erro
>  endif
>  endif
>  
> +$(2)_IS_VIRTUAL = YES

I wasn't sure whether a new variable was needed. We could have used
$($(PKG)_VERSION) != "virtual", but that would have failed if one day
we have a normal package that really has a version named "virtual" for
some reason.

We can anyway change this later on if others have better suggestions.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
