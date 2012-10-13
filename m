From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2012 11:35:58 +0200
Subject: [Buildroot] [PATCH] toolchain: have check_glibc to search
 deeper for ld-linux
In-Reply-To: <1350073550-779-1-git-send-email-jean-mickael.guerin@6wind.com>
References: <1350073550-779-1-git-send-email-jean-mickael.guerin@6wind.com>
Message-ID: <507935FE.4010500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/12 22:25, Jean-Mickael Guerin wrote:
> ld-linux*.so may not be present in lib/ directory, it could be
> in lib32 and/or lib64 only. But check_glibc reports
> "Incorrect selection of the C library" in this case, which is
> not true.
> Fixed by extending the search to  SYSROOT/*/*.
>
> Signed-off-by: Jean-Mickael Guerin<jean-mickael.guerin@6wind.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   toolchain/helpers.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index d5ab91b..497cfff 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -196,7 +196,7 @@ check_glibc_feature = \
>   #
>   check_glibc = \
>   	SYSROOT_DIR="$(strip $1)"; \
> -	if test `find $${SYSROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
> +	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \

  Maybe it's better to search in /lib*/ ?  Not that it really matters that much.

  Regards,
  Arnout

>   		echo "Incorrect selection of the C library"; \
>   		exit -1; \
>   	fi; \

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
