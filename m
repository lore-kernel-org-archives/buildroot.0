From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:09:51 -0500
Subject: [Buildroot] [PATCH 2/2] toolchain-external: musl toolchain on
 ARM is for MMU-systems only
In-Reply-To: <1469713154-10898-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1469713154-10898-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANQCQpb-MkMFEvFr=4PgUi4Yxx5LMm2NVcC6qYHQTd2kZNdT8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 28, 2016 at 8:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Now that we have introduced the support for ARM no-MMU in Buildroot,
> we need to update the dependencies of the musl external toolchain. It
> supports only MMU-capable ARM cores, so it must depend on BR2_USE_MMU,
> at least for the ARM platforms.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index ee07ddb..f54fbee 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -586,10 +586,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>
>  config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>         bool "Musl 1.1.12 toolchain"
> -       depends on (BR2_arm && BR2_ARM_EABI) || \
> -               (BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
> -               (BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A) || BR2_i386 || \
> -               (BR2_mips && !BR2_SOFT_FLOAT) || \
> +       depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
> +               (BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4 && BR2_USE_MMU) || \
> +               (BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A && BR2_USE_MMU) || \
> +               BR2_i386 || (BR2_mips && !BR2_SOFT_FLOAT) || \


Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>                 BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
>                 BR2_sh4 || BR2_sh4eb || \
>                 BR2_x86_64
> --
> 2.7.4
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
