From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 May 2019 23:07:35 +0200
Subject: [Buildroot] [PATCH] package/ninja: enforce Python3 on the host
In-Reply-To: <20190222203756.8795-1-joerg.krause@embedded.rocks>
References: <20190222203756.8795-1-joerg.krause@embedded.rocks>
Message-ID: <20190507230735.0a489f73@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Feb 2019 21:37:56 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The current logic selects Python3 for the host only if Python3 is
> selected for the target, otherwise it selects Python2.
> 
> As Meson, the only package infrastructure using ninja, needs Python3, it is
> desirable to also depend on Python3 on the host for the ninja host
> package.
> 
> Otherwise, if no Python interpreter is selected for the target, both
> Python2 and Python3 are build for the host, which is time consuming
> without any benefit.
> 
> For example when building libmpdclient (and all its target and host
> dependencies) the actual elapsed time for is reduced from around 286s to 207s
> as reported by `time -p make clean all`.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I think this is a good idea, but...

> -HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +# Enforce Python3 on the host, to prevent building Python2 and Python3 when
> +# using packages using the Meson infrastructure and not having any Python
> +# interperter selected for the target.
> +HOST_NINJA_NEEDS_HOST_PYTHON = python3

This definitely cannot be the right change: <pkg>_NEEDS_HOST_PYTHON
only makes sense for packages using the python-package infrastructure,
but Ninja is using the generic-package infrastructure. So basically,
the line you have added does not do anything at all, and it only works
by chance because host-python3 was already built before host-ninja by
some other package.

I think the right change is to just do:

HOST_NINJA_DEPENDENCIES = host-python3

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
