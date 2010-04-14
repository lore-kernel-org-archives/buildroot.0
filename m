From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:26:19 +0200
Subject: [Buildroot] [PATCH 05/41] package: Add $(HOST_DIR)/usr/lib to
 LD_LIBRARY_PATH for host but not target
In-Reply-To: <1271199974-30434-6-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-6-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414152619.418da04a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Apr 2010 01:05:38 +0200
llandwerlin at gmail.com wrote:

> Adding $(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for target compilation
> might break the link step by mixing host libraries and target
> binaries.

I'm sorry but I think that this doesn't work. When you are compiling
target packages, the build process might use host utilities installed
into $(HOST_DIR)/usr/bin, and these host utilities might in turn rely in
libraries installed into $(HOST_DIR)/usr/lib. So even when compiling
target things, $(HOST_DIR)/usr/lib must be in the PATH.

See
http://git.buildroot.net/buildroot/commit/?id=c1b6242fdcf2cff7ebf09fec4cc1be58963e8427

(Another solution might be to try compiling all host binaries with an
rpath set to $(HOST_DIR)/usr/lib, but that may be difficult with
some build systems).

> diff --git a/package/Makefile.in b/package/Makefile.in
> index 983caf3..66cf61d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -205,21 +205,20 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  		NM_FOR_TARGET="$(TARGET_NM)" \
>  		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
>  		DEFAULT_LINKER="$(TARGET_LD)" \
> +		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \

Why ?

> -		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \

See above why we need it.

>  TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
> -
> LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \

Same thing.

> PERLLIB="$(HOST_DIR)/usr/lib/perl" 
>  HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
> @@ -257,9 +256,11 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
>  		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
>  		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
>  		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
> +		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \

For the host this seems to make sense, but what problem does it fix ?

> +
> LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" 

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
