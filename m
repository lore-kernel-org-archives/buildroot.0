From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 14:51:26 +0200
Subject: [Buildroot] [v2 1/1] package/bat: new package
In-Reply-To: <74538af2-c667-e50e-4cbb-681957f67a2d@gmail.com>
References: <20200327174035.11503-1-david.pierret@smile.fr>
 <74538af2-c667-e50e-4cbb-681957f67a2d@gmail.com>
Message-ID: <20200727145126.76b6ff3d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 22:18:29 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> David, can you add some details about the issue with CC_<target> ?
> 
> It would be great if you can use the upcoming cargo package infra, but this
> infra doesn't handle CC_<target>.
> 
> As you noticed the build fail because we need to set CC_aarch64-none-linux-gnu
> environment variable for aarch64 target build.
> 
> Arnout, Patrick. It seems David discovered a cross-compilation issue with cargo.
> I reproduced the issue, cargo is using the host compiler instead of the
> cross-compiler:
> 
> error: failed to run custom build command for `libloading v0.5.2`
> 
> Caused by:
>   process didn't exit successfully:
> `/home/naourr/buildroot/test/bat/build/bat-0.13.0/target/release/build/libloading-0c8de6c7b10afd2b/build-script-build`
> (exit code: 1)
> --- stdout
> cargo:rustc-link-lib=dl
> TARGET = Some("x86_64-unknown-linux-gnu")
> OPT_LEVEL = Some("3")
> HOST = Some("x86_64-unknown-linux-gnu")
> CC_x86_64-unknown-linux-gnu = None
> CC_x86_64_unknown_linux_gnu = None
> HOST_CC = None
> CC = Some("/home/naourr/buildroot/test/bat/host/bin/aarch64-none-linux-gnu-gcc")
> CFLAGS_x86_64-unknown-linux-gnu = None
> CFLAGS_x86_64_unknown_linux_gnu = None
> HOST_CFLAGS = None
> CFLAGS = Some("-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -Os  ")
> CRATE_CC_NO_DEFAULTS = None
> DEBUG = Some("false")
> CARGO_CFG_TARGET_FEATURE = Some("fxsr,sse,sse2")
> running: "/home/naourr/buildroot/test/bat/host/bin/aarch64-none-linux-gnu-gcc"

The selected compiler is correct!

> "-O3" "-ffunction-sections" "-fdata-sections" "-fPIC" "-m64"

However, probably due to the TARGET value being wrong, an invalid -m64
option was passed here.

That being said, I applied this patch, dropped the CC_something hack to
reproduce the problem... and it doesn't appear anymore. Could you see
if it also work for you now ?

Note that I did not even update the "bat" version, but it anyway uses a
newer version of libloading: it uses 0.5.2 here, while in your case, it
was using 0c8de6c7b10afd2b (which oddly enough is not a valid commit in
the rust_libloading Github repository).

Could you double check that this issue still exists ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
