From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 16 Jan 2019 23:15:12 +0100
Subject: [Buildroot] [PATCH v6 7/7] package/llvm: disable libxml2
In-Reply-To: <1546552368-50707-7-git-send-email-matthew.weber@rockwellcollins.com>
References: <1546552368-50707-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1546552368-50707-7-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <10f3bc49-5150-1314-b625-67e41b3edb5a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 03/01/2019 ? 22:52, Matt Weber a ?crit?:
> libxml2 is needed during Windows builds to populate the COFF
> file manifest info
> 
> If left enabled, a dependency would need to be added and paths
> set for libxml2 include and library paths. This isn't require at
> this point for Linux builds.

It seems not really useful to add these options if it's only used for Windows build.

> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> This change was discovered during testing of compiler-rt
> patchset.  This patch could be independently applied.
> 
> Romain, hopefully you are able to verify this resolves the path
> posioning you observed with the target build and libxml2.

Sorry but this patch is not enough to fix the path poisoning issue.
Hopefully my patch [1] will do it.

[1] http://patchwork.ozlabs.org/patch/1026229/

Best regards,
Romain

> 
> v4
>  - New patch
> 
> v5
>  - Rebased post 2018.11 on master
> ---
>  package/llvm/llvm.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 2973689..5174be3 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -123,6 +123,11 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
>  HOST_LLVM_DEPENDENCIES += host-zlib
>  LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=OFF
>  
> +# libxml2 can be disabled as it is used for LLVM Windows builds where COFF
> +# files include manifest info
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
> +LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
> +
>  # We don't use llvm for static only build, so enable PIC
>  HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
>  LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
> 
