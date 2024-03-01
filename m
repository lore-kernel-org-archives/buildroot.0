Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C562C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4246F83474;
	Fri,  1 Mar 2024 13:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k49nyMznJKNF; Fri,  1 Mar 2024 13:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780948211B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780948211B;
	Fri,  1 Mar 2024 13:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C463F1BF990
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B271041DD7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lA_jOrQ8KfX6 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2ECB41C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2ECB41C61
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2ECB41C61
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso3481439a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300206; x=1709905006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBHmOg83dmdyJhrLvJaCDYqux5uadIRjVh5Zh5ThZRk=;
 b=jbho/G19RvMqEbAlXP6Bk04QbeIbJUftO40A7ofmrr4W1pY9dzl8vg2fr6M5G7G+xW
 xNRvuSAF+J5EG7AR/IkxrsApKvCeBxsp1xvHsEgiiEJTAvtg4MZa7QoHtV1hcR/F7mbI
 PDA6RNOKWtgRTHqTXKD5CvwvsXl6fwUAm/fhnZWDuBAwLqH+NiuEcIw7aCLpl8j5kxlH
 +iRqgfslcab8Y5rVNv2mCIeRn2Wd7WBtE7+Wclm2WX0ZzUHr8LJBRKRiEjAUXPJLtq0F
 JKYW4LATcyQ28iEEuvI4Xmk3mfT47hHjAkDVySVppaFDTsmsS4+AnWGOIKIeyuboaFbW
 bs0Q==
X-Gm-Message-State: AOJu0Yy4XvFZw5jJ5T7zDT8+/8dIw+C+Aw5wkh7+Pw1wFF22C0V4gzME
 LzU5sSob/0YaAfUVcvit6C2n2MFhGzronx5BKFsa4CuNDop7OY4MmNBFzrO6s1w0Aw0Dq/OuboY
 lsgg=
X-Google-Smtp-Source: AGHT+IGu2jZUHYDYvrChfxbZolD435XCB4LFvROFuK8WVPby1tlZEL+se2NUjxnNyc0X1cn3EUn7IA==
X-Received: by 2002:aa7:cd10:0:b0:566:4d9:c3cd with SMTP id
 b16-20020aa7cd10000000b0056604d9c3cdmr1292194edw.41.1709300205859; 
 Fri, 01 Mar 2024 05:36:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:15 +0100
Message-ID: <20240301133620.3547430-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300206; x=1709905006;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBHmOg83dmdyJhrLvJaCDYqux5uadIRjVh5Zh5ThZRk=;
 b=g9WmvlCnUYrLVJcT/8RgrhrOXWHFoXJ65IAO9GrjR1CE8EhrV1ISSsrsJmzv1UduqJ
 vW2vGD35vU8Q+pdrYJwM3BdpWE9VTg2fBv070NMzPH/FRxz7AAJ0Hr+aIknC33q2iRAt
 RdyLYlO1ImBoPtaC774d0ItLS9HkO4gIHtaX0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=g9WmvlCn
Subject: [Buildroot] [PATCH v8 18/23] board/ti/am62x-sk: generalize
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
