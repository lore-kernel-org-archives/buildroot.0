Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B26C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D1381ABB;
	Thu,  8 Aug 2024 20:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yy2V5amXgWaC; Thu,  8 Aug 2024 20:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A32F881D34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A32F881D34;
	Thu,  8 Aug 2024 20:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3D7F1BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD64840BFD
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1jQaLzYOGAZ for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3F484015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F484015F
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F484015F
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:26:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id c9insD6jBNKTWc9insbpsM; Thu, 08 Aug 2024 22:26:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 22:26:52 +0200
Message-Id: <20240808202652.23100-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNj8OoxfjnSyzal8EGtCY3lUs+JEoL/DAD4wRSb0qqAH8kRyCO7xi2iYEnoQXD4DeAXYKKk6mnnhO4/kI3RFhELInkGd8GXU81GcdaVmi+lAa5M35AG6
 V0XorJefHp3nkvwgMPOlQi+imAMVoNnUKIZ7UGX/pNvCWG4P1p4QzD2oQf6QulIHdArIHPcTnawDtDEPlHtmNawCl0RhCZykHArmlBKP4VqGPhfhMqa61Cyg
 3KgqDvA9yM6SQ0zJ3hl1V4ATJWR15QUByqmeX1KuA7k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1723148814; bh=UvKoWjkvWPOSN+dmjgdUFZI18ryvOXdKzgLJT5hIphU=;
 h=From:To:Subject:Date:MIME-Version;
 b=iIF8i3vb1sMEcqhiDt6P2km5H3rxTlTthpxonS2QzTtYPv5oDTww0LgZPbUMgf+PJ
 eAB9Ft0jzgPPOxYpJ2V7xkBbMupkegitfkOJqkEO2SsaTducxfK6CxvXw6rmG5wUlL
 FykSicfS+nFJepZQjxq/X5ro5c0Qcq+46LrNBehC1bpZCGHEdYrhzYxBBeNnqCzvVC
 RNLX0qmITW3DYU6+feRHqIG60fZ3ZEM4SXjmq6Y9hSkutQ/SzRwZDB10wXeWUn8q/U
 lXtSWl54VdPkAVXAMdMfRb6DIvpQGaR0DdByBi1x5KOtpdJ3fkOrbTQi2VkTwuNwfD
 5624Q1NS9kPMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iIF8i3vb
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 99c633882a..05727f7cb3 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  455867060d2b7563eab59fe21779dff469d98465028997178c7efbe4b8763206  libnvme-1.9.tar.gz
+sha256  add9efa968e8341459fcaa2d96f2594a6f871e1fb3f57c02ce1c8ba5424f3960  libnvme-1.10.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index da8707db7d..93de76e83e 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.9
+LIBNVME_VERSION = 1.10
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
