Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A774E7DEF1
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9EC60724;
	Mon,  2 Feb 2026 14:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XygAE9-ET423; Mon,  2 Feb 2026 14:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABCE60726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043640;
	bh=7FGP/LCO6gEHFctRsocK3ywOO5NrUogjmmLZ+S0yIVA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IpG5eVftI+Y/qSnLEEU3cUqYHdgmX62r0mq91SkuxK3H2UxxLz+luQsGtz0prfOgB
	 O7oiE3D+Q65gobcl/2yGQU7gFsleqqmIIQbc2XF2hqE/DX+NlTcSIbueWd0kS8hV22
	 lC78QLqvzh+WD34i7IMUs7rMTBD+T1UW9+bD1CK9HAZ1Jjd0KDQJiNpb7g8m4Pj6it
	 hex4EK4kLEOPMiM71L6rmEarqSlRICKhoXSqMtU8ikNb0POoacaS2rSS5GsDSKqqFF
	 sIwLwhdRPO93dMOjgs/sBEgybRVnZmyppF8HmRz6ByQmEFT7PmQBzbQhwZ1qyxAwYk
	 RBwWPX1jxP0bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABCE60726;
	Mon,  2 Feb 2026 14:47:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8CAA23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E22A74021B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgQuuX42-LSn for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A94A4401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94A4401E1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A94A4401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:17 +0000 (UTC)
Received: from home.juju.sh (unknown [109.89.232.55])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 19A2719F740;
 Mon,  2 Feb 2026 15:47:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  2 Feb 2026 15:47:03 +0100
Message-ID: <20260202144704.980271-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770043635;
 bh=Hm7Y263W8Cwb87Qpu+yQM0LbpGlCwuWq5gfsMwIVGiY=;
 h=From:To:Cc:Subject:Date:From;
 b=HbbSqYhI+epAP0LsM1Pe1fcL3wQtjoPwOiI4dVYU+yjarfWMN55QG0yXeECHy++Ke
 Kyb+Ywt3tO+ERTzmzOT1fVqs9UcCevi+9bT3zVjQHZRU7x7yqYkgl3uW1UmBQx4srU
 jbi/4gVzE5LPIMORnjS5QjnDk+geD4CqvAMsXqlEEaugY61Qmb/hmWqrliUM6p1E/r
 dhWVW37U9+B02/AB9KDXjOQaHiTDh/ca6+mR0iIc96veo0/pEDlJsiSLlCoNQJbwQj
 nSAMRv32nTfv6xapmAmJespTdjvDButMplTC4qkKCbq7qggyAxELVY3akF0ZkBY2Ts
 32aqXbA5+u45A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HbbSqYhI
Subject: [Buildroot] [PATCH 1/2] package/qemu: bump to version 10.1.3
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

For list of changes since v10.1.0, see:
https://gitlab.com/qemu-project/qemu/-/commits/v10.1.3

Note: this bump is a bugfix release for the stable-10.1 branch.
This commit can backported to Buildroot LTS branches.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index f4691af1dd..ee70e67694 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  e0517349b50ca73ebec2fa85b06050d5c463ca65c738833bd8fc1f15f180be51  qemu-10.1.0.tar.xz
+sha256  fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53  qemu-10.1.3.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index df81ea6486..5cc98138d9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.1.0
+QEMU_VERSION = 10.1.3
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
