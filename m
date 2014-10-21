From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 22:50:11 +0200
Subject: [Buildroot] [PATCH] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <1413897705-47811-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413897705-47811-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5446C703.7070501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/14 15:21, Vicente Olivert Riera wrote:
> ...and also use configure options instead of environment variables.
> 
> bash fails to link for static builds with uClibc toolchains due to
> getenv redefinitions. This is caused because bash is unable to check if
> getenv is already defined when cross-compiling, so it defaults to 'yes':
> 
> configure:14438: WARNING: cannot check getenv redefinition if cross
> compiling -- defaulting to yes
> 
> We can avoid this redefinition by adding bash_cv_getenv_redef=no to the
> configure options.
> 
> At the same time, we use configure options instead of environment
> variables because there is no need to pass those options to the
> configure script as environment variables. Doing it in this way we
> avoid the risk of environment variables leaking into places we don't
> expect.

 That change from _ENV to _OPTS should definitely be a separate patch.
Especially because I don't see the reason to do it. The environment variables
will leak into exactly one place: the configure script. And that script will
just export all assignments passed on the command line into its environment. So
the effect is exactly the same.

 If you do make this change, then it should probably be done for all packages,
which means it should probably be done in pkg-autotools.mk.

 So you have a concrete example of where the _ENV causes trouble?

> 
> Related:
> 	http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/a20/a2007e6dbcfe53e7cd837ae642869ee26376826a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/bash/bash.mk |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 34a3a73..9a13f69 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -13,7 +13,7 @@ BASH_CONF_OPTS = --with-installed-readline
>  BASH_LICENSE = GPLv3+
>  BASH_LICENSE_FILES = COPYING
>  
> -BASH_CONF_ENV += \
> +BASH_CONF_OPTS += \
>  	ac_cv_rl_prefix="$(STAGING_DIR)" \
>  	ac_cv_rl_version="$(READLINE_VERSION)" \
>  	bash_cv_job_control_missing=present \
> @@ -28,6 +28,9 @@ BASH_MAKE = $(MAKE1)
>  # The static build needs some trickery
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +BASH_CONF_OPTS += bash_cv_getenv_redef=no
> +endif

 It's probably better to also set it to yes explicitly in the else branch.

 Also, a short comment would be good.

 Also, does musl allow redefining getenv?


 Regards,
 Arnout

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
