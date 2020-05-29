From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:14:01 +0200
Subject: [Buildroot] [for-next] package/rust: allow using python3
 interpreter
In-Reply-To: <20200526182037.592824-1-romain.naour@gmail.com>
References: <20200526182037.592824-1-romain.naour@gmail.com>
Message-ID: <20200529231401.4c66c5d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Tue, 26 May 2020 20:20:37 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Fedora packaging use python3 as python interpreter since rust 1.24.0 [1]
> by removing python2 tests from configure script [2].
> 
> Using python3 will help to remove python2 in a near future.
> 
> [1] https://src.fedoraproject.org/rpms/rust/c/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2
> [2] https://src.fedoraproject.org/rpms/rust/blob/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2/f/rust.spec#_314
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Titouan Christophe <titouan.christophe@railnova.eu>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Patrick Havelange <patrick.havelange@essensium.com>

Thanks, I have applied to next, but I have a few comments/questions,
see below.

> diff --git a/package/rust/0002-configure-use-default-python-interpreter.patch b/package/rust/0002-configure-use-default-python-interpreter.patch
> new file mode 100644
> index 0000000000..34d97bb4cf
> --- /dev/null
> +++ b/package/rust/0002-configure-use-default-python-interpreter.patch
> @@ -0,0 +1,37 @@
> +From aca7abb537f5caf1c9f027cf65dd0f53fb664e73 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 26 May 2020 18:24:25 +0200
> +Subject: [PATCH] configure: use default python interpreter
> +
> +Don't try to use python2 if available, use the python interpreter available
> +in ouput/host/bin/python whateverer the python version is.
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + configure | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/configure b/configure
> +index eeb8d081d34..6014a982f47 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2,16 +2,4 @@
> + 
> + script="$(dirname $0)"/src/bootstrap/configure.py
> + 
> +-try() {
> +-    cmd=$1
> +-    shift
> +-    T=$($cmd --version 2>/dev/null)
> +-    if [ $? -eq 0 ]; then
> +-        exec $cmd "$script" "$@"
> +-    fi
> +-}
> +-
> +-try python2.7 "$@"
> +-try python27 "$@"
> +-try python2 "$@"
> + exec python $script "$@"

Shouldn't we try to find an upstreamable solution here, such as perhaps
a PYTHON environment variable, or an argument to configure that allows
to specify the path to the Python interpreter ?

But in fact, this path to the Python interpreter is already in the
config.toml file that we generate, why isn't this path used ?

> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 5d14fc6682..25153966f2 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -17,9 +17,16 @@ HOST_RUST_DEPENDENCIES = \
>  	host-rust-bin \
>  	host-cargo-bin \
>  	host-openssl \
> -	host-python \
>  	$(BR2_CMAKE_HOST_DEPENDENCY)
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> +HOST_RUST_DEPENDENCIES += host-python3
> +else
> +HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> +HOST_RUST_DEPENDENCIES += host-python
> +endif

I think we should start inverting this logic, i.e use host-python3 by
default if there is no python interpreter selected for the target. We
should do that not only here, but in all packages that have a logic
like that: python3 should become our default, and python2 should become
the exception.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
