From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:04:59 +0100
Subject: [Buildroot] Building cargo with per-package directories
In-Reply-To: <20181212225041.GA15035@itchy>
References: <20181211171252.02ddb571@windsurf> <20181211212705.GA13119@itchy>
 <20181212225041.GA15035@itchy>
Message-ID: <20181213210459.78bc90ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Wed, 12 Dec 2018 23:50:41 +0100, Eric Le Bihan wrote:

> The build ended as expected.
> 
> ```
>   = note: /usr/bin/ld: cannot find -lhttp_parser
>           collect2: error: ld returned 1 exit status
> ```
> 
> The library libhttp_parser.so is required by one of the dependencies of
> cargo: libgit2-sys, which provides the Rust interface to libgit2.
> 
> There is trick in vendor/libgit2-sys/build.rs to handle
> libhttp_parser.so: if the pkgconfig file of libgit2 contains -lhttp_parser,
> then pass it to rustc via "cargo:rustc-link-lib=http_parser".
> 
> See "Outputs of the Build Script" in Cargo Book [1] for details.
> 
> We want to use per-package/host-cargo/host/lib/libhttp_parser.so. Adding
> "-Clink-arg=-L$(HOST_DIR)/lib" to the RUSTFLAGS environment variable
> solves the issue on my system:
> 
> ```
> diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
> index 1b1053ba41..891901578e 100644
> --- a/package/cargo/cargo.mk
> +++ b/package/cargo/cargo.mk
> @@ -70,7 +70,7 @@ HOST_CARGO_SNAP_OPTS = \
>  	$(if $(VERBOSE),--verbose)
> 
>  HOST_CARGO_ENV = \
> -	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
> +	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib -Clink-arg=-L$(HOST_DIR)/lib" \
>  	CARGO_HOME=$(HOST_CARGO_HOME)

Thanks a lot for this investigation and solution. I will definitely
have a look and see how it goes. Many, many thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
