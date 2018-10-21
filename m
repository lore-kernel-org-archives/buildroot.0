From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 21 Oct 2018 17:54:12 +0100
Subject: [Buildroot] [PATCH v2] utils/diffconfig: remove BR2_* prefix
 restriction
In-Reply-To: <20181021162110.10569-1-luca@lucaceresoli.net>
References: <20181021162110.10569-1-luca@lucaceresoli.net>
Message-ID: <CANQCQpbnchERW12pH8iBQn-pDhLrL+_VckL70PMafG7BQVD1Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, Luca,

On Sun, Oct 21, 2018 at 5:22 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> From: Marcel Patzlaff <m.patzlaff@pilz.de>
>
> The utils/diffconfig script works only on variables with the BR2_
> prefix. This is OK for Buildroot [def]configs since this is the prefix
> for all user-facing variables, but it prevents using the same script
> to compare configs from kconfig-based packages.
>
> Remove the BR2_ restriction, allowing usage such as:
>
>   ./utils/diffconfig \
>         board/qemu/xtensa-lx60/linux.config \
>         board/qemu/xtensa-lx60/linux-nommu.config
>
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---


Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>
> Changes v1 -> v2:
>  - rewrite commit message with a different motivation
>  - fix subject (use imperative verb, lowercase after colon)
> ---
>  utils/diffconfig | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/utils/diffconfig b/utils/diffconfig
> index 5862a62f25cb..f1af23cfce5c 100755
> --- a/utils/diffconfig
> +++ b/utils/diffconfig
> @@ -28,14 +28,14 @@ If no config files are specified, .config and .config.old are used.
>
>  Example usage:
>   $ diffconfig .config config-with-some-changes
> --LINUX_KERNEL_INTREE_DTS_NAME "vexpress-v2p-ca9"
> - LINUX_KERNEL_DTS_SUPPORT y -> n
> - LINUX_KERNEL_USE_INTREE_DTS y -> n
> - PACKAGE_DFU_UTIL n -> y
> - PACKAGE_LIBUSB n -> y
> - TARGET_GENERIC_HOSTNAME "buildroot" -> "Tuxie"
> - TARGET_GENERIC_ISSUE "Welcome to Buildroot" -> "Welcome to CustomBoard"
> -+PACKAGE_LIBUSB_COMPAT n
> +-BR2_LINUX_KERNEL_INTREE_DTS_NAME "vexpress-v2p-ca9"
> + BR2_LINUX_KERNEL_DTS_SUPPORT y -> n
> + BR2_LINUX_KERNEL_USE_INTREE_DTS y -> n
> + BR2_PACKAGE_DFU_UTIL n -> y
> + BR2_PACKAGE_LIBUSB n -> y
> + BR2_TARGET_GENERIC_HOSTNAME "buildroot" -> "Tuxie"
> + BR2_TARGET_GENERIC_ISSUE "Welcome to Buildroot" -> "Welcome to CustomBoard"
> ++BR2_PACKAGE_LIBUSB_COMPAT n
>
>  """)
>      sys.exit(0)
> @@ -44,12 +44,14 @@ Example usage:
>  def readconfig(config_file):
>      d = {}
>      for line in config_file:
> -        line = line[:-1]
> -        if line[:4] == "BR2_":
> -            name, val = line[4:].split("=", 1)
> -            d[name] = val
> +        line = line.strip()
> +        if len(line) == 0:
> +            continue
>          if line[-11:] == " is not set":
> -            d[line[6:-11]] = "n"
> +            d[line[2:-11]] = "n"
> +        elif line[0] != "#":
> +            name, val = line.split("=", 1)
> +            d[name] = val
>      return d
>
>  def print_config(op, config, value, new_value):
> @@ -58,9 +60,9 @@ def print_config(op, config, value, new_value):
>      if merge_style:
>          if new_value:
>              if new_value=="n":
> -                print("# BR2_%s is not set" % config)
> +                print("# %s is not set" % config)
>              else:
> -                print("BR2_%s=%s" % (config, new_value))
> +                print("%s=%s" % (config, new_value))
>      else:
>          if op=="-":
>              print("-%s %s" % (config, value))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
