Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601ADCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C0541977;
	Sun,  7 Apr 2024 10:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj5tYoTxcRsr; Sun,  7 Apr 2024 10:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322DA4188E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322DA4188E;
	Sun,  7 Apr 2024 10:35:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BBF31BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7B0A40614
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFiFnF4VuU75 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A136403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A136403E9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A136403E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-416632343d0so1182505e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486120; x=1713090920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDZMNZNss5v+mTOVavgh0bNXypggo91SQ9lA/mgDH0o=;
 b=WoA4doCB9OFvyIb4cywe+zkG46qA0o+3Mi9qEt05l0GbFaR5sE9qiU8CBJhdaN2x54
 Izn8l2qiaRpaov8hfJCX3HINCz9MrfRCIgTl80DcaDMa3EsWTOZB11yitc1bEIbgGDBu
 jlv3kfb9mCZ9F8TWBs4ijQAJoO++tSCkyFKud6JO74f1yIXDz0ufsbUMH/TR7+FOG66C
 02qtpxuw89TndYR8IIq2mMXwSTZEcKbmeAz/3FSiF84dyRW9J16c9PWm9ZJRgd6ScHCw
 uAgb2DN5KNpQMRJaRSs7Z3MKgL+b0QrK1eOybCfNWRxtCmENkxhp9htI2ITTFN8ohmZY
 uvKQ==
X-Gm-Message-State: AOJu0YzpeCBf7UVMRpYH/k5WsoMfZQY84JHN/HeHveSqoKJpywczBC7Q
 2Xhufxk8oAzqe8pgWLPqmmuIJwr5Y61km6UAQNbUJKU4DDqZMBLIpxCHUhoh2azQMPd+/Adu3uq
 +
X-Google-Smtp-Source: AGHT+IEFmjnfNPvt0Ve19Rn9N2V8o5kvjbK3rTfN6rlypGZtwmT2lbJva3eekMl09CWEE/yAvOJXkw==
X-Received: by 2002:a05:600c:3b88:b0:416:6816:2b40 with SMTP id
 n8-20020a05600c3b8800b0041668162b40mr367815wms.28.1712486120226; 
 Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:02 +0200
Message-ID: <20240407103512.1112712-10-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486120; x=1713090920;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDZMNZNss5v+mTOVavgh0bNXypggo91SQ9lA/mgDH0o=;
 b=w36tuOY83UCYrhWvpstIfqqPYXNzd58YFMZHqtZfI8OaQR96HfNvFyTs+RXqguGiOr
 vy4xXSmxYswN/Pl6Po7TwVjyoGN+CoN8BDDrTkVQoawI9bO895f7UBPH5Kgq0HRHRV4P
 MxRrpftZNrfAV3jATwXzWphYmgM8gUYdS1GiTWEdxpuW+IdkzWqW/uosS/8V3bDHwCc/
 5cmvY3hTDGlQXy1Rypu0e4WNhyxfd1XXkb+h1RPBGrGQrQa6Iy5PKqtqg95aleqDVgx1
 eBdhc8uXT++tW9oGTtOvn5ZVVwYSAGFxHNohg2jObTs84/ErseHtSTjD1XqMXSmRcaRx
 wrog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=w36tuOY8
Subject: [Buildroot] [PATCH v12 09/16] board/ti/am62x-sk: generalize
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
index d4b19e5039..1c7085d04d 100644
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
