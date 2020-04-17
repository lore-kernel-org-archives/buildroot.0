From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 17 Apr 2020 23:27:04 +0200
Subject: [Buildroot] [PATCH 5/9 v5] package/apparmor: add options to
 install utils
In-Reply-To: <265c344269306d0c419a1845f8501faf6f769aa0.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
 <265c344269306d0c419a1845f8501faf6f769aa0.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <CA+_SqVYyWMRDq4t4qEnkNVm25dLzgEBjH5oWbW-_xzhKxNk++A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Most utilities are written in python3, except a few that are written in
> a mixture of POSIX shell, bash, perl and awk.
>
> The Makefile does not allow isntalling

installing

> parts of it, but requiring all of
> python3, bash, and perl to install the utils is too much of a
> requirement.
>
> Instead, we split the set in two, on one hand the puthin

python

> ones, which we
> install when python3 is enabled, and on the other hand, the rest of the
> script which we call 'extras', and which we install when all the extra
> requirements (bash, perl, and busybox or gawk) are met; if not, then we
> remove these extras utils as a post-install hook.
>
> Note about the order of the comments: they are in reverse-order of the
> associated config symbols, so that they are properly displayed.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [yann.morin.1998 at free.fr:
>   - split into its own patch
>   - re-arrange the conditions
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/Config.in   | 36 ++++++++++++++++++++++++++++++++++++
>  package/apparmor/apparmor.mk | 14 ++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
> index d3941200c6..714888c583 100644
> --- a/package/apparmor/Config.in
> +++ b/package/apparmor/Config.in
> @@ -26,4 +26,40 @@ config BR2_PACKAGE_APPARMOR_BINUTILS
>           A set of utilities (written in C):
>             aa-enabled    aa-exec
>
> +config BR2_PACKAGE_APPARMOR_UTILS
> +       bool "utils"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON3_READLINE
> +       help
> +         A set of utilities (written in pyhon):
> +           aa-audit          aa-disable      aa-logprof
> +           aa-autodep        aa-easyprof     aa-mergeprof
> +           aa-cleanprof      aa-enforce      aa-status
> +           aa-complain       aa-genprof      aa-unconfined
> +
> +config BR2_PACKAGE_APPARMOR_UTILS_EXTRA
> +       bool "utils (extras)"
> +       depends on BR2_PACKAGE_APPARMOR_UTILS
> +       depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK
> +       depends on BR2_PACKAGE_BASH
> +       depends on BR2_PACKAGE_PERL
> +       help
> +         An extra set of utilities (written in a mixture of sh,
> +         bash, perl, and awk):
> +           aa-decode          (bash + perl)
> +           aa-notify          (perl)
> +           aa-remove-unknown  (sh + awk)
> +
> +comment "utils (extras) need bash and perl, and busybox or gawk"
> +       depends on BR2_PACKAGE_APPARMOR_UTILS
> +       depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_PERL \
> +               || !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK)
> +
> +comment "utils need python3"
> +       depends on BR2_USE_MMU
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_STATIC_LIBS
> +       depends on !BR2_PACKAGE_PYTHON3
> +
>  endif
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 9ee5304a16..1805628de4 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -21,6 +21,20 @@ ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
>  APPARMOR_TOOLS += binutils
>  endif
>
> +ifeq ($(BR2_PACKAGE_APPARMOR_UTILS),y)
> +APPARMOR_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY) python3
> +APPARMOR_TOOLS += utils
> +APPARMOR_MAKE_OPTS += PYTHON=$(HOST_DIR)/bin/python3
> +
> +ifeq ($(BR2_PACKAGE_APPARMOR_UTILS_EXTRA),)
> +define APPARMOR_UTILS_NO_EXTRA
> +       $(Q)rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,aa-decode aa-notify aa-remove-unknown)
> +endef
> +APPARMOR_POST_INSTALL_TARGET_HOOKS += APPARMOR_UTILS_NO_EXTRA
> +endif # BR2_PACKAGE_APPARMOR_UTILS_EXTRA
> +
> +endif # BR2_PACKAGE_APPARMOR_UTILS
> +
>  define APPARMOR_BUILD_CMDS
>         $(foreach tool,$(APPARMOR_TOOLS),\
>                 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> --
> 2.20.1
>
