Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C371C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A114940609;
	Wed, 26 Jul 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A114940609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUEhQDlGZ-g8; Wed, 26 Jul 2023 21:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E578240A59;
	Wed, 26 Jul 2023 21:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E578240A59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D57A61BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC3C81FE4
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC3C81FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YTlOeP6TBBr for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:15:22 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01FAD81FE2
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FAD81FE2
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4A89A4C0ABE;
 Wed, 26 Jul 2023 23:15:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39774)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOlqo-000828-29;
 Wed, 26 Jul 2023 23:15:18 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:15:17 +0200
Message-Id: <20230726211518.2205469-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726211518.2205469-1-bernd@kuhls.net>
References: <20230726211518.2205469-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690406118;
 bh=DW5kqSD/AHFe2eJBAeFfAZBxmzBFQMIlxvckSx08kZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hDliOGXUk/JVXX+1wnN4tp6pcpxP/ZENB/NPkMdDo6owsIDAPgEw7U7oO9LyMi0GZ
 ZQhMDho7l4PfEe8F4rwJcHwgqLiHDKgkKf4QV2xjni9oiqaH9ak0gQvjXDe2AHJEjx
 to97fsPMYltKNjG0EbIDZC0stZIT/J1Fem0iv2YXVKldURK89/zg6cCKSIJVB49qIY
 rTPtxem/f2+5nqVA3hZJhYY9Ifv2JP6kGifsiwLDIsH+4uw++qZH2JA7Fou/39Tdqc
 R6sO04TlbuBaaO3gTDbIxUz/siqkCzsWs3z7OYCBTHEIvv9DDf+ReLbMuzSLlCdirp
 ye7NBTSJ2lneA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hDliOGXU
Subject: [Buildroot] [PATCH 2/3] package/redis-plus-plus: disable static
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>
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
