Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21931C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D197080F21;
	Sun, 20 Sep 2026 12:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59ifTFxQDjyW; Sun, 20 Sep 2026 12:30:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E601F80F11
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907418;
	b=guZNzSwypgqffILA1MMiOCCN7Cp2qlABS3B0QafbosFfxAFRTR7Rmnfb3Vwcr/tdVnkO
	 gmF7MU9hqAEyYPWTk1k/GBEKvtqo+vlRUPL01+uN9hwlE9ObVFjjGYOLtA+Hxcu5FRFHq
	 UnQTWIO50n72q88Xhyx9ROmmXIGwgwyXMtikmZTF/ApxwQdFepe8kF8rbG5ABqd/NMmYk
	 CaY61ldqGh0sUP9vDgC31Vur5Is1kWMgjMJB0S79vhkzMEs4AzSCql1xGMvuXEXNBbqDQ
	 ft9x64uATvgzp1zVoNU49+wGT3hG/BpfWfWIKOJHH6/QSQilANf4eDmQmQxoXJCujhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wYcl8SF8/n17ldzrfwqxogAm8BSnmWcTciNw1h/vo7E=;
	b=bQxP93Og9K778REMjq5uvSG3CA8ZrYf023iRuV3ywG//u+TCoXTtRk+g+gJIv0eOhveW
	 IdvjLqUraCaof+ytaqJQdFj8zU5gHje2cq2zgm57yOXVCnA2MOLuqa05BA5Otqx/zuBWQ
	 HA+1NgqJMIasP9F4iIg518zk0dXqoFE/5EmXaky6UD3vt0PL7CJoE661d7h+FZTmaDhBU
	 m/3P7szszs3AMiRtmuNua+BCETn0T18wdiCzFPZslRdiJ5kfRr1eY4hYNmyvTU8cCRdJO
	 OR2RVvViAcVmoj5ILBCmwd/fwuyHnbp0Th/zujv0DNVZnaiPvhdFpuRybH9HNWeqeeg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907418;
	bh=wYcl8SF8/n17ldzrfwqxogAm8BSnmWcTciNw1h/vo7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OUQmdMx9c6BE5I62ZJxsEYBWW+n2IPw2Y4iltXThnSBeY2c49x/mNHmBrM+8BNZ/o
	 j03IOvp2KnJYKjJczd2NX46HCi8V0atool6pyqSM1455usL3mzFh4HgNTT3xLrcBnq
	 zyRnRypr+iN+KDGg++rIyTF+LptM4ec/ovNDFB5XLFqwrAdDm3/KDUrD4NzGdlngHA
	 YjgxLtvva546UNoUfUg63x4CiTQCzEzAFQhmZRKBpbCNA0FwvcOgzxL0bd4nQh9n8+
	 6j9o3rD2QHjkPXHaQhLYtMTH30C5uAYSrY18oCQnny/QLJKBKALdLhmuyEjvezgUnI
	 91WrMtFeaTccg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E601F80F11;
	Sun, 20 Sep 2026 12:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A74503AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D5E04005E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ-ZQrvR1Ffr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CBBCE4005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907414;
 b=aQ6IN6Pfw//sK9ZuGxaL/Ewcr6u5BjLag4IhSb+sAkVWworbjVA0RbHcQ+4kgJk9c1JW
 Ia7eReZhDSRSLrliDc8Kj80k+hW8PmBlV0ffWiUZGfViVxziCAiRAVLUGug2Luufi9ELT
 Ixq+KUmtWNLMoZhO3mGXKXFycGLnoSCUi/wmsfNQu3K5Eq7+UJWuubCFbFkGuQTJ2Bfm6
 C3u7okPh4ddyvQMKIoI9Dzb/omTeqMLluBFuQ6bWJBd8FVrgKLWUxxHC7eGiFDnYW3zyu
 YPUOgYNE/5NE4Mo01uFXeCqEAdO1w3eZUy7dl97aN+LK+auGxbpS5eD+96bwKXWHfSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907414;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vMRbt0kOfpJo8xfq3v2wWyIJDUXqC9T8KjNKLidr4g0=;
 b=XQ4fz19Coq3FAfXY7OjKdTvxcB4NaQnuQjnzs2pLzapUMu2B4DdLx46uG1vmdnMdKf7x
 Cz3s1p75AGlgTJWjsHeluKZFNr6FzZ951cYppQ0jo9EI41U5qk0L5+Ca65zROnOclN57G
 NkK7eIc7HwTp0SneEeKVfJaOJYhiPzPqs6D8LGe8psELvXEpQUN/42xHy3nNTBqAOFRoj
 ZLhSLeUo5YMzu1sSFrY9jP3SPdvjU2LRbxPMrDVA4P6iXuAhGkT9tR3Sn+1h9wPRMg4rc
 8qRY5anOaIb9OkiRSnoxN9FKFIy7W5c6x5IgrdFWWptS2M/pTVhKlB7WHmCuAl+AKsg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBBCE4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C1E18D9F0; Sun, 20 Sep 2026 12:29:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:27:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6a2765091cc585d84464a420ce2e05cf3218bf3
X-Git-Newrev: f919aa74564a62807d6709ae2eeb8825a95ee5ac
X-Patchwork-Hint: ignore
Message-Id: <20260920122906.7C1E18D9F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: remove non-upstream
 Linux config options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f919aa74564a62807d6709ae2eeb8825a95ee5ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove vendor-specific config options from linux_defconfig as they are
not present in the upstream kernel.

Regenerate the defconfig by running:

  make visionfive2_defconfig
  make linux-menuconfig
  # Save and exit without making any changes.
  make linux-update-defconfig

Fixes: 4567c35d066e ("configs/visionfive2: bump OpenSBI to 1.6, Linux to 6.12.24 and U-Boot to 2025.04")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/visionfive2/linux_defconfig | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 06942928b5..509cd0f475 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -22,7 +22,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
-CONFIG_RISCV_AMP=y
 CONFIG_HZ_100=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_STD_PARTITION="PARTLABEL=hibernation"
@@ -40,6 +39,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_CPUFREQ_DT=y
 # CONFIG_SECCOMP is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_MISC=y
@@ -87,7 +87,6 @@ CONFIG_BT_RFCOMM_TTY=y
 CONFIG_BT_BNEP=y
 CONFIG_BT_BNEP_MC_FILTER=y
 CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_AICUSB=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
 CONFIG_RFKILL=y
@@ -104,7 +103,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_OF_CONFIGFS=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=y
@@ -159,21 +157,15 @@ CONFIG_MARVELL_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROCHIP_PHY=y
 CONFIG_MOTORCOMM_PHY=y
-CONFIG_IPMS_CAN=y
 CONFIG_IWLWIFI=y
 CONFIG_IWLDVM=y
 CONFIG_IWLMVM=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_USB_WIFI_ECR6600U=y
-CONFIG_AIC_WLAN_SUPPORT=y
-CONFIG_AIC8800_WLAN_SUPPORT=m
-CONFIG_AIC_LOADFW_SUPPORT=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_GOODIX=y
-CONFIG_TOUCHSCREEN_TINKER_FT5406=y
 CONFIG_SERIO_LIBPS2=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -221,10 +213,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CADENCE_CSI2RX=y
 CONFIG_VIDEO_WAVE_VPU=m
-CONFIG_VIN_SENSOR_OV4689=y
-CONFIG_VIDEO_STF_VIN=y
 CONFIG_VIDEO_IMX219=y
-CONFIG_VIDEO_IMX708=y
 # CONFIG_CXD2880_SPI_DRV is not set
 # CONFIG_MEDIA_TUNER_E4000 is not set
 # CONFIG_MEDIA_TUNER_FC0011 is not set
@@ -371,13 +360,8 @@ CONFIG_VIDEO_IMX708=y
 # CONFIG_DVB_SP2 is not set
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y
-CONFIG_DRM_PANEL_STARFIVE_JADARD=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_TOSHIBA_TC358762=y
-CONFIG_DRM_VERISILICON=y
-CONFIG_STARFIVE_INNO_HDMI=y
-CONFIG_STARFIVE_DSI=y
-CONFIG_DRM_IMG_ROGUE=y
 CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_SOUND=y
@@ -389,7 +373,6 @@ CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
-CONFIG_SND_SOC_AC108=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_UHID=y
@@ -477,7 +460,6 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_STARFIVE=y
 CONFIG_RTC_DRV_GOLDFISH=y
 CONFIG_DMADEVICES=y
 CONFIG_AMBA_PL08X=y
@@ -492,22 +474,16 @@ CONFIG_CLK_STARFIVE_JH7110_STG=y
 CONFIG_CLK_STARFIVE_JH7110_ISP=y
 CONFIG_CLK_STARFIVE_JH7110_VOUT=y
 CONFIG_MAILBOX=y
-CONFIG_STARFIVE_IPI_MBOX=y
-CONFIG_STARFIVE_MBOX=m
-CONFIG_STARFIVE_MBOX_TEST=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
-CONFIG_RPMSG_STARFIVE=m
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_IIO_ST_ACCEL_3AXIS=y
 CONFIG_PWM=y
-CONFIG_PWM_OCORES=y
 CONFIG_PHY_STARFIVE_JH7110_PCIE=y
 CONFIG_PHY_STARFIVE_JH7110_USB=y
-CONFIG_PHY_M31_DPHY_RX0=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
