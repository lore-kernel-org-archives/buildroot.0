From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 May 2015 23:45:35 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_ABI flags to
 configure with --enable-cxx-flags
In-Reply-To: <1432625556-14611-1-git-send-email-jcmvbkbc@gmail.com>
References: <1432625556-14611-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <55663AFF.4090107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/15 09:32, Max Filippov wrote:
> libstdc++ is in all regards a normal library, it needs to be built with
> TARGET_ABI flags, otherwise linking it with other C++ code may fail.

 Then why only do it for xtensa? And why not pass the full TARGET_CFLAGS?

 Regards,
 Arnout

> 
> Pass TARGET_ABI flags to gcc-final configure script in the
> --enable-cxx-flags parameter.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
>   http://autobuild.buildroot.net/results/4943b214c29951ecc7af0a1f360b6454485c0b9b/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index d873aa6..8d7009b 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -185,4 +185,8 @@ endef
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
>  endif
>  
> +ifeq ($(BR2_xtensa),y)
> +HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
> +endif
> +
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
