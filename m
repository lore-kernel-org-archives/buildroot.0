From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 22:28:12 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20180727024720.13370-1-camh@xdna.net>
References: <20180727024720.13370-1-camh@xdna.net>
Message-ID: <20190407222812.570c91f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cam,

+Christian and Anisse in Cc.

Sorry for the very slow feedback.

On Fri, 27 Jul 2018 12:47:20 +1000
Cam Hutchison <camh@xdna.net> wrote:

> Allow the CGO_ENABLED variable to be controlled per package and per
> build target, instead of having the value determined by whether or not
> the toolchain has threads.
> 
> Some build targets may not build with CGO_ENABLED=1, so allowing a per
> package and build target override will allow those targets to be built
> with Buildroot.

Could you give some specific examples instead of the fuzzy "Some build
targets" wording ?

Christian, Anisse, what do you think about this patch ? Do we need
something like this in our Go support ?

I'm leaving the full patch below. You can also find it at
http://patchwork.ozlabs.org/patch/949972/.

Thanks!

Thomas

> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  docs/manual/adding-packages-golang.txt | 14 ++++++++++++++
>  package/pkg-golang.mk                  | 17 +++++++++++++++--
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
> index efcf696867..2683774861 100644
> --- a/docs/manual/adding-packages-golang.txt
> +++ b/docs/manual/adding-packages-golang.txt
> @@ -99,6 +99,20 @@ therefore only use a few of them, or none.
>     +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+ the binaries produced
>     are +docker+ and +dockerd+.
>  
> +* +FOO_CGO_ENABLED+ overrides the default value for the +CGO_ENABLED+
> +  flag passed to the Go compiler. By default +CGO_ENABLED+ is set
> +  to 1 if the toolchain supports threads, but you can force it to
> +  0 for the package by setting this variable. If the toolchain does
> +  not support threads and you set +FOO_CGO_ENABLED+ to 1, an error
> +  will be generated.
> +
> +* +FOO_BUILD_TARGET_CGO_ENABLED_<target>+ can be used to override
> +  the +CGO_ENABLED+ flag passed to the Go compiler for a specific
> +  build target, similar to +FOO_CGO_ENABLED+. +<target>+ references
> +  a target listed in +FOO_BUILD_TARGETS+. If the toolchain does
> +  not support threads and you set this variable to 1, an error will
> +  be generated.
> +
>  * +FOO_INSTALL_BINS+ can be used to pass the list of binaries that
>    should be installed in +/usr/bin+ on the target. If
>    +FOO_INSTALL_BINS+ is not specified, it defaults to the lower-case
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index bf178622b5..2be3bd4c14 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -28,8 +28,20 @@ GO_BIN = $(HOST_DIR)/bin/go
>  GO_TARGET_ENV = \
>  	$(HOST_GO_TARGET_ENV) \
>  	PATH=$(BR_PATH) \
> -	GOBIN= \
> -	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> +	GOBIN=
> +
> +# Allow CGO_ENABLED to be defined per package and per build target, but if
> +# CGO is enabled for a package or a build target and the toolchain does not
> +# support that, generate an error.
> +GO_CGO_ENABLED = $(strip \
> +	$(if $(filter 10,$($(1)_CGO_ENABLED)$(HOST_GO_CGO_ENABLED)),\
> +		$(error Toolchain does not support CGO_ENABLED=1 for package $(1)),\
> +		$(or $($(1)_CGO_ENABLED),$(HOST_GO_CGO_ENABLED))))
> +
> +GO_TARGET_CGO_ENABLED = $(strip \
> +	$(if $(filter 10,$($(1)_BUILD_TARGET_CGO_ENABLED_$(2))$(HOST_GO_CGO_ENABLED)),\
> +		$(error Toolchain does not support CGO_ENABLED=1 for target $(2)),\
> +		$(or $($(1)_BUILD_TARGET_CGO_ENABLED_$(2)),$(call GO_CGO_ENABLED,$(1)))))
>  
>  ################################################################################
>  # inner-golang-package -- defines how the configuration, compilation and
> @@ -100,6 +112,7 @@ define $(2)_BUILD_CMDS
>  	$$(foreach d,$$($(2)_BUILD_TARGETS),\
>  		cd $$($(2)_SRC_PATH); \
>  		$$(GO_TARGET_ENV) \
> +			CGO_ENABLED=$$(call GO_TARGET_CGO_ENABLED,$(2),$$(d)) \
>  			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>  			$$($(2)_GO_ENV) \
>  			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
