Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2203AC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 06:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7441540354;
	Wed,  7 Sep 2022 06:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7441540354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yT0hf8FxGMRP; Wed,  7 Sep 2022 06:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D1840291;
	Wed,  7 Sep 2022 06:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85D1840291
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0E71BF957
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 06:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8466640384
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 06:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8466640384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2t0KwiURGcr7 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 06:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0089F4037A
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0089F4037A
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 06:50:13 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kg20so1382282ejc.12
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 23:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UUc8NBFlSBzz7RlOLhSdwtvJUFIDI6pzcREfrRjwhsQ=;
 b=KKaIy8iMWLZ0IKFiM7cYaRqWJSPoESe5XtMEzmqMY19BzeQOS0fwRhTaJ2lQUU9ANS
 Htlx3yH/dETqeLCGYuzPMQ6UiH9Dxct91lA+/aP0z2R+Ife/7vnxIP7TLX4/aB/SBOSE
 Im9Igp0mU3BBU96zOfbPWapvGaF7PtnMZjkPwBeJxd49rhW4VVNORfE7jKoAUvefeAWn
 ZBO7ttm+r49E6ymtP9+0zVkKnlU1QocQWpF5KEIdHOLOPuFi7cyfF/Dv1fKoJ1M4NkmO
 WnG+mz4STC9Bu0fh2EBPkAYD6458GkEhv37aJiattvI1mnZggfx3bEWXKOXcv5SQ2hq8
 Gv5A==
X-Gm-Message-State: ACgBeo1aqOeH+rvPsnXEFXR1EAJRVmdPorBL8iUVB5o7xp/yL1A9pOnx
 soEMla6oJImSz0J225nKc3nts0rFB4/Hj1Ox6imReQ==
X-Google-Smtp-Source: AA6agR7OWLT4/WgbOMoWpoJ3yV/qRiBEMeIvKe+zcF9fm3LPNg1h7TGfhm+2InkSrIf3GM5vNHKN1gC1jh7j0SgKGmw=
X-Received: by 2002:a17:906:8a68:b0:741:56b2:af42 with SMTP id
 hy8-20020a1709068a6800b0074156b2af42mr1332316ejc.488.1662533411781; Tue, 06
 Sep 2022 23:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220902063939.2761040-1-dario.binacchi@amarulasolutions.com>
 <20220902063939.2761040-2-dario.binacchi@amarulasolutions.com>
 <f2bc336a-b07e-3f17-4a13-226be75eba64@benettiengineering.com>
 <cd899b55-35b3-0415-890b-2402c4e2e7d6@benettiengineering.com>
In-Reply-To: <cd899b55-35b3-0415-890b-2402c4e2e7d6@benettiengineering.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 7 Sep 2022 08:50:00 +0200
Message-ID: <CAOf5uwnBeAEHo_+kd8r2xnC5-wnjGfZ5qeFcAxH2Sv6hU3zmcg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UUc8NBFlSBzz7RlOLhSdwtvJUFIDI6pzcREfrRjwhsQ=;
 b=LlStQP5cgSMI9d3LxLULOpHcxUgXgQUqTPHrItzBd+LA/4yT+NBk+H/ybeDipkd8Ae
 D/Fk3wzyPxNp0uYRYXv+yccMzRnEHDim5GAcAOl35fTBQXco4k+YeClRq4fD3cFsmnZu
 7kf/ySar5dNVHfdFdlNmw1WL63v2eCKpqqfNw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LlStQP5c
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio

On Tue, Sep 6, 2022 at 11:14 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> I've forgotten 1 thing below,
>
> On 06/09/22 23:04, Giulio Benetti wrote:
> > Hi Dario, Michael, All,
> >
> > On 02/09/22 08:39, Dario Binacchi wrote:
> >> BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
> >> input and output interfaces to a dedicated carrier board. It is designed
> >> mainly to provide graphical/video and connectivity interfaces to the
> >> appliance.
> >>
> >> Board support package includes the following components:
> >> - mainline Linux kernel 5.18.19
> >> - mainline U-Boot 2022-07
> >> - default packages from buildroot
> >>
> >> Patches applied to the Linux kernel and U-Boot have been submitted but
> >> not merged yet.
> >>
> >> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> >> The smm s2 board is basically the same as the pro except it boots from
> >> NAND instead of eMMC.
> >>
> >> Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> ---
> >> Changes in v4:
> >> - Update the commit description.
> >> - Bump the kernel version to 5.18.19.
> >> - Shrink the Linux configuration.
> >> - Add 3 dashes to the kernel patches to avoid having the version history
> >>    to fall into the final commit log.
> >> - Add lore.kernel.org links to the submitted patches.
> >> - Apply the
> >> 0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
> >>    to the kernel.
> >>
> >> Changes in v3:
> >> - Update the commit description.
> >> - Bump U-Boot to version 2022-07.
> >> - Remove U-Boot patches merged in version 2022-07.
> >> - Update the Linux patches.
> >>
> >> Changes in v2:
> >> - Change commit subject and description.
> >> - Update linux patch to version 4. It hasn't been merged yet but has
> >>    been reviewed. This is the most up-to-date version.
> >> - Replace `Co-developed-by:' tag with `Co-authored-by'.
> >> - Use the buildroot's output directory if the binaries directory is
> >>    not passed as a parameter to the `flash.sh' script.
> >> - Replace the linux.config file with an architectural defconfig and
> >>    a config fragment for the changes.
> >> - Remove useless and deprecated statements in nand-full.lst.
> >> - Remove the buildroot configurations for ext2/ext4 filesystem creation.
> >>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> ---
> >>   DEVELOPERS                                    |   4 +
> >>   board/bsh/imx8mn-bsh-smm-s2/flash.sh          |  26 +
> >>   board/bsh/imx8mn-bsh-smm-s2/linux.fragment    | 895 ++++++++++++++++++
> >>   board/bsh/imx8mn-bsh-smm-s2/nand-full.lst     |  29 +
> >>   ...ine-mxs-use-platform_driver_register.patch |  45 +
> >>   ...2-dmaengine-mxs-fix-section-mismatch.patch |  39 +
> >>   ...d-rawnand-gpmi-Fix-setting-busy-time.patch |  39 +
> >>   ...Remove-rootwait-1-to-all-the-affecte.patch | 159 ++++
> >>   board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
> >>   board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
> >>   configs/imx8mn_bsh_smm_s2_defconfig           |  40 +
> >>   11 files changed, 1355 insertions(+)
> >>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
> >>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> >>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> >>   create mode 100644
> >> board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch
> >>   create mode 100644
> >> board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch
> >>   create mode 100644
> >> board/bsh/imx8mn-bsh-smm-s2/patches/linux/0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
> >>   create mode 100644
> >> board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
> >>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2/post-build.sh
> >>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/readme.txt
> >>   create mode 100644 configs/imx8mn_bsh_smm_s2_defconfig
> >>
> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index d2bd0d809a6a..d63cb22cce1d 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -673,6 +673,8 @@ F:    package/luaexpat/
> >>   F:    package/xinetd/
> >>   N:    Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +F:    board/bsh/
> >> +F:    configs/imx8mn_bsh_smm_s2_defconfig
> >>   F:    package/uuu/
> >>   N:    Dario Binacchi <dariobin@libero.it>
> >> @@ -2104,6 +2106,8 @@ F:    package/python-crc16/
> >>   F:    package/python-pyzmq/
> >>   N:    Michael Trimarchi <michael@amarulasolutions.com>
> >> +F:    board/bsh/
> >> +F:    configs/imx8mn_bsh_smm_s2_defconfig
> >>   F:    package/python-spidev/
> >>   N:    Michael Vetter <jubalh@iodoru.org>
> >> diff --git a/board/bsh/imx8mn-bsh-smm-s2/flash.sh
> >> b/board/bsh/imx8mn-bsh-smm-s2/flash.sh
> >> new file mode 100755
> >> index 000000000000..1f343d516dcf
> >> --- /dev/null
> >> +++ b/board/bsh/imx8mn-bsh-smm-s2/flash.sh
> >> @@ -0,0 +1,26 @@
> >> +#!/bin/bash
> >> +
> >> +if [ $# -eq 0 ]; then
> >> +    OUTPUT_DIR=output
> >> +else
> >> +    OUTPUT_DIR=$1
> >> +fi
> >> +
> >> +if ! test -d "${OUTPUT_DIR}" ; then
> >> +    echo "ERROR: no output directory specified."
> >> +    echo "Usage: $0 OUTPUT_DIR"
> >> +    echo ""
> >> +    echo "Arguments:"
> >> +    echo "    OUTPUT_DIR    The Buildroot output directory."
> >> +    exit 1
> >> +fi
> >> +
> >> +IMAGES_DIR=${OUTPUT_DIR}/images
> >> +
> >> +${OUTPUT_DIR}/host/bin/uuu -v -b ${IMAGES_DIR}/nand-full.lst \
> >> +  ${IMAGES_DIR}/flash.bin \
> >> +  ${IMAGES_DIR}/flash.bin \
> >> +  ${IMAGES_DIR}/rootfs.ubifs \
> >> +  ${IMAGES_DIR}/Image \
> >> +  ${IMAGES_DIR}/freescale/imx8mn-bsh-smm-s2.dtb
> >> +
> >> diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> >> b/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> >> new file mode 100644
> >> index 000000000000..80803ab08886
> >> --- /dev/null
> >> +++ b/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> >> @@ -0,0 +1,895 @@
> >> +# CONFIG_BPF_SYSCALL is not set
> >> +CONFIG_TASK_DELAY_ACCT=y
> >> +CONFIG_CGROUP_FREEZER=y
> >> +# CONFIG_CGROUP_BPF is not set
> >> +CONFIG_RELAY=y
> >> +# CONFIG_ARCH_ACTIONS is not set
> >> +# CONFIG_ARCH_SUNXI is not set
> >> +# CONFIG_ARCH_ALPINE is not set
> >> +# CONFIG_ARCH_APPLE is not set
> >> +# CONFIG_ARCH_BCM2835 is not set
> >> +# CONFIG_ARCH_BCM4908 is not set
> >> +# CONFIG_ARCH_BCM_IPROC is not set
> >> +# CONFIG_ARCH_BERLIN is not set
> >> +# CONFIG_ARCH_BRCMSTB is not set
> >> +# CONFIG_ARCH_EXYNOS is not set
> >> +# CONFIG_ARCH_K3 is not set
> >> +# CONFIG_ARCH_LAYERSCAPE is not set
> >> +# CONFIG_ARCH_LG1K is not set
> >> +# CONFIG_ARCH_HISI is not set
> >> +# CONFIG_ARCH_KEEMBAY is not set
> >> +# CONFIG_ARCH_MEDIATEK is not set
> >> +# CONFIG_ARCH_MESON is not set
> >> +# CONFIG_ARCH_MVEBU is not set
> >> +# CONFIG_ARCH_QCOM is not set
> >> +# CONFIG_ARCH_RENESAS is not set
> >> +# CONFIG_ARCH_ROCKCHIP is not set
> >> +# CONFIG_ARCH_S32 is not set
> >> +# CONFIG_ARCH_SEATTLE is not set
> >> +# CONFIG_ARCH_INTEL_SOCFPGA is not set
> >> +# CONFIG_ARCH_SYNQUACER is not set
> >> +# CONFIG_ARCH_TEGRA is not set
> >> +# CONFIG_ARCH_TESLA_FSD is not set
> >> +# CONFIG_ARCH_SPRD is not set
> >> +# CONFIG_ARCH_THUNDER is not set
> >> +# CONFIG_ARCH_THUNDER2 is not set
> >> +# CONFIG_ARCH_UNIPHIER is not set
> >> +# CONFIG_ARCH_VEXPRESS is not set
> >> +# CONFIG_ARCH_VISCONTI is not set
> >> +# CONFIG_ARCH_XGENE is not set
> >> +# CONFIG_ARCH_ZYNQMP is not set
> >> +# CONFIG_KEXEC is not set
> >> +# CONFIG_KEXEC_FILE is not set
> >> +# CONFIG_XEN is not set
> >> +# CONFIG_ARM64_PTR_AUTH is not set
> >> +# CONFIG_ARM64_TLB_RANGE is not set
> >> +# CONFIG_ARM64_MTE is not set
> >> +CONFIG_PM_DEBUG=y
> >> +CONFIG_PM_TEST_SUSPEND=y
> >> +# CONFIG_HIBERNATION is not set
> >> +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> >> +CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> >> +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> >> +CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> >> +# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> >> +# CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM is not set
> >> +# CONFIG_ARM_ARMADA_37XX_CPUFREQ is not set
> >> +CONFIG_ARM_IMX_CPUFREQ_DT=y
> >> +# CONFIG_ARM_QCOM_CPUFREQ_NVMEM is not set
> >> +# CONFIG_ARM_QCOM_CPUFREQ_HW is not set
> >> +# CONFIG_ARM_RASPBERRYPI_CPUFREQ is not set
> >> +# CONFIG_ARM_SCMI_CPUFREQ is not set
> >> +# CONFIG_ARM_TEGRA186_CPUFREQ is not set
> >> +# CONFIG_ARM_MEDIATEK_CPUFREQ is not set
> >> +# CONFIG_QORIQ_CPUFREQ is not set
> >> +# CONFIG_ACPI_APEI_PCIEAER is not set
> >> +# CONFIG_VIRTUALIZATION is not set
> >> +# CONFIG_KVM is not set
> >> +# CONFIG_GCC_PLUGINS is not set
> >> +CONFIG_IPV6=y
> >> +CONFIG_MODVERSIONS=y
> >> +CONFIG_IPV6_SIT=m
> >> +CONFIG_NET_DSA_TAG_OCELOT=m
> >> +CONFIG_VLAN_8021Q=y
> >> +CONFIG_LLC2=y
> >> +CONFIG_NET_SCH_MULTIQ=m
> >> +CONFIG_NET_CLS_TCINDEX=m
> >> +CONFIG_NET_PKTGEN=m
> >> +CONFIG_BT=y
> >> +CONFIG_BT_RFCOMM=y
> >> +CONFIG_BT_RFCOMM_TTY=y
> >> +CONFIG_BT_BNEP=y
> >> +CONFIG_BT_BNEP_MC_FILTER=y
> >> +CONFIG_BT_BNEP_PROTO_FILTER=y
> >> +CONFIG_BT_HIDP=y
> >> +# CONFIG_CAN_RCAR is not set
> >> +# CONFIG_CAN_RCAR_CANFD is not set
> >> +# CONFIG_CAN_MCP251XFD is not set
> >> +CONFIG_BT_HCIUART=y
> >> +CONFIG_BT_HCIUART_BCSP=y
> >> +CONFIG_BT_HCIUART_ATH3K=y
> >> +CONFIG_BT_HCIUART_3WIRE=y
> >> +CONFIG_BT_HCIVHCI=y
> >> +CONFIG_CFG80211=y
> >> +CONFIG_NL80211_TESTMODE=y
> >> +CONFIG_CFG80211_WEXT=y
> >> +CONFIG_MAC80211=y
> >> +# CONFIG_BT_HCIUART_MRVL is not set
> >> +# CONFIG_BT_MRVL is not set
> >> +# CONFIG_BT_MRVL_SDIO is not set
> >> +# CONFIG_BT_QCOMSMD is not set
> >> +# CONFIG_RFKILL is not set
> >> +# CONFIG_PCI is not set
> >> +# CONFIG_PCIEPORTBUS is not set
> >> +# CONFIG_PCIEAER is not set
> >> +# CONFIG_PCI_IOV is not set
> >> +# CONFIG_PCI_PASID is not set
> >> +# CONFIG_HOTPLUG_PCI is not set
> >> +# CONFIG_HOTPLUG_PCI_ACPI is not set
> >> +# CONFIG_PCI_AARDVARK is not set
> >> +# CONFIG_PCI_TEGRA is not set
> >> +# CONFIG_PCIE_RCAR_HOST is not set
> >> +# CONFIG_PCIE_RCAR_EP is not set
> >> +# CONFIG_PCI_HOST_GENERIC is not set
> >> +# CONFIG_PCI_XGENE is not set
> >> +# CONFIG_PCIE_ALTERA is not set
> >> +# CONFIG_PCIE_ALTERA_MSI is not set
> >> +# CONFIG_PCI_HOST_THUNDER_PEM is not set
> >> +# CONFIG_PCI_HOST_THUNDER_ECAM is not set
> >> +# CONFIG_PCIE_ROCKCHIP_HOST is not set
> >> +# CONFIG_PCIE_BRCMSTB is not set
> >> +# CONFIG_PCI_IMX6 is not set
> >> +# CONFIG_PCI_LAYERSCAPE is not set
> >> +# CONFIG_PCI_HISI is not set
> >> +# CONFIG_PCIE_QCOM is not set
> >> +# CONFIG_PCIE_ARMADA_8K is not set
> >> +# CONFIG_PCIE_KIRIN is not set
> >> +# CONFIG_PCIE_HISI_STB is not set
> >> +# CONFIG_PCIE_TEGRA194_HOST is not set
> >> +# CONFIG_PCIE_VISCONTI_HOST is not set
> >> +# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
> >> +# CONFIG_PCI_ENDPOINT is not set
> >> +# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> >> +# CONFIG_PCI_EPF_TEST is not set
> >> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> >> +CONFIG_BRCMSTB_GISB_ARB=y
> >> +CONFIG_VEXPRESS_CONFIG=y
> >> +# CONFIG_HISILICON_LPC is not set
> >> +# CONFIG_TEGRA_ACONNECT is not set
> >> +# CONFIG_RASPBERRYPI_FIRMWARE is not set
> >> +# CONFIG_INTEL_STRATIX10_SERVICE is not set
> >> +# CONFIG_INTEL_STRATIX10_RSU is not set
> >> +CONFIG_IMX_DSP=y
> >> +# CONFIG_GNSS is not set
> >> +# CONFIG_GNSS_MTK_SERIAL is not set
> >> +CONFIG_MTD_CMDLINE_PARTS=y
> >> +# CONFIG_MTD_NAND_BRCMNAND is not set
> >> +CONFIG_MTD_NAND_GPMI_NAND=y
> >> +# CONFIG_MTD_NAND_MARVELL is not set
> >> +# CONFIG_MTD_NAND_FSL_IFC is not set
> >> +# CONFIG_MTD_NAND_QCOM is not set
> >> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> >> +CONFIG_MTD_UBI=y
> >> +# CONFIG_BLK_DEV_NVME is not set
> >> +# CONFIG_PCI_ENDPOINT_TEST is not set
> >> +CONFIG_RAID_ATTRS=m
> >> +# CONFIG_SCSI_HISI_SAS_PCI is not set
> >> +# CONFIG_MEGARAID_SAS is not set
> >> +# CONFIG_SCSI_MPT3SAS is not set
> >> +# CONFIG_SCSI_UFS_QCOM is not set
> >> +# CONFIG_SCSI_UFS_HISI is not set
> >> +# CONFIG_SCSI_UFS_EXYNOS is not set
> >> +# CONFIG_SATA_AHCI is not set
> >> +CONFIG_AHCI_IMX=y
> >> +# CONFIG_AHCI_BRCM is not set
> >> +# CONFIG_AHCI_MVEBU is not set
> >> +# CONFIG_SATA_SIL24 is not set
> >> +# CONFIG_SATA_RCAR is not set
> >> +CONFIG_DM_CRYPT=m
> >> +# CONFIG_NET_DSA_BCM_SF2 is not set
> >> +# CONFIG_NET_DSA_MSCC_FELIX is not set
> >> +# CONFIG_NET_XGENE is not set
> >> +# CONFIG_ATL1C is not set
> >> +# CONFIG_SYSTEMPORT is not set
> >> +# CONFIG_BNX2X is not set
> >> +# CONFIG_THUNDER_NIC_PF is not set
> >> +CONFIG_FSL_XGMAC_MDIO=y
> >> +CONFIG_FSL_ENETC_IERB=y
> >> +# CONFIG_FSL_FMAN is not set
> >> +# CONFIG_FSL_DPAA_ETH is not set
> >> +# CONFIG_FSL_DPAA2_ETH is not set
> >> +# CONFIG_FSL_ENETC is not set
> >> +# CONFIG_FSL_ENETC_VF is not set
> >> +# CONFIG_FSL_ENETC_QOS is not set
> >> +CONFIG_MVMDIO=y
> >> +CONFIG_MSCC_OCELOT_SWITCH=m
> >> +# CONFIG_HNS3 is not set
> >> +# CONFIG_HNS3_HCLGE is not set
> >> +# CONFIG_HNS3_ENET is not set
> >> +# CONFIG_E1000 is not set
> >> +# CONFIG_E1000E is not set
> >> +# CONFIG_IGB is not set
> >> +# CONFIG_IGBVF is not set
> >> +# CONFIG_MVNETA is not set
> >> +# CONFIG_MVPP2 is not set
> >> +# CONFIG_SKY2 is not set
> >> +# CONFIG_MLX4_EN is not set
> >> +# CONFIG_MLX5_CORE is not set
> >> +# CONFIG_MLX5_CORE_EN is not set
> >> +# CONFIG_R8169 is not set
> >> +# CONFIG_SH_ETH is not set
> >> +# CONFIG_RAVB is not set
> >> +CONFIG_STMMAC_ETH=y
> >> +CONFIG_DWMAC_GENERIC=m
> >> +CONFIG_MICROCHIP_PHY=y
> >> +CONFIG_NXP_TJA11XX_PHY=y
> >> +CONFIG_MDIO_BITBANG=y
> >> +# CONFIG_SNI_AVE is not set
> >> +# CONFIG_SNI_NETSEC is not set
> >> +# CONFIG_TI_K3_AM65_CPSW_NUSS is not set
> >> +# CONFIG_QCOM_IPA is not set
> >> +# CONFIG_MESON_GXL_PHY is not set
> >> +# CONFIG_AQUANTIA_PHY is not set
> >> +# CONFIG_BCM54140_PHY is not set
> >> +# CONFIG_MARVELL_PHY is not set
> >> +# CONFIG_MARVELL_10G_PHY is not set
> >> +# CONFIG_MICREL_PHY is not set
> >> +# CONFIG_MICROSEMI_PHY is not set
> >> +# CONFIG_AT803X_PHY is not set
> >> +# CONFIG_REALTEK_PHY is not set
> >> +# CONFIG_ROCKCHIP_PHY is not set
> >> +# CONFIG_DP83867_PHY is not set
> >> +# CONFIG_VITESSE_PHY is not set
> >> +# CONFIG_USB_BRCMSTB is not set
> >> +CONFIG_USB_RTL8152=y
> >> +CONFIG_USB_USBNET=y
> >> +CONFIG_BRCMFMAC=y
> >> +CONFIG_HOSTAP=y
> >> +# CONFIG_ATH10K is not set
> >> +# CONFIG_ATH10K_PCI is not set
> >> +# CONFIG_ATH10K_SNOC is not set
> >> +# CONFIG_WCN36XX is not set
> >> +# CONFIG_MWIFIEX is not set
> >> +# CONFIG_MWIFIEX_SDIO is not set
> >> +# CONFIG_MWIFIEX_PCIE is not set
> >> +CONFIG_KEYBOARD_SNVS_PWRKEY=y
> >> +# CONFIG_KEYBOARD_IMX_SC_KEY is not set
> >> +# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
> >> +# CONFIG_INPUT_PM8941_PWRKEY is not set
> >> +# CONFIG_INPUT_PM8XXX_VIBRATOR is not set
> >> +# CONFIG_INPUT_PWM_BEEPER is not set
> >> +# CONFIG_INPUT_PWM_VIBRA is not set
> >> +# CONFIG_INPUT_HISI_POWERKEY is not set
> >> +# CONFIG_SERIAL_8250_BCM2835AUX is not set
> >> +# CONFIG_SERIAL_8250_OMAP is not set
> >> +# CONFIG_SERIAL_8250_MT6577 is not set
> >> +# CONFIG_SERIAL_8250_UNIPHIER is not set
> >> +# CONFIG_SERIAL_MESON is not set
> >> +# CONFIG_SERIAL_MESON_CONSOLE is not set
> >> +# CONFIG_SERIAL_SAMSUNG is not set
> >> +# CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
> >> +# CONFIG_SERIAL_TEGRA is not set
> >> +# CONFIG_SERIAL_TEGRA_TCU is not set
> >> +# CONFIG_SERIAL_SH_SCI is not set
> >> +# CONFIG_SERIAL_MSM is not set
> >> +# CONFIG_SERIAL_MSM_CONSOLE is not set
> >> +# CONFIG_SERIAL_QCOM_GENI is not set
> >> +# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
> >> +# CONFIG_SERIAL_MVEBU_UART is not set
> >> +# CONFIG_SERIAL_OWL is not set
> >> +# CONFIG_I2C_MUX is not set
> >> +# CONFIG_I2C_BCM2835 is not set
> >> +# CONFIG_I2C_MESON is not set
> >> +# CONFIG_I2C_MT65XX is not set
> >> +# CONFIG_I2C_MV64XXX is not set
> >> +# CONFIG_I2C_OMAP is not set
> >> +# CONFIG_I2C_OWL is not set
> >> +# CONFIG_I2C_PXA is not set
> >> +# CONFIG_I2C_QCOM_CCI is not set
> >> +# CONFIG_I2C_QCOM_GENI is not set
> >> +# CONFIG_I2C_QUP is not set
> >> +# CONFIG_I2C_RIIC is not set
> >> +# CONFIG_I2C_S3C2410 is not set
> >> +# CONFIG_I2C_SH_MOBILE is not set
> >> +# CONFIG_I2C_TEGRA is not set
> >> +# CONFIG_I2C_UNIPHIER_F is not set
> >> +# CONFIG_I2C_RCAR is not set
> >> +# CONFIG_SPI_ARMADA_3700 is not set
> >> +# CONFIG_SPI_BCM2835 is not set
> >> +# CONFIG_SPI_BCM2835AUX is not set
> >> +# CONFIG_SPI_DESIGNWARE is not set
> >> +# CONFIG_SPI_DW_DMA is not set
> >> +# CONFIG_SPI_DW_MMIO is not set
> >> +CONFIG_SPI_IMX=y
> >> +# CONFIG_SPI_FSL_DSPI is not set
> >> +# CONFIG_SPI_MESON_SPICC is not set
> >> +# CONFIG_SPI_MESON_SPIFC is not set
> >> +# CONFIG_SPI_ORION is not set
> >> +CONFIG_SPI_SPIDEV=y
> >> +CONFIG_SPI_SLAVE=y
> >> +CONFIG_SPI_SLAVE_TIME=y
> >> +CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
> >> +CONFIG_PINCTRL=y
> >> +# CONFIG_SPI_RPCIF is not set
> >> +# CONFIG_SPI_RSPI is not set
> >> +# CONFIG_SPI_QCOM_QSPI is not set
> >> +# CONFIG_SPI_QUP is not set
> >> +# CONFIG_SPI_QCOM_GENI is not set
> >> +# CONFIG_SPI_S3C64XX is not set
> >> +# CONFIG_SPI_SH_MSIOF is not set
> >> +# CONFIG_SPI_SUN6I is not set
> >> +# CONFIG_SPMI is not set
> >> +# CONFIG_PINCTRL_OWL is not set
> >> +# CONFIG_PINCTRL_S700 is not set
> >> +# CONFIG_PINCTRL_S900 is not set
> >> +CONFIG_GPIOLIB=y
> >> +# CONFIG_PINCTRL_MSM is not set
> >> +# CONFIG_PINCTRL_IPQ8074 is not set
> >> +# CONFIG_PINCTRL_IPQ6018 is not set
> >> +# CONFIG_PINCTRL_MSM8916 is not set
> >> +# CONFIG_PINCTRL_MSM8994 is not set
> >> +# CONFIG_PINCTRL_MSM8996 is not set
> >> +# CONFIG_PINCTRL_MSM8998 is not set
> >> +# CONFIG_PINCTRL_QCS404 is not set
> >> +# CONFIG_PINCTRL_QDF2XXX is not set
> >> +# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
> >> +# CONFIG_PINCTRL_SC7180 is not set
> >> +# CONFIG_PINCTRL_SC7280 is not set
> >> +# CONFIG_PINCTRL_SDM845 is not set
> >> +# CONFIG_PINCTRL_SM8150 is not set
> >> +# CONFIG_PINCTRL_SM8250 is not set
> >> +# CONFIG_PINCTRL_SM8350 is not set
> >> +# CONFIG_PINCTRL_SM8450 is not set
> >> +# CONFIG_PINCTRL_LPASS_LPI is not set
> >> +# CONFIG_GPIO_DAVINCI is not set
> >> +# CONFIG_GPIO_MPC8XXX is not set
> >> +# CONFIG_GPIO_RCAR is not set
> >> +# CONFIG_GPIO_UNIPHIER is not set
> >> +# CONFIG_GPIO_VISCONTI is not set
> >> +# CONFIG_GPIO_XGENE_SB is not set
> >> +CONFIG_POWER_RESET_BRCMSTB=y
> >> +# CONFIG_GPIO_MAX77620 is not set
> >> +# CONFIG_GPIO_SL28CPLD is not set
> >> +# CONFIG_POWER_RESET_MSM is not set
> >> +# CONFIG_POWER_RESET_QCOM_PON is not set
> >> +# CONFIG_BATTERY_MAX17042 is not set
> >> +# CONFIG_CHARGER_BQ25890 is not set
> >> +# CONFIG_CHARGER_BQ25980 is not set
> >> +# CONFIG_SENSORS_JC42 is not set
> >> +# CONFIG_SENSORS_LM75 is not set
> >> +# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
> >> +# CONFIG_SENSORS_SL28CPLD is not set
> >> +CONFIG_THERMAL_WRITABLE_TRIPS=y
> >> +CONFIG_IMX_SC_THERMAL=y
> >> +CONFIG_IMX8MM_THERMAL=y
> >> +CONFIG_QORIQ_THERMAL=y
> >> +# CONFIG_SUN8I_THERMAL is not set
> >> +# CONFIG_ROCKCHIP_THERMAL is not set
> >> +# CONFIG_RCAR_THERMAL is not set
> >> +# CONFIG_RCAR_GEN3_THERMAL is not set
> >> +# CONFIG_RZG2L_THERMAL is not set
> >> +# CONFIG_ARMADA_THERMAL is not set
> >> +# CONFIG_BCM2711_THERMAL is not set
> >> +# CONFIG_BCM2835_THERMAL is not set
> >> +# CONFIG_BRCMSTB_THERMAL is not set
> >> +# CONFIG_EXYNOS_THERMAL is not set
> >> +# CONFIG_TEGRA_SOCTHERM is not set
> >> +# CONFIG_TEGRA_BPMP_THERMAL is not set
> >> +# CONFIG_QCOM_TSENS is not set
> >> +# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
> >> +# CONFIG_QCOM_LMH is not set
> >> +# CONFIG_UNIPHIER_THERMAL is not set
> >> +# CONFIG_SL28CPLD_WATCHDOG is not set
> >> +# CONFIG_S3C2410_WATCHDOG is not set
> >> +# CONFIG_BCM7038_WDT is not set
> >> +# CONFIG_SUNXI_WATCHDOG is not set
> >> +CONFIG_IMX_SC_WDT=y
> >> +CONFIG_IMX7ULP_WDT=y
> >> +# CONFIG_QCOM_WDT is not set
> >> +# CONFIG_MESON_GXBB_WATCHDOG is not set
> >> +# CONFIG_MESON_WATCHDOG is not set
> >> +# CONFIG_RENESAS_WDT is not set
> >> +# CONFIG_RENESAS_RZG2LWDT is not set
> >> +# CONFIG_UNIPHIER_WATCHDOG is not set
> >> +# CONFIG_BCM2835_WDT is not set
> >> +# CONFIG_MFD_ALTERA_SYSMGR is not set
> >> +# CONFIG_MFD_AXP20X_RSB is not set
> >> +# CONFIG_MFD_EXYNOS_LPASS is not set
> >> +# CONFIG_MFD_HI655X_PMIC is not set
> >> +# CONFIG_MFD_MT6397 is not set
> >> +# CONFIG_MFD_SPMI_PMIC is not set
> >> +# CONFIG_MFD_SL28CPLD is not set
> >> +CONFIG_REGULATOR=y
> >> +# CONFIG_REGULATOR_HI655X is not set
> >> +# CONFIG_REGULATOR_MP8859 is not set
> >> +# CONFIG_REGULATOR_MT6358 is not set
> >> +# CONFIG_REGULATOR_MT6397 is not set
> >> +# CONFIG_REGULATOR_PF8X00 is not set
> >> +# CONFIG_REGULATOR_QCOM_RPMH is not set
> >> +# CONFIG_REGULATOR_QCOM_SMD_RPM is not set
> >> +# CONFIG_REGULATOR_QCOM_SPMI is not set
> >> +# CONFIG_REGULATOR_TPS65132 is not set
> >> +CONFIG_MEDIA_SUPPORT=y
> >> +# CONFIG_RC_CORE is not set
> >> +# CONFIG_RC_DECODERS is not set
> >> +# CONFIG_RC_DEVICES is not set
> >> +# CONFIG_IR_MESON is not set
> >> +# CONFIG_IR_SUNXI is not set
> >> +CONFIG_SDR_PLATFORM_DRIVERS=y
> >> +# CONFIG_VIDEO_QCOM_CAMSS is not set
> >> +# CONFIG_VIDEO_RCAR_CSI2 is not set
> >> +# CONFIG_VIDEO_RCAR_VIN is not set
> >> +# CONFIG_VIDEO_SUN6I_CSI is not set
> >> +# CONFIG_VIDEO_RCAR_ISP is not set
> >> +# CONFIG_VIDEO_SAMSUNG_S5P_JPEG is not set
> >> +# CONFIG_VIDEO_SAMSUNG_S5P_MFC is not set
> >> +# CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC is not set
> >> +# CONFIG_VIDEO_RENESAS_FDP1 is not set
> >> +# CONFIG_VIDEO_RENESAS_FCP is not set
> >> +# CONFIG_VIDEO_RENESAS_VSP1 is not set
> >> +# CONFIG_VIDEO_QCOM_VENUS is not set
> >> +# CONFIG_VIDEO_RCAR_DRIF is not set
> >> +CONFIG_VIDEO_OV5640=y
> >> +CONFIG_DRM=y
> >> +CONFIG_DRM_I2C_CH7006=m
> >> +CONFIG_DRM_I2C_SIL164=m
> >> +# CONFIG_DRM_NOUVEAU is not set
> >> +# CONFIG_DRM_EXYNOS is not set
> >> +# CONFIG_DRM_EXYNOS5433_DECON is not set
> >> +# CONFIG_DRM_EXYNOS7_DECON is not set
> >> +# CONFIG_DRM_EXYNOS_DSI is not set
> >> +# CONFIG_DRM_EXYNOS_DP is not set
> >> +# CONFIG_DRM_EXYNOS_HDMI is not set
> >> +# CONFIG_DRM_EXYNOS_MIC is not set
> >> +# CONFIG_DRM_ROCKCHIP is not set
> >> +# CONFIG_ROCKCHIP_ANALOGIX_DP is not set
> >> +# CONFIG_ROCKCHIP_CDN_DP is not set
> >> +# CONFIG_ROCKCHIP_DW_HDMI is not set
> >> +# CONFIG_ROCKCHIP_DW_MIPI_DSI is not set
> >> +# CONFIG_ROCKCHIP_INNO_HDMI is not set
> >> +# CONFIG_ROCKCHIP_LVDS is not set
> >> +# CONFIG_DRM_RCAR_DU is not set
> >> +# CONFIG_DRM_RCAR_MIPI_DSI is not set
> >> +# CONFIG_DRM_SUN4I is not set
> >> +# CONFIG_DRM_SUN6I_DSI is not set
> >> +# CONFIG_DRM_SUN8I_DW_HDMI is not set
> >> +# CONFIG_DRM_SUN8I_MIXER is not set
> >> +# CONFIG_DRM_MSM is not set
> >> +# CONFIG_DRM_TEGRA is not set
> >> +# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
> >> +# CONFIG_DRM_PANEL_LVDS is not set
> >> +# CONFIG_DRM_PANEL_SIMPLE is not set
> >> +# CONFIG_DRM_PANEL_EDP is not set
> >> +# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
> >> +# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
> >> +# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
> >> +CONFIG_DRM_DISPLAY_CONNECTOR=m
> >> +# CONFIG_DRM_LONTIUM_LT8912B is not set
> >> +CONFIG_DRM_NWL_MIPI_DSI=y
> >> +# CONFIG_DRM_LONTIUM_LT9611UXC is not set
> >> +# CONFIG_DRM_PARADE_PS8640 is not set
> >> +CONFIG_DRM_I2C_ADV7511=y
> >> +CONFIG_DRM_DW_HDMI_I2S_AUDIO=m
> >> +CONFIG_DRM_IMX_DCSS=y
> >> +# CONFIG_DRM_VC4 is not set
> >> +# CONFIG_DRM_HISI_HIBMC is not set
> >> +CONFIG_DRM_MXSFB=y
> >> +# CONFIG_DRM_MEDIATEK is not set
> >> +# CONFIG_DRM_MEDIATEK_HDMI is not set
> >> +# CONFIG_DRM_MESON is not set
> >> +CONFIG_DRM_LEGACY=y
> >> +# CONFIG_FB is not set
> >> +# CONFIG_FB_MODE_HELPERS is not set
> >> +# CONFIG_FB_EFI is not set
> >> +# CONFIG_BACKLIGHT_PWM is not set
> >> +# CONFIG_BACKLIGHT_LP855X is not set
> >> +# CONFIG_LOGO is not set
> >> +CONFIG_SND_DYNAMIC_MINORS=y
> >> +CONFIG_SND_ALOOP=m
> >> +# CONFIG_SND_SPI is not set
> >> +# CONFIG_SND_USB is not set
> >> +# CONFIG_SND_HDA_TEGRA is not set
> >> +# CONFIG_SND_HDA_CODEC_HDMI is not set
> >> +CONFIG_SND_SOC_FSL_ASRC=y
> >> +CONFIG_SND_SOC_FSL_EASRC=y
> >> +CONFIG_SND_IMX_SOC=y
> >> +CONFIG_SND_SOC_FSL_ASOC_CARD=y
> >> +CONFIG_SND_SOC_SOF_TOPLEVEL=y
> >> +CONFIG_SND_SOC_SOF_OF=m
> >> +CONFIG_SND_SOC_SOF_IMX_TOPLEVEL=y
> >> +CONFIG_SND_SOC_AK4458=y
> >> +CONFIG_SND_SOC_AK5558=y
> >> +CONFIG_SND_SOC_PCM512x_I2C=y
> >> +CONFIG_SND_SIMPLE_CARD=y
> >> +CONFIG_SND_AUDIO_GRAPH_CARD=y
> >> +CONFIG_USB_CONN_GPIO=y
> >> +# CONFIG_SND_BCM2835_SOC_I2S is not set
> >> +# CONFIG_SND_SOC_FSL_MICFIL is not set
> >> +# CONFIG_SND_SOC_IMX_SGTL5000 is not set
> >> +# CONFIG_SND_SOC_IMX_SPDIF is not set
> >> +# CONFIG_SND_SOC_IMX_AUDMIX is not set
> >> +# CONFIG_SND_MESON_AXG_SOUND_CARD is not set
> >> +# CONFIG_SND_MESON_GX_SOUND_CARD is not set
> >> +# CONFIG_SND_SOC_QCOM is not set
> >> +# CONFIG_SND_SOC_APQ8016_SBC is not set
> >> +# CONFIG_SND_SOC_MSM8996 is not set
> >> +# CONFIG_SND_SOC_SDM845 is not set
> >> +# CONFIG_SND_SOC_SM8250 is not set
> >> +# CONFIG_SND_SOC_ROCKCHIP is not set
> >> +# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
> >> +# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
> >> +# CONFIG_SND_SOC_RK3399_GRU_SOUND is not set
> >> +# CONFIG_SND_SOC_SAMSUNG is not set
> >> +# CONFIG_SND_SOC_RCAR is not set
> >> +# CONFIG_SND_SOC_RZ is not set
> >> +# CONFIG_SND_SUN4I_I2S is not set
> >> +# CONFIG_SND_SUN4I_SPDIF is not set
> >> +# CONFIG_SND_SOC_TEGRA is not set
> >> +# CONFIG_SND_SOC_TEGRA210_AHUB is not set
> >> +# CONFIG_SND_SOC_TEGRA210_DMIC is not set
> >> +# CONFIG_SND_SOC_TEGRA210_I2S is not set
> >> +# CONFIG_SND_SOC_TEGRA186_DSPK is not set
> >> +# CONFIG_SND_SOC_TEGRA210_ADMAIF is not set
> >> +# CONFIG_SND_SOC_TEGRA210_MVC is not set
> >> +# CONFIG_SND_SOC_TEGRA210_SFC is not set
> >> +# CONFIG_SND_SOC_TEGRA210_AMX is not set
> >> +# CONFIG_SND_SOC_TEGRA210_ADX is not set
> >> +# CONFIG_SND_SOC_TEGRA210_MIXER is not set
> >> +# CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD is not set
> >> +# CONFIG_SND_SOC_AK4613 is not set
> >> +# CONFIG_SND_SOC_ES7134 is not set
> >> +# CONFIG_SND_SOC_ES7241 is not set
> >> +# CONFIG_SND_SOC_GTM601 is not set
> >> +# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
> >> +# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
> >> +# CONFIG_SND_SOC_PCM3168A_I2C is not set
> >> +# CONFIG_SND_SOC_RT5659 is not set
> >> +# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
> >> +# CONFIG_SND_SOC_SIMPLE_MUX is not set
> >> +# CONFIG_SND_SOC_TAS571X is not set
> >> +# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> >> +# CONFIG_SND_SOC_WCD934X is not set
> >> +# CONFIG_SND_SOC_WM8904 is not set
> >> +# CONFIG_SND_SOC_WM8960 is not set
> >> +# CONFIG_SND_SOC_WM8962 is not set
> >> +# CONFIG_SND_SOC_WM8978 is not set
> >> +# CONFIG_SND_SOC_WSA881X is not set
> >> +# CONFIG_SND_SOC_NAU8822 is not set
> >> +# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
> >> +# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
> >> +# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
> >> +# CONFIG_HID_MULTITOUCH is not set
> >> +# CONFIG_I2C_HID_ACPI is not set
> >> +# CONFIG_I2C_HID_OF is not set
> >> +# CONFIG_USB_XHCI_PCI_RENESAS is not set
> >> +# CONFIG_USB_XHCI_TEGRA is not set
> >> +# CONFIG_USB_EHCI_EXYNOS is not set
> >> +# CONFIG_USB_OHCI_EXYNOS is not set
> >> +CONFIG_USB_HCD_TEST_MODE=y
> >> +# CONFIG_USB_RENESAS_USBHS_HCD is not set
> >> +# CONFIG_USB_RENESAS_USBHS is not set
> >> +CONFIG_USB_UAS=y
> >> +# CONFIG_USB_CDNS_SUPPORT is not set
> >> +# CONFIG_USB_CDNS3 is not set
> >> +# CONFIG_USB_CDNS3_GADGET is not set
> >> +# CONFIG_USB_CDNS3_HOST is not set
> >> +# CONFIG_USB_MTU3 is not set
> >> +# CONFIG_USB_MUSB_SUNXI is not set
> >> +CONFIG_USB_SERIAL=y
> >> +CONFIG_USB_SERIAL_CONSOLE=y
> >> +CONFIG_USB_SERIAL_GENERIC=y
> >> +CONFIG_USB_SERIAL_SIMPLE=y
> >> +CONFIG_USB_SERIAL_FTDI_SIO=y
> >> +CONFIG_USB_TEST=m
> >> +CONFIG_USB_EHSET_TEST_FIXTURE=y
> >> +# CONFIG_USB_SERIAL_CP210X is not set
> >> +# CONFIG_USB_SERIAL_OPTION is not set
> >> +CONFIG_USB_MXS_PHY=y
> >> +CONFIG_USB_ULPI=y
> >> +CONFIG_USB_SNP_UDC_PLAT=y
> >> +CONFIG_USB_BDC_UDC=y
> >> +CONFIG_USB_CONFIGFS=y
> >> +# CONFIG_USB_RENESAS_USBHS_UDC is not set
> >> +# CONFIG_USB_RENESAS_USB3 is not set
> >> +# CONFIG_USB_TEGRA_XUDC is not set
> >> +CONFIG_USB_CONFIGFS_F_LB_SS=y
> >> +CONFIG_USB_CONFIGFS_F_UAC1=y
> >> +CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> >> +CONFIG_USB_CONFIGFS_F_UAC2=y
> >> +CONFIG_USB_CONFIGFS_F_MIDI=y
> >> +CONFIG_USB_CONFIGFS_F_HID=y
> >> +CONFIG_USB_CONFIGFS_F_UVC=y
> >> +CONFIG_USB_ZERO=m
> >> +CONFIG_USB_AUDIO=m
> >> +CONFIG_USB_ETH=m
> >> +CONFIG_USB_MASS_STORAGE=m
> >> +CONFIG_USB_G_SERIAL=m
> >> +CONFIG_TYPEC=y
> >> +CONFIG_TYPEC_TCPM=y
> >> +CONFIG_TYPEC_TCPCI=y
> >> +# CONFIG_TYPEC_TPS6598X is not set
> >> +# CONFIG_MMC_SDHCI_ACPI is not set
> >> +# CONFIG_MMC_SDHCI_TEGRA is not set
> >> +# CONFIG_MMC_MESON_GX is not set
> >> +# CONFIG_MMC_SDHCI_MSM is not set
> >> +# CONFIG_MMC_SDHI is not set
> >> +# CONFIG_MMC_UNIPHIER is not set
> >> +# CONFIG_MMC_DW_ROCKCHIP is not set
> >> +# CONFIG_MMC_SUNXI is not set
> >> +# CONFIG_MMC_BCM2835 is not set
> >> +# CONFIG_MMC_MTK is not set
> >> +# CONFIG_MMC_OWL is not set
> >> +# CONFIG_LEDS_LM3692X is not set
> >> +# CONFIG_LEDS_PCA9532 is not set
> >> +# CONFIG_EDAC_LAYERSCAPE is not set
> >> +# CONFIG_RTC_DRV_HYM8563 is not set
> >> +# CONFIG_RTC_DRV_PCF85063 is not set
> >> +# CONFIG_RTC_DRV_M41T80 is not set
> >> +# CONFIG_RTC_DRV_RV3028 is not set
> >> +# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
> >> +# CONFIG_RTC_DRV_S3C is not set
> >> +CONFIG_RTC_DRV_SNVS=y
> >> +CONFIG_RTC_DRV_IMX_SC=y
> >> +# CONFIG_RTC_DRV_SUN6I is not set
> >> +# CONFIG_RTC_DRV_ARMADA38X is not set
> >> +# CONFIG_RTC_DRV_PM8XXX is not set
> >> +# CONFIG_RTC_DRV_TEGRA is not set
> >> +# CONFIG_RTC_DRV_XGENE is not set
> >> +# CONFIG_RTC_DRV_MT6397 is not set
> >> +CONFIG_BCM_SBA_RAID=m
> >> +# CONFIG_DMA_BCM2835 is not set
> >> +# CONFIG_DMA_SUN6I is not set
> >> +CONFIG_FSL_QDMA=m
> >> +CONFIG_IMX_SDMA=y
> >> +# CONFIG_K3_DMA is not set
> >> +# CONFIG_MV_XOR is not set
> >> +CONFIG_MXS_DMA=y
> >> +# CONFIG_OWL_DMA is not set
> >> +# CONFIG_TEGRA186_GPC_DMA is not set
> >> +# CONFIG_TEGRA20_APB_DMA is not set
> >> +# CONFIG_TEGRA210_ADMA is not set
> >> +# CONFIG_QCOM_BAM_DMA is not set
> >> +CONFIG_DMATEST=y
> >> +CONFIG_DMABUF_HEAPS=y
> >> +CONFIG_DMABUF_HEAPS_SYSTEM=y
> >> +CONFIG_DMABUF_HEAPS_CMA=y
> >> +# CONFIG_RCAR_DMAC is not set
> >> +# CONFIG_RENESAS_USB_DMAC is not set
> >> +# CONFIG_RZ_DMAC is not set
> >> +# CONFIG_TI_K3_UDMA is not set
> >> +# CONFIG_TI_K3_UDMA_GLUE_LAYER is not set
> >> +# CONFIG_VFIO_PCI is not set
> >> +# CONFIG_VIRTIO_PCI is not set
> >> +# CONFIG_XEN_GNTDEV is not set
> >> +# CONFIG_XEN_GRANT_DEV_ALLOC is not set
> >> +# CONFIG_VIDEO_HANTRO is not set
> >> +# CONFIG_VIDEO_IMX_MEDIA is not set
> >> +# CONFIG_COMMON_CLK_SCMI is not set
> >> +# CONFIG_COMMON_CLK_FSL_SAI is not set
> >> +CONFIG_COMMON_CLK_XGENE=y
> >> +# CONFIG_COMMON_CLK_BD718XX is not set
> >> +# CONFIG_CLK_RASPBERRYPI is not set
> >> +# CONFIG_CLK_IMX8MM is not set
> >> +# CONFIG_CLK_IMX8MP is not set
> >> +# CONFIG_CLK_IMX8MQ is not set
> >> +# CONFIG_CLK_IMX8QXP is not set
> >> +# CONFIG_CLK_IMX8ULP is not set
> >> +# CONFIG_TI_SCI_CLK is not set
> >> +# CONFIG_COMMON_CLK_QCOM is not set
> >> +# CONFIG_QCOM_A53PLL is not set
> >> +# CONFIG_QCOM_CLK_APCS_MSM8916 is not set
> >> +# CONFIG_QCOM_CLK_APCC_MSM8996 is not set
> >> +# CONFIG_QCOM_CLK_SMD_RPM is not set
> >> +# CONFIG_QCOM_CLK_RPMH is not set
> >> +# CONFIG_IPQ_GCC_6018 is not set
> >> +# CONFIG_IPQ_GCC_8074 is not set
> >> +# CONFIG_MSM_GCC_8916 is not set
> >> +# CONFIG_MSM_GCC_8994 is not set
> >> +# CONFIG_MSM_MMCC_8996 is not set
> >> +# CONFIG_MSM_GCC_8998 is not set
> >> +# CONFIG_QCS_GCC_404 is not set
> >> +# CONFIG_SC_GCC_7180 is not set
> >> +# CONFIG_SC_GCC_7280 is not set
> >> +# CONFIG_SDM_CAMCC_845 is not set
> >> +# CONFIG_SDM_GPUCC_845 is not set
> >> +# CONFIG_SDM_VIDEOCC_845 is not set
> >> +# CONFIG_SDM_DISPCC_845 is not set
> >> +# CONFIG_SM_GCC_8350 is not set
> >> +# CONFIG_SM_GCC_8450 is not set
> >> +# CONFIG_SM_GPUCC_8150 is not set
> >> +# CONFIG_SM_GPUCC_8250 is not set
> >> +# CONFIG_QCOM_HFPLL is not set
> >> +# CONFIG_CLK_GFM_LPASS_SM8250 is not set
> >> +# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
> >> +# CONFIG_HWSPINLOCK_QCOM is not set
> >> +# CONFIG_RENESAS_OSTM is not set
> >> +# CONFIG_BCM2835_MBOX is not set
> >> +# CONFIG_QCOM_APCS_IPC is not set
> >> +# CONFIG_QCOM_IPCC is not set
> >> +# CONFIG_ROCKCHIP_IOMMU is not set
> >> +# CONFIG_TEGRA_IOMMU_SMMU is not set
> >> +# CONFIG_MTK_IOMMU is not set
> >> +# CONFIG_QCOM_IOMMU is not set
> >> +CONFIG_IMX_REMOTEPROC=y
> >> +CONFIG_IMX_DSP_REMOTEPROC=y
> >> +CONFIG_RPMSG_CHAR=y
> >> +# CONFIG_QCOM_Q6V5_MSS is not set
> >> +# CONFIG_QCOM_Q6V5_PAS is not set
> >> +# CONFIG_QCOM_SYSMON is not set
> >> +# CONFIG_QCOM_WCNSS_PIL is not set
> >> +# CONFIG_RPMSG_QCOM_GLINK_SMEM is not set
> >> +# CONFIG_RPMSG_QCOM_SMD is not set
> >> +CONFIG_SOC_BRCMSTB=y
> >> +# CONFIG_OWL_PM_DOMAINS is not set
> >> +# CONFIG_RASPBERRYPI_POWER is not set
> >> +# CONFIG_FSL_DPAA is not set
> >> +# CONFIG_FSL_MC_DPIO is not set
> >> +CONFIG_SOC_TI=y
> >> +# CONFIG_MTK_DEVAPC is not set
> >> +# CONFIG_MTK_PMIC_WRAP is not set
> >> +# CONFIG_QCOM_AOSS_QMP is not set
> >> +# CONFIG_QCOM_COMMAND_DB is not set
> >> +# CONFIG_QCOM_CPR is not set
> >> +# CONFIG_QCOM_GENI_SE is not set
> >> +# CONFIG_QCOM_RMTFS_MEM is not set
> >> +# CONFIG_QCOM_RPMH is not set
> >> +# CONFIG_QCOM_RPMHPD is not set
> >> +# CONFIG_QCOM_RPMPD is not set
> >> +# CONFIG_QCOM_SMEM is not set
> >> +# CONFIG_QCOM_SMD_RPM is not set
> >> +# CONFIG_QCOM_SMP2P is not set
> >> +# CONFIG_QCOM_SMSM is not set
> >> +# CONFIG_QCOM_SOCINFO is not set
> >> +# CONFIG_QCOM_STATS is not set
> >> +# CONFIG_QCOM_WCNSS_CTRL is not set
> >> +# CONFIG_QCOM_APR is not set
> >> +# CONFIG_ARCH_R8A77995 is not set
> >> +# CONFIG_ARCH_R8A77990 is not set
> >> +# CONFIG_ARCH_R8A77950 is not set
> >> +# CONFIG_ARCH_R8A77951 is not set
> >> +# CONFIG_ARCH_R8A77965 is not set
> >> +# CONFIG_ARCH_R8A77960 is not set
> >> +# CONFIG_ARCH_R8A77961 is not set
> >> +# CONFIG_ARCH_R8A779F0 is not set
> >> +# CONFIG_ARCH_R8A77980 is not set
> >> +# CONFIG_ARCH_R8A77970 is not set
> >> +# CONFIG_ARCH_R8A779A0 is not set
> >> +# CONFIG_ARCH_R8A774C0 is not set
> >> +# CONFIG_ARCH_R8A774E1 is not set
> >> +# CONFIG_ARCH_R8A774A1 is not set
> >> +# CONFIG_ARCH_R8A774B1 is not set
> >> +# CONFIG_ARCH_R9A07G044 is not set
> >> +# CONFIG_ROCKCHIP_IODOMAIN is not set
> >> +# CONFIG_ROCKCHIP_PM_DOMAINS is not set
> >> +# CONFIG_ARCH_TEGRA_132_SOC is not set
> >> +# CONFIG_ARCH_TEGRA_210_SOC is not set
> >> +# CONFIG_ARCH_TEGRA_186_SOC is not set
> >> +# CONFIG_ARCH_TEGRA_194_SOC is not set
> >> +# CONFIG_ARCH_TEGRA_234_SOC is not set
> >> +# CONFIG_TI_SCI_PM_DOMAINS is not set
> >> +# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
> >> +# CONFIG_ARM_IMX8M_DDRC_DEVFREQ is not set
> >> +CONFIG_MEMORY=y
> >> +# CONFIG_RENESAS_RPCIF is not set
> >> +CONFIG_IMX8QXP_ADC=y
> >> +# CONFIG_EXYNOS_ADC is not set
> >> +# CONFIG_QCOM_SPMI_VADC is not set
> >> +# CONFIG_QCOM_SPMI_ADC5 is not set
> >> +# CONFIG_ROCKCHIP_SARADC is not set
> >> +# CONFIG_RZG2L_ADC is not set
> >> +# CONFIG_TI_ADS1015 is not set
> >> +CONFIG_IIO_ST_LSM6DSX=y
> >> +# CONFIG_SENSORS_ISL29018 is not set
> >> +# CONFIG_VCNL4000 is not set
> >> +# CONFIG_IIO_ST_MAGN_3AXIS is not set
> >> +# CONFIG_MPL3115 is not set
> >> +# CONFIG_PWM_BCM2835 is not set
> >> +# CONFIG_PWM_BRCMSTB is not set
> >> +CONFIG_PWM_FSL_FTM=m
> >> +CONFIG_PWM_IMX27=y
> >> +# CONFIG_PWM_MESON is not set
> >> +# CONFIG_PWM_MTK_DISP is not set
> >> +# CONFIG_PWM_MEDIATEK is not set
> >> +# CONFIG_PWM_RCAR is not set
> >> +# CONFIG_PWM_RENESAS_TPU is not set
> >> +# CONFIG_PWM_ROCKCHIP is not set
> >> +# CONFIG_PWM_SAMSUNG is not set
> >> +# CONFIG_PWM_SL28CPLD is not set
> >> +# CONFIG_PWM_SUN4I is not set
> >> +# CONFIG_PWM_TEGRA is not set
> >> +# CONFIG_PWM_VISCONTI is not set
> >> +# CONFIG_SL28CPLD_INTC is not set
> >> +# CONFIG_QCOM_PDC is not set
> >> +# CONFIG_RESET_QCOM_AOSS is not set
> >> +# CONFIG_RESET_QCOM_PDC is not set
> >> +# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
> >> +# CONFIG_RESET_TI_SCI is not set
> >> +CONFIG_PHY_CADENCE_SALVO=y
> >> +CONFIG_PHY_MIXEL_MIPI_DPHY=y
> >> +# CONFIG_PHY_SUN4I_USB is not set
> >> +# CONFIG_PHY_CADENCE_SIERRA is not set
> >> +# CONFIG_PHY_FSL_IMX8M_PCIE is not set
> >> +# CONFIG_PHY_HI6220_USB is not set
> >> +# CONFIG_PHY_HISTB_COMBPHY is not set
> >> +# CONFIG_PHY_HISI_INNO_USB2 is not set
> >> +# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
> >> +# CONFIG_PHY_MTK_TPHY is not set
> >> +# CONFIG_PHY_QCOM_QMP is not set
> >> +# CONFIG_PHY_QCOM_QUSB2 is not set
> >> +CONFIG_PHY_SAMSUNG_USB2=y
> >> +# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
> >> +# CONFIG_PHY_RCAR_GEN3_PCIE is not set
> >> +# CONFIG_PHY_RCAR_GEN3_USB2 is not set
> >> +# CONFIG_PHY_RCAR_GEN3_USB3 is not set
> >> +# CONFIG_PHY_ROCKCHIP_EMMC is not set
> >> +# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
> >> +# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
> >> +# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
> >> +# CONFIG_PHY_ROCKCHIP_PCIE is not set
> >> +# CONFIG_PHY_ROCKCHIP_TYPEC is not set
> >> +# CONFIG_PHY_SAMSUNG_UFS is not set
> >> +# CONFIG_PHY_UNIPHIER_USB2 is not set
> >> +# CONFIG_PHY_UNIPHIER_USB3 is not set
> >> +# CONFIG_PHY_TEGRA_XUSB is not set
> >> +# CONFIG_PHY_AM654_SERDES is not set
> >> +# CONFIG_PHY_J721E_WIZ is not set
> >> +CONFIG_FSL_IMX8_DDR_PMU=y
> >> +# CONFIG_QCOM_L2_PMU is not set
> >> +# CONFIG_QCOM_L3_PMU is not set
> >> +# CONFIG_MTK_EFUSE is not set
> >> +# CONFIG_QCOM_QFPROM is not set
> >> +# CONFIG_ROCKCHIP_EFUSE is not set
> >> +# CONFIG_NVMEM_SUNXI_SID is not set
> >> +# CONFIG_UNIPHIER_EFUSE is not set
> >> +# CONFIG_MESON_EFUSE is not set
> >> +# CONFIG_NVMEM_RMEM is not set
> >> +# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
> >> +# CONFIG_FPGA_MGR_ALTERA_CVP is not set
> >> +# CONFIG_FPGA_MGR_STRATIX10_SOC is not set
> >> +# CONFIG_SLIMBUS is not set
> >> +# CONFIG_SLIM_QCOM_NGD_CTRL is not set
> >> +# CONFIG_INTERCONNECT_IMX is not set
> >> +# CONFIG_INTERCONNECT_IMX8MM is not set
> >> +# CONFIG_INTERCONNECT_IMX8MN is not set
> >> +# CONFIG_INTERCONNECT_IMX8MQ is not set
> >> +# CONFIG_INTERCONNECT_QCOM is not set
> >> +# CONFIG_INTERCONNECT_QCOM_MSM8916 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SC7280 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SDM845 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SM8150 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SM8250 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SM8350 is not set
> >> +# CONFIG_INTERCONNECT_QCOM_SM8450 is not set
> >> +# CONFIG_TMPFS_POSIX_ACL is not set
> >> +# CONFIG_CONFIGFS_FS is not set
> >> +CONFIG_JFFS2_FS=y
> >> +CONFIG_UBIFS_FS=y
> >> +CONFIG_SQUASHFS_XZ=y
> >> +CONFIG_CRYPTO_USER=y
> >> +CONFIG_CRYPTO_TEST=m
> >> +CONFIG_CRYPTO_DH=m
> >> +CONFIG_CRYPTO_CHACHA20POLY1305=m
> >> +CONFIG_CRYPTO_CFB=m
> >> +CONFIG_CRYPTO_CTS=m
> >> +CONFIG_CRYPTO_LRW=m
> >> +CONFIG_CRYPTO_OFB=m
> >> +CONFIG_CRYPTO_PCBC=m
> >> +CONFIG_CRYPTO_XCBC=m
> >> +CONFIG_CRYPTO_VMAC=m
> >> +CONFIG_CRYPTO_MD4=m
> >> +CONFIG_CRYPTO_RMD160=m
> >> +CONFIG_CRYPTO_STREEBOG=m
> >> +CONFIG_CRYPTO_WP512=m
> >> +CONFIG_CRYPTO_ANUBIS=m
> >> +CONFIG_CRYPTO_ARC4=m
> >> +CONFIG_CRYPTO_BLOWFISH=m
> >> +CONFIG_CRYPTO_CAMELLIA=m
> >> +CONFIG_CRYPTO_CAST5=m
> >> +CONFIG_CRYPTO_CAST6=m
> >> +CONFIG_CRYPTO_DES=m
> >> +CONFIG_CRYPTO_FCRYPT=m
> >> +CONFIG_CRYPTO_KHAZAD=m
> >> +CONFIG_CRYPTO_SEED=m
> >> +CONFIG_CRYPTO_SERPENT=m
> >> +CONFIG_CRYPTO_TEA=m
> >> +CONFIG_CRYPTO_TWOFISH=m
> >> +CONFIG_CRYPTO_USER_API_HASH=m
> >> +CONFIG_CRYPTO_USER_API_SKCIPHER=m
> >> +CONFIG_CRYPTO_USER_API_AEAD=m
> >> +# CONFIG_CRYPTO_DEV_SUN8I_CE is not set
> >> +# CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM is not set
> >> +# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
> >> +CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
> >> +CONFIG_INDIRECT_PIO=y
> >> +CONFIG_CRC_CCITT=m
> >> +# CONFIG_CRYPTO_DEV_HISI_SEC2 is not set
> >> +# CONFIG_CRYPTO_DEV_HISI_ZIP is not set
> >> +# CONFIG_CRYPTO_DEV_HISI_HPRE is not set
> >> +# CONFIG_CRYPTO_DEV_HISI_TRNG is not set
> >> +CONFIG_IRQ_POLL=y
> >> +# CONFIG_DEBUG_INFO is not set
> >> +# CONFIG_DEBUG_INFO_REDUCED is not set
> >> +CONFIG_CORESIGHT=y
> >> +CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
> >> +CONFIG_CORESIGHT_SOURCE_ETM4X=y
> >
> > This ^^^ produces a very shrinked Linux image, but here in Buildroot we
> > usually want a generic defconfig or fragment that makes the boards
> > working.
> >
> > Then I ask you to only add the mandatory CONFIG_* needed for the board
> > to work correctly and drop all the CONFIG_* that optimize for size or
> > build modules to speed up Linux loading.
> >
> > The goal is to be generic and let the user to have all enabled by arch
> > default and just in case tweak Linux configuration. And in that case the
> > user will have a complete defconfig. This is instead a fragment only
> > where you usually add few CONFIG_*.
> >
> > Try to check the other *.fragment under buildroot/board for that.
> >

The config is needed because the partition is defined for those
products. We can not have 20Mb of kernel
on nand part for instance. Generic kernel is needed if you have a lot
of possibility to connect peripherals but in this
case without a usb host and without a lot of connectors that is
impossible. Why should we have a generic kernel in this case?

Michael

> >> diff --git a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> >> b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> >> new file mode 100644
> >> index 000000000000..c01d2d6c1dac
> >> --- /dev/null
> >> +++ b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> >> @@ -0,0 +1,29 @@
> >> +# @_flash.bin            | bootloader
> >> +# @_image   [_flash.bin] | image burn to nand, default is the same as
> >> bootloader
> >> +# @_filesystem           | filesystem to burn
> >> +# @_kernel               | kernel image
> >> +# @_dtb                  | dtb image
> >> +
> >> +# This command will be run when ROM support stream mode
> >> +# i.MX8QXP, i.MX8QM
> >> +SDPS: boot -f _flash.bin
> >> +
> >> +FB: ucmd setenv fastboot_buffer ${loadaddr}
> >> +FB: download -f _image
> >> +# Burn image to nandfit partition if needed
> >> +FB: ucmd if env exists nandfit_part; then nand erase.part nandfit;
> >> nand write ${fastboot_buffer} nandfit ${filesize}; else true; fi;
> >> +FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
> >> +
> >> +FB[-t 10000]: ucmd ubi part nandrootfs
> >> +FB[-t 10000]: ucmd ubi create root -
> >> +FB: download -f _filesystem
> >> +FB[-t 60000]: ucmd ubi write ${loadaddr} root ${filesize}
> >> +
> >> +FB: download -f _kernel
> >> +FB[-t 10000]: ucmd nand write ${loadaddr} nandkernel ${filesize}
> >> +
> >> +FB: download -f _dtb
> >> +FB[-t 8000]: ucmd nand write ${loadaddr} nanddtb ${filesize}
> >> +
> >> +FB: reboot
> >> +FB: done
> >> diff --git
> >> a/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch
> >> new file mode 100644
> >> index 000000000000..bce14a106e89
> >> --- /dev/null
> >> +++
> >> b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch
> >> @@ -0,0 +1,45 @@
> >> +From 7ec9f1a48b1041f1bc11ed0f858245fd2626f4e6 Mon Sep 17 00:00:00 2001
> >> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +Date: Sun, 22 May 2022 17:40:15 +0200
> >> +Subject: [PATCH 1/2] dmaengine: mxs: use platform_driver_register
> >
> > Patches must be git formatted one by one, this to have no patch number.
> > The reason is that if you later remove some patch only need to rename
> > the file name index. So please re-generate all patches one by one so the
> > subject becomes [PATCH] without numbers.
> >
> >> +
> >> +Driver registration fails on SOC imx8mn as its supplier, the clock
> >> +control module, is probed later than subsys initcall level. This driver
> >> +uses platform_driver_probe which is not compatible with deferred probing
> >> +and won't be probed again later if probe function fails due to clock not
> >> +being available at that time.
> >> +
> >> +This patch replaces the use of platform_driver_probe with
> >> +platform_driver_register which will allow probing the driver later again
> >> +when the clock control module will be available.
> >> +
> >> +Fixes: a580b8c5429a ("dmaengine: mxs-dma: add dma support for
> >> i.MX23/28")
> >> +Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +Cc: stable@vger.kernel.org
> >> +Link:
> >> https://lore.kernel.org/lkml/20220712160909.2054141-1-dario.binacchi@amarulasolutions.com
> >> +---
> >> + drivers/dma/mxs-dma.c | 8 ++------
> >> + 1 file changed, 2 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> >> +index 994fc4d2aca4..18f8154b859b 100644
> >> +--- a/drivers/dma/mxs-dma.c
> >> ++++ b/drivers/dma/mxs-dma.c
> >> +@@ -839,10 +839,6 @@ static struct platform_driver mxs_dma_driver = {
> >> +         .name    = "mxs-dma",
> >> +         .of_match_table = mxs_dma_dt_ids,
> >> +     },
> >> ++    .probe = mxs_dma_probe,
> >> + };
> >> +-
> >> +-static int __init mxs_dma_module_init(void)
> >> +-{
> >> +-    return platform_driver_probe(&mxs_dma_driver, mxs_dma_probe);
> >> +-}
> >> +-subsys_initcall(mxs_dma_module_init);
> >> ++builtin_platform_driver(mxs_dma_driver);
> >> +--
> >> +2.32.0
> >> +
> >> diff --git
> >> a/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch
> >> new file mode 100644
> >> index 000000000000..17301455f70e
> >> --- /dev/null
> >> +++
> >> b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch
> >> @@ -0,0 +1,39 @@
> >> +From 466bca34d485b7f6a50f64b2a884e37938e6f8e7 Mon Sep 17 00:00:00 2001
> >> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +Date: Tue, 12 Jul 2022 15:15:19 +0200
> >> +Subject: [PATCH 2/2] dmaengine: mxs: fix section mismatch
> >
> > Ditto
> >
> >> +
> >> +The patch was suggested by the following modpost warning:
> >> +
> >> +WARNING: modpost: vmlinux.o(.data+0xa3900): Section mismatch in
> >> reference from the variable mxs_dma_driver to the function
> >> .init.text:mxs_dma_probe()
> >> +The variable mxs_dma_driver references
> >> +the function __init mxs_dma_probe()
> >> +If the reference is valid then annotate the
> >> +variable with __init* or __refdata (see linux/init.h) or name the
> >> variable:
> >> +*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> >> +
> >> +Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +Cc: stable@vger.kernel.org
> >> +Link:
> >> https://lore.kernel.org/linux-arm-kernel/20220712160909.2054141-2-dario.binacchi@amarulasolutions.com/
> >> +---
> >> + drivers/dma/mxs-dma.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> >> +index 18f8154b859b..a01953e06048 100644
> >> +--- a/drivers/dma/mxs-dma.c
> >> ++++ b/drivers/dma/mxs-dma.c
> >> +@@ -834,7 +834,7 @@ static int __init mxs_dma_probe(struct
> >> platform_device *pdev)
> >> +     return 0;
> >> + }
> >> +
> >> +-static struct platform_driver mxs_dma_driver = {
> >> ++static struct platform_driver mxs_dma_driver __initdata = {
> >> +     .driver        = {
> >> +         .name    = "mxs-dma",
> >> +         .of_match_table = mxs_dma_dt_ids,
> >> +--
> >> +2.32.0
> >> +
> >> diff --git
> >> a/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
> >> new file mode 100644
> >> index 000000000000..773e889b9f18
> >> --- /dev/null
> >> +++
> >> b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
> >> @@ -0,0 +1,39 @@
> >> +From f3ff7cca5927b3837da24e9e345849c0b3708562 Mon Sep 17 00:00:00 2001
> >> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +Date: Thu, 1 Sep 2022 12:28:09 +0200
> >> +Subject: [PATCH] Revert "Revert "mtd: rawnand: gpmi: Fix setting busy
> >> timeout
> >> + setting""
> >
> > This ^^^ is the right way for patch creation
> >
> >> +
> >> +This reverts commit f8d01e0f004a73cf9d0e76daa69aea9556683d57.
> >> +Commit 06781a5026350 ("mtd: rawnand: gpmi: Fix setting busy timeout
> >> setting")
> >> +explicitly mentions the reference manual:
> >> +
> >> +|The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:
> >> +|
> >> +|| Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in
> >> WAIT_FOR_READY
> >> +|| mode. This value is the number of GPMI_CLK cycles multiplied by 4096.
> >> +
> >> +So busy_timeout_cycles variable must be divided (and not multiplied) by
> >> +4096 beforse setting the timing1 register.
> >> +
> >
> > Here we miss upstream link
> >
> >> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> +---
> >> + drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> >> b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> >> +index a626028336d3..fedad3a2b988 100644
> >> +--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> >> ++++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> >> +@@ -697,7 +697,7 @@ static int gpmi_nfc_compute_timings(struct
> >> gpmi_nand_data *this,
> >> +     hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
> >> +               BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
> >> +               BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
> >> +-    hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles *
> >> 4096);
> >> ++    hw->timing1 =
> >> BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));
> >> +
> >> +     /*
> >> +      * Derive NFC ideal delay from {3}:
> >> +--
> >> +2.32.0
> >> +
> >> diff --git
> >> a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
> >> new file mode 100644
> >> index 000000000000..7ec8a97a0c9a
> >> --- /dev/null
> >> +++
> >> b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
> >> @@ -0,0 +1,159 @@
> >> +From d818bfb185a9f62fc988141d2dbbf9e9bc8ffa5d Mon Sep 17 00:00:00 2001
> >> +From: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Date: Sun, 22 May 2022 15:22:08 +0200
> >> +Subject: [PATCH 06/10] include/configs: Remove rootwait=1 to all the
> >> affected
> >> + boards
> >
> > Ditto
> >
> >> +
> >> +rootwait=1 is not a valid kernel boot parameters. According
> >> +to the documenation is only rootwait
> >> +
> >> +rootwait    [KNL]    Wait (indefinitely) for root device to show up.
> >> +            Useful for devices that are detected asynchronously
> >> +            (e.g. USB and MMC devices).
> >> +
> >> +Fix:
> >> +Unknown kernel command line parameters "rootwait=1", will be passed
> >> to user space.
> >> +
> >> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> +Reviewed-by: Heiko Schocher <hs@denx.de>
>
> Here you also need to add your SoB. Every patch you add here in
> Buildroot must be signed off from you too.
>
> >
> > Ditto
> >
> > I wait for V5 series.
> >
> > Thanks for contributing!
> >
> > Best regards
>
> --
> Giulio Benetti
> Benetti Engineering sas



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
