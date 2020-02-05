From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 10:37:39 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200204100733.22106-1-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
Message-ID: <20200205103739.62be0ec6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

Thanks for the new iteration. However, one question remains. See below.

On Tue,  4 Feb 2020 11:07:31 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

>  # Patched erts/aclocal.m4
> -ERLANG_AUTORECONF = YES
> +define ERLANG_RUN_AUTOCONF
> +	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
> +endef
> +HOST_ERLANG_DEPENDENCIES = host-autoconf
> +ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
> +
> +define ERLANG_RUN_SAVE_BOOTSTRAP
> +	cd $(@D) && PATH=$(BR_PATH) ./otp_build save_bootstrap
> +endef

Why is this save_bootstrap now needed ? Looking at HOWTO/INSTALL.md in
the Erlang source code shows:

"""

#### Pre-built Source Release ####

The source release is delivered with a lot of platform independent
build results already pre-built. If you want to remove these pre-built
files, invoke `./otp_build remove_prebuilt_files` from the `$ERL_TOP`
directory. After you have done this, you can build exactly the same way
as before, but the build process will take a much longer time.

> *WARNING*: Doing `make clean` in an arbitrary directory of the source
> tree, may remove files needed for bootstrapping the build.
>
> Doing `./otp_build save_bootstrap` from the `$ERL_TOP` directory before
> doing `make clean` will ensure that it will be possible to build after
> doing `make clean`. `./otp_build save_bootstrap` will be invoked
> automatically when `make` is invoked from `$ERL_TOP` with either the
> `clean` target, or the default target. It is also automatically invoked
> if `./otp_build remove_prebuilt_files` is invoked.
>
> If you need to verify the bootstrap beam files match the provided
> source files, use `./otp_build update_primary` to create a new commit that
> contains differences, if any exist.

"""

Which doesn't really help in understanding why we need to call this
save_bootstrap action in the context of Buildroot. It definitely
warrants an explanation in the commit log and a small comment above the
code. No need to resend a new iteration of the entire patch series,
just give some more details by e-mail, I can amend the patch when
applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
