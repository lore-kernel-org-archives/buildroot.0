Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE942C25B79
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DC281E57;
	Tue, 14 May 2024 21:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6d5byYGsbP3; Tue, 14 May 2024 21:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973FF82039
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973FF82039;
	Tue, 14 May 2024 21:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 839571BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BD83409F0
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TblTHKuHNgB for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54A05409E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A05409E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A05409E0
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:54:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC2C1A4C48EB;
 Tue, 14 May 2024 23:54:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59422)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s7065-000000000Dp-37rR;
 Tue, 14 May 2024 21:54:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:54:05 +0200
Message-Id: <20240514215406.2866563-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514215406.2866563-1-bernd@kuhls.net>
References: <20240514215406.2866563-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723649;
 bh=Dd+tjxcmVoUQX8ZjwzqcEKsNNR5gapy9H9eC6nxgHMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fcmF18ovCfNFPkRvLV4N7SzSMPC3K3YJfDRXSfE/1w4KWe3NP/ruQ7IwGfKgk5KT5
 3i2h/l2mYudO0ENGjwqwm3DgJgo835Ms+lQJb6FEKFycTw3QvUVJvv6FLklk0Pb0kx
 PajSTBfP9bFem3T8yBonD0zKdyH75vBaaJc9NT5xoElwC3CmtpbNxvhqHyfuPoHlRa
 YfnL5nylKV96siUqO6MqOAZv2Mab4i+Rr4+0/DT4Tt5Pv/79kkulWEuTcEQKlvtVkb
 dDrFyhaQvSeQp1ZhD3X7kFA9w58ehc8J3eeejoJPABhzAlDbQXxK0fju+qnrBv/KGt
 zZ3WrzRpMSIIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=fcmF18ov
Subject: [Buildroot] [PATCH 4/5] package/sofia-sip: fix build with gcc 14.x
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...mpatible-pointer-type-in-sip_basic-c.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch

diff --git a/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch b/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
new file mode 100644
index 0000000000..7f890fd27b
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
@@ -0,0 +1,27 @@
+From 46b02f0655af0a9594e805f09a8ee99278f84777 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tomi=20L=C3=A4hteenm=C3=A4ki?= <lihis@lihis.net>
+Date: Mon, 19 Feb 2024 09:06:20 +0200
+Subject: [PATCH] Fix incompatible pointer type in sip_basic.c
+
+Closes #248
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/249
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/sip/sip_basic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsofia-sip-ua/sip/sip_basic.c b/libsofia-sip-ua/sip/sip_basic.c
+index 3444fb25..82e824e3 100644
+--- a/libsofia-sip-ua/sip/sip_basic.c
++++ b/libsofia-sip-ua/sip/sip_basic.c
+@@ -2901,7 +2901,7 @@ issize_t sip_identity_d(su_home_t *home, sip_header_t *h, char *s, isize_t slen)
+       ext = strchr(ppt, ';');
+ 
+       if (ext) {
+-          msg_param_t *params = su_alloc(home, sizeof(msg_param_t));
++          msg_param_t const *params = su_alloc(home, sizeof(msg_param_t));
+           if (msg_params_d(home, &ext, &params) >= 0) {
+               id->id_info_params = params;
+           }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
