Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5171DF47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A37C811E0;
	Thu,  5 Mar 2026 21:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05ZffRPWXrd1; Thu,  5 Mar 2026 21:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7965381197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745116;
	bh=u8s13NmCf5H0ay2wn4X2hCzl2QQOWTTiBW3WN1gCndI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oSRkuGdbr9EVJEXtxXA/lzEnzXWRIDxH5Wl1K9nKsMCzGsbf8nrWGfrScTLLNtbNK
	 3XqrWjVfEGsDuaZJXdad+u9gtREAbheL/CEcZ7ofcyjeda06RX/PRRVcrSt0RPffAa
	 2LGM/L2mgBcKVVA4Shmd9EgiFdK468Z5Ykrb2Nc8RfQWz40Zz6iA7gGUBChdFHqsMH
	 YmInGi+skNhv4acOwkmoUnKUpO63RY7vx6adeEzY3KTm8n2G3uwB55REZ0rchIM8eK
	 qgVVKO1XlAYHWoX7qFSYTiOKA9y5eJ/XquUxzL6A2aY/SkRZS/7GglAysWH4NTevfc
	 YqGkZAQdMB5Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7965381197;
	Thu,  5 Mar 2026 21:11:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95029223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B29640929
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26wvgbA0ymyk for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B3D3408F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3D3408F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B3D3408F7
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA7CAA4C373C;
 Thu,  5 Mar 2026 22:09:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-0uSf;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:45 +0100
Message-ID: <20260305210950.3471974-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744997;
 bh=wgh3Iohfhnk0985DAKSpXH6rUlUDR0uCEEmAJeB6T5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VtMlote/CSMo2cWuYsfNe4uvYRWf+k85spWvnekE6ms8gonrfKeoaUPzwhS27XTcV
 u0lvd8FE0k/KsJmXJ12HVoXoQWGbLvtiNTyPc0xOfhon6gIEeds9F+9hFCNvjfTdSi
 6iUVa0wCIGxvVFgwddIZ9hv9VObE+9IXe3vbhHryAcrmae+0xxurLMRmENRGznqDeI
 dDxWP7lTRWtTdXFu3ur8QSW3pAXdq/Gl/wPQ6XlbYTwp5CtpQXzjgTa6gMpU0sLoXN
 jJ83lM8GYEjfzFlFsX0QuKVhRXEtpveJ+ywYD20OabjstFikZef3Jboyv+n2H5VnXo
 0VTJ/JoBL4lcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VtMlote/
Subject: [Buildroot] [PATCH v2 10/14] package/libvips: fix build with glibc
 2.43
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
