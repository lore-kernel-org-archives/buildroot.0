From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 23:53:05 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/docker-containerd:
 converting to golang infrastructure
In-Reply-To: <1520461179-31679-6-git-send-email-angelo@amarulasolutions.com>
References: <1520461179-31679-1-git-send-email-angelo@amarulasolutions.com>
 <1520461179-31679-6-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180330235305.78569cc7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

I'm now looking at your patch series, hoping to make good progress with
it as part of the hackathon. I have one question below.

On Wed,  7 Mar 2018 23:19:37 +0100, Angelo Compagnucci wrote:

> -define DOCKER_CONTAINERD_CONFIGURE_CMDS
> -	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
> -	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> -	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
> -	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
> +define DOCKER_CONTAINERD_LINK_DIR
> +	ln -sf $(@D) $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> +	mkdir -p $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
> +	ln -s $(RUNC_SRCDIR) $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc

I am a bit confused by this symlink to the runc package source
directory. Indeed, the docker-containerd package does not depend on
runc from a build dependency point of view. It does select runc at the
Config.in level, but that doesn't guarantee that runc will be
built/extracted before docker-containerd. And therefore, this symlink
might point to a non-existing directory.

Am I missing something ? How does it work ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
