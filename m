From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Oct 2017 08:21:19 -0500
Subject: [Buildroot] [PATCH v3 1/1] libsepol: require threads
In-Reply-To: <20171025131200.18412-1-aduskett@gmail.com>
References: <20171025131200.18412-1-aduskett@gmail.com>
Message-ID: <CANQCQpZAALq+-pgCN37_dT=yL8y56Q0096FS01AKRJW==Nr5Yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Wed, Oct 25, 2017 at 8:12 AM, Adam Duskett <aduskett@gmail.com> wrote:
> libsepol 2.7 now uses pthreads.h
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added thread dependency to semodule-utils (Arnout)
>
> Changes v2 -> v3:
>   - Added explinations for dependencies (Matt Webber)
>
minor nit, spelling of 'explanations' above

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>  package/libsepol/Config.in       | 1 +
>  package/semodule-utils/Config.in | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> index f92af52072..f17eb47448 100644
> --- a/package/libsepol/Config.in
> +++ b/package/libsepol/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSEPOL
>         bool "libsepol"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
>         help
>           Libsepol is the binary policy manipulation library. It doesn't
>           depend upon or use any of the other SELinux components.
> diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
> index d9cb928c4c..38e043dc2c 100644
> --- a/package/semodule-utils/Config.in
> +++ b/package/semodule-utils/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SEMODULE_UTILS
>         bool "semodule-utils"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
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
> --
> 2.13.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
