Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28755C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F014138E;
	Wed, 26 Feb 2025 21:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK1gQbXDsWVg; Wed, 26 Feb 2025 21:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25EE41390
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25EE41390;
	Wed, 26 Feb 2025 21:34:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C829594F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB7A861021
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKBdvplD0--J for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1BCE6109A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1BCE6109A
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1BCE6109A
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso214102e87.2
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 13:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740605638; x=1741210438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1899ALb7K4HXTFCcIyMAbLMv2U65jqU5QUmWhjqAts0=;
 b=lANyKFcY3BVcQIE91Ra1lwOwkzkWE15Kp/Z5330gGime1X5F4aXKdrRCfwn4+stFEr
 3uFR8L+VT7JuYlDcoGDZq/jjfrQWW14AjWFZFs26yDeCeDVt0tio7N+pLAOOAmnOgCk6
 2ERP49aMjVT90TAbayjjt4OjHXfd0qySEAtgS2dTAjN7+95TaP5RXYKH8MyyiMhSE8tE
 jR99MwbRq5GoeLHkbwqTt+evxrWbvV3xR9B99jmxz2edau4/qCfWXIsXLZ8U0c13vBfz
 D5zBKT6nXM2kYucIlwGVlb6QrEEWeFMA2zmkC0P4yXi7q9cG/oEwBGmlV2GOr7vO3Yyj
 Wi8g==
X-Gm-Message-State: AOJu0Yw6xBHQQIydWwp3p5OxMi80nrealZLE2/jSNriTEw8zQPxYooZu
 2cIqYgY0uao9EVTGujprZmLvGXtLa8WcgA+GTo6BGN+82yuabXV9jAigRQ==
X-Gm-Gg: ASbGncu/6aJkEAhXyZhvwJuNz9bTMt3TRDSoA0sLUrEYyEwzvxQEuh6Ytun2MVa4eqb
 IJ3F9Ahxrx2RB1HdpeSu4OPc706cLGQ76LuGo3dm7Yx4CN8M/Xdvky8LjvpJw1Sz0YyOBcFb4NJ
 BVLRCHQzC/TpwWpIuq1HPdnBzSpuhr5303/xg9ffzvVhUlm179zdvjbKmD0H4A0oKKW2vqTkoYG
 Im0bOWPH3nV+xz8fFHqK3M5pqcTy6gER+5SXWihpCF4KjzoZ6aaBXVcu6e/7SOp+BnVbOhl4sIE
 4DtUrdnCSJa3HwluplEMEeM+NXAIPS9jkTiavTL2Bw==
X-Google-Smtp-Source: AGHT+IEh0Zmf+QbCcUrg+EMmX8hwoX1zxaIuN+OGaXm7q5e5TQKmZDFWGJl5Y3VuxIJ0o23ziKAmFg==
X-Received: by 2002:a05:6512:1093:b0:545:cc2:accd with SMTP id
 2adb3069b0e04-5493c578f58mr3329353e87.20.1740605637939; 
 Wed, 26 Feb 2025 13:33:57 -0800 (PST)
Received: from calculate.local ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be7eesm6895e87.205.2025.02.26.13.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 13:33:57 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Thu, 27 Feb 2025 00:33:56 +0300
Message-ID: <20250226213356.15168-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740605638; x=1741210438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1899ALb7K4HXTFCcIyMAbLMv2U65jqU5QUmWhjqAts0=;
 b=gfg/fgmXkA2I9DEZmelRAgvSgk23dc4qmlfxcb6LdvObedBasvNd3VCfGJJrJ+/n8y
 HfGOXQfRcjcpzvU8vnjT1svmCgPP+Um5f+/OxTTMvSXp020GKX0+x0EVzaXe3sgp1zdE
 evY3GSugQGFBdSHOFhVpgFOVEyzIl6CYL1fdr4Cv2m5+X3R9D4L0i0ynLkLbfBN8qukC
 Z2DRPeTbgnFlqhyNvJxjRVjLFWgcHGfMzQTGAIKnrjwsbZ8pr3k3SIOcSd3Dqg4YPiii
 ejSqVrXNWUbgqVZFDd1Tqup0tcV42D2oYC5vQfVyAqsNCaU2dCXg8/8ppuLad0mEm/Wy
 mtNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gfg/fgmX
Subject: [Buildroot] [PATCH v2] board/friendlyarm/nanopi-r3s: Generate
 permanent mac address
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Generate permanent mac address for eth0 from emmc chip serial number. 
I found the information at the link: https://github.com/openwrt/openwrt/issues/14453

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
Changes v1->v2:
 - Fixed the error reported by shellcheck
---
 .../rootfs_overlay/etc/init.d/S01hwaddress      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress

diff --git a/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress
new file mode 100755
index 0000000000..ed4dc784f4
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+# Generate permanent mac address for eth0 from emmc chip serial number
+
+case "$1" in
+	start)
+		if ! grep -q "hwaddress ether" /etc/network/interfaces; then
+			cid_hash=$(sha256sum /sys/class/block/mmcblk1/device/cid | cut -d ' ' -f 1)
+			base_mac=$(printf '%.12s' "$cid_hash" | sed 's/\(..\)/\1:/g;s/:$//')
+			sed -i "/iface eth0/a hwaddress ether $base_mac" /etc/network/interfaces
+		fi
+		;;
+	*)
+		echo "Usage: $0 start"
+		exit 1
+		;;
+esac
-- 
2.45.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
