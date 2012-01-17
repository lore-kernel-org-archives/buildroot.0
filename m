From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jan 2012 00:07:43 +0100
Subject: [Buildroot] [PATCH v2] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <1326821128-29133-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 17 Jan 2012 18:25:28 +0100")
References: <1326820937-28384-1-git-send-email-arnout@mind.be>
 <1326821128-29133-1-git-send-email-arnout@mind.be>
Message-ID: <87wr8qnd1c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: Arkady Gilinsky <arcadyg@gmail.com>

 Arnout> There are some bash features that can not be detected
 Arnout> automatically during configure stage while
 Arnout> cross-compiling. This commit adds the ability to force support
 Arnout> of such features.

Ok, but does it make sense to make these things configurable? I haven't
checked, but presumably these are supported on all Linux archs, and
don't affect the binary size significantly (compared to bash size)?

Couldn't we just always forcibly enable these instead?

 Arnout> Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout>  package/bash/Config.in |   26 ++++++++++++++++++++++++++
 Arnout>  package/bash/bash.mk   |    6 +++++-
 Arnout>  2 files changed, 31 insertions(+), 1 deletions(-)

 Arnout> diff --git a/package/bash/Config.in b/package/bash/Config.in
 Arnout> index 9ee46e8..74f03e0 100644
 Arnout> --- a/package/bash/Config.in
 Arnout> +++ b/package/bash/Config.in
 Arnout> @@ -5,3 +5,29 @@ config BR2_PACKAGE_BASH
 Arnout>  	  The standard GNU Bourne again shell.
 
 Arnout>  	  http://tiswww.case.edu/php/chet/bash/bashtop.html
 Arnout> +
 Arnout> +if BR2_PACKAGE_BASH
 Arnout> +
 Arnout> +comment "Bash features that cannot be derived automatically when cross-compiling"
 Arnout> +
 Arnout> +config BR2_PACKAGE_BASH_JOB_CONTROL
 Arnout> +	bool "job_control"
 Arnout> +	help
 Arnout> +	   The job control feature (Ctrl-Z and etc.)
 Arnout> +
 Arnout> +config BR2_PACKAGE_BASH_NAMED_PIPES
 Arnout> +	bool "named_pipes"
 Arnout> +	help
 Arnout> +	   Named pipe presence
 Arnout> +
 Arnout> +config BR2_PACKAGE_BASH_SIG_SET_JUMP
 Arnout> +	bool "sigsetjmp"
 Arnout> +	help
 Arnout> +	   POSIX-style sigsetjmp/siglongjmp
 Arnout> +
 Arnout> +config BR2_PACKAGE_BASH_PRINTF_A_FORMAT
 Arnout> +	bool "printf_a_format"
 Arnout> +	help
 Arnout> +	   Printf floating point output in hex notation
 Arnout> +
 Arnout> +endif
 Arnout> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
 Arnout> index f1f951c..78face7 100644
 Arnout> --- a/package/bash/bash.mk
 Arnout> +++ b/package/bash/bash.mk
 Arnout> @@ -7,7 +7,11 @@
 Arnout>  BASH_VERSION = 4.2
 Arnout>  BASH_SITE = $(BR2_GNU_MIRROR)/bash
 Arnout>  BASH_DEPENDENCIES = ncurses
 Arnout> -BASH_CONF_ENV = bash_cv_job_control_missing=no
 Arnout> +BASH_CONF_ENV +=                                                                \
 Arnout> +   bash_cv_job_control_missing=$(if $(BR2_PACKAGE_BASH_JOB_CONTROL),present,no) \
 Arnout> +   $(if $(BR2_PACKAGE_BASH_NAMED_PIPES), bash_cv_sys_named_pipes=present,)      \
 Arnout> +   $(if $(BR2_PACKAGE_BASH_SIG_SET_JUMP), bash_cv_func_sigsetjmp=present,)      \
 Arnout> +   $(if $(BR2_PACKAGE_BASH_PRINTF_A_FORMAT), bash_cv_printf_a_format=yes,)
 
 Arnout>  # Make sure we build after busybox so that /bin/sh links to bash
 Arnout>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 Arnout> -- 
 Arnout> 1.7.8.3

 Arnout> _______________________________________________
 Arnout> buildroot mailing list
 Arnout> buildroot at busybox.net
 Arnout> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
