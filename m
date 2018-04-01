From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:48:57 +0200
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <20180228173852.66069-1-charles.hardin@storagecraft.com>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
Message-ID: <20180402004857.7e7e46c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

Eric: could you review the patch below ?

On Wed, 28 Feb 2018 09:38:52 -0800, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> Noticed that building the LLVM build -DCMAKE_CXX_COMPILER=c++
> during the rust build which the C compiler was set to the
> expected buildroot compiler.

I am sorry, but I don't understand this sentence. Could you explain in
more details what is going on ?

> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index ff2634b996..9ea4c79af5 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -62,7 +62,10 @@ define HOST_RUST_CONFIGURE_CMDS
>  		echo '[rust]'; \
>  		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
>  		echo '[target.$(RUSTC_TARGET_NAME)]'; \
> -		echo 'cc = "$(TARGET_CROSS)gcc"'; \
> +		if [ "x$(RUSTC_HOST_NAME)" != "x$(RUSTC_TARGET_NAME)" ]; then \
> +			echo 'cc = "$(TARGET_CROSS)gcc"'; \
> +			echo 'cxx = "$(TARGET_CROSS)g++"'; \
> +		fi; \

This is doing two things:

 1. Defining cxx, like the commit title says

 2. Only defining cc and cxx when RUSTC_HOST_NAME and
    RUSTC_TARGET_NAME, which is not explained anywhere.

Could you clarify what this patch does, and why it is needed, with a
better commit log ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
