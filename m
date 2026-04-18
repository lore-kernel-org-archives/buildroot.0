Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BDFF99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 19:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C993560E90;
	Sat, 18 Apr 2026 19:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63td5EyubnTc; Sat, 18 Apr 2026 19:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D0560E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776539492;
	bh=Fxnhz5F6tElkC+Kj/rKd5Xgs3Wa3y8el1uwCKFMv/Fo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Qe8befZ5vUgorurprFHur9k3cOpGL3kjpSI7V5+FOznl2ahnblD5pmCUQ9t3PGWYu
	 UE+LNdcKnDBWjGPktMxpvb+oXuD2WfHloIB7gJ6uAQjtS2b4OfPP5AMe6XPKVxMJYA
	 hvo0uFjPgjEyGPFPvgtKxB2yB+8GG6TapbpJc+c5ioQPAVV1t8c9nknBvazLNcczYr
	 +w820j4wM4q0fvCAnsWYRuleaSf/nX3pKKtrhZkBrhkH/lFIDUsvx9H0JMKs0jMWrR
	 PVNGkDwZGtgrs9/9N3Jct1VIuk4kQmDO4vf7vpFQ7zVNIqnoFgmCdMxjEmDgc+BMg6
	 JlJ2GwrVvihnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D0560E37;
	Sat, 18 Apr 2026 19:11:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07243259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E113360E37
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfVKHFsbopA6 for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 19:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D50CE60E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50CE60E1A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D50CE60E1A
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:11:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AC3045FFAF;
 Sat, 18 Apr 2026 21:11:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 21:11:19 +0200
Message-ID: <20260418191120.981179-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776539486;
 bh=EpeFlmkhAYGG664J+XnumUdpvJ2HYjPgx43o0s2r9wI=;
 h=From:To:Cc:Subject:Date:From;
 b=qQgOk8fHlZRKOuE6siw4uK5TlSmxdoLJMEnup5T1ilJPqVJYTiyOx0Y6BdkXOogt5
 GgR15iXtAm/cPWDLMIUOAYeeCioPwB75UjbLkMY5JE+C33b0UENdPdIAArNch6kiAr
 3Uq2peU/2bvIq0R0soTG4tbYNht1dpr1zGqztA7fc4pBA4NFqBWbv5RjBAkkZ5gYmt
 b1Qhr8QB8A+giehBTgbxJ0gKybpD8aUoJkctN59YcXpuy5IsMM7xjM9qADnHtthsz9
 zq3IErhfor7repXNSfFPnjIm6FQUrpTV1/wuuqRERChKI6bpLcpW+grlTji92TIk7U
 2XuQxL8QvLCVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qQgOk8fH
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.16.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.15.2, see:
https://github.com/Z3Prover/z3/blob/z3-4.16.0/RELEASE_NOTES.md#version-4160

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/13984389812
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index a9d1da901a..a73d7f460d 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3486bf5b35b185981cab0b0a81f870547648a1ca433085aa79afd17c44959751  z3-4.15.2.tar.gz
+sha256  c68c3e5e4810b16126b8cb4c47eee85c1ac3e24a81914c8e371b40de9dd33ac7  z3-4.16.0.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index fe52167e1e..ef84fd8021 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.15.2
+Z3_VERSION = 4.16.0
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
