Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB28BCF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 16:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8B8402DD;
	Sun, 29 Sep 2024 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMrI2BT6R1MD; Sun, 29 Sep 2024 16:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22DD1402E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DD1402E9;
	Sun, 29 Sep 2024 16:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83D391BF29F
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 16:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FBDD80F78
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 16:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hi4i2qmNUB_a for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 16:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6138680F6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6138680F6D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6138680F6D
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 16:53:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4B716B0053E;
 Sun, 29 Sep 2024 18:53:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 18:53:43 +0200
Message-ID: <20240929165343.1570582-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727628833;
 bh=82RkBUVoAfRDU2P95p44gtpQQ4VSHLtlgrzG3a9fzkQ=;
 h=From:To:Cc:Subject:Date:From;
 b=MNOz5uzLD/H1Tv8Cf9MQbuoRJmFQ7Cm8FQp9754WHjK9SAqG4IJtQyyb6mAVvLF+U
 gROnkNbF1HPkNBVFR2uj5pCcRdNK0ZwCVE70Xf3Ju+GqeECY7r4/RbzdQPqcYZHy1+
 5qae5SVmeFg/Yypik6KZE+/JyyLFqrYaRQuOR/3SOS/XKMk8nW9OugK/wmTBe3t9+z
 Kp8kxtxdGRZLSgCPgssnHTflIpAzyAQxUbbr3kYqO5cV679D6YE5hjSYV5K3j4h/+D
 DrRi30tv2vsoj0liwKgvm1Alxv+Twag1fFNUgk1twd41c3HxIVGjOrlGLsDrY6mqe+
 K5ph+A4F1DgqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MNOz5uzL
Subject: [Buildroot] [PATCH 1/1] boot/grub2: replace host-python3 with
 BR2_PYTHON3_HOST_DEPENDENCY
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 86bb1b236 "boot/grub2: needs host-python3" [1] introduced a
dependency on host-python3.

Since grub does not have any specific requirements on host Python
modules, or recent host Python version, this commit replaces the
host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This will
skip the host-python3 compilation if a sufficient version (3.4 or
greater at the time of this commit) is already present on host. This
will save build time.

This optimization was suggested by Peter, in [2].

Note 1: this commit was checked to ensure that grub is building with
Python 3.4.

Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
"support/dependencies: add a check for python3" [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86bb1b2360bdaed069cd087541f4edad1d5ce925
[2] https://lists.buildroot.org/pipermail/buildroot/2024-September/763967.html
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/b60729784ab1c2f75dca30f924f4dd3176713ae8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/grub2.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 7c95adc739..4df12774a3 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,8 +9,10 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2 host-python3
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-python3
+GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2 \
+	$(BR2_PYTHON3_HOST_DEPENDENCY)
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
+	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
