From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 22:30:02 +0200
Subject: [Buildroot] [PATCH] toolchain-external: adjust logic for musl
 dynamic linker symlink
In-Reply-To: <20170618201157.1930-1-thomas.petazzoni@free-electrons.com>
References: <20170618201157.1930-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170618203002.GT2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-06-18 22:11 +0200, Thomas Petazzoni spake thusly:
> This commit changes the strategy to know what symlink should be
> created for the musl dynamic linker. For now, we have in Buildroot the
> logic to decide what the symlink name should be. However, despite
> numerous fixes, there are still some cases that are missing, such as
> mips64el-n32, where the symlink is ld-musl-mipsn32el.so.1.
> 
> So, instead of trying to make Buildroot aware of all the possible
> names, simply get it from the external toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 856be65..83bfc13 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -477,21 +477,10 @@ endef
>  # of the dynamic library loader. We just need to create a symbolic
>  # link to libc.so with the appropriate name.
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> -ifeq ($(BR2_i386),y)
> -MUSL_ARCH = i386
> -else ifeq ($(BR2_ARM_EABIHF),y)
> -MUSL_ARCH = armhf
> -else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
> -MUSL_ARCH = mips-sf
> -else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
> -MUSL_ARCH = mipsel-sf
> -else ifeq ($(BR2_sh),y)
> -MUSL_ARCH = sh
> -else
> -MUSL_ARCH = $(ARCH)
> -endif
>  define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> -	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
> +	SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> +	LD_MUSL_SYMLINK="`basename $${SYSROOT_DIR}/lib/ld-musl*.so*`" ; \
> +	ln -sf libc.so $(TARGET_DIR)/lib/$${LD_MUSL_SYMLINK}

I am not too fond of wildcard-matching. Instead, we could probalby build
a simple file and extract the interpreter from the generated bunary;

    $(CROSS)-gcc -o foo -xc - <<<'int main() { return 0; }'
    LD_MUSL_SYMLINK=$$(\
        LC_ALL=C $(CROSS)-readelf -a foo \
        |sed -r -e '/.*Requesting program interpreter: (.+)\]$/!d; s//\1/'
    )
    rm foo

or something along those lines (unfortunately, readelf can't read from
stdin, and wants a real file (not a pipe) as input)...

Regards,
Yann E. MORIN.

>  endef
>  endif
>  
> -- 
> 2.9.4
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
