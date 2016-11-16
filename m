From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 00:02:39 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161117000239.36cd4e77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:13 +0100, Yann E. MORIN wrote:
> This new waf-package infrastructure simplifies writing waf-based
> packages. It can be used by our six current such packages, plus a
> later-incoming one by Romain.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>

I am generally happy with the whole series, I just have a few comments
on this specific patch, which are mainly questions. We discussed them
on IRC, but I'd like to raise the questions here as well, in case
people have some opinions.

If nobody gives some feedback, then I'm going to apply the series.


> +# If the package does not have its own waf, use our own.
> +ifeq ($$($(2)_BUNDLED_WAF),NO)

Where is the default value of this variable defined? It seems it's not
defined anywhere, while it should be set to "YES".

However, what I dislike a bit is the slightly "negative" logic of this
variable. By default, we assume packages have their bundled version of
waf, so this variable is by default assumed to be set to "YES" (even
though in fact it's empty).

Only packages that do *NOT* have a bundled version of waf can set
<pkg>_BUNDLED_WAF = NO, to tell the infrastructure to add a dependency
on host-waf.

To me it feels a bit weird to:

 1. Have a boolean that defaults to YES and that can be overridden to
    NO. I generally expects the opposite.

 2. Have a boolean that when set to "NO" actually asks the
    infrastructure to do more things. I generally expects the opposite.

So, ideally, I'd like to invert this variable, but I can't really find
a good name for it.

I propose <pkg>_NEEDS_WAF on IRC, but I'm not convinced because all
packages need waf, either bundled or external.
<pkg>_NEEDS_EXTERNAL_WAF ?

Anyone has some other proposal ?

> +# Dependency on host-python is done by host-waf
> +$(2)_DEPENDENCIES += host-waf
> +$(2)_WAF = $(HOST_DIR)/usr/bin/waf
> +else
> +# We need host-python to run the package's waf
> +$(2)_DEPENDENCIES += host-python
> +$(2)_WAF = ./waf
> +endif

Here another point where I'm hesitating. host-waf doesn't really need
to build-depend on host-python. It's *running* host-waf that requires
host-python. So I'm wondering if we shouldn't:

 1. Remove the host-python dependency from host-waf

 2. In the first case above (no bundled waf), add to the package a
    dependency on host-waf *and* host-python.

On IRC, you suggested that packages that depend on host-waf should not
have to know host-python is needed to run it, which is fair point.

So I'm opening the question to others.

> +ifndef $(2)_MAKE
> + ifdef $(3)_MAKE
> +  $(2)_MAKE = $$($(3)_MAKE)
> + else
> +  $(2)_MAKE ?= $$(MAKE)
> + endif
> +endif

Is $(2)_MAKE used anywhere in this infrastructure?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
