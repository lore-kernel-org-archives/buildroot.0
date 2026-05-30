Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE48CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 11:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C22E61B46;
	Sat, 30 May 2026 11:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feJktHeomBXB; Sat, 30 May 2026 11:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97DF61B47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780142178;
	bh=iSIdOTZXBP9g2SMS5LwKwFYhzByWjGk00DCxmcdiQn8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvapXph09MKQYYaTuMaYeyaliDTLR499zoWLUfoQasnOMIEK4Zr+xObgCaEdnH6VG
	 NKyU1PQaHO7DoBWEzXy9hj4T0Fr5TkhfGAQZ76MinQNL+PgjAamoEYpGqxPeQtoB+i
	 xr3drJ0lkI9H/f0EqLxtknUbQkjh8lKCS0lCaKdKiXGHQqmHxfy14ufhnETF6lhFtu
	 aFrB2jGKRBj0SUepgMNkC2vW0z54DAUggWJiAOj/VWPsON4kur/XYNOAHZBdSmTAoR
	 c9QFI+w8dGuqyfNSj/kqEwMun2qYbIUn26dmHA3fzkLiQSeFSS8PKIej1DWB04TbId
	 P936M2rd9P0qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97DF61B47;
	Sat, 30 May 2026 11:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0549F12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C5940935
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coJM0gUGFKQH for <buildroot@buildroot.org>;
 Sat, 30 May 2026 11:56:17 +0000 (UTC)
X-Greylist: delayed 1138 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 30 May 2026 11:56:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A6C6407ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6C6407ED
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:96:8a00::1200:706; helo=mxd-3-706.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
Received: from mxd-3-706.seznam.cz (mxd-3-706.seznam.cz
 [IPv6:2a02:598:96:8a00::1200:706])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6C6407ED
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:15 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-85fb448c55-l247v
 (smtpc-mxd-85fb448c55-l247v [2a02:598:96:8a00::1200:706])
 id 1b4d5b579baa31ca19396539; Sat, 30 May 2026 13:56:14 +0200 (CEST)
Received: from arch-zen ([2a02:8308:b086:3c00:3636:4bcf:b8c2:e5cf])
 by smtpd-relay-5698866cf-d84zp (szn-email-smtpd/2.0.73) with ESMTPA
 id 7dccbb98-7806-40b1-aeb3-f7c432501343;
 Sat, 30 May 2026 13:36:53 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jan Havran <havran.jan@email.cz>
Date: Sat, 30 May 2026 13:35:41 +0200
Message-ID: <20260530113540.26204-4-havran.jan@email.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530113540.26204-2-havran.jan@email.cz>
References: <20260530113540.26204-2-havran.jan@email.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn1; 
 t=1780142174; bh=D8rgC1Zi+OimZS9gqySpKauHPyyWSxuRWDQqfk9ePsA=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding;
 b=Lxw1Fcxq/NMj6jCPoF01QrjZzQFaed7LDtfglKDEaBp8DrH6L6X7sX72Z3qo4JTLh
 UjD/RzKUUOv3f8W+xgkq+OxLxjehfOm3XnZQf+poZsQWEnWVE0Gt7wHlyKh77fUwJ1
 x8nAdnoDBalGxZn3OP3KA6d/3mBMcBL3viN0BVwHiJNxadF0PwzMotI5Br8r1ZcOmQ
 15F9fCvJaCej6i6CwsPLghVBuexgiUyXs/s4kmkFzd35HS8to99VwVGflRe9U8c8nc
 nPh2mtWSeVpUZY5GHSmVFNmNOjD3DtmTfZ+mVcKeX4ywufQp8kXbLxPEnJK96Lrj2g
 ZWcwIqcmPVymg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn1 header.b=Lxw1Fcxq
Subject: [Buildroot] [PATCH 2/3] configs/pine64_pinecube: switch to external
 Bootlin toolchain
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

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 configs/pine64_pinecube_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 8fc55d80a5..742be94d17 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
