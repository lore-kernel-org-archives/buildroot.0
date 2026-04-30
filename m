Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2557CCD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0379C41C73;
	Thu, 30 Apr 2026 19:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id od0D4LDoJFVj; Thu, 30 Apr 2026 19:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C3141C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576037;
	bh=h+HGKbXwcDcusY/03Ylw+SPzlsUPA7CGB0BeDiOb3Hc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gGLGNgjBbJrmTMQpT1RV9nqpvWa7Xz65hwTLoelMpshP7lceW8jpe0wgogRcspsUJ
	 KcDmhQ/8JqmJJCBiVhERDh8vZjLaFXh56DqQyGRoiDVyoNAQx8v40FiypzBaShVJoO
	 D2x2ChjdzJaYIaM2JdGcQjX83qxs/SqGtJCg52alJLQz81053Ebn1nNqP0ziAZVHEH
	 Cqqr46mam9iZqi7tQtMYeBQ3OclqEuxHLj5g5kv+TsBftg9B8GCYuLeIzV5iUhOa1/
	 q3CvdaKm9J1Qf1uJYu0C37nNj43LMuyXY4UM+cSUmtBYjs/fKGuHjZn/ujuK0gt7MU
	 6o+kwsWvHyRCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C3141C81;
	Thu, 30 Apr 2026 19:07:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A12BF18E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8753B40024
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnrK93r6rj-5 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E1BE40757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E1BE40757
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E1BE40757
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDD3AA4C2D47;
 Thu, 30 Apr 2026 21:06:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWil-000000000Pg-3mJW;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:36 +0200
Message-ID: <20260430190647.3212159-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576007;
 bh=fWNeG1+9NnmAvCKCw4Owt7bzJpYtu/S6a5aes8TQYKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tZHO//YaEEjzsTiWOwqVMwRdXGt1B/5Mp7FxMRyvQ2Si4ULMz3z3++7uU0OAhuO3K
 7XrJ4Tf1wqC5SChV8JED43stj/EQ5iuQvNehGe+xCYGHD9X9UZek3g34kYjpsBJBNf
 EiYWPePKgxkzGDsYCedzSaZoau2R7hVxcJNwQufaYJzfnxM6h6qsivGtzBPfVWGMNb
 UlgwWbZnpGvDUMc6jYAghi5z3YDA6BJo/OHMbAd0zO+QU7nncpCdfbUHCHV2VkjmHJ
 2DXzPdHctYanLxwHFG69BlhUKhBttfhCbHTl60oqiVz95PhGzL6HQLCYxmaXbNIJjr
 YcaOaS0e4bfpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tZHO//Ya
Subject: [Buildroot] [PATCH v2 03/14] package/redis-plus-plus: disable
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
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
