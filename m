Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FA7EDEBEF
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B982080F51;
	Tue,  3 Mar 2026 20:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enbUHy5PXjFj; Tue,  3 Mar 2026 20:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBEA810F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568174;
	bh=u8s13NmCf5H0ay2wn4X2hCzl2QQOWTTiBW3WN1gCndI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=COh0t7pa/I2NbNHU4iZ388hYEZJbExUxjgh2KsPHP5NLczMTj4TDMQpdN81c/Cd+s
	 S31tQv+ne/WRHqOhb7swSoKgo3MmV27RIaOE+CgXlnF1+nFmfYyxhJd5pr3foLO6EO
	 hkC1cWNVPSdM8SDD7s0rwvUCXkOIMEiJX3co9pROOnuJo3EKhYGSxcp6iiC68EQ2UD
	 0eYg7Mnw7kW6bMRPMEpy1yNS4+s0XcrMJp/4MM4CLKhO2WUar62a8a/KNtGEGVQmTq
	 +rL3wclwhtTcM8PymaGK3IEBT0RisyQnbf8wAeZWpOyCxAIk3FB/fVgjkUQNpL9k7i
	 pcZRgpXLxBBlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBEA810F9;
	Tue,  3 Mar 2026 20:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4904125B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EA15810F9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qethWLfFcrGH for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F206980F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F206980F51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F206980F51
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 975C4A4C3412;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-0q9O;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:49 +0100
Message-ID: <20260303200054.784253-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=wgh3Iohfhnk0985DAKSpXH6rUlUDR0uCEEmAJeB6T5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=T8rfmvdGomwvUmAjISfKWCpIvHuA3iM50CowRQkS7tzwWcs/cA9Za8JdQz2nK0HMu
 qNhltga2aq+6+A6hFQKZPBpPcs8FedGAo+feyb33W4D3wrIt0h5k3aEsMoeeuUsJrt
 KSPB33+x0+XOFZ6j0KsbVnAtaMu8iA2VfdG5cdLejt93n01eWFDMZqZHPVls0ATLuS
 gsYzoaROydHDrdE2LjTogude6P+8l9OJ0DQ07CFBpqkqHvQB4RCcqCe7Sj3Z8Bdyhs
 M1oygP3J61cDgZlzQePkdeKtU5EeDd8XS3hL++8AkPyTUp4hqOHMOkK3sxmlLjwC+r
 r4YVOkRYF/ZVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T8rfmvdG
Subject: [Buildroot] [PATCH/next 10/14] package/libvips: fix build with
 glibc 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...IPS_FREEF-for-expression-like-macros.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch

diff --git a/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch b/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch
new file mode 100644
index 0000000000..cee35415c6
--- /dev/null
+++ b/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch
@@ -0,0 +1,33 @@
+From abb4dfad9e446e77396de9e93003af5be7aa18da Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Sun, 18 Jan 2026 12:15:33 +0100
+Subject: [PATCH] memory: fix `VIPS_FREEF` for expression-like macros (#4836)
+
+Ensure the macro works correctly when F expands to an expression,
+such as `g_free()` using `free_sized()` (as available in the
+upcoming glibc 2.43).
+
+Resolves: #4835.
+
+Upstream: https://github.com/libvips/libvips/commit/abb4dfad9e446e77396de9e93003af5be7aa18da
+
+[Bernd: dropped ChangeLog from patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ChangeLog                     | 1 +
+ libvips/include/vips/memory.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libvips/include/vips/memory.h b/libvips/include/vips/memory.h
+index 93e669340b..7073d1ea6a 100644
+--- a/libvips/include/vips/memory.h
++++ b/libvips/include/vips/memory.h
+@@ -41,7 +41,7 @@ extern "C" {
+ 	G_STMT_START \
+ 	{ \
+ 		if (S) { \
+-			(void) F((S)); \
++			(void) (F((S))); \
+ 			(S) = 0; \
+ 		} \
+ 	} \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
