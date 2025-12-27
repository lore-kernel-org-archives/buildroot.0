Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE16E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DD980EFD;
	Sat, 27 Dec 2025 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9q3Z47QGxG5W; Sat, 27 Dec 2025 19:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81E580EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766864650;
	bh=gz7yRVm3qQes0K0djV2wleBzl7pONSndVxnSCPtb4X0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=euu0ILby44my9xC0zSc0GdKiFALMr2Qt7bT853b7uqzduDQdgWCNS1a3QSWpma4e5
	 FHZWZokEnB5nqwGPGcamIQDp62e65iqIOjbmG7IolswN5z1FB1iLzZuY8ZatnK7ahG
	 qwY0wHvJD8kvXMRTNDOrbSgyy8KcVPtTys5haSYqaxfx3JhUR63z4luahviLiyPnef
	 t5cz8e4hXLrHE1Mbx+syNoi2ZwQpF9JmoHzBrNh1elpReO1Hm4jPquBhurqF8r42g7
	 u0bNEqGzNMyfeBCmVRZUsHoIjsZ0tuRRjk+D0Qb5Ikr/sYrVw5Bk725qLw+Z4N5jO6
	 pflrI9K8RO8CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81E580EA0;
	Sat, 27 Dec 2025 19:44:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E30119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE8AF40296
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiird0x6qnJ0 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 19:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D120140333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D120140333
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D120140333
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:44:04 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZaCnvUZhKcq1hZaCnvmbFF; Sat, 27 Dec 2025 20:44:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sat, 27 Dec 2025 20:44:00 +0100
Message-ID: <20251227194400.1108440-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKcOR1yLnRpKW1tjubvBZVB+INkKxAroC/YNVgWy7hkewviUAmeoMqiDupK++5PnPI4PMppqgOeyOq1Kfx/+CS8C5ozTxg5pQqvs0/4FyibSLobc8vMW
 yUIYWouXSITdC7PdpZbQTLP1v7ftezt8LFFfE0/OslnOKmknm7kE14/dsuzM/TIBtkSfEJ8kLVmF4XhQmCZvcM/tmuBrAi1lRuioEBIBCzttveREO9CDOv8m
 cdzRmSYnKFEYOuLoyraqdv1IabSFyecXW63fdCzfmfs47SlQJrCiMKJ+9+KSX37WJxD9togWq4DBHJAEWxTEvA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766864641; bh=CynunTdo/J5k1f9w0QhjzDNz+Gu5BYHW+FMLX8zPdOc=;
 h=From:To:Subject:Date:MIME-Version;
 b=IC1lKhCeMKHi7Zal9QwPMGHYKQpeWdeVwbTcTrOq6x2uF9comke+JLfILR75YQPVA
 qsxvn3uRWYj3bo4Uyx1afSi6erxrXiKY7UBAZEO/sgkdpoEl+yQk8FIXIQ0TR+Rc+h
 eaJwv/GGIjqpM3ZvbWWEkpjq3G6DFJQG6ajztIXMrf/oLCNpBFUOrs6T5B5chSuAD7
 ejDKUpiqYI2t5DTkqMM2G+s3GYA/Wty0NXXI8J03PgvIX+rG9yat4LDh416bT2CSaN
 YIJhriAMkYGaqsQB/3vwLWc4COdLZLnqMwEfdP9/47d7HuRxoOnYDS08+gknVLi7J7
 foidzxrcVQGjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IC1lKhCe
Subject: [Buildroot] [PATCH v2] package/dash: fix build failure due to wchar
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

Since commit [1] package dash requires wchar so let's depend on it to
fix build failure.

[1]:
https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360

Fixes:
https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed commit log and Config.in comment as suggested by Edgar Bonet
---
 package/dash/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index b816ac7837..3573a40aa3 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	help
 	  DASH is a POSIX-compliant implementation of /bin/sh that
 	  aims to be as small as possible. It does this without
@@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
 	  for most tasks.
 
 	  http://gondor.apana.org.au/~herbert/dash
+
+comment "dash needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
