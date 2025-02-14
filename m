Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFCFC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 621366F7F8;
	Fri, 14 Feb 2025 18:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlRbuLshKEVZ; Fri, 14 Feb 2025 18:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693C260A47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693C260A47;
	Fri, 14 Feb 2025 18:22:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0021F2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036A24026F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytbp7hxWfQoE for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABA9D4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA9D4013C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABA9D4013C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:22:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07bc.dip0.t-ipconnect.de [91.58.7.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75F40A4C49BD
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:22:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58558)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tj0KQ-000000007Xj-3sfW
 for buildroot@buildroot.org; Fri, 14 Feb 2025 18:22:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 19:22:19 +0100
Message-Id: <20250214182219.41658-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739557339;
 bh=u4IY8Y3U2nsrT4qd6xlTK2UCcG8VTy8QbuGX2bK1cgs=;
 h=From:To:Subject:Date:From;
 b=M4p2VORcgGRuTIehXgC41rutoMG1fzvowHbTUk0zk8sA3LDqRVddSx0KBy1A2gnV/
 DdojHrerVx6gXyHqdIEATGlSThcVZlN8CfFtZm+qO2h8w6qeHBLPHMBdNtj7v9ZsIC
 AglcIfxzradWdsqw2tPzIp8kktL7R+kGfcRE7fhAVTaqVsfXlduIc1kuczHaj6wLjr
 inqf5Z1xcdLuDx26huLhqBTGr3CIPjtK83bFey6GS+CZPNRz9VZ3qSrlda58APAxgH
 dqYhNPLyg4UbYnMy9pTB483gdMh1TKzC/xKeGt9vW1n5Rg+akv1Lyt7qn3wXdJIw34
 UCGXGjBORJ7/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=M4p2VORc
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 13}.x series
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 319a16eece..709c36c16d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a80accf785..9d53141b7f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f011f6c8ea471df1b3dbbdd1eb261b29c92e43360503c3ebd005beec2155b66a  linux-6.13.1.tar.xz
-sha256  e98942d17ef7063b3f2d6d7692bf24899e2e021cf832d19b55308ec8e8e08eff  linux-6.12.12.tar.xz
-sha256  f7dfb1fa9716ba139d0b4c8161535816d400dea21d5943f513448429b1790290  linux-6.6.75.tar.xz
+sha256  cdf62981906bbbe9701aeb73c4f9fcc807a09846c288731663d62717ed1ae705  linux-6.13.2.tar.xz
+sha256  f3ebdeea9e555b4cface44e29670056f4024541e6bd222fbcf776c818974fbba  linux-6.12.13.tar.xz
+sha256  081089dfcf125aef67aa940ebb995ff789b646129f5d4b2365e1d5685b29a84e  linux-6.6.77.tar.xz
 sha256  874d67d3181570e69ac6b33853f0448f05fc90d4cf3e4baaadc4a9cede7c50f3  linux-6.1.128.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ccb2224cd..9cf8e9be70 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -440,9 +440,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.128"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.75"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.12"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.1"	if BR2_KERNEL_HEADERS_6_13
+	default "6.6.77"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.13"	if BR2_KERNEL_HEADERS_6_12
+	default "6.13.2"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
