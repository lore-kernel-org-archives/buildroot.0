From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 24 Oct 2017 11:13:35 -0500
Subject: [Buildroot] [PATCH v2 1/1] libsepol: require threads
In-Reply-To: <20171024134806.16755-1-aduskett@gmail.com>
References: <20171024134806.16755-1-aduskett@gmail.com>
Message-ID: <CANQCQpY6hViXUQQ908no35poJ_0cXwSHyLsyUkwn6nQY7PYA_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Tue, Oct 24, 2017 at 8:48 AM, Adam Duskett <aduskett@gmail.com> wrote:
> libsepol 2.7 now uses pthreads.h
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> changes v1 -> v2:
>   - Added thread dependency to semodule-utils (Arnout)
>
>  package/libsepol/Config.in       | 1 +
>  package/semodule-utils/Config.in | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> index f92af52072..83141e8b98 100644
> --- a/package/libsepol/Config.in
> +++ b/package/libsepol/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSEPOL
>         bool "libsepol"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         help
>           Libsepol is the binary policy manipulation library. It doesn't
>           depend upon or use any of the other SELinux components.
> diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
> index d9cb928c4c..995157baa1 100644
> --- a/package/semodule-utils/Config.in
> +++ b/package/semodule-utils/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SEMODULE_UTILS
>         bool "semodule-utils"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS

Suggest adding comment to show why the dependency was added.  Something like

depends on BR2_TOOLCHAIN_HAS_THREADS  # libsepol

>         select BR2_PACKAGE_LIBSEPOL
>         help
>           semodule-utils is a package that contains tools for handling
> @@ -13,3 +14,6 @@ config BR2_PACKAGE_SEMODULE_UTILS
>           * semodule_package - Create a SELinux policy module package.
>
>           https://github.com/SELinuxProject/selinux/wiki/Releases
> +
> +comment "semodule-utils needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS

I'd suggest also doing similar for the libsepol package


Matt
