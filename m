Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63160D5B876
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F08181293;
	Mon, 15 Dec 2025 22:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZDvThODczG2; Mon, 15 Dec 2025 22:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D807812D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839531;
	bh=TMQZuB/0aroziyIsqmmx5I49jyPG8NiDI/aAPXtf9Jg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Dh3E7t04O0LgLuoX7vaHVj8gjNCStfKI4w2iKMQv0YGI5Qv4y5EWiNQmp4b9/ynnQ
	 1JwZGKlA9pKfAmkv7lHJXuSARhd1IErcCFWmg3Q2p+v7BJcnZnpXZxn9fwZlpFsd5i
	 8fz5aLwiDsxjsU3kdh0vtxiWQ7vkb2NIUwOU30G7KPyhGGsgPmJn2uadZ9+nEQBIfN
	 WGV4bMzFErHqqoWn7hJ8O4r9Huce4R79Y8UB6Kjt3M90ZCh3IZrUqn2QZMvtIv0CTR
	 4/ZlLgEHLqMavZDULwNC86KYEDZe0g1JLoyHdqVFtsESKSwvlW9zqBN//5/Sc6kE6N
	 PeDDIS0f5h2Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D807812D3;
	Mon, 15 Dec 2025 22:58:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D843151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24013812D3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_gUjV0iB0xm for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 429FE81293
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429FE81293
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 429FE81293
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 32CB8C19D27;
 Mon, 15 Dec 2025 22:58:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8092360664;
 Mon, 15 Dec 2025 22:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0DC41194245C; Mon, 15 Dec 2025 23:58:38 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 15 Dec 2025 23:58:35 +0100
Message-ID: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839521; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zLtef6JlmUMOV1F7RdFda3Y6KCJSPDlAY/zu4MrW3Ek=;
 b=t3+WQH9ks8vGhqtchqex9HVKMNOW/Ct3r2c6W3qB2NLuaW1ZdrplJeMnCab/W2c51eV5pj
 OyMXGEVr09ZJu98CgTYF8skLnpBhmOgyDa9uKR3d38cnlhena2LgSuZHCEiWEzgU3R2Lrt
 tRsOibEUPvKRNuIxcd36lM2JDEJDVoWfWv1iCHsqb5fV/AZ/tDutqSrq25HGsCyM3ZkMZc
 aOX+JlMMHOjrYBZuJ2IzpWWd7vNUlU8ZyG6CVKzH2xtMrqo7cBXboITsl3xSgqoqpT3z0+
 uP+TDE3WFaS1fgZLhCA7v8AdaFlDhl+GmQO1g2stKkjuc5IRs9BCFqUCQ3bNbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=t3+WQH9k
Subject: [Buildroot] [PATCH 1/2] package/cage: properly propagate wlroots
 dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/cage.

Fixes:

  https://autobuild.buildroot.net/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605/

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cage/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 4f823c768c..95c68732ed 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,7 @@
-comment "cage needs udev, EGL and OpenGL ES support"
+comment "cage needs udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "cage needs a toolchain w/ threads, dynamic library"
@@ -13,6 +14,7 @@ config BR2_PACKAGE_CAGE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	select BR2_PACKAGE_WLROOTS
 	help
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
