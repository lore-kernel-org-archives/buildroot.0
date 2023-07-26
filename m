Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B2C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67B5D40BC2;
	Wed, 26 Jul 2023 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67B5D40BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3e_W901Ao_g; Wed, 26 Jul 2023 21:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 870F940C4E;
	Wed, 26 Jul 2023 21:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870F940C4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C00E31BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3AF40BD9
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3AF40BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pk6TbOF7pBfi for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:19:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A164A40BCB
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A164A40BCB
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3B61A4C0ABE;
 Wed, 26 Jul 2023 23:19:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47896)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOluY-0000Fz-1F;
 Wed, 26 Jul 2023 23:19:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:19:09 +0200
Message-Id: <20230726211910.2206515-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726211910.2206515-1-bernd@kuhls.net>
References: <20230726211910.2206515-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690406350;
 bh=sCQZlvC4dgabmr4WM4m+fqYongTfJmQQIerms7O8C/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XeJIv89v1Fs3FPLxOmvkYcYpTpuBRUZjdPdYI2UqaHBtu03OCaiFWEDYsnOVlqJTj
 owd+zqh0cvWEB9rFpkaAs1FxkLkeqU9c+fcWecE9tOk98y7c36n7hvhEl52YaOig2D
 uuNjbWjI/S5eCyzSSiIQVSicfG0OdN0uNd+DCsuxbSy4jQsb3n25qrGMyCn7FOykJc
 wQRHYS1UnoDbXhDHXMm+0Ic/ubmqPMNLJhylTTXUeIbjWgIce+UIGq3VDOa8t/VZkD
 LsNu5//mZbVvM3v88A2FeZjY+1YiMbu9AHW65s1RqkQh9t0lQyNZ4BXOnP1wtTXmze
 SE5CdiBvzXi0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XeJIv89v
Subject: [Buildroot] [PATCH v2 2/3] package/redis-plus-plus: disable shared
 library build with BR2_STATIC_LIBS=y
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/6d3/6d310d52dbfe076cd470be71f02de32fb47fa904/
in combination with the bump of hiredis to 1.2.0 which contains
improvements for static builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed typo in subject

 package/redis-plus-plus/redis-plus-plus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index ea0e182748..4d1eb9361b 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -12,6 +12,7 @@ REDIS_PLUS_PLUS_INSTALL_STAGING = YES
 REDIS_PLUS_PLUS_DEPENDENCIES = hiredis
 
 REDIS_PLUS_PLUS_CONF_OPTS = \
+	-DREDIS_PLUS_PLUS_BUILD_SHARED=$(if $(BR2_STATIC_LIBS),OFF,ON) \
 	-DREDIS_PLUS_PLUS_BUILD_TEST=OFF
 
 # since version 1.3.0, by default, redis-plus-plus is built with the
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
