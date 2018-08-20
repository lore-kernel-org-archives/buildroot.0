From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:02:28 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: fix build on m68k_cf
In-Reply-To: <20180820165929.20741-1-fontaine.fabrice@gmail.com>
References: <20180820165929.20741-1-fontaine.fabrice@gmail.com>
Message-ID: <20180820230228.07ebf70f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 18:59:29 +0200, Fabrice Fontaine wrote:

> +# Internal error, aborting at dwarf2cfi.c:2752 in connect_traces
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
> +ifeq ($(BR2_m68k_cf),y)
> +ZEROMQ_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-defer-pop"
> +endif

I've applied, but what bothers me is that we will never notice if/when
this workaround can be removed. Perhaps we should make such workarounds
depend on the gcc version, like this:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_9):$(BR2_m68k_cf),:y)
...
endif

This way, when we start using gcc 9.x, the workaround is no longer
applied. Either the bug is fixed, and we never see a build failure
again. Or the bug is not fixed, we noticed via autobuilder failure, and
extend the workaround to gcc 10.x.

Not sure what others think about this. OTOH, this is just about m68k
coldfire, maybe we don't care. But it's code that would probably stay
forever in BR.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
