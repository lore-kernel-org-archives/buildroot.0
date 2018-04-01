From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 14:25:58 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: use 'build' instead
 of 'install'
In-Reply-To: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180401122558.GB2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-01 13:51 +0200, Thomas Petazzoni spake thusly:
> So far, we were using the 'go install' mechanism to build a package
> and have its binary installed in
> $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH). This worked fine when
> building on x86-64 for ARM, but failed when building on x86-64 for
> x86-64 because the binaries were installed in $$($(2)_WORKSPACE)/bin/.
> 
> Instead of doing some complicated logic to guess whether Go is going
> to put our binaries in $$($(2)_WORKSPACE)/bin/ or in
> $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH), we revert back to using
> "go build", as it was done before the introduction of the golang
> package infrastructure. "go build" lets us pass explicitly the
> destination path of the binary to be generated.
> 
> There's just one complexity with how to decide on the name of the
> binary that should be produced, and we have two cases:
> 
>  - <pkg>_BUILD_TARGETS is the default, i.e ".". In this case we assume
>    a single binary is produced by "go build", and we name if after the
>    lower case package name. We allow this to be overridden thanks to
>    <pkg>_BIN_NAME.
> 
>  - <pkg>_BUILD_TARGETS is non-default, and typically contains
>    something like "foo bar" or "cmd/foo cmd/bar". In this case, we
>    assume the binaries to be produced are "foo" and "bar", i.e we take
>    the non-directory part of the build target to name the binaries.
> 
> Because we're using this -o option, we no longer need to explicitly
> create the binary directory, it is done by "go build".
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1f9cd7c48e8c8f41326632a9c0de83915d72c45b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-golang.txt | 13 ++++++++++++-
>  package/pkg-golang.mk                  | 26 ++++++++++++++------------
>  2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
> index b6d1f5e6b4..efcf696867 100644
> --- a/docs/manual/adding-packages-golang.txt
> +++ b/docs/manual/adding-packages-golang.txt
> @@ -86,7 +86,18 @@ therefore only use a few of them, or none.
>  
>  * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
>    should be built. If +FOO_BUILD_TARGETS+ is not specified, it
> -  defaults to +.+.
> +  defaults to +.+. We then have two cases:
> +
> +** +FOO_BUILD_TARGETS+ is +.+. In this case, we assume only one binary
> +   will be produced, and that by default we name it after the package
> +   name. If that is not appropriate, the name of the produced binary
> +   can be overridden using +FOO_BIN_NAME+.
> +
> +** +FOO_BUILD_TARGETS+ is not +.+. In this case, we iterate over the
> +   values to build each target, and for each produced a binary that is
> +   the non-directory component of the target. For example if
> +   +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+ the binaries produced
> +   are +docker+ and +dockerd+.
>  
>  * +FOO_INSTALL_BINS+ can be used to pass the list of binaries that
>    should be installed in +/usr/bin+ on the target. If
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index f51b2ee2e0..c21be86a55 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -62,12 +62,16 @@ $(2)_DEPENDENCIES += host-go
>  
>  $(2)_BUILD_TARGETS ?= .
>  
> -$(2)_INSTALL_BINS ?= $(1)
> +# If the build target is just ".", then we assume the binary to be
> +# produced is named after the package. If however, a build target has
> +# been specified, we assume that the binaries to be produced are named
> +# after each build target building them (below in <pkg>_BUILD_CMDS).
> +ifeq ($$($(2)_BUILD_TARGETS),.)
> +$(2)_BIN_NAME ?= $(1)
> +endif
>  
> -# The go build/install command installs the binaries inside
> -# gopath/bin/linux_GOARCH/ when cross compilation is enabled. We set this
> -# variable here to be used by packages if needed.
> -$(2)_BINDIR = $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH)
> +$(2)_BINDIR = bin
> +$(2)_INSTALL_BINS ?= $(1)
>  
>  # Source files in Go should be extracted in a precise folder in the hierarchy
>  # of GOPATH. It usually resolves around domain/vendor/software. By default, we
> @@ -84,17 +88,13 @@ $(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)
>  # file.
>  ifndef $(2)_CONFIGURE_CMDS
>  define $(2)_CONFIGURE_CMDS
> -	mkdir -p $$(@D)/$$($(2)_WORKSPACE)/bin
>  	mkdir -p $$(dir $$($(2)_SRC_PATH))
>  	ln -sf $$(@D) $$($(2)_SRC_PATH)
>  endef
>  endif
>  
> -# Build step. Only define it if not already defined by the package .mk file. We
> -# use the install command instead of build command here because the install
> -# command just moves the package binaries into <workspace>/bin/linux_GOARCH/.
> -# This leverages the go build infrastructure for building and installing
> -# multiple binaries.
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
>  ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>  	$$(foreach d,$$($(2)_BUILD_TARGETS),\
> @@ -102,7 +102,9 @@ define $(2)_BUILD_CMDS
>  		$$(GO_TARGET_ENV) \
>  			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>  			$$($(2)_GO_ENV) \
> -			$$(GO_BIN) install -v $$($(2)_BUILD_OPTS) ./$$(d)
> +			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
> +			-o $$(@D)/$$($(2)_BINDIR)/$$(if $$($(2)_BIN_NAME),$$($(2)_BIN_NAME),$$(notdir $$(d))) \
> +			./$$(d)
>  	)
>  endef
>  endif
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
