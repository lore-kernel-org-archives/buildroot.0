From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 23:37:08 +0200
Subject: [Buildroot] [PATCH 3/9] docker-engine: add support for init
	processes
In-Reply-To: <20170920030210.19446-4-christian@paral.in>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-4-christian@paral.in>
Message-ID: <859c9ec7-7a17-cfef-ac9f-8982d8f8c086@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 05:02, Christian Stewart wrote:
> When a docker container is run with the --init flag, the Docker engine
> uses the docker-init binary as PID 1 inside the container. This is
> necessary in may cases to avoid issues with signal handling, zombie
> processes, and other quirks when running as PID 1.
> 
> The docker-init binary is backed by tini on default, but optionally can
> be changed to docker-init by user preference.

 OK, now I get the reason to build dumb-init statically: it actually comes from
outside the container, not inside. Honestly I don't understand why it takes an
executable from outside the container to run inside it, but OK.

> 
> Furthermore, this patch fixes the following Docker error:
> 
>   dockerd: level=warning msg="failed to retrieve docker-init version"

 On my Debian system there is no docker-init but I don't get this warning when
starting docker...


> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Small nit below.

> ---
>  package/docker-engine/Config.in        | 26 ++++++++++++++++++++++++++
>  package/docker-engine/docker-engine.mk | 11 +++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index 05670a716e..7d9a87f7bb 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -33,6 +33,32 @@ config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
>  
>  if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
>  
> +choice
> +	bool "docker-init to use"
> +	default BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
> +	help
> +	  The docker engine uses a minimal init process as PID 1
> +	  inside containers. There are several implementations
> +	  of this init process.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
> +	bool "tini"
> +	select BR2_PACKAGE_TINI
> +	help
> +	  Use Tini as the container init process.
> +
> +	  https://github.com/krallin/tini

 Upstream URL is not needed here, only in the package itself.

 It might be useful to add some help text that indicates the difference between
tini and dumb-init.


 Regards,
 Arnout


> +
> +config BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT
> +	bool "dumb-init"
> +	select BR2_PACKAGE_DUMB_INIT
> +	help
> +	  Use dumb-init as the container init process.
> +
> +	  https://github.com/Yelp/dumb-init
> +
> +endchoice
> +
>  config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
>  	bool "btrfs filesystem driver"
>  	depends on BR2_USE_MMU # btrfs-progs
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 8928f072e7..a2776ed78c 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -50,6 +50,13 @@ endif
>  ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
>  DOCKER_ENGINE_BUILD_TAGS += daemon
>  DOCKER_ENGINE_BUILD_TARGETS += dockerd
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT),y)
> +DOCKER_ENGINE_INIT = dumb-init
> +else
> +DOCKER_ENGINE_INIT = tini
> +endif
> +
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
> @@ -119,6 +126,10 @@ define DOCKER_ENGINE_INSTALL_TARGET_CMDS
>  	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
>  		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
>  	)
> +
> +	$(if $(filter $(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y), \
> +		ln -fs $(DOCKER_ENGINE_INIT) $(TARGET_DIR)/usr/bin/docker-init
> +	)
>  endef
>  
>  $(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
