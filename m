Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773EBC021AD
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 06:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E71483B59;
	Thu, 20 Feb 2025 06:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJre_CAp-gpM; Thu, 20 Feb 2025 06:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897E383B4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897E383B4C;
	Thu, 20 Feb 2025 06:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 615A5D92
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 06:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0274138C
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 06:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPRg_GF7MDKw for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 06:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBA75405A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA75405A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBA75405A2
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 06:34:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b7e.dip0.t-ipconnect.de [91.58.11.126])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5CC1DA4C4EC9
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:34:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59124)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tl08Y-000000000nI-3hca
 for buildroot@buildroot.org; Thu, 20 Feb 2025 06:34:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 07:34:18 +0100
Message-Id: <20250220063418.3131-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740033259;
 bh=paYUg1xeUGn//DijGneZYJ1PaIJPa9JT4XurNNHEWrQ=;
 h=From:To:Subject:Date:From;
 b=BPf3SDP6xd7wElIywjDVpcWiPq9xLxotiH3ce1N66LI4gwQSBcu6VrwwNkKg00WVL
 RMIbcKaRvs75OLcPc5MI0cW9C+i/vf0knccfxjyx4oYsdfnOMhAJt0c6b47T5Uq7La
 7YWqe+ofnTCJp0YNdYCdZdtYNuGFhrxPTOiCb4DeUmHlPI1nhKUDSY6GiQOEGWcH7v
 q+z3l6MEUbgdTCUxJup8ogpLiz/dm575+jQYml2VikyhwBJvEMu9wGoTNaG0NppOUM
 cQNfnlQvNEqVEF/Wk/IUt+qYRHbRLWs7c7i128vQuYD1oaVz3ARNJCxTuVoBP1ofXt
 JsiQUc7LccKLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=BPf3SDP6
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6,
 12}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1626264a93..238ef4aada 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 459202b4a6..e81b506682 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f3ebdeea9e555b4cface44e29670056f4024541e6bd222fbcf776c818974fbba  linux-6.12.13.tar.xz
-sha256  081089dfcf125aef67aa940ebb995ff789b646129f5d4b2365e1d5685b29a84e  linux-6.6.77.tar.xz
+sha256  5ff5bd84ea0e22c53437302db5d394d0a92d8b8b1a88ce20d1098298e9f7630a  linux-6.12.15.tar.xz
+sha256  5aa39a9bd555133ad741058f9908a277e6b36bb928481e747d885b50aaaa93ed  linux-6.6.78.tar.xz
 sha256  874d67d3181570e69ac6b33853f0448f05fc90d4cf3e4baaadc4a9cede7c50f3  linux-6.1.128.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7aed0301e1..e762ded1f7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,8 +432,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.128"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.77"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.13"	if BR2_KERNEL_HEADERS_6_12
+	default "6.6.78"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.15"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
