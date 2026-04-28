Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D72FF8868
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 14:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E71780C9B;
	Tue, 28 Apr 2026 14:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54QlF5wwCEi5; Tue, 28 Apr 2026 14:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322E183155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777386681;
	bh=hvf5EQjjZWsbW2E1Qin061CD/qAwPnhl8GSjGGWybas=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CvR27MakV7lGe/2E5xnQu+MJcBNuVmnfMfkilXDtld4ITBb1IcSpJYo+7aK77dQP+
	 4qOf9OjWL1tztNdX3BwLJ/f9MH2ylYA8UNqQbevN13gh36/X+BWU4/2uRI1P4Q9aHo
	 lFFOk4leErrnUQiXyra7JWs4YloHxDyXTUNiylWlMa7FCPLX2dI9uuqAS2+FWyY9OJ
	 e708LSt7Zhhf5iYlnsdX4iaBPiVnId/RXeB8QnrLct71DyHFSnMpc7TE8guzeEEq+k
	 PvvrDPEAPadbmGDNA4ZhlJjXln7PqQMKlrQ/MRk3wv60bDAHbFRQshKz14I83cjoyn
	 O27OxeBHQfKfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322E183155;
	Tue, 28 Apr 2026 14:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E0251B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F93583143
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPs2sj8ogoKF for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 14:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F98483122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F98483122
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F98483122
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1777386674; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=h3VJIcgy6IBhaX6Fa1DTsGJGpkV05t3uUgKru6cE0mQU++BIt3dINerIn48zpK8zq9ARKFS5d0Wy+VdGKDJUR3OShBrAZo8gFGSb9/KNWyalM3a7RebGz5xoXZ+XqemT6YmtuC6RP2RRAxIbcHgpCx+gn4LAcwo2SBHyKOPmdsA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1777386674;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kW3LXcpVhWdDOkmvfXhUmFXwDqG9B7RUoCrHG+kmDs8=; 
 b=CjeyLUDz3h9lKZ33sjZLXPzwWlUoGC1X+iBAM5yK7nFotWKnp3L24AKuqjHTR5MnMK+S1nOo9+fX0EHaXViCu982ZKegZabdbdj6kJcpFlMCV17mvzmBPRSnfw8edz0V+YvTvx3aSFm1xXWaVCInHQ/Kr7LcE5/4ciW6KKnR/LM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1777386670392336.01532383753636;
 Tue, 28 Apr 2026 07:31:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 22:30:18 +0800
Message-Id: <20260428143020.2129906-1-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Feedback-ID: zu080112274322e59d92a24870d8575b760000a8edbecd7459fa18426920380a411db3916884e3109c0379b6:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1777386674; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=kW3LXcpVhWdDOkmvfXhUmFXwDqG9B7RUoCrHG+kmDs8=;
 b=DRojoBdpiqCa+TlS+EMUUEouHth6rlOjNOqkpphIuE6MnRAdRvzFxLJjI8/Rqali
 uikIN7cIXThSCIoyhEoeNGahz2d1VSLtQzaJ6VZzLFYjwN8TFhnV3xknnNHDods5PW6
 9I6xSNUeEbI5Q245gkpNa7JwX5+aMvY1ImMHeECM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=DRojoBdp
Subject: [Buildroot] [PATCH 1/3] package/python-gymnasium: add missing
 toolchain dependencies for numpy
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-gymnasium selects python-numpy, but does not inherit the toolchain
requirements of numpy, which can lead to automatic selection of numpy
without proper toolchain support (C++, gcc >= 9, glibc/musl).

Fix this by adding all necessary toolchain dependencies that numpy
requires. Also update the help URL and add a comment explaining the
toolchain requirements.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 package/python-gymnasium/Config.in | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
index 19185f267c..b93fe6ccc8 100644
--- a/package/python-gymnasium/Config.in
+++ b/package/python-gymnasium/Config.in
@@ -1,11 +1,22 @@
 config BR2_PACKAGE_PYTHON_GYMNASIUM
 	bool "python-gymnasium"
-	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
-	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
-	select BR2_PACKAGE_PYTHON_NUMPY # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP  # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL  # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9  # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9  # host-python-numpy
+	select BR2_PACKAGE_PYTHON_CLOUDPICKLE  # runtime
+	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS  # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY  # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS  # runtime
 	help
 	  A standard API for reinforcement learning and a diverse set
 	  of reference environments (formerly Gym).
 
-	  https://farama.org
+	  https://gymnasium.farama.org
+
+comment "python-gymnasium needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
