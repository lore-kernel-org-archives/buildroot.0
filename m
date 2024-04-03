Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2BDCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB75418FC;
	Wed,  3 Apr 2024 19:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W68noaKa5Aq; Wed,  3 Apr 2024 19:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED30418EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ED30418EA;
	Wed,  3 Apr 2024 19:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1632B1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040E740437
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZRPcIaEW6wF for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFC0C402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFC0C402E6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFC0C402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343b4601415so68336f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174052; x=1712778852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BH9LBWRYkxmvG4g6L5QmUcdxaUHLc/m0Xq69POMF/t8=;
 b=rJb5Orj42Aw1UqpV1qxYHAlPFjjyzSpkwlY/M/sNHAxEeF/iTaKnR5D/CmJ6t5B7j/
 TUEQQVTvNMt0MxlMtSAxxGdGjO7eBliVEbzf9lrye1SSr7TjX16msckpOUoVsgCd/p9Y
 jX8f7Trp6XKvxh8MPPgD4uYzl/LQrvKB/tpXidfWBtsy/BGedhZYRLWpYL4uZUBVCUdZ
 ImZvQ1ymWkRGLNrjd8ZoMYisI+nUxknqFVnUJV1WuZcQ9y4YxBeRwHeWMAdI1tRW2C59
 hB3+yDziutrBUJIgGPZ4g/9+7zoO74KjvFnAFgEILziaCLGnQtD3Tg/6O1wfMr+Jt7RW
 QfXg==
X-Gm-Message-State: AOJu0YzuzewsGFtC2S2M0UfAM7tKc1enjX8UsLcZvrdeldb+UrTu/knI
 meJCwJJc49u1HZ/2XF6gYtPjCY5U9g/JWG41xkNfuzcTWSNKLuAHybunNYNJUb5+GA/V0Tnsn7l
 C
X-Google-Smtp-Source: AGHT+IGYNUxUj+uZlWQYjs/izjw3Mbe7CZ3oBlE+1vqApn4pMf7XCjBf/ZHSQ7InUgZOfAdNGY58Vw==
X-Received: by 2002:a05:6000:1249:b0:343:44cd:7d1e with SMTP id
 j9-20020a056000124900b0034344cd7d1emr538596wrx.17.1712174052087; 
 Wed, 03 Apr 2024 12:54:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:11 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:44 +0200
Message-ID: <20240403195403.1359007-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174052; x=1712778852;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BH9LBWRYkxmvG4g6L5QmUcdxaUHLc/m0Xq69POMF/t8=;
 b=PMnNJ3E9bdzLQTTAnU1bPFoay4s0qM+0ONq90NSfWA9A1s7IN44P43HfOuxSmyREMb
 xeHv4TwYhUeFqB2u9I+ZcNaIYF7ip6hwmGOFbmU24/VyQ9QffxIe1XBeveSASA+JtK5u
 PFqgdvmaaKEDKwEEfpDwIGld4WdV8mWlECaF9WwFZZsTzDOPl5UAEmMTU9CcKxO+be+O
 rhJJ0vlRaPRnLNaCXMJwsmyhjASIOLFoLleZRpWuOBf7fu9TM4wN17QZdpj7k4m61JhO
 lHxR1B5ud0O2PuSLD/I/dadJKJ6FplKrcAEPy2VYr7RjK9zYiVNC+lMXRmPbHyAo3MQ2
 gPMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=PMnNJ3E9
Subject: [Buildroot] [PATCH v11 10/17] board/ti/am62x-sk: generalize
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Removing any explicit reference to the ti_am62x_sk_defconfig
configuration, the script can also be used by other configurations or at
least by ti_am64x_sk_defconfig.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---

Added in v8
---
 board/ti/am62x-sk/post-build.sh | 10 +++++++---
 configs/ti_am62x_sk_defconfig   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
index 4f19f4d6cf..d066e28fd0 100755
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
index 68e414ee6e..df7733f526 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
-BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
