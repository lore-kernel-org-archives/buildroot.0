From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Dec 2019 22:56:31 +0100
Subject: [Buildroot] [PATCH/next v2 1/1] package/grpc: bump to version
 1.25.0
In-Reply-To: <20191128231803.1351294-1-aduskett@gmail.com>
References: <20191128231803.1351294-1-aduskett@gmail.com>
Message-ID: <20191203215631.GA20811@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2019-11-28 15:18 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream patch 0004-Fix-gettid-naming-conflict.patch
>   - Remove upstream patch 0005-Rename-gettid-functions.patch
>   - Add a check for BR2_TOOLCHAIN_GCC_AT_LEAST_5 in grpc.mk. If the selected
>     toolchain is not at least version 5 or higher, set the GRPC_CFLAGS and
>     GRPC_CXXFLAGS optimizations to -O0. This check prevents the following error:
>       error: failure memory model cannot be stronger than success memory
>       model for '__atomic_compare_exchange'

Also:

  - since 1.24.0, gRPC now requires C++ for tiself, not only as
    inherited from protobuf

[--SNIP--]
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 569db12089..bc0bee10b1 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GRPC_VERSION = 1.23.0
> +GRPC_VERSION = 1.25.0
>  GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>  GRPC_LICENSE = Apache-2.0
>  GRPC_LICENSE_FILES = LICENSE
> @@ -43,11 +43,19 @@ GRPC_CFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
>  GRPC_CXXFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
>  endif
>  
> +# Toolchains older than gcc5 will fail to compile with -0s due to:
> +# error: failure memory model cannot be stronger than success memory model for
> +# '__atomic_compare_exchange'

This comment should got below, along with the gc-at-least condition, I
guess, no?

I've spawned a few tests to see if that bump could fix all the failures
I encounter on my autobuilder. I'll report back later.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  GRPC_CFLAGS += -O0
>  GRPC_CXXFLAGS += -O0
>  endif
>  
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
> +GRPC_CFLAGS += -O0
> +GRPC_CXXFLAGS += -O0
> +endif
> +
>  GRPC_CONF_OPTS += \
>  	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
>  	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
