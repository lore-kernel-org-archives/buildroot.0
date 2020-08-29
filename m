From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 15:01:51 +0200
Subject: [Buildroot] [PATCH v4 3/7] package/docker-containerd: fix
 go-module package identifier/target
In-Reply-To: <20200813213220.260112-3-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
 <20200813213220.260112-3-christian@paral.in>
Message-ID: <20200829150151.1cc117b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 14:32:16 -0700
Christian Stewart <christian@paral.in> wrote:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-containerd/docker-containerd.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
> index 5a44489065..8b17e6997a 100644
> --- a/package/docker-containerd/docker-containerd.mk
> +++ b/package/docker-containerd/docker-containerd.mk
> @@ -9,13 +9,14 @@ DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINER
>  DOCKER_CONTAINERD_LICENSE = Apache-2.0
>  DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
>  
> -DOCKER_CONTAINERD_WORKSPACE = vendor
> -
> +DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd

So I've split this into two patches:

 - One adding the GOMOD variable, which was committed *before* the
   changes in the golang-package infrastructure.

 - One dropping the WORKSPACE variable, which was committed *after* the
   changes in the golang-package infrastructure.

This allows the series to be bisectable.

>  DOCKER_CONTAINERD_LDFLAGS = \
> -	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
> -
> -DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
> +	-X $(DOCKER_CONTAINERD_GOMOD).GitCommit=$(DOCKER_CONTAINERD_VERSION)
>  
> +DOCKER_CONTAINERD_BUILD_TARGETS = \
> +	$(DOCKER_CONTAINERD_GOMOD)/cmd/ctr \
> +	$(DOCKER_CONTAINERD_GOMOD)/cmd/containerd \
> +	$(DOCKER_CONTAINERD_GOMOD)/cmd/containerd-shim

I've dropped this entire changed, this the GOMOD is now pre-pended to
the BUILD_TARGETS by the golang-package infra.

I'm not going to comment on the other patches in the series, since the
changes I did were pretty much the same.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
