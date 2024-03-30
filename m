Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A8CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CEC812B4;
	Sat, 30 Mar 2024 16:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rr57tYofdxqa; Sat, 30 Mar 2024 16:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC8780E8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC8780E8C;
	Sat, 30 Mar 2024 16:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371AA1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24097406CC
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t39TyJ4r0tX2 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA9BD406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA9BD406C9
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA9BD406C9
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:03:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c1364ff79so3353954a12.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814580; x=1712419380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBHmOg83dmdyJhrLvJaCDYqux5uadIRjVh5Zh5ThZRk=;
 b=ITMBVzIgc2RI5+m9Tc0KWqRBlrN4Ae4MVTDhIBASPL+fDZxha4Ykct3RBQov4zxRnK
 Fj7DunJsgOK2zB7jfoatp9qFP85WEaM/sQD+gHKZuyXlxx/zDehovLXxz1+kyyed0ZtT
 9dpehXOrnnbS6Y+lZHvvaJJnlIOknJI2jbSEURJObeSBc2YdxkW42FSbxVYv/9muYrs7
 HnE/xeucCCONxpomwKIX//MnOf58S6SL3SmV9BgtyDP016/VZA0pPhFGaHQrM/0FGaYB
 /b1ubOwn/3DES+HdU1wkUpru34tfr9NEtHuoSiHfF45A/QpbOLykkRuCd6VfiIeWf3WS
 Ob2w==
X-Gm-Message-State: AOJu0YyfiZcTl9rsTtYp8S2F6C/g5KJktKzOhvInLj3qwN+5ZTPEiSgC
 57Oj/w2GSsNn7gnBgxieBqh2crLQbWf9kB5dg7mrJjSSrQSKfy21V6kh0y9xjrANOW0lsXoDpd2
 d8NQ=
X-Google-Smtp-Source: AGHT+IHFgqoDwWcNXTgCbZ+7wr+fd+I9vEAw7E1cxSypEOOSyV/bnSZr1k0RDrgjbaPZDJvvaXYOJw==
X-Received: by 2002:a05:6402:51cd:b0:566:777:af4f with SMTP id
 r13-20020a05640251cd00b005660777af4fmr3304678edd.1.1711814580288; 
 Sat, 30 Mar 2024 09:03:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:03:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:41 +0100
Message-ID: <20240330160244.3214733-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814580; x=1712419380;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBHmOg83dmdyJhrLvJaCDYqux5uadIRjVh5Zh5ThZRk=;
 b=nnZKFijLwLQaVr5fCLLsj4YjNm5hUgawJBDwg/OsSydVoHTxXc9mWOXhtDBN/2vIA5
 zjnNsLyZQfPMLJ3B82ciDlXcTMXhVe2s0YlSMKc9UK3ttLxS957Ea1nqb6RYUWxWfNIy
 DXJqtk5A6BKgl1uelImOrwkAY4QljNHmJX58Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nnZKFijL
Subject: [Buildroot] [PATCH v10 09/12] board/ti/am62x-sk: generalize
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
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
