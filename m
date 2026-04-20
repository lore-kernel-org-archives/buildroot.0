Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B9F588E3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 16:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE4E41100;
	Mon, 20 Apr 2026 16:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Uc7YlLCXpYu; Mon, 20 Apr 2026 16:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88D06410E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776702721;
	bh=KTFltzQsZmO/3amLD4HguLO/cLnh65lwfNoY+GG67c8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bL4NwaPIcSt9UpsK7XL+gAIYZ88usBnqoixB8Au/7vwtRgZceSPiAdNBlGSknBPr/
	 6z0U2gAMDcMQWBN+YFAcPZiAGaLO4F7XmwEzUy5A6PYFz+D+tQH1QqJsNkgVMl1iAL
	 xP1ySK/YPeyDoirU/nttsKSEvUjW7XLXSgqXwl0Egbz2GvdSE8ejkQpeAt9pjrDZFj
	 +6iZ/m3GDmiEcp4/g+lysPvkbOIcicv4PYG6oiurAeWo0nsP6s2LIe9NN7Z8BiiABb
	 uS0bIpidU6FvKP8rS698fqFqxbwi9zztRljU/4HoeJdUML5zmMAhI/9Ya8YNDKSEFW
	 vGpxFccP9Fh1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D06410E3;
	Mon, 20 Apr 2026 16:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D32355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 16:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86C7610CD
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIPUmnQ8Sw2j for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 16:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA5F860A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5F860A73
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5F860A73
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 16:31:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ErXMwJ6R10dL0ErXMwKsfp; Mon, 20 Apr 2026 18:31:52 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 20 Apr 2026 18:18:24 +0200
Message-ID: <20260420161824.2278045-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMd3RJz7SpBHJ9q5pBovz1ZNwP8IeBJV2xDtNnX64o0GehZyydF0mm537dUf7o22p8V8uav9SW0tjjdECsm4tLX1QyzO/dNE6t7c0gtONGaXo82a0F83
 MBExe9KFAXfedY7CNZgzY8U55fCemFei3y48kNUJ+4xhppu8porzokt+mWrh9MgeCq88h9uIoEuyWnrJfEfhfDvc+/weSTNwcHKhDmgNVZK4GsLFDe9qwGzD
 CjSIQB9qbRnkwvuMUcv5zk2bxoK1MuTCKqzz0XRgfwk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1776702712; bh=9CiHglw76KnEtEF/O75c7L7EHRszeQYfCIR1nk02qgQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zsk1Ul5+Yu5InUloMw5dpC6yHEnW+jIzQDC3DiLiB+aYEPA+gY9XVIo1WyfQSL767
 7m2zvAZvw02Fi3Gl2+1IUC0ina16r1PqLpuY70rW9+q7FgQTSMBO32+2Y6RIaI2ieZ
 0tP34FMRdjuEKaEy02KUgZ+q2JGGJ1MNTFEsULVkY6vX0M25Gp6znGp9CUpg+7nqmC
 WgFwMF8kbnUv3tf0ysvVI+i68XriebhBapm0pfw1ZZpxnUOIfISLuv5K98RKiiHYOc
 fQQAKFNfwTnuaJ0lsb1Eyb9t0pEAI+FU0IYDZjMy/Ii2EDd9uerSeH7p3xn03FdZ7r
 0QxaL8euZY6vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Zsk1Ul5+
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.2.0
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

https://github.com/harfbuzz/harfbuzz/blob/14.2.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1a366edd68..d8df707924 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.1.0
-sha256  ee0eb3a1da2c5a28147f12dff55f6c7d60aeeeb29ac7ef334eabe84c8476c105  harfbuzz-14.1.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.0
+sha256  94017020f96d025bb66ae91574e4cf334bcad23e8175a8a40565b3721bc2eaff  harfbuzz-14.2.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index eae671758a..36b53f53eb 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.1.0
+HARFBUZZ_VERSION = 14.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
