Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BCCC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FF641557;
	Mon,  4 Mar 2024 15:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQldodlAGDVG; Mon,  4 Mar 2024 15:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80384414EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80384414EF;
	Mon,  4 Mar 2024 15:35:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B256A1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD6E88169A
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvuekOtzdzvO for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC35281656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC35281656
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC35281656
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:32 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d2fad80eacso55128551fa.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566470; x=1710171270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPQagV28irN2Jmx/rxo3YHBgBHJo9qHRa8+cRY2hp+4=;
 b=D3/7aiLNu10g51moC1sDRnOmVXa1VmE08oPmAn3ui9ynQpnnRibtdaIarXySm5YFhh
 VBVaB8N4Gt50hRDyP6nFUQraITlt/zA76TWBONCF/3/O3xo2qZHhByB+MXtx0bIeVU9e
 YBQ7Ej7oow8ILAv1n8F64W57RunEf/Aer6laLXzBChEtlruzUTqRSfJYoxhwReJv3udb
 C4wpDOB9oY1IEwBHM9g5H61XhC7DUVudlHx/4zoNhNJqZvtidnxilGcfENuzrTQiHG08
 FwLzRQpghpVZYChPxXe9G1Ief+vVKGTXWlj98bFDsBBsUZ0I1HpAH93kp16zncXG8h0o
 Bn1A==
X-Gm-Message-State: AOJu0YyCxeDQe9/NOPrulM9/SSIrq6XxYHzN6+SBRsir0odRlmW3TDii
 MX6LDsLn9qtuUQaVT7ASB0L3BrSa/dI4nHDUbTUNCSalMnCMXcDDoHrZ6iYaoFAV3CjsG+e+B52
 YjYc=
X-Google-Smtp-Source: AGHT+IE2SiSg2MtwyAsF9IsP2e1g7LRUdlUb8vAWyux3fNkK79+oOk3Xi4uR1GFZH5DlQfYuokpxBg==
X-Received: by 2002:a19:8c11:0:b0:512:fce4:327b with SMTP id
 o17-20020a198c11000000b00512fce4327bmr5553685lfd.39.1709566470133; 
 Mon, 04 Mar 2024 07:34:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:49 +0100
Message-ID: <20240304153253.732708-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566470; x=1710171270;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPQagV28irN2Jmx/rxo3YHBgBHJo9qHRa8+cRY2hp+4=;
 b=V0Tz9vjcVjupxL7vwzrpkDR1KEn14BgZyWFVKdXCo7x3JK/zWf56uXdKZjhVPAJcgR
 HlW72nUjIaW2oLG+me/rBPs+xaouNrWDJcqoxV+Kx6Pfo+4UZt1J931X5tBgmmOhvwlf
 HEj44vPiaojW+8zLs2dxU6dJiyzK2xMa/hnu4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=V0Tz9vjc
Subject: [Buildroot] [PATCH v9 18/22] board/ti/am62x-sk: generalize
 post-build.sh
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing any explicit reference to the ti_am62x_sk_defconfig
configuration, the script can also be used by other configurations or at
least by ti_am64x_sk_defconfig.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

 board/ti/am62x-sk/post-build.sh | 10 +++++++---
 configs/ti_am62x_sk_defconfig   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
index 4f19f4d6cf91..d066e28fd0d5 100755
--- a/board/ti/am62x-sk/post-build.sh
+++ b/board/ti/am62x-sk/post-build.sh
@@ -12,8 +12,8 @@ EOF
   exit 1
 }
 
-o='c:d:r:x:'
-O='console:,devicetree:,root:,extra-args:'
+o='c:d:l:r:x:'
+O='console:,devicetree:,label:,root:,extra-args:'
 opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
 eval set -- "${opts}"
 while [ ${#} -gt 0 ]; do
@@ -24,6 +24,9 @@ while [ ${#} -gt 0 ]; do
     (-d|--devicetree)
         DEVICETREE="${2}"; shift 2
         ;;
+    (-l|--label)
+        LABEL="${2}"; shift 2
+        ;;
     (-r|--root)
         ROOT="${2}"; shift 2
         ;;
@@ -38,6 +41,7 @@ done
 
 [ -n "${CONSOLE}" ] || die "Missing \`console' argument"
 [ -n "${DEVICETREE}" ] || die "Missing \`devicetree' argument"
+[ -n "${LABEL}" ] || die "Missing \`label' argument"
 [ -n "${ROOT}" ] || die "Missing \`root' argument"
 append="console=${CONSOLE} root=${ROOT} rw rootfstype=ext4 rootwait"
 if [ -n "${EXTRA_ARGS}" ]; then
@@ -46,7 +50,7 @@ fi
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
-	label am62x-sk-buildroot
+	label ${LABEL}
 	  kernel /Image
 	  fdtdir /
 	  devicetree /${DEVICETREE}
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 877f88899af9..bd294bb712ee 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
