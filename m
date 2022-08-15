Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827EDC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E4E40A6A;
	Mon, 15 Aug 2022 12:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E4E40A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6r_-TSMJvOv; Mon, 15 Aug 2022 12:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC33408E5;
	Mon, 15 Aug 2022 12:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC33408E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 647F01BF215
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FFD4408E5
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FFD4408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgXN7Utn4VUm for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:59:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F2CF405AC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F2CF405AC
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:59:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so3866898wms.5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=GW7A7ufeChXvfZThnCkLLe4DSWxzi2iwQLmVRbZua/k=;
 b=8E0Awa9mqmpU/yvXpXeSL5mfLFI4AqbRc0ZE+TXzn3xjd7Psc2wSi5NIi3Bpe6AWIE
 NkINVKjC8XfCw1cE7jHYeOYQw0IJTpKa2IzfRgTWmPYhuNb8w7M3W+xU9Rz0fD0VVMtQ
 67cl/iRS7tePth7Nagpskd7em5F5reZ10a8cFQ0Gisk1hU3LmMGL4xcxaj1Lwe6qGifM
 9zbiFo99QGBc6tG4A7X94AUhWhtNQUUGQmulA2pUwqSiOzbnLg9bgu0wIHwzK1cclnWZ
 UkEtJeNAyY8rAZQGgC3WiuoaMQLNXGY07cceFkRq6RwGUpqthxhnm6ax5kId8/RtlGML
 hw/g==
X-Gm-Message-State: ACgBeo2N+Iegj8T3cxcC/C9+P42/h/fxna/GyxwTRvpxWve2is4Aw0QZ
 J5pPamoRqaG7BFB3/1Q+3D8KI4OHDbU=
X-Google-Smtp-Source: AA6agR5Spsg2Xr/9WSYv2mS8tTFS6Psw1Ai56SP/ddE1fNdcevUeOLRk9RjtQzf4F4UpuMeq2ca8CQ==
X-Received: by 2002:a05:600c:a43:b0:3a4:d07e:1151 with SMTP id
 c3-20020a05600c0a4300b003a4d07e1151mr16624496wmq.169.1660568384196; 
 Mon, 15 Aug 2022 05:59:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b007270bbd6f150e5cd.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7270:bbd6:f150:e5cd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adfe712000000b002250fcfe2ddsm510172wrm.14.2022.08.15.05.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 05:59:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:59:41 +0200
Message-Id: <20220815125941.565072-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=GW7A7ufeChXvfZThnCkLLe4DSWxzi2iwQLmVRbZua/k=;
 b=nEN/UWtM3dVVwDYcIe4dHY2Ev9rWJWuA3dzyaW11zLemXAGTqSrZi/x67i55wOAjbP
 re8C8H8Ag9r8WYUTpU/86clWp0So6HDBPTXUIGRDFEW1pdE9Q6gFIZo8jw2e6senQQtJ
 aXrDHoB5YXOgge6KMmm0F369Z67yAj+7+Yx0VRTxdO+eCmzD1CX0+7TeDvbFG9qP2ZZZ
 Cqo9PHn8UbkraYyithTYGiXo37xVCALLz1dWcfjbgONpwLfArmpsJtQ7sVZN5FNOVjm8
 WJuiTdVV3o+iAYBqTXIB8WUf1wREmi6PCWIxAZUYnry1/a57c0hOaV6Eye2swep3PMiS
 RN8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nEN/UWtM
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: needs NPTL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

netsniff-ng unconditionally uses pthread_spin_lock since its addition in
commit 500d287b07190c9c1a1284bc91b37d07e1a835a3 and
https://github.com/netsniff-ng/netsniff-ng/commit/1a9fbac03c684f29cff9ac44875bd9504a89f54e
resulting in the following build failure:

/home/autobuild/autobuild/instance-1/output-1/per-package/netsniff-ng/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: netsniff-ng/tprintf.o: in function `tprintf_flush':
tprintf.c:(.text+0x42c): undefined reference to `pthread_spin_lock'

Fixes:
 - http://autobuild.buildroot.org/results/ceadbdea8cc35bfd7d601a6d4b18137f81f61406

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsniff-ng/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index bbb4172cd3..9ad3628f14 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NETSNIFF_NG
 	bool "netsniff-ng"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_spin_lock
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -28,7 +28,7 @@ comment "mausezahn needs glibc or musl toolchain"
 
 endif
 
-comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
+comment "netsniff-ng needs a toolchain w/ NPTL, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
