Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB1C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEF681DF3;
	Sun, 24 Mar 2024 21:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1TYbKUEFY2P; Sun, 24 Mar 2024 21:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D3F81DF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D3F81DF0;
	Sun, 24 Mar 2024 21:25:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1074B1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A3BF4010B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnqsYo_dvIth for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65BE2400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BE2400FC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65BE2400FC
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41485fe355bso4399545e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315495; x=1711920295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRIAvR6I/Q5LAShkMYCrNeb/A3Hez/pnsZmA2PGYkss=;
 b=jmAI2Mm59ugQ9E3aP6yQ/geciOyk5xOnFfoh8OmVU8QaP0xTEWkKYP/X9h6fvscQC9
 Q/Aed+no/CFdUsApLP9snwowpZQ7f8moLJfA000rv+lUm0KO2dshZCCh7vHemu6UYjVm
 Fy47qbC/1v+BCl/450oOkYQpX67tfnDSDWRCq8c548yTQTm0dzbejWqiMLqaEiJxuvnD
 sZ1Z175HIwLO/fhGQjolXkAKt9sXhXhvxdRC1s8nNdw28vlbiCn8bXXhyDD0MpFG854U
 1F1wA+axUw2zSdjEtjHqh4FkMmExksoQWyipnlOOVZ7mDZu07GoXt4oD7sXby5e7dmMk
 wm7w==
X-Gm-Message-State: AOJu0YwN7Eenj/yhw3g7nbIs4d5miPqVNmGmUp1BTvAo/pBIMGIyVqOF
 wIMLjVlnzYRuO7VZdOl1xFdpn3H3zQNUog31Nevl4AQqoUWT9+k6wNZgFlV8
X-Google-Smtp-Source: AGHT+IGDIXs8ta4fddHgXoxN6hSnwvy7oLxr29gWcjeNKexqtZzzg9icrgy1+GRVfQs9XsexEx7++g==
X-Received: by 2002:a05:600c:4587:b0:414:85f:1f72 with SMTP id
 r7-20020a05600c458700b00414085f1f72mr3046974wmo.6.1711315494921; 
 Sun, 24 Mar 2024 14:24:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0041409cabb39sm6159013wmb.18.2024.03.24.14.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 22:24:51 +0100
Message-ID: <20240324212451.750780-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711315495; x=1711920295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LRIAvR6I/Q5LAShkMYCrNeb/A3Hez/pnsZmA2PGYkss=;
 b=VdVAnbDOeuf1K5L+6KqO5IagLJkRFCeaga+qGF+6h8B8+KqVe4F4OwHjLP/GdJL8WK
 aujhk0QvSN0Phf8YmKGmCFOv4aSvJ4KIdk05oNphktEK0xI9vACheTRQ58ZypZRdKOSw
 4FVxpQGBBa9f2HFHATE0brHDsnThKDRl2MPvw5sSz+T145SszY/C4lMP+4quFyJ+Jog1
 fP6N+8ITB/CVmEdJGHKS3XSQTCwl1wc964vqBp/9aQBvSf/wDR2KfzwThNW4ocbO5ryx
 mvDFQRPzMK7LHIvCfwpNQyKfekwWiviTjCDiEBTVgwTq+niFzM97qN808KevMNDzzgDo
 R6wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VdVAnbDO
Subject: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 5.7.0
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

- Update hash of COPYING (year updated with
  https://github.com/dbry/WavPack/commit/b28fdab79dd8af2b8281d77097cf8f25e580e525)
- threads is an optional dependency since
  https://github.com/dbry/WavPack/commit/9ef0d37deb4f3f6def663079b18d3beea9cc10d2
- openssl dropped with
  https://github.com/dbry/WavPack/commit/c5b545146de8dd296f905183908cdcda682ed88b

https://github.com/dbry/WavPack/releases/tag/5.7.0
https://github.com/dbry/WavPack/blob/5.7.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavpack/wavpack.hash | 4 ++--
 package/wavpack/wavpack.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 2a2317a86c..e938386b76 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  af8035f457509c3d338b895875228a9b81de276c88c79bb2d3e31d9b605da9a9  wavpack-5.6.0.tar.xz
-sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
+sha256  e81510fd9ec5f309f58d5de83e9af6c95e267a13753d7e0bbfe7b91273a88bee  wavpack-5.7.0.tar.xz
+sha256  35a87c7390cd00e51e7a7cbb0486df7897201347e4625779248ace48e7e6cfbc  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index b393a75197..25fe448c5f 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.6.0
+WAVPACK_VERSION = 5.7.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
@@ -18,11 +18,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-WAVPACK_DEPENDENCIES += openssl
-WAVPACK_CONF_OPTS += --enable-libcrypto
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+WAVPACK_CONF_OPTS += --enable-threads
 else
-WAVPACK_CONF_OPTS += --disable-libcrypto
+WAVPACK_CONF_OPTS += --disable-threads
 endif
 
 # WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
