From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Apr 2020 18:44:09 -0300
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <20200427211638.6047-1-xroumegue@gmail.com>
References: <20200427211638.6047-1-xroumegue@gmail.com>
Message-ID: <CAOMZO5Ad77WMwsf2cAKUBj2HT+EH1p1_UsYg9Nb-ZTsO54oKPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

On Mon, Apr 27, 2020 at 6:16 PM Xavier Roumegue <xroumegue@gmail.com> wrote:
>
> This script aims to create an imx compatible boot image embedding
> mainline components, using only upstream uboot mkimage tool, avoiding
> dependencies on proprietary imx mkimage.
>
> Mainline u-boot can generate a bootable image, but SPL soc proprietary
> firmware dependencies have to be copied on uboot root dir.
>
> This script prevents additional buildroot uboot recipe hacking to handle
> custom SoC uboot build process.
>
> The script actions summary is:
> - Append DDR4 firmware to uboot spl binary
> - Generate imx mkimage configuration file, extracting entry points from
>   relevant elf files on the fly.
> - Generate imx boot image using uboot upstream mkimage tool
>
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>

This is cool :-) I like it!

Do you think we can also expand this later to support booting i.MX8QXP
and i.MX8QM too?

Thanks


> ---
>  .../common/imx/imx8-generate-fw-image.sh      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100755 board/freescale/common/imx/imx8-generate-fw-image.sh
>
> diff --git a/board/freescale/common/imx/imx8-generate-fw-image.sh b/board/freescale/common/imx/imx8-generate-fw-image.sh
> new file mode 100755
> index 0000000000..eb9e96265b
> --- /dev/null
> +++ b/board/freescale/common/imx/imx8-generate-fw-image.sh
> @@ -0,0 +1,52 @@
> +#!/usr/bin/env bash
> +
> +get_entry()
> +{
> +    local elf_file=$1
> +    readelf -h "$elf_file" | sed -e '/Entry/!d;s/.*:.*\(0x[0-9a-fA-F]\)/\1/g'
> +}
> +
> +gen_cfg_file()
> +{
> +cat <<EOF > "$CFG_OUTFILE"
> +#define __ASSEMBLY__
> +
> +FIT
> +BOOT_FROM      sd
> +LOADER         ${SPL_DDR_BIN}  ${SPL_ENTRY}
> +SECOND_LOADER  ${UBOOT_BIN}            ${UBOOT_ENTRY} 0x60000
> +
> +EOF
> +}
> +
> +gen_1stloader_bin()
> +{
> +    SPL_BIN_PAD="$(mktemp --suffix spl_pad.bin)"
> +    dd if="${SPL_BIN}" of="${SPL_BIN_PAD}"  bs=4 conv=sync
> +    cat "${SPL_BIN_PAD}" "${DDR_FW_BIN}" > "${SPL_DDR_BIN}"
> +}
> +
> +gen_fw_image()
> +{
> +    "${HOST_DIR}"/bin/mkimage -n "${CFG_OUTFILE}" -T imx8mimage -e "${SPL_ENTRY}" -d "${UBOOT_BIN}" "${FLASH_BIN}"
> +
> +}
> +main()
> +{
> +    UBOOT_BIN="${BINARIES_DIR}/u-boot.itb"
> +    UBOOT_ELF="${BINARIES_DIR}/u-boot"
> +    SPL_DDR_BIN="${BINARIES_DIR}/u-boot-spl-ddr.bin"
> +    SPL_BIN="${BINARIES_DIR}/u-boot-spl.bin"
> +    SPL_ELF="${BINARIES_DIR}/u-boot-spl"
> +    CFG_OUTFILE="${BINARIES_DIR}/bootimage.cfg"
> +    FLASH_BIN="${BINARIES_DIR}/imx8-boot-sd.bin"
> +    UBOOT_ENTRY="$(get_entry "${UBOOT_ELF}")"
> +    SPL_ENTRY="$(get_entry "${SPL_ELF}")"
> +    DDR_FW_BIN="${BINARIES_DIR}/lpddr4_pmu_train_fw.bin"
> +
> +    gen_1stloader_bin
> +    gen_cfg_file
> +    gen_fw_image
> +}
> +
> +main "$@"
> --
> 2.25.1
>
