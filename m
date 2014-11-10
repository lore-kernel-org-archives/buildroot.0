From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Nov 2014 13:31:27 +0100
Subject: [Buildroot] [PATCH 1/2] elfutils: bump version to 0.160
In-Reply-To: <1415616323-58155-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415616323-58155-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAHXCMMLEwTjev99Jk626Gpsh-r7gpq9F-EB2mpda371Cuuok6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Mon, Nov 10, 2014 at 11:45 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> - Bump version to 0.160
> - Add a hash file
> - Add a hook to remove some -Werror options
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/elfutils/elfutils.hash |    3 +++
>  package/elfutils/elfutils.mk   |   16 ++++++++++++----
>  2 files changed, 15 insertions(+), 4 deletions(-)
>  create mode 100644 package/elfutils/elfutils.hash
>
> diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> new file mode 100644
> index 0000000..f0f4598
> --- /dev/null
> +++ b/package/elfutils/elfutils.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 4f00a27..e8ff3fc 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -ELFUTILS_VERSION = 0.155
> +ELFUTILS_VERSION = 0.160
>  ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
>  ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
>  ELFUTILS_LICENSE = GPLv3 GPLv2 LGPLv3
> @@ -13,9 +13,7 @@ ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
>  # The tarball does not have a generated configure script
>  ELFUTILS_AUTORECONF = YES
>  ELFUTILS_CONF_OPTS += --disable-werror
> -ELFUTILS_PATCH = \
> -       elfutils-portability.patch \
> -       elfutils-robustify.patch
> +ELFUTILS_PATCH = elfutils-portability.patch
>
>  ELFUTILS_INSTALL_STAGING = YES
>
> @@ -68,4 +66,14 @@ else
>  ELFUTILS_CONF_OPTS += --disable-progs
>  endif
>
> +# The --disable-werror configure option does not seem to be enough. We
> +# need to remove the -Werror options from these Makefiles in order to
> +# avoid compilation failures.
> +define ELFUTILS_DISABLE_WERROR
> +       $(SED) 's/-Werror//g' $(@D)/lib/Makefile
> +       $(SED) 's/-Werror//g' $(@D)/libelf/Makefile
> +       $(SED) 's/-Werror//g' $(@D)/libdwfl/Makefile
> +endef
> +ELFUTILS_POST_CONFIGURE_HOOKS += ELFUTILS_DISABLE_WERROR

Since we are already reconfiguring elfutils, is it possible to patch
the Makefile.am or Makefile.in instead?
Also if you manage to fix the --disable-werror option, it'd be good to
send the fix upstream.

Regards,


-- 
Samuel
