From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 10:24:56 -0700
Subject: [Buildroot] [PATCH v2.1 1/6] package/go: Build host tools with
 host CC
In-Reply-To: <20160525225947.15913a38@free-electrons.com>
References: <cover.1463696454.git.geoff@infradead.org>
 <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
 <1464125645.5014.52.camel@infradead.org>
 <20160525160529.2c19eea9@free-electrons.com>
 <1464194514.30545.5.camel@infradead.org>
 <20160525225947.15913a38@free-electrons.com>
Message-ID: <1464283496.2374.20.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2016-05-25 at 22:59 +0200, Thomas Petazzoni wrote:
> On Wed, 25 May 2016 09:41:54 -0700, Geoff Levand wrote:
> bin and tool with HOST_GO_HOST_CC, because those are host binaries.
> > The rest with HOST_GO_TARGET_CC because those are target binaries.
> > 
> > If you can think of a better way to do this two step build I can try it.
> 
> I was thinking of having the host parts build by host-go and the
> target parts by the "go" package, but I'm not sure it's easy to achieve
> nor that it will make the stuff clearer.

Seems to be more complicated.

> Now that I think of it, why do we have to have those two cases:
> 
> +ifneq ($(ARCH),$(HOSTARCH))
>  define HOST_GO_BUILD_CMDS
> -> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
> +> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> +> 	> mkdir -p $(HOST_GO_TMP)
> +> 	> mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> +> 	> mv $(@D)/bin/ $(HOST_GO_TMP)/
>  endef
> +else
> +define HOST_GO_BUILD_CMDS
> +> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
> +> 	> mkdir -p $(HOST_GO_TMP)
> +> 	> mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> +> 	> mv $(@D)/bin/ $(HOST_GO_TMP)/
> +> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> +endef
> +endif
> 
> Aren't the host binaries always built for the host, and the target
> binaries always built for the target? So can't we replace this by just:
> 
> +define HOST_GO_BUILD_CMDS
> +> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
> +> 	> mkdir -p $(HOST_GO_TMP)
> +> 	> mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> +> 	> mv $(@D)/bin/ $(HOST_GO_TMP)/
> +> 	> cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> +endef
> 
> and get in fact the exact same behavior?

There is a subtle difference, when we build with HOST_GO_HOST_CC the
resulting host compiler binaries have the go environment variables CC
and CXX set to the host compilers.  They should be set to the target
cross compilers so that by default go programs are built with the target
cross compiler.  That was one motivation for my follow up patch
'package/go: Add HOST_GO_TARGET_ENV', which sets those to the proper
values for target package builds.

I had planned to look into how to fix this environment problem.  One
idea was to use a custom version of ./make.bash that would do the
right thing.

On thinking about it, it seems it would be best for now to do the
two step build for all configs and expect package maintainers to
either use HOST_GO_TARGET_ENV or set CC and CXX.  That would avoid
the situation where the maintainer does not test with host arch
equal to target arch.

-Geoff
