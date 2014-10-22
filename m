From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 18:27:30 +0200
Subject: [Buildroot] [PATCH v4] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5447DAF2.1070504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/14 11:40, Vicente Olivert Riera wrote:
> bash fails to link for static builds with uClibc toolchains due to
> getenv redefinitions. This is caused because bash is unable to check if
> getenv is already defined when cross-compiling, so it defaults to 'yes':
> 
> configure:14438: WARNING: cannot check getenv redefinition if cross
> compiling -- defaulting to yes
> 
> We can avoid this redefinition by passing bash_cv_getenv_redef=no to the
> configure script.
> 
> Related:
> 	http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/a20/a2007e6dbcfe53e7cd837ae642869ee26376826a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Small additional remark...

> ---
>  package/bash/bash.mk |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 34a3a73..5eec3cc 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -28,6 +28,17 @@ BASH_MAKE = $(MAKE1)
>  # The static build needs some trickery
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
> +# bash wants to redefine the getenv() function. To check whether this is
> +# possible, AC_TRY_RUN is used which is not possible in
> +# cross-compilation.
> +# On uClibc, redefining getenv is not possible; on glibc and musl it is.

 I failed to notice earlier: glibc is not available on static builds so it
doesn't make a lot of sense to mention it here.


 Regards,
 Arnout

> +# Related:
> +# http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +BASH_CONF_ENV += bash_cv_getenv_redef=no
> +else
> +BASH_CONF_ENV += bash_cv_getenv_redef=yes
> +endif
>  endif
>  
>  # Make /bin/sh -> bash (no other shell, better than busybox shells)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
