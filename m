From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 15 Jan 2012 07:30:57 -0600
Subject: [Buildroot] [PATCH] BASH: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <CA+gTGJGUmtWp2cnyrP=Za7=ySQmiQ3REWxJatydJCKv6et-OzQ@mail.gmail.com>
References: <CA+gTGJGUmtWp2cnyrP=Za7=ySQmiQ3REWxJatydJCKv6et-OzQ@mail.gmail.com>
Message-ID: <201201150730.59076.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun January 15 2012, Arkady Gilinsky wrote:
> From: Arkady Gilinsky <arcadyg@gmail.com>
> Date: Sat, 14 Jan 2012 11:27:11 +0200
> Subject: [PATCH] BASH: Adding features that can not be automatically
> detected
>  while cross-compiling
>

A note on your post -

When you write the post in HTML and then rely on your e-mail
client to create a plain-text version, the usual result is
garbage-text, unusable by the patch program.

Please author your post as plain text to begin with.

This mailing list prefers a plain-text file (makes it easier
to review, both now and in the archives).

If using an e-mail client that you can't control enough to
ensure a plain-text post, at least attach the plain-text file.

Mike
 
> There are some bash features that can not be detected automatically during
> configure stage while cross-compiling. This commit add ability to force
> support of such a features.
> 
> Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
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
>        The standard GNU Bourne again shell.
> 
>        http://tiswww.case.edu/php/chet/bash/bashtop.html
> +
> +menu "BASH cross compile features selection"
> +    depends on BR2_PACKAGE_BASH
> +
> +config BR2_PACKAGE_BASH_JOB_CONTROL
> +    bool "job_control"
> +    depends on BR2_PACKAGE_BASH
> +    help
> +       The job control feature (Ctrl-Z and etc.)
> +       Configure variable - bash_cv_job_control_missing
> +
> +config BR2_PACKAGE_BASH_NAMED_PIPES
> +    bool "named_pipes"
> +    depends on BR2_PACKAGE_BASH
> +    help
> +       Named pipe presence
> +       Configure variable - bash_cv_sys_named_pipes
> +
> +config BR2_PACKAGE_BASH_SIG_SET_JUMP
> +    bool "sigsetjmp"
> +    depends on BR2_PACKAGE_BASH
> +    help
> +       POSIX-style sigsetjmp/siglongjmp
> +       Configure variable - bash_cv_func_sigsetjmp
> +
> +config BR2_PACKAGE_BASH_PRINTF_A_FORMAT
> +    bool "printf_a_format"
> +    depends on BR2_PACKAGE_BASH
> +    help
> +       Printf floating point output in hex notation
> +       Configure variable - bash_cv_printf_a_format
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
> +BASH_CONF_ENV
> +=                                                                \
> +   bash_cv_job_control_missing=$(if
> $(BR2_PACKAGE_BASH_JOB_CONTROL),present,no) \
> +   $(if $(BR2_PACKAGE_BASH_NAMED_PIPES),
> bash_cv_sys_named_pipes=present,)      \
> +   $(if $(BR2_PACKAGE_BASH_SIG_SET_JUMP),
> bash_cv_func_sigsetjmp=present,)      \
> +   $(if $(BR2_PACKAGE_BASH_PRINTF_A_FORMAT), bash_cv_printf_a_format=yes,)
> 
>  # Make sure we build after busybox so that /bin/sh links to bash
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -- 
> 1.7.7
> 
> 
> 
