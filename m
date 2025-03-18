Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECACC28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E9280E5A;
	Tue, 18 Mar 2025 16:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJxvBwM73gcr; Tue, 18 Mar 2025 16:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 325EA811AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325EA811AD;
	Tue, 18 Mar 2025 16:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEDF16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F226C60906
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1zcwAuZw6Ut for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78E31607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E31607F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78E31607F5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:06:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48F34A4C2E29
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 17:06:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48530)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tuZSC-000000000sq-0pUt
 for buildroot@buildroot.org; Tue, 18 Mar 2025 16:06:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 17:06:07 +0100
Message-Id: <20250318160607.24704-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742313968;
 bh=BMls514BQaMSpDmYn4UAiNGfJHK/VWJ/LVTqfPwERKo=;
 h=From:To:Subject:Date:From;
 b=SMu7aaO1mA2hkz7bAyHbvqMm1RM5ZiCZ1fDvNBHSuppVs0fzGMT2u+HK1vDRIwpNf
 KySlMdhIJIRC32YjrmhVH5zuZJeW0tppNXhVievbnkE2NrBe8S2CSh/1SrmGysXyC0
 ZOLuB6nPN+Q7VZQPaFPJhdeBJAF22E7v8J0SnRn/1LaJq9L7tT4fELgcTH1qPVL3/f
 X7564P6ZVfqC0V6xE3gQTqEr5wu7hh2qI3skQrmO54k9xWpu3wlhJ6AJJXqaj40SBB
 kIfD+X81UmqA+ibtRdTdSBZl2Vgz+2GvZdHhTFFIoYfbXm2qLGp4ovyLG/5d2xg7X2
 XYCrWn2jd9sPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=SMu7aaO1
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.13.x series
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
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 506eccf0ed..c2f730709b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b85cad7c3c..a8f37fd097 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  283ecb0784f3fbc16dd822fb1d9642e230ec7515ed33f120e551b839f355e6e2  linux-6.13.5.tar.xz
+sha256  3a39b62038b7ac2f43d26a1f84b4283e197804e1e817ad637e9a3d874c47801d  linux-6.13.7.tar.xz
 sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
 sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
 sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index eff20e9846..9be5957596 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -442,7 +442,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.19"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.5"	if BR2_KERNEL_HEADERS_6_13
+	default "6.13.7"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
