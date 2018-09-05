From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:37:27 +0200
Subject: [Buildroot] [PATCH v3 1/3] Makefile: add tainting support
In-Reply-To: <1536163596-5310-2-git-send-email-angelo@amarulasolutions.com>
References: <1536163596-5310-1-git-send-email-angelo@amarulasolutions.com>
 <1536163596-5310-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180905213727.56f5fecc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann/Arnout in Cc.

On Wed,  5 Sep 2018 18:06:34 +0200, Angelo Compagnucci wrote:

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 91b61c6..bcb4acd 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -551,6 +551,10 @@ ifndef $(2)_REDISTRIBUTE
>   endif
>  endif
>  
> +ifdef $(2)_TAINTS
> +BR2_TAINTED_BY+=$$($(2)_RAWNAME)
> +endif

I was almost going to apply and push this, but then I found a fairly
major problem. With your implementation, as soon as a package sets
<pkg>_TAINTS = YES, it will be part of the BR2_TAINTED_BY list,
regardless of whether the package is enabled or not.

It happens to work OK with nodejs, because the NODEJS_TAINTS = YES is
inside a condition that NODEJS_MODULES_LIST != "". However, if you put
NODEJS_TAINTS = YES outside of that condition in nodejs.mk, you will
see that the build is always tainted by nodejs, regardless of whether
nodejs is enabled or not. Not good.

This can easily be fixed by moving the BR2_TAINTED_BY += line inside
the:

  ifeq ($$($$($(2)_KCONFIG_VAR)),y)

condition, which is true only when the package is really enabled.

However, this only works for target packages. What about host
packages ? Can they taint the build ? If so, how do we handle that ?

When I was about to apply, I had added something like this in
pkg-generic.mk:

ifndef $(2)_TAINTS
 ifdef $(3)_TAINTS
  $(2)_TAINTS = $$($(3)_TAINTS)
 endif
endif

so that HOST_<pkg>_TAINTS is automatically defined to the same value as
<pkg>_TAINTS. However, we have no way to know if a host package is
enabled or not, since most host packages don't have any
corresponding Config.in option.

So: do we care about host packages for "tainting" ? If we do care, how
do we handle this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
