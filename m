Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E9FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB8C854C5;
	Fri,  1 May 2026 06:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7wxgJfY5Gcj; Fri,  1 May 2026 06:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65BC854B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616685;
	bh=h+HGKbXwcDcusY/03Ylw+SPzlsUPA7CGB0BeDiOb3Hc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S8alzIdBbW9z6NDTq0cwKnUSfXQ/k/YQcFGu4ivnpwSTKYGcj4QpplpwoZ9xbg7go
	 eHGX+G8B3oRLaeCee/JSJpa23BvAoEyfRudCGLd16egoF8wEdFnjXYpqv0u1MGCJpx
	 Ke6FGTFqM0GJJ1Y9+S3Rad5YqubHO9sGylvzEO6kYd266eJJhyBehIoCdof6eKuMv8
	 YMWDgGsc7/pZ4bHZzGd2qwMZv/W8NL0dpVLjPmZyA2O51ZfNUGAfuefKgSPUfa969z
	 bIfOqJwsvV0SSDhqoXqjqYI+9l8r+Q7UTt2IvoOTPYc/fpR+j0HE/pUjC3k2tz/owH
	 qszjHKDz30Wiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65BC854B6;
	Fri,  1 May 2026 06:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F86204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BC91854B6
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0MIozp0pGAR for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74B1F854AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B1F854AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74B1F854AF
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48501A4C2AC0;
 Fri,  1 May 2026 08:23:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHQ-000000007tD-3cnQ;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:22:56 +0200
Message-ID: <20260501062316.1942112-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616607;
 bh=fWNeG1+9NnmAvCKCw4Owt7bzJpYtu/S6a5aes8TQYKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DKKwg1ht8bbd3i4SvK2DLXcCutkstFVrI5iBAissG1VFTBLdO+tdLV3p+UeLPnPND
 AETziiCrj0HMu2zGvgTopHw3BlB3lER5AFVBRDd4mDU+GXBavQ3U1QK6ZKLwnzuNTW
 Z9LEgVzRDdpUwXAD9acB1yeo/Rls3CR0jxM6a9cVdkMS9EisEhfEIQeJG9Eo163QHf
 2NALe8FABq8fUpqc+v4xA4i2S2bqOdeTPdMUHg4bRwN2BpwwkZ7TjUChNJUgp8bMSQ
 /QvEzqPgm+tVAULo77gxDqIzdYz3L+zxeo+3IhG/wlmhvioKfSFaXme1Q1lTHjN35f
 3HDqkL6kRvt1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DKKwg1ht
Subject: [Buildroot] [PATCH v3 03/21] package/redis-plus-plus: disable
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
