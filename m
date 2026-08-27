Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0242EC61DC2
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 11:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADA83606CC;
	Thu, 27 Aug 2026 11:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2bpGFWpNL1Z; Thu, 27 Aug 2026 11:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787828772;
	bh=80opBbdThiGbCG11u2yP3IVUSfjkQ5kiaLtPrwY36dU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kc6oxTsPRt92M4w/DzFOLi/RBde4uvzAVuhQ5xOzWBMqBpd64Od+6dLmeUg3cnpJH
	 VjpPqohKQqpLZuwH7V2vOes2fjlKTCsYesdp7bhM8tLhnIZ9rMyXpMGYUbOksddzfH
	 h5NSBqMTHSAH/H0IwA1V3s+7Q57YIzin6WutTWWJrdc3Ep5RYGqNBXSQtyGWJ8ZeN2
	 avsvKrEqlfAyhQof7zQKQwJBNSfGjxn/f4rjjaTnLslP1OMojlt6dUKcku3dr8ecBi
	 0bhueQ//WUnbx23No4B0WHtppRfI0bUYBjelCv5sq9STLlOastinZVBnaVsW6IUbmt
	 k8CVKKYxCxTeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E45606C4;
	Thu, 27 Aug 2026 11:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E33E7AA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FCF380DF9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIpZ_znWEzGz for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 11:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LXZRaM3n
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18CC680DF5
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 11:06:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id zXvnwsrIdtpTfzXvowDm3R; Thu, 27 Aug 2026 13:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787828764; bh=oER8cbpdYzls0GL1T+iz1a1GwM9Jt3A1lCyp26HThAU=;
 h=From:To:Subject:Date:MIME-Version;
 b=LXZRaM3nyGKEU9zwm68xI8Tnz3hd1OAi90jqq8mwXfPFZCqo8ka+ysiX7kof7qps3
 bGiyCtDb2zR4cp8XH7UEhE3Wcd3HRDLvOucqs3xblq4DRK+GyOZ2vDuxez/FAj+dOw
 imxetQ/RI5fcuJKDbJEDkOaQmTZj7DDSRu8A306LlNt23b3LFJ/ZLMG4VPjmoFpr/I
 sF+96Tbet84vXdOqxwvwsWSNWjjbWSvr+mc9obDeD+cqK3WzRjOK1m9enrDBt/Om7h
 reEu4k10T86PdnsLAKg6UGqAxe1NLrIGVgBdmlH0LCfLtNVlspR+VXzcQHBPeo10Lo
 HSQUVD88uO1PQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Aug 2026 13:06:03 +0200
Message-ID: <20260827110603.3318017-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP0nZJXLEPBPjns9keIk78hSN9DxBhblxYklVZWJuKt/eal7wdaEpSHho0nAb8vyNJJm5T1VgCABiGJ1hl+xMCIRblaiMGUJRo7EJ9DdxZFmhUnWYmiG
 l5avfVAw31fV9ja4sPq8d+9+7oV0ADmmYocTONCxNT1yf9yTJpbplmXJn6J/SqfTtfsJ7AnC5YVDqy75/dVYd7/X9Vm+E9ETyhpqu4p4aj+yIutGamLfxCYS
 gou4sgZWt9iVJ7z21NP6lUDXrNJrEGfUqKZRuWS37B4=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.4.0
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

https://github.com/harfbuzz/harfbuzz/blob/14.4.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3d7540f788..f8ee98e172 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.3.1
-sha256  9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7  harfbuzz-14.3.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0
+sha256  2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371  harfbuzz-14.4.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 909629d7d0..184253949e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.3.1
+HARFBUZZ_VERSION = 14.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
