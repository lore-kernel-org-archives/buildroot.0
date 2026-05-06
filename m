Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A7DCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A8FC8130B;
	Wed,  6 May 2026 16:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bd8wR_ks9jMk; Wed,  6 May 2026 16:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36DF8811F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085180;
	bh=h+HGKbXwcDcusY/03Ylw+SPzlsUPA7CGB0BeDiOb3Hc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VvOk3ydDUYhuY4i8BoSmLAhb8ArUKE3Qt9B2Sm1nou8j3UaRemGgWeQ5pzisKmk2B
	 cM48uCTTlgh/TOqN3hGFmogJMQujosK5tq7VtPOXtaj2zzM18AZOS/vfmKpDQ/FaMV
	 7qPRUjupb9h8D2Ok6pCFOwpGpfQn2oXL3bcdGmca8BSKC1VEa/p2nx9Y8VLzdLfnlt
	 iw/pZyMgH6gJ4/bEJmJSHmktBypT705XIuWvHbMhd9kS+ENaUdQpQv6gPCTfQajF/7
	 6tXcWHWsuO1f9xAYwZY1Tl23CM3S9zys6MjpztzX3pROxXRJben19XMmJvtt4CuZkG
	 GACWTXSsfnooQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36DF8811F6;
	Wed,  6 May 2026 16:33:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78E0F11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A40240F09
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNDxmKGg8HDz for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5449040EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5449040EFA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5449040EFA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CFA7A4C2092;
 Wed,  6 May 2026 18:31:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9u-000000002XI-1XBR;
 Wed, 06 May 2026 16:31:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:16 +0200
Message-ID: <20260506163136.1330722-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085114;
 bh=fWNeG1+9NnmAvCKCw4Owt7bzJpYtu/S6a5aes8TQYKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k5PnILVqcJ1fiPoAI9++i82HutYVpafUwIiaKvwQSXl6NQYi7np71okwidLeCASD2
 FQKeeNckd/0T0wGz9b8Hk3tSxabfbEb+KVUdRwtV5PCxnkM+S8CU33cXcKT5r2xFWR
 satyepQBoWi2NMuewjrfTF7yUfTKx4sQCMXd0ANFfXKl7Xkk7BIBOv5RZOadCXYhHd
 lnAHhbpaEou2SSkkRC48Q2OkYpg1CUDEKNb79khhHnXujhwKi34fbC3sZtcLmHVniN
 +fOZ2h7SmwBdztydYumkEaYizHze3EWlKjQuRBcbCkLd6q+4s6bkI6NbegD+7FmS6+
 bcc9k/3enU04w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=k5PnILVq
Subject: [Buildroot] [PATCH v5 03/22] package/redis-plus-plus: disable
 -Werror
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with gcc 16.x:

output/build/redis-plus-plus-1.3.15/src/sw/redis++/reply.h:
 In constructor 'sw::redis::ParseError::ParseError(const std::string&,
 const redisReply&)':
output/build/redis-plus-plus-1.3.15/src/sw/redis++/reply.h:54:60: error:
 '<unknown>' may be used uninitialized [-Werror=maybe-uninitialized]
   54 | const redisReply &reply) : ProtoError(_err_info(expect_type, reply)) {}
      |                                       ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/redis-plus-plus/redis-plus-plus.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 0ee9f091fb..acd3a81f3d 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -11,6 +11,11 @@ REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
 REDIS_PLUS_PLUS_INSTALL_STAGING = YES
 REDIS_PLUS_PLUS_DEPENDENCIES = hiredis
 
+define REDIS_PLUS_PLUS_NO_WERROR
+	$(SED) 's/"-Werror"//' $(@D)/CMakeLists.txt
+endef
+REDIS_PLUS_PLUS_POST_PATCH_HOOKS += REDIS_PLUS_PLUS_NO_WERROR
+
 REDIS_PLUS_PLUS_CONF_OPTS = \
 	-DREDIS_PLUS_PLUS_BUILD_SHARED=$(if $(BR2_STATIC_LIBS),OFF,ON) \
 	-DREDIS_PLUS_PLUS_BUILD_TEST=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
