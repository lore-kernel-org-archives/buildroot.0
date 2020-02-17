From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 17 Feb 2020 17:45:08 -0600
Subject: [Buildroot] [PATCH v2 01/10] package/pkg-cargo.mk: Introduce
 the cargo package infrastructure.
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <CAH=K+6k6oL_iutnW2yQ1PRiwrkngDyft=L+sGE+nmj+kX9nQZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On Fri, Feb 14, 2020 at 6:49 AM Patrick Havelange
<patrick.havelange@essensium.com> wrote:
>
> In order to be package agnostic, the install phase is now using
> cargo instead of install.
>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
>
> ---
> This is the V2 of the previously posted series :
> http://patchwork.ozlabs.org/project/buildroot/list/?series=156166&state=%2A&archive=both
>
> A lot of changes following the buildroot developer meeting's
> decisions from February 2020.
>
> Needs to be applied on top of the rust 1.40 bump
> ---
>  package/Makefile.in  |  1 +
>  package/pkg-cargo.mk | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 package/pkg-cargo.mk
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 285e2837ef..650d7c166e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -426,3 +426,4 @@ include package/pkg-kernel-module.mk
>  include package/pkg-waf.mk
>  include package/pkg-golang.mk
>  include package/pkg-meson.mk
> +include package/pkg-cargo.mk
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> new file mode 100644
> index 0000000000..2242f3a082
> --- /dev/null
> +++ b/package/pkg-cargo.mk
> @@ -0,0 +1,89 @@
> +################################################################################
> +# Cargo package infrastructure
> +#
> +# This file implements an infrastructure that eases development of package
> +# .mk files for Cargo packages. It should be used for all packages that use
> +# Cargo as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this Cargo infrastructure requires the .mk file
> +# to only specify metadata information about the package: name, version,
> +# download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different steps
> +# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
> +# it is used as the list of commands to perform to build the package,
> +# instead of the default Cargo behaviour. The package can also define some
> +# post operation hooks.
> +#
> +################################################################################
> +
> +################################################################################
> +# inner-cargo-package -- defines how the configuration, compilation and
> +# installation of a cargo package should be done, implements a few hooks
> +# to tune the build process for cargo specifities and calls the generic
> +# package infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-cargo-package
> +
> +# We need host-rustc to run cargo
> +$(2)_DEPENDENCIES += host-rustc
> +
> +$(2)_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo

Rust has the ability to use c code, and as such has to compile/link[1]
against it. To do this when cross compiling, it uses cargo's
`--target=<arch>` flag to find the compiler. This does not take into
account the vendor portion of the toolchain name, such as buildroot when
using an "internal" toolchain.

`cc-rs` allows the compiler to be passed down with the standard `CC`
variables, so we will need to add  $(TARGET_CONFIGURE_OPTS)
somewhere.

I just did a very quick test and put it here under $(2)_CARGO_ENV and
it worked when testing with the procs package at version v0.9.11 -
with the exact same $(eval $(cargo-package)) as ripgrep is in this
same series.

Let me know if you need more information, but this variable will pass
down those standard variables.

1: https://github.com/alexcrichton/cc-rs

-- 
Sam Voss | Sr. Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
Tel: +1 319 263 4039
sam.voss at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
