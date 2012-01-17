From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jan 2012 18:18:25 +0100
Subject: [Buildroot] [PATCH] BASH: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <CA+gTGJG2ZZayS9hbyqiZwJG_-eWDjJx8cZgKd5i5goEFNXBT0g@mail.gmail.com>
References: <CA+gTGJG2ZZayS9hbyqiZwJG_-eWDjJx8cZgKd5i5goEFNXBT0g@mail.gmail.com>
Message-ID: <201201171818.25317.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi Arkady,

 It's difficult or impossible to post patches from GMail.  I've taken over 
your patch and will post it in reply.  I'll also post a v2 which incorporates
some of my feedback, below.

On Sunday 15 January 2012 18:14:32 Arkady Gilinsky wrote:
> From: Arkady Gilinsky <arcadyg@gmail.com>
> Date: Sat, 14 Jan 2012 11:27:11 +0200
> Subject: [PATCH] BASH: Adding features that can not be automatically detected
>  while cross-compiling
> 
> There are some bash features that can not be detected automatically during
> configure stage while cross-compiling. This commit add ability to force
> support of such a features.
> 
> Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/bash/Config.in |   33 +++++++++++++++++++++++++++++++++
>  package/bash/bash.mk   |    6 +++++-
>  2 files changed, 38 insertions(+), 1 deletions(-)
> 
> diff --git a/package/bash/Config.in b/package/bash/Config.in
> index 9ee46e8..b7cc27d 100644
> --- a/package/bash/Config.in
> +++ b/package/bash/Config.in
> @@ -5,3 +5,36 @@ config BR2_PACKAGE_BASH
>  	  The standard GNU Bourne again shell.
> 
>  	  http://tiswww.case.edu/php/chet/bash/bashtop.html
> +
> +menu "BASH cross compile features selection"
> +	depends on BR2_PACKAGE_BASH

 Adding a menu just makes things more complex - the indentation added
by the 'depends on' statements is sufficient.  But then it should be
a comment that explains the subsequent options.

> +config BR2_PACKAGE_BASH_JOB_CONTROL
> +	bool "job_control"
> +	depends on BR2_PACKAGE_BASH
> +	help
> +	   The job control feature (Ctrl-Z and etc.)
> +	   Configure variable - bash_cv_job_control_missing
 I don' think mentioning the configure variable is relevant here.  (Same
for the other options.)

 Actually, doesn't this feature always exist on a Linux kernel?
(Again, same for the other options, except possibly printf_a_format.)

> +
> +config BR2_PACKAGE_BASH_NAMED_PIPES
> +	bool "named_pipes"
> +	depends on BR2_PACKAGE_BASH
> +	help
> +	   Named pipe presence
> +	   Configure variable - bash_cv_sys_named_pipes
> +
> +config BR2_PACKAGE_BASH_SIG_SET_JUMP
> +	bool "sigsetjmp"
> +	depends on BR2_PACKAGE_BASH
> +	help
> +	   POSIX-style sigsetjmp/siglongjmp
> +	   Configure variable - bash_cv_func_sigsetjmp
> +
> +config BR2_PACKAGE_BASH_PRINTF_A_FORMAT
> +	bool "printf_a_format"
> +	depends on BR2_PACKAGE_BASH
> +	help
> +	   Printf floating point output in hex notation
> +	   Configure variable - bash_cv_printf_a_format
> +
> +endmenu
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index f1f951c..78face7 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -7,7 +7,11 @@
>  BASH_VERSION = 4.2
>  BASH_SITE = $(BR2_GNU_MIRROR)/bash
>  BASH_DEPENDENCIES = ncurses
> -BASH_CONF_ENV = bash_cv_job_control_missing=no
> +BASH_CONF_ENV +=
>           \
> +   bash_cv_job_control_missing=$(if
> $(BR2_PACKAGE_BASH_JOB_CONTROL),present,no) \
> +   $(if $(BR2_PACKAGE_BASH_NAMED_PIPES),
> bash_cv_sys_named_pipes=present,)      \
> +   $(if $(BR2_PACKAGE_BASH_SIG_SET_JUMP),
> bash_cv_func_sigsetjmp=present,)      \
> +   $(if $(BR2_PACKAGE_BASH_PRINTF_A_FORMAT), bash_cv_printf_a_format=yes,)
 I prefer (and I believe Peter does as well):

ifeq ($(BR2_PACKAGE_BASH_JOB_CONTROL),y)
BASH_CONF_ENV += bash_cv_job_control_missing=no
endif

more lines, but easier to read.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
