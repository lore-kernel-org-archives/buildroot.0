Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24849C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64AF640540;
	Sun,  9 Aug 2026 10:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnzYDloTCu7y; Sun,  9 Aug 2026 10:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1098140208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786271480;
	bh=AfLrjiifhBzb1T+w3WKv8i1UkDaagKp/uZQJWjPRL6s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hkdlmhgTw74J/1NsZkY20+Im+AdtVhk2q/B7D/XFYw9lVqpPYNc22EyoCGupa7XnE
	 H9Yk7eOT2mVIv6SX2E/izJlWeB3HfJ6b6vF60H07hjIf9lIQ6SzjEbBJnubD8tSeNp
	 03pVJ0mA7WFqcinswK6cOdMuTGmGLY/QJaqXg3TmTIvKqcQaCWXj1RoPFMPZy3+6oA
	 V7PBByM+LDIaUg9N+3ZqAereztNQHhh4uUmG+hgbVSNtfeZKIVVJiRsVPbYJZ1W3S3
	 NJLimq7eaEmj1dj/SBm92L0hC+KrMtt8foWPlcz7rZ0ggNbOzjZwW8RzqxdokEDM80
	 MRZNuNIShBLjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1098140208;
	Sun,  9 Aug 2026 10:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9EE28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50CF60602
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8HuOP9u2Pkq for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E94B6605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94B6605D8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E94B6605D8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:31:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 78F0B4E41176;
 Sun,  9 Aug 2026 10:31:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46D1A6033B;
 Sun,  9 Aug 2026 10:31:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47D6E11C489DC; 
 Sun,  9 Aug 2026 12:31:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Sun,  9 Aug 2026 12:31:00 +0200
Message-ID: <20260809103101.311957-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786271468; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=0MQph4KbSruFdUh8LGJrUi2sgf6UIpcUfonpMqBSI9w=;
 b=WP7NJWSQYqDkwfV/f/jgBLn5nl8kP6Rb0BeyG0KjB65ajKvvJVJ4pcBzwzSipo0+latjfb
 wk3sLTuo6P5TjpfWYKNZokllHRdIt2TtTg6+LtdGL4+adulg1oXhOI0PTkwu+DBHvT0SN4
 Yvj94NuMnKt+TmbX4rk0rJgrvdqG8Ndx83ULlCq2bDH4uCXuATGqyHLfRPreeVbH6z9vV2
 nbxzrUzjnOy9Uzyffo9upg+YOko2GAbNvSQxikd/A8XtCDGlqWYNuGppO7LlLkgGbsvO+M
 6kkBmqXMuJXlHoGW0y6dQQ0evNusYejJwaBLwy1AbSGws6ehQGEdPCqX2LmCfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WP7NJWSQ
Subject: [Buildroot] [PATCH] package/libxmlsec1: fix Config.in comment
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

Commit fef9cad1fe84b4366e705adb03470e12199ffd25 ("package/libxmlsec1:
bump version to 1.3.12") has introduced a gcc 7.x and atomic
dependency, but the Config.in comment dependencies are not correct:

+comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
+       depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_ATOMIC

Indeed, we treat BR2_TOOLCHAIN_HAS_ATOMIC like an architecture
dependency in Buildroot, so it should be:

+comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

so that the comment does NOT show up when BR2_TOOLCHAIN_HAS_ATOMIC is
false.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlsec1/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
index 782e6ced7c..9270447510 100644
--- a/package/libxmlsec1/Config.in
+++ b/package/libxmlsec1/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_LIBXMLSEC1
 	  https://github.com/lsh123/xmlsec
 
 comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
-	depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
