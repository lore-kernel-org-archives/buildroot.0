From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 23 Oct 2017 17:50:43 +0200
Subject: [Buildroot] [RFC, v2,
	2/4] package/pkg-golang: new package infrastructure
In-Reply-To: <CA+h8R2p_8jhZqP2NLcSz0mXZ7WbrWSKnV8ML78U29CsTCk_Q=g@mail.gmail.com>
References: <CA+h8R2p_8jhZqP2NLcSz0mXZ7WbrWSKnV8ML78U29CsTCk_Q=g@mail.gmail.com>
Message-ID: <CA+TH9Vny5An_ktJCRFZiN5RFok0QuaSF9a1GKOsHyiV--huO-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

2017-10-19 18:06 GMT+02:00 Christian Stewart <christian@paral.in>:
> Hi Angelo,
>
> Angelo Compagnucci wrote:
>> This patch adds a new infrastructure for golang based packages.
>
> I have tested this new infrastructure against the docker series of packages:
>
> https://github.com/paralin/buildroot/commits/docker-package-infra
>
>  - https://github.com/paralin/buildroot/commit/74a1dd8913409b65a230c7c15acfd2df8fdc3d50
>  - https://github.com/paralin/buildroot/commit/3873fdf90c4900fba2b27097eecdaadb73816ce3
>  - https://github.com/paralin/buildroot/commit/c2a73eef568f9c6f656cf3344e2f6005cec8f5ca
>
> In general though the changes seem to just be:
>
> diff --git a/package/docker-engine/docker-engine.mk
> b/package/docker-engine/docker-engine.mk
> index 8494efdce7..70ab4a531a 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -11,7 +11,7 @@ DOCKER_ENGINE_SITE = $(call
> github,docker,docker-ce,$(DOCKER_ENGINE_VERSION))
>  DOCKER_ENGINE_LICENSE = Apache-2.0
>  DOCKER_ENGINE_LICENSE_FILES = LICENSE
>
> -DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
> +DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
>
>  DOCKER_ENGINE_GOPATH = "$(@D)/gopath"
>  DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> @@ -138,4 +138,4 @@ define DOCKER_ENGINE_INSTALL_TARGET_CMDS
>   )
>  endef
>
> -$(eval $(generic-package))
> +$(eval $(golang-package))
>
> While the package infra code itself works fine in this case because I
> override almost everything in these packages, I am skeptical of how
> useful it would be in the general case for the following reasons:
>
>  - The go code is already pretty succinct, aside from having a
> dependency on host-go which looks just fine to me.
>  - Go packages often do not have their main package in the root of the
> repo. You need to allow package developers to specify multiple targets
> in subdirs, like cmd/hyperkube, cmd/kubelet, etc.

Yes right. I actually changed the logic of the build phase to use the
go build/install to take advantage of the go building system.

>  - Typically executables exist under a cmd/${executable} path which is
> nice and predictable. I would almost make the default build path
> cmd/kubelet.

I think with should stick with standard go rules for packages. Usually
packages are installed in GOPATH/bin when crosscompilation is not
enabled or GOPATH/bin/$GOOS_$GOARCH/ when crosscompilation is enabled,
stating to the go manual.
I think that simply using go install should be sufficient. The only
problem remaining could be that a package that needs to install
multiple binaries in the host or target directory should implement a
host/target install step and can't use the default one.


> - Is  CGO_NO_EMULATION=1  necessary? I use it in docker-engine, not sure why.

Unfortunately I cannot find any information about this variable or
google nor the manual. I don't think it makes something.

> - Please add a mechanism to specify Go build tags

Will do.

> - In terms of gopath, determining the path to the executable / the
> location inside the gopath is scary to me. Can we please set it
> explicitly in Go packages? Like
> RUNC_GO_PATH=github.com/opencontainers/runc - please see the runc.mk
> file and make a proposed revision to that as well as flannel.

It is already provided by the GO_FOO_GO_SRC_PATH variable.
Btw I think that there is no problem in guessing the path cause all
the projects I worked with use the domain/vendor/software convention.


> Overall I think it works and may potentially be useful but at the
> moment it doesn't do enough to merit adding an entire new package
> infrastructure for it, if I'm going to override 99% of it anyway. All
> it does right now for every go package I've tried it on is remove the
> host-go dependency, which I almost like having because it's more
> explicit. Otherwise in these cases I've had to hand override most of
> the infra because Go packages do not conform to as typical of a format
> as autotools or cmake.

I will do a respin of the series with the runc package converted to
the golang infrastructure and you will find it much smaller!

>
> Thanks!
> Christian Stewart



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
