From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Sep 2015 23:02:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: indicate getcwd is
 malloc-supported
In-Reply-To: <1441292409-5264-1-git-send-email-james.knight@rockwellcollins.com>
References: <1441292409-5264-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <55E8B565.3030407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-09-15 17:00, James Knight wrote:
> When Bash attempts to find the current working directory, it uses a C
> library call `getcwd` to resolve it. When cross-compiling, the
> configuration process cannot determine if the target system's C library
> can support an "unfixed" path length. Therefore, Bash will fallback to a
> size of `PATH_MAX` for determining the current working directory. When
> using OverlayFS (and possible other file systems), this becomes an issue
> since file paths can commonly exceed standard `PATH_MAX` length. This
> typically results in the following error appearing:
> 
>    error retrieving current directory: [...]
> 
> Common C library `getcwd` calls can default to a higher limit (usually
> the system's page size). The current configurable C libraries (as of at
> least 2015.08) support a zero (0) size buffer length. Most use the
> system's page size; musl, being an exception, which defaults to
> `PATH_MAX` (as Bash was doing). Since these C libraries support
> allocating buffer space with a zero (0) provided size, the following
> configuration change allows Bash to support getting a larger-length'ed
> working directory on target's that support it.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

 Just to be clear for other reviewers: this will work for glibc, musl and
uClibc. In the worst case (musl) it won't make a difference compared to the
current situation. uClibc and glibc will allocate getpagesize(),

 Therefore:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/bash/bash.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 9865e19..97d7182 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -16,6 +16,7 @@ BASH_LICENSE_FILES = COPYING
>  BASH_CONF_ENV += \
>  	ac_cv_rl_prefix="$(STAGING_DIR)" \
>  	ac_cv_rl_version="$(READLINE_VERSION)" \
> +	bash_cv_getcwd_malloc=yes \
>  	bash_cv_job_control_missing=present \
>  	bash_cv_sys_named_pipes=present \
>  	bash_cv_func_sigsetjmp=present \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
