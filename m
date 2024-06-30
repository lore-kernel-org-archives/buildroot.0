Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8CC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B317881E76;
	Sun, 30 Jun 2024 14:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSOtpRbmyyKp; Sun, 30 Jun 2024 14:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2CB381E7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2CB381E7A;
	Sun, 30 Jun 2024 14:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 661701BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A5660635
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkra9G8z4Sbu for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E949605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E949605B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E949605B1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:57:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a87.dip0.t-ipconnect.de [91.58.10.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AEC1A4C247C;
 Sun, 30 Jun 2024 16:57:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52894)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNvzN-000000000xE-0YL4;
 Sun, 30 Jun 2024 14:57:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:57:12 +0200
Message-Id: <20240630145712.13579-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240630145712.13579-1-bernd@kuhls.net>
References: <20240630145712.13579-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719759433;
 bh=yiVSqhVS4kUHApHOy9w2CS2GrvCzLchFNsD2VJNqRhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aPnLSjAmQOFvWzm7bfxr3TOLP6xKH08e7qBGX6w1KZrLIXYvFHOAxAwNfJS0uDEIp
 IokMuwsXm96mRrkESdvZG4aUC/bBi64OhYv9AwvDOAXecde+8H+NGdyT3C3CKcCy0z
 A4WrRm3MEPtEv1yZbusAsTl4+Q1URQ2VgmvSpB6LueAs4gZ/EgdFhZpXPucCMGlWKI
 mf8xlrc72jpa7wgzaoU/7eg/g3Olqy6DrHhewbnB/xrl7t6DuqrPzhe8O5Z8Fr70GS
 kNSRmI1nPb/QzSqAv05jrgT1Wt06eWqn8i9UYpBAjNjFaOpCWXNP4W7POlZAXZ8Osz
 DhSTTXNcDX3vA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=aPnLSjAm
Subject: [Buildroot] [PATCH 4/4] package/intel-gmmlib: bump version to 22.4.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index aadf01a169..66a4088257 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ea9c418b0fd84a982850f230cb2d783dfe2e1f9923065f54b2fcaad1e9b33417  intel-gmmlib-22.3.19.tar.gz
+sha256  7233037c5788966b0b356823149247e4d3bd590480103c48277191da83243d0d  intel-gmmlib-22.4.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 74e19e93fd..5260b7689c 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.19
+INTEL_GMMLIB_VERSION = 22.4.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
