From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 21 Mar 2016 09:48:01 +0000
Subject: [Buildroot] [PATCH v2 16/17] configs/stm32f429_disco: new
 configuration for STM32F429 Discovery board
In-Reply-To: <1458335299-27409-17-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160321094801.GB3529@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Mar 2016, Thomas Petazzoni wrote:

> From: Lee Jones <lee.jones@linaro.org>
> 
> This commit adds a defconfig for the STM32F429 platform, which is
> based on a Cortex-M4 core from ST Microelectronics. It is therefore
> the first noMMU ARM platform supported in Buildroot.
> 
> This commit includes some files that will be common to several STM32
> platforms (hence in board/stmicroelectronics) and some files that are
> specific to the STM32F429 (hence in
> board/stmicroelectronics/stm32f429-disco). More specifically, this
> commit adds:
> 
>  - A minimal Busybox configuration, which is small enough to boot
>    without causing OOM on such small noMMU platforms. The resulting
>    Busybox, statically linked with uClibc-ng, weights around 220
>    KB. For now, this file is located in board/stmicroelectronics/, but
>    we might consider moving it to package/busybox/ in the future if
>    needed.
> 
>  - A post-build script that removes the mounting of /dev/pts (not
>    enabled in the kernel and not very useful for a system that has no
>    network and no X), and removes the network related init script and
>    configuration files (no network support).
> 
>  - A flash.sh script, to perform the right OpenOCD invocations to
>    reflash the board.
> 
>  - One small kernel patch to adjust the kernel command line in the
>    Device Tree, since it's the only way to do so.
> 
>  - The usual readme.txt file.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> [Thomas:
>  - squashed multiple patches from Lee Jones together
>  - added the minimal Busybox configuration
>  - added the post-build script
>  - improved the flashing script to not hardcode the location of the
>    output directory
>  - add the small kernel patch
>  - improve the readme.txt file
>  - test on HW the resulting image, after using the internal toolchain.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  board/stmicroelectronics/busybox-minimal.config    | 1057 ++++++++++++++++++++
>  board/stmicroelectronics/stm32-post-build.sh       |    8 +
>  board/stmicroelectronics/stm32f429-disco/flash.sh  |   20 +
>  ...49-disco-don-t-force-init-in-chosen-boota.patch |   32 +
>  .../stmicroelectronics/stm32f429-disco/readme.txt  |   30 +
>  configs/stm32f429_disco_defconfig                  |   18 +
>  6 files changed, 1165 insertions(+)
>  create mode 100644 board/stmicroelectronics/busybox-minimal.config
>  create mode 100755 board/stmicroelectronics/stm32-post-build.sh
>  create mode 100755 board/stmicroelectronics/stm32f429-disco/flash.sh
>  create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
>  create mode 100644 board/stmicroelectronics/stm32f429-disco/readme.txt
>  create mode 100644 configs/stm32f429_disco_defconfig

[...]

> diff --git a/board/stmicroelectronics/stm32f429-disco/readme.txt b/board/stmicroelectronics/stm32f429-disco/readme.txt
> new file mode 100644
> index 0000000..afe0f11
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/readme.txt
> @@ -0,0 +1,30 @@
> +STM32F429 Discovery
> +===================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the STM32F429 Discovery evaluation platform.
> +
> +Building
> +--------
> +
> +  make stm32f429_disco_defconfig
> +  make
> +
> +Wire the UART
> +-------------
> +
> +Use a USB to TTL adapter, and connect:
> +
> + - RX to PA9
> + - TX to PA10
> + - GND to one of the GND available on the board
> +
> +The UART is configured at 115200.
> +
> +Flashing
> +--------
> +
> +  ./board/stmicroelectronics/stm32/stm32f429-disco/flash.sh output/

Looks like you've removed the stm32 directory, but still reference it
from readme.txt

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org ? Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
