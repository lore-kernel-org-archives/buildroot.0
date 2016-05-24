From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 21:11:45 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/go: Build host tools with
 host CC
In-Reply-To: <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
 <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
Message-ID: <20160524211145.4b3080d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version.

On Thu, 19 May 2016 22:25:02 +0000, Geoff Levand wrote:

> +HOST_GO_TMP = $(@D)/host-go-tmp
> +
> +ifneq ($(ARCH),$(HOSTARCH))
>  define HOST_GO_BUILD_CMDS
> -	cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
> +	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> +	mkdir -p $(HOST_GO_TMP)
> +	mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> +	mv $(@D)/bin/ $(HOST_GO_TMP)/

So here you are moving what was built to HOST_GO_TMP.

>  endef
> +else
> +define HOST_GO_BUILD_CMDS
> +	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
> +	mkdir -p $(HOST_GO_TMP)
> +	cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/
> +	cp -a $(@D)/bin/ $(HOST_GO_TMP)/
> +	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> +	cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/

And here you're using a copy. Why?

Also, in this last case, you are copying pkg/tool/ twice, once after
the build with HOST_GO_HOST_CC, and once after the build with
HOST_GO_TARGET_CC. It seems like the first copy is useless.

Could you comment on this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
