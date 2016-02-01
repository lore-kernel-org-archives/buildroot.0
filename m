From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 15:38:39 +0100
Subject: [Buildroot] [PATCH v2 1/2] toolchain-external: add a check for
 unsupported toolchains
In-Reply-To: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
References: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201153839.6325ebba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon,  1 Feb 2016 14:40:16 +0100, Romain Naour wrote:

> Here is the sysroot directory tree for linaro 2015.11:
> $ ls libc/arm-linux-gnueabihf
> etc  lib  sbin  usr  var
> 
> Here is the sysroot directory tree for CodeSourcery standard:
> $ ls libc/sgxx-glibc
> etc  lib  lib64  sbin  usr  var
> 
> Usually the sysroot is located directly under libc directory
> $ ls libc/
> etc  lib  sbin  usr  var

I think this is not "usual", for example it's not the case for
Buildroot or Crosstool-NG toolchain.

> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 02cc0bb..fd99efe 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -418,6 +418,11 @@ check_unusable_toolchain = \
>  		echo "and contain a lot of pre-built libraries that would conflict with"; \
>  		echo "the ones Buildroot wants to build."; \
>  		exit 1; \
> +	fi; \
> +	non_existent_sysroot=`$${__CROSS_CC} -print-file-name=libc.a` ; \

The variable should not be named non_existent_sysroot since it may
exist. Also, you could use the existing toolchain_find_libc_a function,
no? So maybe:

	libc_a_path=$(call toolchain_find_libc_a,$${__CROSS_CC}) ; \

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
