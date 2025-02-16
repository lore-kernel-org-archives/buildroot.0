Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47374C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE594128D;
	Sun, 16 Feb 2025 13:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3SM9_1lLERR; Sun, 16 Feb 2025 13:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA0C410C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA0C410C2;
	Sun, 16 Feb 2025 13:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B475372
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DAC181F25
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KT59XOe5Maj4 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC38681F0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC38681F0D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC38681F0D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:58:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b112.dip0.t-ipconnect.de [84.161.177.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A39DA4C49BD
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:58:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39532)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tjfA9-00000000235-0beg
 for buildroot@buildroot.org; Sun, 16 Feb 2025 13:58:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 14:58:24 +0100
Message-Id: <20250216135824.2070591-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739714305;
 bh=XhGa+3+MtlamISERTnIXsghULl/FcddR9NmoOTNnlUM=;
 h=From:To:Subject:Date:From;
 b=YGOkGbwe5EeRuzOTgsFy9gGuVv1q7Fx1DrCydt/8wd8UzJljtu35VZtmDo2E1g6xi
 1kNM9/cKsADUUj4OnrdRrd6iqHTbgeCLA826oGlQY3ty08ov/4lbQNbrKbDFkLS2mh
 tfa1qff6lux3rWnpfmHkXsPE6z7xVTdItkB9eCmOPekTGhLzAS6eZ2p4rZGVOwVE19
 frLv4qZhVHy+WMsqHvTSdYbOlpn7bA2nuWmbh8YUku1thKdb/kkMiLscRXyLpOiiyV
 voUv626y+ZXbSQGGnsB3WJ9tI6Mt7XER9M8MKGCA4BUDTrvrc8l04K8yWMVDpyHT3i
 qZXnx+LdUijWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=YGOkGbwe
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
index 1e6842c44e..1626264a93 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ebd39c2bc7..459202b4a6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e98942d17ef7063b3f2d6d7692bf24899e2e021cf832d19b55308ec8e8e08eff  linux-6.12.12.tar.xz
-sha256  f7dfb1fa9716ba139d0b4c8161535816d400dea21d5943f513448429b1790290  linux-6.6.75.tar.xz
+sha256  f3ebdeea9e555b4cface44e29670056f4024541e6bd222fbcf776c818974fbba  linux-6.12.13.tar.xz
+sha256  081089dfcf125aef67aa940ebb995ff789b646129f5d4b2365e1d5685b29a84e  linux-6.6.77.tar.xz
 sha256  874d67d3181570e69ac6b33853f0448f05fc90d4cf3e4baaadc4a9cede7c50f3  linux-6.1.128.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0cb484bd0..7aed0301e1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,8 +432,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.128"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.75"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.12"	if BR2_KERNEL_HEADERS_6_12
+	default "6.6.77"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.13"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
