Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65648C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 15:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF2060A9D;
	Wed,  1 May 2024 15:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVzdK0QKs3h9; Wed,  1 May 2024 15:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8E860BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8E860BCA;
	Wed,  1 May 2024 15:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86A651BF297
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E5260A9D
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBaZhC_l0ut8 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 15:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58F5160BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F5160BDF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58F5160BDF
 for <buildroot@buildroot.org>; Wed,  1 May 2024 15:05:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34db6a299b2so806229f8f.3
 for <buildroot@buildroot.org>; Wed, 01 May 2024 08:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714575910; x=1715180710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Ko+HP0VxsJtqpDwxi0N1LymhE2nPegZd2UW0NBn74g=;
 b=B1zgqH66v3GmXJ0+gmh9dcXK+FrFeIcgtvsmb128jAO57ojvEK838O5DlPTwhylVSX
 /qkOZ/bynGyFGl9VRF3NpM8sWcJfx+uFl+AuZE7n920HvXNLBoqPxSx0ENovX7SPRmpU
 ohEcniNnUZPiOgUs7pTVWehea/SR6Q+n0m4qH75Wcecd9NCwyTqb6a9xw6FyWkchjjbt
 c7/n7eLlnYkx+Rt2RNQgYNGy30jKHemPOB91LA7FdTyHVNDRAafK5X5Q0FIfNNC1GrsQ
 E4MJglgZtTd7xgDvbJXm+bc0uZenSyZ1xVhaJnkzSY2PDTOS04I9cQGymEO4vH/QXDZ6
 lr5A==
X-Gm-Message-State: AOJu0YxREBC5Iar45mn7JItCCyuLg8DZ4jpd4jK/HJJhRV1Q8ww/ZvMF
 yxNDyGU7ZMEy9i3Br2kqSknR0A4IfabcKAtMQlVcPZfklAvP1HwKbREN8w==
X-Google-Smtp-Source: AGHT+IEWkjyteXHdXII66z3QJlKhOYrXKONNBZ/6GRo7Ga/Z4wONJy2HVh/OLBozctTn+2WE0rUGcQ==
X-Received: by 2002:a05:6000:ace:b0:349:c40c:393 with SMTP id
 di14-20020a0560000ace00b00349c40c0393mr1775585wrb.3.1714575909774; 
 Wed, 01 May 2024 08:05:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 y18-20020adff152000000b0034d7a555047sm4315354wro.96.2024.05.01.08.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:05:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 17:05:07 +0200
Message-ID: <20240501150507.284189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714575910; x=1715180710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ko+HP0VxsJtqpDwxi0N1LymhE2nPegZd2UW0NBn74g=;
 b=bDmeYCj8jjq2aRwwIGyqoTzL4dPQYQZ+pEA2MUZhknrY7JOJTvhhZArrSTGKx+KHNA
 167PkEUSme6rqaNVVrIZGaaQvynTYkniezxk6zdpuHS4y8Zm09lUwaiB8zCiOkP12i7a
 s9nV7DY/IKfN3IO9FY+5dfXr+FYg21r08eEZOC8wIDWGT8b0UCvmrwACco6Jxlo8rnz8
 I/YPdYxqNiYCPuG3nFY8VQT/2UFftMVVloPM4dUhJjLdDwaqB0i7ZY09HAwoapZPxF5r
 whsMR7EnYWLCZaKnAGqe2AFRj5Djwe3L6L2uqBOmeNLiKVX6CZ/EW6/VN+t48ULxTeFc
 buYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bDmeYCj8
Subject: [Buildroot] [PATCH 1/1] package/libjwt: add CPE variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:bencollins:jwt_c_library is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/6335E595-6F38-4837-83BB-C78B687BB75B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjwt/libjwt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 1643aa7b7a..8929904d10 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -11,6 +11,8 @@ LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
+LIBJWT_CPE_ID_VENDOR = bencollins
+LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 LIBJWT_CONF_OPTS = --without-examples
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
