Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D596DC46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785A640600;
	Mon,  2 Jan 2023 12:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785A640600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UF0mLuCNDYRD; Mon,  2 Jan 2023 12:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B995F404B9;
	Mon,  2 Jan 2023 12:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B995F404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4151BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F4181400
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F4181400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFcV3VF_dtbb for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3203081379
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3203081379
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g10so6466985wmo.1
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hz7O4A1X2aY01GLWrcvqC5h6XakMyChDNIc0MaZpYR0=;
 b=E7gRfuUhuOMDkx0h8NBP2a5ktdedDHVCmrTUVqSjy/FeUoPHsdRE6vmfKOLGdms+bS
 stMuDB7oX10uIDzJTdLtKXXAlXTIe09CBpA0RpGiipRv2mUNiWuvAA2TynnxViY3o2mI
 6ioeyPkqAgx0/sWG8abjnEjhDam2gbrxr6D5bzu3Z5iunNt6F/UacDHtNRHfDXc+WxJL
 MNWyDNoHiSKmx2OyUN8GvLipzN61oSpCc0+2jpB43bO19HwFj/ClFwDNaValbb9DsE4f
 dWJtY6HiCWEFXYWvBlm+lQLOfm9J4QiX5+RrKtGmmZWkkd99YP8ZNYLZcfn29+1uZlAn
 W7Rw==
X-Gm-Message-State: AFqh2kry2eEB6TTQiF8iuwaRmvkx2JlQwtNizrQRWYmceUEL0N7whuZl
 BL+NuQtwj9NASlZ4UfMfj/AGFy4HLsk=
X-Google-Smtp-Source: AMrXdXvXOau08LfHxzg0esd9CFJ/aXSJ/UEiwD45tjl+sJ7T1C2lid2OhaA7Xoy7HF7lWRFzahFinQ==
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id
 t6-20020a7bc3c6000000b003d233766f37mr28231011wmj.10.1672662089482; 
 Mon, 02 Jan 2023 04:21:29 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm49646636wmq.8.2023.01.02.04.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:29 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:24 +0100
Message-Id: <20230102122124.1912257-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hz7O4A1X2aY01GLWrcvqC5h6XakMyChDNIc0MaZpYR0=;
 b=Nz5Q6r2tCQpTJCfhNRHPDO8x6Ds6aSJbqH8NIWTEPdaeGWLWLLK4EJSQjYi3MrOSxp
 69SFTIN7BNmXXfjO+rtxLWfl75OUZV6vgYFplgOgjNhFJFlV7WTTDpkDRUZ1TPJ3kdlG
 KRvaxGzcCHEXAIOw/Llm7LjfcgRn2byeZWz9PJZRVdZ9FkH5INE/uG1Di2qujWTchLOn
 KdmljMhHeRlEehsQIpD5s76t/B9fLZiuVAgTgieRsDDDDU6bYusG0UyX2Vqb7Msn3T35
 fn1NMfOSbvh9GHbLSjVAjVlKSBlbiAtV5K4KUkRj2HJIhVkD+u2xNsm3YFEoC8LCen3k
 Ha8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nz5Q6r2t
Subject: [Buildroot] [PATCH] package/libpcap: bump to version 1.10.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libpcap/Config.in    | 2 +-
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index a5f64bdc8..7ffac64c4 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBPCAP
 	  A system-independent library for user-level network packet
 	  capture.
 
-	  http://www.tcpdump.org/
+	  https://www.tcpdump.org/
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 84c8e405d..b87d9d04e 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz.sig
-sha256  ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4  libpcap-1.10.1.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz.sig
+sha256  db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560  libpcap-1.10.2.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 21422b2c0..173207de6 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.1
+LIBPCAP_VERSION = 1.10.2
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
