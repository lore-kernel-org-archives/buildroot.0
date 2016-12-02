From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:56:56 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161202235656.2bd6d029@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:13 +0100, Yann E. MORIN wrote:

> +# If the package does not have its own waf, use our own.
> +ifeq ($$($(2)_BUNDLED_WAF),NO)

I've renamed this variable to _NEEDS_EXTERNAL_WAF, which inverts its
logic. It's explicitly defined to NO by default, and when set to YES, a
dependency on host-waf is needed.

> +# Dependency on host-python is done by host-waf
> +$(2)_DEPENDENCIES += host-waf
> +$(2)_WAF = $(HOST_DIR)/usr/bin/waf
> +else
> +# We need host-python to run the package's waf
> +$(2)_DEPENDENCIES += host-python

This line has been moved out of the condition, since it's now needed
for both the "bundled waf" and "external waf" cases.

> +ifndef $(2)_MAKE
> + ifdef $(3)_MAKE
> +  $(2)_MAKE = $$($(3)_MAKE)
> + else
> +  $(2)_MAKE ?= $$(MAKE)
> + endif
> +endif

I've dropped this as it wasn't needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
