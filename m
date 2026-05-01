Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407D6CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA77642610;
	Fri,  1 May 2026 15:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBLogu7-092p; Fri,  1 May 2026 15:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A8C42609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649285;
	bh=h+HGKbXwcDcusY/03Ylw+SPzlsUPA7CGB0BeDiOb3Hc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gya4EaowLYV9sOfmEe5PCcuEwcq/HRquqH9+TAQRFLlGW4vCh+PjCjG/wlRWYeI8K
	 DdMEWd0kCWEut/qqJ1tR5F+V2pVlgHaEuDRrFf6nmQM7k2b6l70OqPUuhs5SrFGOeu
	 14cAROp4Itl5m2curdNrRTeFMKve8wlwMuebT5wkyXHXpewlcQ0+7/IQgX80YnLAVQ
	 7pwwaUS+lDSzjMeqsiOOz1+srAx8I6dfILgz+YkXbeQsLfSPqZElsD7mGBIwb/UhZZ
	 LdnIXRT1cCy9M0iVf/BxjHrcAxkI1vh5LfpRbsoosj25W5DrIAzzsbyGb1dZO21SyO
	 uJy3plGaVqvyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A8C42609;
	Fri,  1 May 2026 15:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 403AC127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D1D42609
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0voXo4xdWmOj for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A104442604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A104442604
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A104442604
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:28:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF0B6A4C013E;
 Fri,  1 May 2026 17:27:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpmY-00000000172-45mh;
 Fri, 01 May 2026 15:27:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:39 +0200
Message-ID: <20260501152758.2610763-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649279;
 bh=fWNeG1+9NnmAvCKCw4Owt7bzJpYtu/S6a5aes8TQYKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nVooKdIpWyv2AMd+xUGYPbT8FadDY9Fz+p3SljGIjibBg4oiUJRdpfeMOFgY8yKMZ
 8x8cRJbmK7z4vg8V4OzIb58U/0ORL8rkeXXeLJeDXEF/Uh1ww3KMbW8crcskX299yC
 aZAYNQhI/l54WE/kcp1cGJ2VQAfKZh+gmjkAfOxexSxtFz6ue0y51+Kr/E2pU4prPZ
 w+2F5mPpbWZ6ATQcqQYBTyzvAC0hN/m9eStN3AP/tIzKLHLYivERpiyKrfnFGTL4Sa
 VdPrKQbc1EeFKVELSaIlqAvyWDdJrvBEJfUFbGEL09fuM7E7bHT89+tjby2n79ptuw
 sXMxLvFzXMooQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nVooKdIp
Subject: [Buildroot] [PATCH v4 03/21] package/redis-plus-plus: disable
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
