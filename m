From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:38:23 +0200
Subject: [Buildroot] [PATCHv2] configs: switch to a wget download for
 kernels on github
In-Reply-To: <20180401090455.30889-1-yann.morin.1998@free.fr>
References: <20180401090455.30889-1-yann.morin.1998@free.fr>
Message-ID: <20180402113823.5279322c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 11:04:55 +0200, Yann E. MORIN wrote:
> The linux git trees on github can be huge, and takes a long time to
> download, which is not very nice nor convenient for newcomers.
> 
> Switch them to using a wget, with the github macro.
> 
> A nice side effect of this conversion, is that we no longer need to wait
> for the git clone to finish to notice that the ref is gone; doing a wget
> will instantly fail in that case.
> 
> Mechanical patch, obtained by running (hang-on tight):
> 
> $ sed -r -i -e 's/BR2_LINUX_KERNEL_CUSTOM_GIT/BR2_LINUX_KERNEL_CUSTOM_TARBALL/; /BR2_LINUX_KERNEL_CUSTOM_REPO_URL/N; s:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https\://github.com/([^/]+)/(.+)"\nBR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="(.+)":BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,\1,\2,\3)/linux-\3.tar.gz":; s/(call github.*)\.git/\1/;' $(grep -l 'BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com' configs/*)
> 
> olimex_a20_olinuxino_lime_mali had a comment in between, so it was
> manually fixed thereafter; that comment was also moved.
> 
> Except for socrates_cyclone5 which did not work previously (missing tag
> in git tree?), all the affected defconfigs still download their sources.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - correctly catch and drop the trailing .git
>   - fix the two incorrectly-converted defconfigs
> ---
>  configs/amarula_vyasa_rk3288_defconfig           | 5 ++---
>  configs/arcturus_ucls1012a_defconfig             | 5 ++---
>  configs/at91sam9x5ek_defconfig                   | 5 ++---
>  configs/at91sam9x5ek_dev_defconfig               | 5 ++---
>  configs/at91sam9x5ek_mmc_defconfig               | 5 ++---
>  configs/at91sam9x5ek_mmc_dev_defconfig           | 5 ++---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d2_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d3_xplained_defconfig         | 5 ++---
>  configs/atmel_sama5d3_xplained_dev_defconfig     | 5 ++---
>  configs/atmel_sama5d3_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d3xek_defconfig               | 5 ++---
>  configs/atmel_sama5d4_xplained_defconfig         | 5 ++---
>  configs/atmel_sama5d4_xplained_dev_defconfig     | 5 ++---
>  configs/atmel_sama5d4_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 5 ++---
>  configs/ci20_defconfig                           | 5 ++---
>  configs/galileo_defconfig                        | 5 ++---
>  configs/odroidc2_defconfig                       | 5 ++---
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 8 +++-----
>  configs/raspberrypi0_defconfig                   | 5 ++---
>  configs/raspberrypi0w_defconfig                  | 5 ++---
>  configs/raspberrypi2_defconfig                   | 5 ++---
>  configs/raspberrypi3_64_defconfig                | 5 ++---
>  configs/raspberrypi3_defconfig                   | 5 ++---
>  configs/raspberrypi3_qt5we_defconfig             | 5 ++---
>  configs/raspberrypi_defconfig                    | 5 ++---
>  configs/roseapplepi_defconfig                    | 5 ++---
>  configs/socrates_cyclone5_defconfig              | 5 ++---
>  configs/solidrun_macchiatobin_marvell_defconfig  | 5 ++---
>  configs/ts7680_defconfig                         | 5 ++---
>  configs/zynq_microzed_defconfig                  | 5 ++---
>  configs/zynq_zc706_defconfig                     | 5 ++---
>  configs/zynq_zed_defconfig                       | 5 ++---
>  36 files changed, 73 insertions(+), 110 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
