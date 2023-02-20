Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B53C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 11:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E2560FD1;
	Mon, 20 Feb 2023 11:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E2560FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tb9ea-nJ3gPe; Mon, 20 Feb 2023 11:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B178D60FC2;
	Mon, 20 Feb 2023 11:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B178D60FC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED521BF3BC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6852881E63
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 11:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6852881E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFTeYVoqFHFq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 11:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBE381DFE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DBE381DFE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 11:21:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m23so636009wms.5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 03:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPSZers8wfQvUuLwy7p6kAcPhbTHwY38R9WIWuDXf1A=;
 b=7Qfc4lRLJZLKfVPD1KIS1jrxQdigyIJlKiR7Cg7BugWm2SC4WCbyrM56YRi9Lp5FQ8
 iSKQKg8T628TLh7LRUvh8Ky8gTNIvyrFdMAENdcEVIgWH6LL6NSxvxaMjGjyXE4qFUDO
 U1F4isbRhZg14aYdVu4yIQxJntkQg/56WDqA9owz9A9u2fRJtEPZFgiy0uOlmxbPTzIX
 PJn86NfsIU7WUiHBrPw+H7wRLj2IEqv7O8OHqC83Vk0Vk+Sht1fng3g5aVXst77iA6LI
 ASL2SPnjjp3azRS1eeKAAzVovi6liZRcKF42HzEoboujQ3/PwJSd++jjuCnVDWuzkllQ
 zyoQ==
X-Gm-Message-State: AO0yUKWjycjoYjP+BCUAjx/VpGMhBoY1P2pz7wQbE4o8oBtZEIcuGWdu
 +gHddxkSXfruyhs9TGRWCm9NuS3okaE=
X-Google-Smtp-Source: AK7set92t4fnbyl6jUyIeKSC5T+RDBYxjHnreDtEoRPkZu2HbDe5Mq8Gi40tpjSL3TVJ/CaAjz1soQ==
X-Received: by 2002:a05:600c:4487:b0:3e2:1ddf:7452 with SMTP id
 e7-20020a05600c448700b003e21ddf7452mr122827wmo.5.1676892111618; 
 Mon, 20 Feb 2023 03:21:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003e4326a6d53sm2692406wmb.35.2023.02.20.03.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:21:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 12:21:47 +0100
Message-Id: <20230220112147.952174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gPSZers8wfQvUuLwy7p6kAcPhbTHwY38R9WIWuDXf1A=;
 b=cgqjEYBITNRW9m1SneE3B7LPT3JSCp5d4/piGkiNiZtVSAfOog1pQGMot5dM5HOWk+
 5MyPOtDyqlEZMNy2bxwhqH9QNkJFBdckwcu29bRmUxd0PecU6UkhZ0KfpZiZeJiYbc8o
 nVMc+3ufvErpKZAjAXv2EbytlgXbnwjFVoanp7LpP5+8xOmZqb7rVttQ9R/MJvYwD3Up
 IyLIKpwYefMCqBoNs2/z6sTC6sBWZzlxGxzHqO9HtoWJBsklJ/GVWnsIIjJ9XksLNo5G
 4jcGtLMo38u5o5Izka/Hu7WhxoB6oIlYTLqRUos4SDx3HEwTfz7Ko/G1clwa5j+Ogi3s
 c7Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cgqjEYBI
Subject: [Buildroot] [PATCH 1/1] package/rockchip-mali: needs C++
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rockchip-mali pre-built libraries needs C++ since the addition of the
package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

readelf -a output/build/rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so|grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

While at it, add a comment when dependencies are not met

Fixes:
 - No autobuilder failures (yet), found when debugging an issue with
   rockchip-mali and glslsandbox-player

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rockchip-mali/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index d616284911..5a23954af3 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ROCKCHIP_MALI
 	bool "rockchip-mali"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARM_EABIHF || BR2_aarch64
 	# lidbrm. This would normally need a Config.in comment, but
@@ -30,3 +31,8 @@ config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "rockchip-mali"
 
 endif
+
+comment "rockchip-mali needs a glibc toolchain w/ C++, threads"
+	depends on BR2_ARM_EABIHF || BR2_aarch64
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
