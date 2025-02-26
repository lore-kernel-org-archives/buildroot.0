Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15110C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B0E6075B;
	Wed, 26 Feb 2025 21:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsaR7dUpEXFc; Wed, 26 Feb 2025 21:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF000607C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF000607C5;
	Wed, 26 Feb 2025 21:24:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7937994F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591A7412A0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHzxssBiMBkc for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:24:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3768741281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3768741281
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3768741281
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:24:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54838cd334cso257406e87.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 13:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740605072; x=1741209872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wV+WDu7KfCaIoo1SUlluoLxK6I/IjvdkUi2k+fLi3c=;
 b=AuyennWMTwmDD2GmHVHIC2dvtsLJXN4NdCpK0xJvb/x6VUV9KUk91qklr3gbTc+9i1
 vhQ3hkhRDxRHuXOLoFdv/H5XaOfap3mkrJtE+ZW+TI0ENL/u0JFp+p6t/cRVk/o41C0f
 iVVO8N+S1uPH8SO2vPIpmBFxnDGqyNFqvuCEebpjWNJc3QsIkFhtkWgaz32NMCO+5mJ8
 YyDdkxQeVdLNLozUwfXJop/MSVnxsR9Abh92e4xARgL4B6+mKxHUVaXD78Dx/byFeMdE
 72tmBo8175hPG975TkH7/PWU9RYlzsuZ65+wDF0bk949sL2Uh4hqdWsvB3RMBmx81cfn
 zUCQ==
X-Gm-Message-State: AOJu0Yx3yB4ycMGbWzHXYY7l881U2GAq1k8OlGUSAOVdFyx17bjk/8su
 ZUaIQufZjstImSSY7bn8UecdcJwCEGehLkolw1eiUtw3VVJnusGeYUKSeQ==
X-Gm-Gg: ASbGncu4fXI0567Vp2iTgOKaWuD+wOwHyIMFLP6PSCdhpL0j6ltDBh5GQ0TbByO//qq
 j1RNT8dfGZU1xojLlQy2Xbwl9paubSKDX7K82ICTYGpUbt+8mMhndyAckc+OmguP1NhrzeW1qfq
 jvBe1mRj7gdTssMfc8Mu0kNcLp0T5DrOhm3J5MjgyVU3bewVkbM6IrNyg9DcvooMxxZQ/9J5Q5C
 kMoNP1x0htB6Zb+Y3mdPLRRDjr6ltvZ9XkjFop5Q+NHPKkOjXjbF0fblnMTQ7caiYKV4h2SlPnf
 2fti8yn4S4FUlNpryL5CzvIDbsQoeemcamfOuAi2nQ==
X-Google-Smtp-Source: AGHT+IEWIFlxGB5j55vIbZuTEu4xmvnoSJEI/6Xbo11BftX0Ai7eqjQZ/v/Rq89k8ijkSSKl3JPBpw==
X-Received: by 2002:a05:6512:2314:b0:545:ab8:2be4 with SMTP id
 2adb3069b0e04-5493c57a2demr3292142e87.27.1740605071607; 
 Wed, 26 Feb 2025 13:24:31 -0800 (PST)
Received: from calculate.local ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be5d7sm5677e87.191.2025.02.26.13.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 13:24:31 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Thu, 27 Feb 2025 00:24:29 +0300
Message-ID: <20250226212429.14668-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740605072; x=1741209872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1wV+WDu7KfCaIoo1SUlluoLxK6I/IjvdkUi2k+fLi3c=;
 b=XNKrS5XbPRLsAjAFWnunecCAQkJB5ywBhrZKhayt5NWgcOtOwe4KWqyACUthTEth7B
 SfpySuxx6DZY7hRVUscZC+/Xcy4vtiJyqPn+sxTZGd4mToKUqESXq+YeAe4c+eGjbIc5
 nY27NdcFiH/ntHhqMw1jum3a5d30JFp2NeUm76jfjuYjN1gFBmE2PHkjNtGQksc2n6he
 +JiIyAw0YfmBR2lJc0xYuiJPKtDg0XpTyn0BzhpelMXb3CzzF3z1EfeR1/aNpgZkIfhy
 tMPOZ3f8Zhx7HN8b5pXwCkFyHyI8rwjC9RQY+YF7jltGq7Fe92Vsmwy/PLlW3GDMwqT2
 EzVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XNKrS5Xb
Subject: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s: Generate
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
 .../rootfs_overlay/etc/init.d/S01hwaddress      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress

diff --git a/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01hwaddress
new file mode 100755
index 0000000000..96741f9f53
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
+			base_mac=$(echo "${cid_hash:0:12}" | sed 's/\(..\)/\1:/g;s/:$//')
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
