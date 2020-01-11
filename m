From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:35:34 -0800
Subject: [Buildroot] [PATCH v2 1/6] package/go: implement go modules
 integration
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <CA+h8R2pi93BCfS+u43jvtdwj_-T1o8LEUtwGgfp2_ajQiGvWrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

A couple of notes on the below...

On Fri, Jan 10, 2020 at 8:13 PM Christian Stewart <christian@paral.in> wrote:
> +# used for the Go module and build cache
> +HOST_GO_GOPATH = $(DL_DIR)/go-module

The "pkg" directory will be placed here, inside which Go version
artifacts will be placed. It is not an issue that multiple packages
share the same GOPATH root.

Nothing will be placed in here with regards to Go modules at this time
since we are not downloading / extracting anything with the Go tool.

>  # For the convienience of target packages.

Spelling mistake: should be convenience.

> -# Configure step. Only define it if not already defined by the package .mk
> -# file.
> -ifndef $(2)_CONFIGURE_CMDS
> -define $(2)_CONFIGURE_CMDS
> -       mkdir -p $$(dir $$($(2)_SRC_PATH))
> -       ln -sf $$(@D) $$($(2)_SRC_PATH)

The configure step is removed. The below /could/ be done in place of
the old configure step, but I put it as a post-extract hook because it
must be done before "go mod vendor" which, although not part of this
commit, might be something we will include int he near future.

> +$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> +
> +# Correctly configure the go.mod and go.sum files for the module system.
> +# TODO: Perform the "go mod vendor" download step.
> +# Today, we still only support modules with a vendor/ tree in the source.
> +define $(2)_APPLY_EXTRACT_GOMOD

The lines below this one:

> +       if [ -f $$($(2)_PKGDIR)/go.mod ]; then \
> +               cp $$($(2)_PKGDIR)/go.mod $$(@D)/go.mod; \
> +               if [ -f $$(@D)/go.sum ]; then \
> +                       rm $$(@D)/go.sum; \
> +               fi; \
> +       fi; \
> +       if [ -f $$($(2)_PKGDIR)/go.sum ]; then \
> +               cp $$($(2)_PKGDIR)/go.sum $$(@D)/go.sum; \
> +       fi

... to this one, are unnecessary and can be removed. They copy a
"go.mod" and "go.sum" file from the package directory if they exist.
This is not used by any of the Buildroot packages today and is not
necessary to merge this patch.

> +       if [ ! -f $$(@D)/go.mod ] && [ -n "$$($(2)_GOMOD)" ]; then \
> +               printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
> +       fi

The above three lines create a go.mod file with the root module path
to inform the Go compiler of the name of the package at the root of
the source tree. These lines are necessary for those packages that
have vendor/ but no go.mod.

It's not an issue that this file will be a single line with the module
name in this case. The Go tool will understand it along with
"-mod=vendor" to mean that it should use the vendor tree.


>         $$(foreach d,$$($(2)_BUILD_TARGETS),\
> -               cd $$($(2)_SRC_PATH); \
> +               cd $$(@D); \

This should be $$($(2)_SRC_PATH) as before rather than $(@D), even
though $(@D) works, the change is not necessary.

>                 $$(GO_TARGET_ENV) \
> -                       GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>                         $$($(2)_GO_ENV) \
>                         $$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
>                         -o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
> -                       ./$$(d)
> +                       $$(d)

Here, we specify the Go module path to the compiler to build. This
looks like "go build github.com/myproject/mypackage".

So in summary, optional tweaks I suggest to the above before merge:

 - Use the SRC_PATH variable as mentioned above.
 - Remove the unnecessary copy of go.mod and go.sum from the Buildroot
package directory.
 - Consider creating the go.mod file in the Configure step rather than
a post-extract hook.

Best regards,
Christian
