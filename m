Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B00CCA464
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CA3813C6;
	Fri, 16 Oct 2026 12:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGR8WvPwIQpz; Fri, 16 Oct 2026 12:11:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83AA78142A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792152683;
	b=rnZmMuj33TyXTInBjd9AwDcq+vy/LkIk7FzVQ1W0LO8PyY7S0feSq5fPhWdqWc5plW8d
	 LXJ0fT42qC6kwitA6jt6EWsdvt+v+Zp8yxFdu0/V+o5mJE6+WghbO2jo9LfKmbZJE2y5l
	 hVOqLLZN8yQW0UxrMuJMLVKyxoqfn5uNOjYuVG/5g48AR76RVheYu51qt9lNPNoCxkEF9
	 d0JL9R5koftPi9mLuIh0r1401AyvI3gxUl3bT8Hus1qC0yxUUx613u8rcLYxVkVKU8War
	 tGzM8eOEqZpmr6oq+xbW1OKJiLYRgggl7cJABq5gk9c71yOxKnGMUSChUi5VotExiyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792152683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:Date:To:Cc:Message-ID:
	 MIME-Version:Content-Disposition:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PVkx81pegMytr5tphuDMyQIy/cKoEjsDKvf4Sqn4rZU=;
	b=ZEFPCrhJqO619V4Uh1dDYkSpB9+3tZcFLGm4ONcGa0ZISnruC3Qfte3QLLq5tHcZKrVT
	 LBjAgVaOssGxYfKnycCge5xQmsbDb0AseI5zfJtqoNn5S9r8r8w/g9kt9+0aCTBvIY4JQ
	 GHozO4ZusxlwVXcpqtStmupa3qC+8Hklwsl10MXq5onwVfTvq080Bybx0eMOfPn81r/Go
	 qYWKDBNDYv18OIzOiNMh9HwO76oM8rUWssveSiAia5sDD+Hq2ypdEbAjYqOodKLyc9BO/
	 a0MmODA/kCYvUN+8iPbaf0pJRWA/AGniegi0jNw2f9e0lfLWlIwl3urYvuhKAJRGr5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLI0LinN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792152683;
	bh=PVkx81pegMytr5tphuDMyQIy/cKoEjsDKvf4Sqn4rZU=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SIqvseqSI9JDZ4CxAi1iukG0CKWUsTuJ0+LWykESRoHK+FIY9++yK70Z//YawV3fA
	 NohQqBDl3u1UcthH2CZkGBcNHlsCEx0X17II/bRY20B8iAEb0fsrUGtntGwsVdieY2
	 eRbd61A6BWd3k1VGbwAnIeHBmYbsX9euNqJHxry0/dl9vZhMeUH2SJ8ffhvvBiynaC
	 ji6BZhcZWXOCe1xlXx+4ey9bBX6NTbDPnTV38d0Hcvc9aJIoWpK5YXO3i8qV+3a5oJ
	 6377N3AoPJ+WjNmgJD9QwJJZZah16mxSHMQUm4gMzhTUyKGfG7vtdhP5I6SM+lDR4R
	 Cy/kY/HLjp+HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83AA78142A;
	Fri, 16 Oct 2026 12:11:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8364C75
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 755168146D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBMwazFa_NZB for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 85991813C6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792152680;
 b=MoBQDM7eRisMLkusRv+wpniFdS+7Md0JxTPpTp1vwtkTRrgFsxDNdpvPK34ytv0NR7lF
 D516QiwLegLp9tCbQwENcW4tLuVzkdGfFiFRhlC5xplncg4DLwJzxRoMgOMVPkJOfUgGB
 NCNyS04HNU0f2Hd9jgQUGUcIjGKkw94JybvCCTUfdDfpJindQ4T8bEx5f5oC/+zLiehQQ
 dnEKy+0cRcs5BrGpZHWYBcmZD5/rUpr38XJo2bKzuwV2lpdx614+a5vnpHChOuBU1XsyI
 NccgfaIJGGcwX/GcCCrbqV5FZZQzbaL0iy3ZM83AaXRBwayfMl3xjyrspqcywtBaLLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792152680;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding;
 bh=2kHTbUrlwAYD1PNiYgXsge+OunO+718xkPsftuT0x8s=;
 b=aNDzGVS39TXv98t8iBl4KGke30wnYiGrfUrGVygiRQ3r5TvRYw+ov7Z1hg49RudA3ZDo
 71axpmg4R+OReSp8IHbJtieK2XrfTPyG2LKGBEtAdpC/m/HG+uqy4pnsosdn0I/VIu0qO
 uCYzYMIJljXYGfa77XK3gAjb1YgukwCdmgdX8gaOGDwrJ+GI0AlVka4VFuG/IISZqzBgM
 D2cv30eubvBu7NMqzhvMiAnHbaDVxH0BYOj75iQOaOTSGsKz58hQsTJ9B/QIHLP1Ec2FQ
 mroWjF1kNNFcZOZGM5J75/ovdjOETk6z9rW/C1kR/8c2Gh7KY/G+pydHQJOv89IZv1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DLI0LinN; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DLI0LinN
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85991813C6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:11:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so732611f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792152677; x=1792757477; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2kHTbUrlwAYD1PNiYgXsge+OunO+718xkPsftuT0x8s=;
 b=DLI0LinN3y5NIjNZ862TGSl0SMH1iFEKcOqEHkhOh2Yw9f73mYwpYekxwl5bZqPKHo
 /mZNIq7emcLR2VGZnNbkKwfLb2nf/FXp/KNIaJBCGQgrBFvTsVoALIvNmjOgPNFkDAEg
 RTV6YB5T/fsHAg91JT+OvPdYW/XaP5YKaBIdfT1yyvXOjtol/O/hW6k3G53d4EhEBO31
 7bnHnBSWQ53csvt5jID2fiw6s+k7wbpaHLObfpwKylp37JNfEdT1m/QAWmh9AYNGhNBZ
 5LOGKOSTVeKAhr4uergHJts5vWUel2Ejtwj4Wbz0vNIzFdL4HNTAtgfIG6cT5GO+h55a
 +OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792152677; x=1792757477;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2kHTbUrlwAYD1PNiYgXsge+OunO+718xkPsftuT0x8s=;
 b=ZK5QQWCoAwSkuWfKSTKov1ZCN38J8gAC0BlNiamdyxpfdZQmjgNhP3cLyn4dPfqNHy
 9muRmWJyZ7Lk3od6GeHa9DezbccHKtUnJ25oZ4qrAdKz44WAmdBtZMPoXzT1GsE0p79x
 sshRpzFS4Z/ssadccw9Z/4gDBSp67Wrm0ZTa4Alp9XUJqW70dOK5diheHRBBhE3XkL5d
 Hovgye7x1Im0OYNrvtFxyGHtU8ThAqN7NRKsbQtj9QVe2t4ug1vmVSkxSB1kHE/KdTgR
 QNexwpxpWVJEcA30r/c3ivnZ9YN8I3+KauDiwenBqkU7f/d9O3vqD3rf0IptoN1lfazh
 9Zew==
X-Gm-Message-State: AFq9FYJWJf6MGPkntXktjL4yCnSdXJKOVrsEe1x8p8LPb+m35nQuXpmT
 EUVIL3iXBJ1tnH1hiP3Lt/HksiMvmb4BwFHDKNBFODwTfVlluxYMuoPeE+84qnSu
X-Gm-Gg: AYBFou3A7FsGSkrjRzl9Jp0t73L4w34DEjmIOIRmzM2zJI0MMJ8mDyYtxOLK6ArTKJj
 kQgQPl2fSLe5xhf6bagg3kgGqvU4h1fY5dQXBVE7dTw+9mvvapOOlZ4yHCCRVYjyhoZ8OL5866W
 lECOSA970MubwM0F9lE9zhxwOv+OZRJ9cml8m26G3Twas72EbWrBaC13zUFvwobfqoHCqBuJkq/
 tGxSzdhcowloKrcEu1eFNMBTVpIeTbWJb8znjstgaOKFqbpXkU4zm4IW4HtMX1W90Nl8nehnCpL
 IS314Md8G+H1o+O7+VfMjrl9dE5NgHGwqcwzorVSjKfAi04BhNXuAS2efYVIol6es1EoPdflI8e
 ylBk9JvTKhkt+Z0+f9ZyZClBBz27VAGyb58yXfONi3V5fJhiDibg+LVl9V8VaGBk1MAvS4fWCWb
 V5YDjMbanpz0g6NS92MHpR3VgN+P8A1xnTjhsVBK45GtB2Ypfw0aI5LNuHM4d0+1m8jqizDgHVW
 RkhXUfkV1AOs6qp+74xTcQKpeeCo8oshwxJHL9D3hrCDUI30kd7Iu/RhnOhXhEuQ+JYkRL2
X-Received: by 2002:a05:6000:1e41:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-48dfae0b9e5mr5207667f8f.13.1792152676932; 
 Fri, 16 Oct 2026 05:11:16 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50d080sm4924648f8f.53.2026.10.16.05.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:11:16 -0700 (PDT)
From: Vladimir Oltean <leo.denieul.yoshino@gmail.com>
X-Google-Original-From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 16 Oct 2026 14:11:15 +0200
To: buildroot@buildroot.org
Cc: maxime@leroys.fr, olteanv@gmail.com, vjardin@free.fr
Message-ID: <atIUY4RQRBFIyULe@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v6 3/3] board/lx2160ardb: new platform
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Buildroot support for the NXP LX2160A-RDB (reference design board).
This is configured here to boot from the SD card. To my surprise, NXP
RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
boot, so until one is available, include the RCW through board files.

The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
Management Complex firmware is loaded from the filesystem during U-Boot
board init. EFI boot support is disabled since we use extlinux.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Tested-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Tested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: L=E9o DENIEUL <leo.denieul.yoshino@gmail.com>
---
Changes v5 -> v6:
  - increase BR2_TARGET_ROOTFS_EXT2_SIZE from 130M to 256M: on
    current master the rootfs needs about 148M (Linux ~100M,
    eudev/hwdb ~25M)
---
 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/lx2160ardb_defconfig                  |  59 ++++++++
 14 files changed, 373 insertions(+)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/=
74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware=
/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-=
headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.=
rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/lx2160ardb_defconfig

diff --git a/board/freescale/common/env-dpaa2.txt b/board/freescale/common/=
env-dpaa2.txt
new file mode 100644
index 0000000000..e60bcdeac0
--- /dev/null
+++ b/board/freescale/common/env-dpaa2.txt
@@ -0,0 +1,7 @@
+# DPAA2 MC firmware loading (common to all DPAA2 boards)
+dpl_addr_r=3D0x80d00000
+dpc_addr_r=3D0x80e00000
+fsl_bootcmd_mcinitcmd_set=3Dy
+mc_fw_addr_r=3D0x80a00000
+mcinitcmd=3Dmmc dev 0 && load mmc 0:1 $mc_fw_addr_r /boot/mc.itb && load m=
mc 0:1 $dpc_addr_r /boot/dpc.dtb && load mmc 0:1 $dpl_addr_r /boot/dpl.dtb =
&& fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_a=
ddr_r
+mcmemsize=3D0x70000000
diff --git a/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa=
2-networking.rules b/board/freescale/common/rootfs_overlay/etc/udev/rules.d=
/74-dpaa2-networking.rules
new file mode 100644
index 0000000000..ac55225673
--- /dev/null
+++ b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-netwo=
rking.rules
@@ -0,0 +1,29 @@
+SUBSYSTEM!=3D"net", GOTO=3D"fsl_dpaa2_rules_end"
+ACTION!=3D"add|change|online|offline", GOTO=3D"fsl_dpaa2_rules_end"
+
+# Rules that match on objects connected to DPMACs have priority, and are n=
amed
+# after those DPMACs.
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@1", NAME=3D"endpmac1", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@2", NAME=3D"endpmac2", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@3", NAME=3D"endpmac3", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@4", NAME=3D"endpmac4", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@5", NAME=3D"endpmac5", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@6", NAME=3D"endpmac6", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@7", NAME=3D"endpmac7", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@8", NAME=3D"endpmac8", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@9", NAME=3D"endpmac9", GOTO=3D"fsl_dpaa2_=
rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@a", NAME=3D"endpmac10", GOTO=3D"fsl_dpaa2=
_rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@11", NAME=3D"endpmac17", GOTO=3D"fsl_dpaa=
2_rules_end"
+DRIVERS=3D=3D"fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=3D=3D"/soc=
/fsl-mc@80c000000/dpmacs/ethernet@12", NAME=3D"endpmac18", GOTO=3D"fsl_dpaa=
2_rules_end"
+
+# Rules that match on DPNI objects which are not connected to DPMACs, but =
to
+# other DPNIs, DPSW ports, DPDMUX etc. Below is an example to set up a
+# persistent MAC address, which can be extended beyond dpni.0.
+# DRIVERS=3D=3D"fsl_dpaa2_eth", DEVPATH=3D=3D"/devices/platform/soc/80c000=
000.fsl-mc/dprc.[0-9]*/dpni.0/net/*", NAME=3D"endpni0", PROGRAM=3D"/sbin/ip=
 link set %k address 00:01:02:03:04:05"
+
+# Rules that match on DPSW ports not connected to a DPMAC.
+# Below is an example to set up a persistent MAC address, which can be ext=
ended
+# beyond dpsw.0.
+# DRIVERS=3D=3D"fsl_dpaa2_switch", DEVPATH=3D=3D"/devices/platform/soc/80c=
000000.fsl-mc/dprc.[0-9]*/dpsw.0/net/*", NAME=3D"endpsw0%s{phys_port_name}"=
, PROGRAM=3D"/sbin/ip link set %k address 00:01:02:03:04:05"
+
+LABEL=3D"fsl_dpaa2_rules_end"
diff --git a/board/freescale/lx2160ardb/extlinux.conf b/board/freescale/lx2=
160ardb/extlinux.conf
new file mode 100644
index 0000000000..58c2720252
--- /dev/null
+++ b/board/freescale/lx2160ardb/extlinux.conf
@@ -0,0 +1,4 @@
+label NXP LX2160A Reference Design Board
+  kernel /boot/Image
+  devicetree /boot/fsl-lx2160a-rdb.dtb
+  append console=3DttyAMA0,115200 root=3DPARTUUID=3D%PARTUUID% rw rootwait=
 cma=3D256M
diff --git a/board/freescale/lx2160ardb/genimage.cfg b/board/freescale/lx21=
60ardb/genimage.cfg
new file mode 100644
index 0000000000..f895a5ab5e
--- /dev/null
+++ b/board/freescale/lx2160ardb/genimage.cfg
@@ -0,0 +1,47 @@
+image sdcard.img {
+	/* Primary GPT table needs to be moved to a region which does
+	 * not collide with the RCW/PBI location
+	 */
+	hdimage {
+		partition-table-type =3D "gpt"
+		gpt-location =3D 6M
+	}
+
+	partition rcw {
+		offset =3D 4K
+		in-partition-table =3D "no"
+		image =3D "bl2_sd.pbl"
+	}
+
+	partition u-boot {
+		offset =3D 1M
+		in-partition-table =3D "no"
+		image =3D "fip.bin"
+	}
+
+	partition u-boot-environment {
+		in-partition-table =3D "no"
+		image =3D "uboot-env.bin"
+		offset =3D 5M
+	}
+
+	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
+	partition ddr-phy {
+		in-partition-table =3D "no"
+		image =3D "fip_ddr.bin"
+		offset =3D 8M
+	}
+
+	/* Offset must match IN112525_FW_ADDR from U-Boot */
+	partition 25ge-retimer-ucode {
+		in-partition-table =3D "no"
+		image =3D "in112525-phy-ucode.txt"
+		offset =3D 0x980000
+	}
+
+	partition rootfs {
+		bootable =3D "true"
+		image =3D "rootfs.ext4"
+		partition-uuid =3D %PARTUUID%
+	}
+}
diff --git a/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-tr=
usted-firmware.hash b/board/freescale/lx2160ardb/patches/arm-trusted-firmwa=
re/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..4b761bede3
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-f=
irmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  =
atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/linux-headers/linux-headers=
.hash b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/lx2160ardb/patches/linux/linux.hash b/board/fr=
eescale/lx2160ardb/patches/linux/linux.hash
new file mode 100644
index 0000000000..f30030c86a
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  =
linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/uboot/uboot.hash b/board/fr=
eescale/lx2160ardb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..38d54d9922
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  =
u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/post-build.sh b/board/freescale/lx2=
160ardb/post-build.sh
new file mode 100755
index 0000000000..4042bf9c7e
--- /dev/null
+++ b/board/freescale/lx2160ardb/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+BOARD_DIR=3D"$(dirname "$0")"
+PARTUUID=3D"$("$HOST_DIR/bin/uuidgen")"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+# Default DPL and DPC selections for mcinitcmd
+ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
+ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/b=
oot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/=
genimage.cfg"
diff --git a/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw b/b=
oard/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
new file mode 100644
index 0000000000..4c4b7d9c79
--- /dev/null
+++ b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
@@ -0,0 +1,67 @@
+/*
+ * SerDes Protocol 1 -  19
+ * SerDes Protocol 2 -  5
+ * SerDes Protocol 3 -  2
+ *
+ * Frequencies:
+ * Core     -- 2200 MHz
+ * Platform -- 750  MHz
+ * DDR      -- 3200 MT/s
+ */
+
+#include <../lx2160asi/lx2160a.rcwi>
+
+SYS_PLL_RAT=3D15
+MEM_PLL_CFG=3D3
+MEM_PLL_RAT=3D32
+MEM2_PLL_CFG=3D3
+MEM2_PLL_RAT=3D32
+CGA_PLL1_RAT=3D22
+CGA_PLL2_RAT=3D22
+CGB_PLL1_RAT=3D22
+CGB_PLL2_RAT=3D9
+HWA_CGA_M1_CLK_SEL=3D1
+HWA_CGB_M1_CLK_SEL=3D6
+BOOT_LOC=3D8
+SYSCLK_FREQ=3D600
+IIC2_PMUX=3D6
+IIC3_PMUX=3D2
+IIC4_PMUX=3D2
+USB3_CLK_FSEL=3D39
+SRDS_PLL_PD_PLL5=3D1
+SRDS_PRTCL_S1=3D19
+SRDS_PRTCL_S2=3D5
+SRDS_PRTCL_S3=3D2
+SRDS_PLL_REF_CLK_SEL_S1=3D2
+SRDS_DIV_PEX_S1=3D1
+SRDS_DIV_PEX_S2=3D1
+SRDS_DIV_PEX_S3=3D1
+
+/* Errata to write on scratch reg for validation */
+#include <../lx2160asi/scratchrw1.rcw>
+
+/* Boot Location Pointer */
+#include <../lx2160asi/bootlocptr_sd.rcw>
+
+/* Errata for SATA controller */
+#include <../lx2160asi/a010554.rcw>
+
+/* common PBI commands */
+#include <../lx2160asi/common.rcw>
+
+/* Modify FlexSPI Clock Divisor value */
+#include <../lx2160asi/flexspi_divisor_32.rcw>
+
+/*PCIe Errata A-009531*/
+#include <../lx2160asi/a009531_PEX3.rcw>
+#include <../lx2160asi/a009531_PEX5.rcw>
+
+/*PCIe Errata A-008851*/
+#include <../lx2160asi/a008851_PEX3.rcw>
+#include <../lx2160asi/a008851_PEX5.rcw>
+
+/*SerDes Errata A-050479*/
+#include <../lx2160asi/a050479.rcw>
+
+/* Errata A-050426 */
+#include <../lx2160asi/a050426.rcw>
diff --git a/board/freescale/lx2160ardb/readme.txt b/board/freescale/lx2160=
ardb/readme.txt
new file mode 100644
index 0000000000..287285a148
--- /dev/null
+++ b/board/freescale/lx2160ardb/readme.txt
@@ -0,0 +1,129 @@
+**************
+NXP LX2160ARDB
+**************
+
+This file documents the Buildroot support for the LX2160A Reference Design=
 Board.
+
+For more details about the board and the QorIQ Layerscape SoC, see the
+following pages (notably the "LX2160A Reference Design Board Getting Start=
ed
+Guide", for which this guide serves as an addition, not a replacement):
+  - https://www.nxp.com/design/design-center/software/qoriq-developer-reso=
urces/layerscape-lx2160a-reference-design-board:LX2160A-RDB
+  - https://www.nxp.com/LX2160A
+
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), but has a slower release cadence than LF. The currently=
 used
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generall=
y, in
+Buildroot, the latest Linux Factory release tag is always used, which may =
be
+considered pre-release software, as it may contain features which are not =
yet
+documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.ht=
ml
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - atf (fork), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.12.34-2.1.0
+  - qoriq-ddr-phy-binary (blob), lf-6.12.34-2.1.0
+  - qoriq-firmware-inphi (blob), static commit
+  - qoriq-mc-binary (blob), mc_release_10.39.0
+  - qoriq-mc-utils, mc_release_10.39.0
+  - qoriq-rcw, lf-6.12.34-2.1.0
+  - qoriq-restool, lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
+
+Build
+=3D=3D=3D=3D=3D
+
+First, configure Buildroot for the LX2160ARDB board:
+
+  make lx2160ardb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl - RCW + ATF BL2 stage
+  - dpc-usxgmii.dtb - the default DPC file
+  - dpc-warn.dtb
+  - dpl-2dpni.dtb
+  - dpl-eth.19.dtb - the default DPL file
+  - fip_ddr.bin - DDR PHY firmware
+  - fip.bin - U-Boot packaged as ATF payload
+  - fsl-lx2160a-rdb.dtb
+  - Image
+  - in112525-phy-ucode.txt - Firmware file for 25GbE SFP+ retimer
+  - mc.itb - MC firmware
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
+  - uboot-env.bin
+
+Create a bootable SD card
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
+
+The SD card image can also be programmed from a live system running U-Boot:
+
+  =3D> setenv autoload off && tftp $load_addr sdcard.img && mmc dev 0 && m=
mc write $load_addr 0 0x80000
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/lx2160ardb/genimage.cfg.
+
+Boot the LX2160ARDB board
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW1[1:4] =3D 0b1000 (select SD Card boot option),
+  or alternatively, run "qixis_reset sd" from a U-Boot booted from a diffe=
rent
+  boot source (NOR, eMMC etc).
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+The DPL and DPC files provided by NXP are not maximal configurations.
+They only contain a static description for:
+- the 40GbE QSFP+ MAC2 (which implicitly has MAC_LINK_TYPE_FIXED, because =
its
+  entry is missing from the DPC, and this means that the link state is pro=
vided
+  by the MC firmware)
+- the 1GbE RGMII MAC17 (specified as MAC_LINK_TYPE_PHY in the DPC, which m=
eans
+  that the link state is provided by phylink).
+
+The extra interfaces routed to front panel ports are endpmac3, endpmac4,
+endpmac5, endpmac6 and endpmac18. Among the more usual networking choices,=
 one
+could create individual DPNIs for each MAC:
+
+$ ls-addni dpmac.3 && ls-addni dpmac.4 && ls-addni dpmac.5 && ls-addni dpm=
ac.6 && ls-addni dpmac.18
+
+or a DPSW object to accelerate L2 forwarding between them:
+
+$ ls-addsw --num-ifs=3D4 --max-fdbs=3D4 --flooding-cfg=3DDPSW_FLOODING_PER=
_FDB \
+       --broadcast-cfg=3DDPSW_BROADCAST_PER_FDB dpmac.3 dpmac.4 dpmac.5 dp=
mac.6
+$ ip link add br0 type bridge vlan_filtering 1 && ip link set br0 up
+$ for eth in endpmac3 endpmac4 endpmac5 endpmac6; do \
+       ip link set $eth master br0 && ip link set $eth up; done
+
+Once the runtime configuration is satisfactory, it can be converted back i=
nto a
+permanent DPL file which can be plugged back into the build system:
+
+$ restool dprc generate-dpl > dpl-new.dts
+
+Using the device tree compiler (dtc), the new DPL can be transformed into a
+.dtb file and deployed as a custom networking configuration upon the next =
boot.
diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2=
160ardb/uboot-env.txt
new file mode 100644
index 0000000000..89090edb32
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot-env.txt
@@ -0,0 +1,11 @@
+# Memory addresses for bootstd
+fdt_addr_r=3D0x90000000
+kernel_addr_r=3D0x81000000
+scriptaddr=3D0x80000000
+
+# Boot order and network
+boot_targets=3Dusb0 mmc0 mmc1 scsi0 dhcp
+ethprime=3DDPMAC1@xgmii
+
+# Boot command (MC already loaded via fsl_bootcmd_mcinitcmd_set)
+bootcmd=3Dbootflow scan
diff --git a/board/freescale/lx2160ardb/uboot.config b/board/freescale/lx21=
60ardb/uboot.config
new file mode 100644
index 0000000000..e31254d62e
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot.config
@@ -0,0 +1,2 @@
+# Disable EFI boot support - we use extlinux.conf via bootstd instead
+# CONFIG_EFI_LOADER is not set
diff --git a/configs/lx2160ardb_defconfig b/configs/lx2160ardb_defconfig
new file mode 100644
index 0000000000..8678bb2df4
--- /dev/null
+++ b/configs/lx2160ardb_defconfig
@@ -0,0 +1,59 @@
+BR2_aarch64=3Dy
+BR2_cortex_a72=3Dy
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy
+BR2_GLOBAL_PATCH_DIR=3D"board/freescale/lx2160ardb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
+BR2_TARGET_GENERIC_HOSTNAME=3D"lx2160ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy
+BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyAMA0"
+BR2_ROOTFS_OVERLAY=3D"board/freescale/common/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freescale/lx2160ardb/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=3Dy
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,nxp-qoriq,linux,=
lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"$(LINUX_DIR)/arch/arm64/configs/=
lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"freescale/fsl-lx2160a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
+BR2_TARGET_ROOTFS_EXT2=3Dy
+BR2_TARGET_ROOTFS_EXT2_4=3Dy
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D"256M"
+BR2_TARGET_ROOTFS_CPIO=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D"$(call github,n=
xp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"lx2160ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"BOOT_MODE=3Dsd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D"fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=3Dy
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call github,nxp-qoriq,u-boot=
,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"lx2160ardb_tfa"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES=3D"board/freescale/lx2160ardb/uboot=
.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=3Dy
+BR2_PACKAGE_HOST_GENIMAGE=3Dy
+BR2_PACKAGE_HOST_QORIQ_RCW=3Dy
+BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH=3D"board/freescale/lx2160ardb/rcw_2=
200_750_3200_19_5_2_sd.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=3Dy
+# Minimal U-Boot environment for bootstd with DPAA2 MC firmware init
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=3D"board/freescale/lx2160ardb=
/uboot-env.txt board/freescale/common/env-dpaa2.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=3D"0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH=3D"boot"
+BR2_PACKAGE_QORIQ_MC_UTILS=3Dy
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE=3D"lx2160a/LX2160A-RDB/dpc-usxgmii l=
x2160a/LX2160A-RDB/dpc-warn"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE=3D"lx2160a/LX2160A-RDB/dpl-2dpni lx2=
160a/LX2160A-RDB/dpl-eth.19"
+BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH=3D"boot"
+BR2_PACKAGE_QORIQ_RESTOOL=3Dy
+BR2_PACKAGE_QORIQ_FIRMWARE_INPHI=3Dy
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
