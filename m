Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D518AC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3989360A7C;
	Fri, 14 Aug 2026 19:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egtIhlH4nHJs; Fri, 14 Aug 2026 19:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C3D608AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786734087;
	bh=udBjnCfV+IFY+0q6CxVchdzW8FRWHzLIgWAFxSkf5IQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ewFXS9ZrwKc7+xpCwHggs0tnRFVUAHFSynFNRkbvK2B/SjUy2oL+t0gtt7sm73VG5
	 BKV7vz/E6dVkEu+am2DuLMt/fqZzdVF2vGmxNX2R/tAgyzecUKTMwsxCJQHyruEfZZ
	 ps3KRNYtQrq3fVC/ZiTMwSMwOepRjwpE6ISAskZiCcKuQYkhzWA72OdQOEs0KWZIST
	 EHQaIXzLD07h3ZMLXkHwbQGim4NBMND8+kUHnSkiBKQ2XJbxL6FSRUHF7lyOQ0+UFI
	 zRi0PYJg8UD2kSOZQIzGRqFsoJtfW/76Shrcd6+QcJPS7s+QXjfzt41WGkfto+BTMF
	 8iuCmRGoz7ofg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C3D608AE;
	Fri, 14 Aug 2026 19:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 146DD3A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F208660823
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-YEHiR5hVAi for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE402606FD
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE402606FD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VibD4/UL
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE402606FD
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:01:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so1177531f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786734083; x=1787338883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Iy1sgnWfijIG4MjhhPiHAItL6XANVzYZG2fwTb8W42Y=;
 b=VibD4/UL+3J+yWg3jqM/UZRqvQyfcfMVXtwlyrtc5io3VEfl/u1wclIl4wsmq3LIN0
 8Xw50P+AyZzfMOQFxlxXu8o4frV72KvcgPk9p+Ra1i0WlbXonu1Cw+vpaiFELwFkZRig
 zhLzzl50vRkraGVlao2sn0X9K6PRJF6lP44YN+i6LeUjXt+htW15VrFyC0wbVbo23V7/
 idCmaqsHGaqiaiotPjhGI2vWuc0YpXcWHBVNVcJtuWDVLuCHve2AmOU/UO0v2QzqMxQv
 UaxN5gSQSsi89MEz/nCppsisC/5b4QeFBl5r4UdxkoiVPmeGsmoFuof4F7ePLgE6O4yJ
 ZQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786734083; x=1787338883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Iy1sgnWfijIG4MjhhPiHAItL6XANVzYZG2fwTb8W42Y=;
 b=dcc1M5ldRwEYSjF1LSLU8y0ZCia6Ptqdf4Q4eNiTDW+4AwUkIEX79F47ceNVQ2JvIV
 GrtfARID8xBBEMupxdDa73hU746BjuqOHRi3IhM8olU1FYkrEYxgK2nLdftculWXiCHr
 +xNeK/0YVg3nDASmIfpNSZieYey4fcLBrkPmo87i0nWjg7OOI7SkJl4Hoc8qyhxeuEEz
 kbnstVac94LUYFgd369oISWomnGzhnuXmjAXTdBIGFjxm7+d2e7u9NaHx+H6zAUV7Kae
 WubDVousdRejhfumODNoADWzK4eIBj5NrqYTu/tY8vAjt41jLRcdBfhHrUDo3Rz3qclP
 D0NA==
X-Gm-Message-State: AOJu0YylkggMxdiSiQuhd7z8wm1y/emL747cRGB3h1Wo0PcJMI+7cFKH
 VH7dci9W5VK2KLySUIY5wuN1/5fHvvxGz3uew45d/YuAC9we8u+340DB/5RoIw==
X-Gm-Gg: AR+sD136HpBVqmDBYG01g+xi0QrAJkqixoyrdEPs4qoWuTtKGGbR9Q7rIxXopa3drVS
 6IQmh62r8onsBUAMIWPeW/WnlkYl7Zw3dnzxje4TltbPNrcSYfrWcYcqiYd7BUiCMG5sUrePFBW
 B8eXw3z1Rd5ppd+feDOKuJun8X9mAuX/GqSZEjMwPsSiyGcFGLu/gGIcYagUH7WBeg1q9OlaBs9
 9C0MpoZDciem38sO32ADbnPA/Tg9Pa8CvmWUPYz6g3aioRAlj+rfItbz+j4jTPYiU3GhsQzh0/F
 6wtIVTv2I7yfFhoo4t56UIQpIH83Kvll/JsfzS1H7RdMhCSqZe68D7Gi00ABa0hmYmOHPhr+sQk
 eoWMWuE4K/g4ybF/r7KcVlUOe+Pg/jULMxU2neVvG1MXNKJ+3kvkD0Pnx0U+bRlyO2HzrZmRaFQ
 VMHvpki6NJ2hgZeGjuiTkXwVqPgjHwJABOnrbhHrReDzBgQeUPGTQ2mHjVO94bepqn8mgRxuz5f
 0stH22Y7QVUD6BhPFhZizpXsWToNIXUnpMzbvUSJuiHLtC4+yfYGgYnNjVvwtV+LJXWk5z8gmhW
 BZhCR33mZ1lQyCcxAzqomYyxOfg=
X-Received: by 2002:a05:6000:2089:b0:47f:8b24:ef01 with SMTP id
 ffacd0b85a97d-4816070be29mr12157597f8f.1.1786734082585; 
 Fri, 14 Aug 2026 12:01:22 -0700 (PDT)
Received: from trial.home (aki181.neoplus.adsl.tpnet.pl. [83.26.12.181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a31dsm10913156f8f.9.2026.08.14.12.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 12:01:21 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Fri, 14 Aug 2026 21:00:52 +0200
Message-ID: <20260814190051.2970501-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.45
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/memcached/memcached/wiki/ReleaseNotes1644
> Hot on the heels of the last security release is...
> another security release

https://github.com/memcached/memcached/wiki/ReleaseNotes1645
> So this is a lot of crash and security bugs.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
I'm wondering, are packages in Buildroot master supposed to be
bleeding-edge? The maintainer also left this in the release notes:

> If you decide to deploy this please be cautious; use a canary server
> and let it bake, just in case.

That said, 1.6.45 was released a month ago and I don't see any critical
bugs reported in Github issues. (there are two AI-generated reports, one
is not considered a security issue, the POC of the other does not work).
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 93480d338c..6a3de856e9 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,5 +1,5 @@
-# From http://www.memcached.org/files/memcached-1.6.43.tar.gz.sha1
-sha1  37307d13528f355fb282bc8841ca033272e44ac9  memcached-1.6.43.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.45.tar.gz.sha1
+sha1  45038980ea7045a548b9b5b5125ef7116312a768  memcached-1.6.45.tar.gz
 # Locally computed
-sha256  8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435  memcached-1.6.43.tar.gz
+sha256  d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd  memcached-1.6.45.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index e297ca17ff..f86bd56006 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.43
+MEMCACHED_VERSION = 1.6.45
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
