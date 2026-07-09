Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38178C44501
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 12:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9B560FEB;
	Thu,  9 Jul 2026 12:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFa0Luk7XcmI; Thu,  9 Jul 2026 12:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D4A60FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783599855;
	bh=LLYCrnlMCtkQZchm50FBxCUxI1Rh4W0xpG54q1Op2S0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CZtcsT9O9Sz70vLQJvjX+mLltMPiw0LVWS07WkO6ub9WZJI+eyXifgGzE42pgca3s
	 79Vr9BjBMbBNHpnjqqbAoDGgF01nQVMTKugIyceba2csOtD6Nymjp4LVjt7NG6DvqT
	 FoMjg120D1+5jkrKvk0z/DCXODbLJiJ4m4PyhYICZB5ls2m1oIpLGvdixHT8wb3bn1
	 DTylEpH4wrm/vmFdCtAtRWP5Y/RD66rYUz5+z9QlVF6MoNFqdTaaJRoJsTtVlVNv/a
	 gld/4DD0DRKW4ZAuJPNT3o/5g2/PmbwM2QG3peTi8YOH08C6XrGJpGaBToQ28AQw6U
	 XSWUnTXjUk12w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D4A60FE2;
	Thu,  9 Jul 2026 12:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D26320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 12:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECD54107D
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 12:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXmmRkPQUSJg for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 12:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC2544107A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2544107A
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC2544107A
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 12:24:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id hnnTw0UuqclBZhnnTw7w5z; Thu, 09 Jul 2026 14:24:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  9 Jul 2026 14:24:06 +0200
Message-ID: <20260709122406.1125768-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFpMZfi4Z45w9ngFjhkOzteX7in22nkYuSxFZO/EKugmHJQMi5sek43LSuKON6Dnilg2iGElAHzrM1LLsbjqqguTbbDtJuocYOJcxngtCty6yB/KJV+1
 QrMFS6sJcsLY5R9FFZaxZNS59/Uat+nz/+u10RRFTYD1rC26k2JjdODjkLcsv5aR6gGyN0FhYxWHpqc9iacbuMgQOhxiCaOdAKzbuskwBQPnzkVrBYHBWogm
 ub/NfaV9AY15ARrXypaQ0lRaLG6q9SZx9LGVbvD8kZ0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1783599847; bh=fUybSMAmomRHNNCjKZ0dTx+pDiAIQr+RHFESKDi/FVk=;
 h=From:To:Subject:Date:MIME-Version;
 b=JnLhrYy2ORXGXeqRP5lBXBxWXq0jcUQhq/7Ajb8Z75kRjx70JEzVWUGV3ka4J6QjS
 PEC0OwMXs/Fgo0VG0LUjxZoBPSOxNPFyHBWiih2sXz9PBj3v/wqOYtrabZsV1cUBf5
 1E+Cw4/KfAXFVwAvuItbVv9Ci3FNxRLtKZX2OyrkZvjSNIdPpJtNhLmRqnXOXS2PCg
 wAAFcn8/ltj9t/NaXlxmE9cTk6sl/c29aEw8wnlvRDIgOvAWfYWmzBOMqidVqdGdoF
 g0aYESITCrLA8XLKPVz62BlBzqqV/692nf43UXx8YHVjGDkXxrIweY6FMp32rVwS4y
 cSoXQtrkFII8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JnLhrYy2
Subject: [Buildroot] [PATCH] package/wireshark: bump to v4.4.17
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.17.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 2c15d4f0f4..917ac47471 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
-sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
-sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
+sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
+sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ab393b8a48..1fd81515c1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.16
+WIRESHARK_VERSION = 4.4.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
