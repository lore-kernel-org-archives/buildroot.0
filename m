Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A006FD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49ABA40841;
	Sun, 14 Dec 2025 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPAMDn7L95TZ; Sun, 14 Dec 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358C74080B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765729795;
	bh=g4la+3USMkpRt9cGow3m9WiMrppN18nleq79CPZ7W/4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iK3lX8Uslumr67s8ghoftTy66Q0jh9+CGtZPMGbfRdcJif/lm7W2NGZdNtqENk1Po
	 bXiOds91ct/ma8A8Fj2j/FHwPBKXpoP558gerPbkfqZko0s1s2DM7utOKD+7sN3IoB
	 ZyZN1jTdJsGnrdsq5/KFI/iQFkWFvRtyL+cFN7wm3vtHd5XrF7QLsEbRPo2euyGg2V
	 z2bkoNAGhzg3iTPxmdnUUYOLKmMfaZJ70/XHHzlQzxYzhx2fQC/XS+NZIW8hz5f40e
	 H8kHUedLIk+PJUE71tp8BZnjyxdMQoljK8CirOWJtMvJ7kn3dbwRqCLAUqMBHJCx7n
	 owFrVCQZWx20A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358C74080B;
	Sun, 14 Dec 2025 16:29:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9942C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2ADE4080B
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0ENfxuoGVOd for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9E49407F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E49407F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E49407F4
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:29:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE7BFA4C3FE2
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:29:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59904)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUoyg-000000007vx-1Ov6
 for buildroot@buildroot.org; Sun, 14 Dec 2025 16:29:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 17:29:46 +0100
Message-ID: <20251214162946.1144748-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765729788;
 bh=c1erA3orFMS1B0QV3+/UjnL5fj8+Cxa1qeUi+wFfFsc=;
 h=From:To:Subject:Date:From;
 b=IE5BTf8BjWJdI49TqedEle7cC6QmNS5UkG+idtJrLG7KAyqkOZOczZthRXVWMxr8+
 bkC05EDOQqJX9fZ9Mg/AH2tYxGfamqCy4oWkcRN8gP/QjtRhpejCi86P5DCIBY9DSE
 B5E8MJOAIKG4DiY4kAf4x8iLdQJwan6wri0KjZ2GBS0/TdpUeFzhCuVihqt+A4L2m/
 6I5eby3y+cOyLHhrbtszGmJpvZxPZ7DJIVOMq9uZRKst1M7YSO2cou/bWyfY25EDZ9
 SNqvaM/c/H9QG7EKAm1qvlST6YcN7Apb7j32BqoAlgFThtiwlu+Gjk5g2cd1uyWnA+
 XVw/m4PCyM+Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=IE5BTf8B
Subject: [Buildroot] [PATCH 1/1] linux: select host-openssl for all
 architectures when building latest CIP version
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

This is a follow-up for buildroot commit
bba86304b0ac4ae266cfb52e54a239b0850b10ca to extend the fix to CIP
kernels.

Fixes:
aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/

Supersedes
https://patchwork.ozlabs.org/project/buildroot/patch/20251101102346.109307-1-bernd@kuhls.net/
and includes Edgar's comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c8d93a72d4..ac78097f07 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -177,9 +177,11 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
 	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
-	# version. This is mainly needed to fix autobuilder testing.
+	# version and the latest CIP version.
+	# This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
