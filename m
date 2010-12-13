From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 22:26:39 +0100
Subject: [Buildroot] [PATCH] toolchain: speed up sysroot lib copying
In-Reply-To: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
References: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101213222639.5455b0aa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:25:20 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> The copy_toolchain_lib_root helper searches the entire sysroot, but is
> only interested in files in certain subdirs.  So rather than waste time
> in walking the entire tree, walk the few subdirs at the depth level we
> are actually going to be poaching files from.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  toolchain/helpers.mk |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 05d43e7..674e7b4 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -24,7 +24,10 @@ copy_toolchain_lib_root = \
>  	STRIP="$(strip $4)"; \
>   \
>  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> -		find -L . -path "./lib/$${LIB}.*"     -o \
> +		find -L \
> +			  ./lib/ ./usr/lib/ ./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/ \
> +			  -maxdepth 1 \
> +			  -path "./lib/$${LIB}.*"     -o \
>  			  -path "./usr/lib/$${LIB}.*" -o \
>  			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
>  		)` ; \

Can't we replace the 3 -path conditions with a single -name "$${LIB}.*"
condition ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
