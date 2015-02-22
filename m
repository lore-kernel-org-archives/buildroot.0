From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 23:48:42 +0100
Subject: [Buildroot] [PATCH 1/2] [RFC] LLVM: Added package
In-Reply-To: <1424210576-18526-2-git-send-email-paul@crapouillou.net>
References: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
 <1424210576-18526-2-git-send-email-paul@crapouillou.net>
Message-ID: <20150222224842.GJ4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2015-02-17 23:02 +0100, Paul Cercueil spake thusly:
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
> new file mode 100644
> index 0000000..df0e582
> --- /dev/null
> +++ b/package/llvm/Config.in.host
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_HOST_LLVM
> +	bool "host llvm"
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
> +		BR2_i386 || BR2_x86_64 || \
> +		BR2_mips || BR2_mipsel || \
> +		BR2_mips64 || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_sparc

It would be nice to move all those dependency to their own symbol, like
so:

    config BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT
        bool
        default y
        depends on ....

and then have the main symbol simply depend on that.

This will be usefull in case other packages want to select host llvm;
they'd simply have to depend on BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT.

> diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
> new file mode 100644
> index 0000000..f641fc9
> --- /dev/null
> +++ b/package/llvm/llvm.hash
> @@ -0,0 +1 @@
> +sha256	bf3275d2d7890015c8d8f5e6f4f882f8cf3bf51967297ebe74111d6d8b53be15	llvm-3.5.1.src.tar.xz

Where did you get that sha1 from? If you computed it locally, say so. If
you grabbed it from upstream, say so an point to it.

> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> new file mode 100644
> index 0000000..e0a7ec2
> --- /dev/null
> +++ b/package/llvm/llvm.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# llvm
> +#
> +################################################################################
> +
> +LLVM_VERSION = 3.5.1
> +LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
> +LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> +LLVM_LICENSE = University of Illinois/NCSA Open Source License
> +LLVM_LICENSE_FILES = LICENSE.TXT
> +
> +HOST_LLVM_DEPENDENCIES = host-libxml2 host-zlib host-python
> +
> +ENABLED_TARGETS := $(ARCH),$(if $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600),r600)

Variables have only global scope, so they need to be prefixed with the
package name:

    HOST_LLVM_ENABLED_TARGETS = ...

> +HOST_LLVM_CONF_OPTS = --with-default-sysroot=$(STAGING_DIR) \
> +					  --enable-bindings=none \
> +					  --enable-targets=$(ENABLED_TARGETS) \
> +					  --target=$(GNU_TARGET_NAME)

It seems that, like me, you're using a 4-space tabs. In Buildroot, we
use an 8-char tab, so the above get mis-aligned.

I was confused as to why you needed to pass --target, as the
pkg-autotools infra already does it. But then I relaised you are
building a host package, and building a compiler, thus the need for
--target. I wonder if a comment about that would not be needed...

> +$(eval $(host-autotools-package))

I thought you were adding a target package, i.e. building libllvm (and
libclang) for the target. Is that what this is supposed to do?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
