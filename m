Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B223C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 17:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159D541783;
	Tue,  1 Jul 2025 17:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8lZikeaVZXK; Tue,  1 Jul 2025 17:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DC84178F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DC84178F;
	Tue,  1 Jul 2025 17:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB138197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCF0E4178F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V91cFwsCoD7l for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 17:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F9AD41783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9AD41783
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F9AD41783
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:03:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c012.dip0.t-ipconnect.de [79.214.192.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67529A4C2C81
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:03:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51304)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uWeO8-000000000AL-2z8A
 for buildroot@buildroot.org; Tue, 01 Jul 2025 17:03:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 19:03:20 +0200
Message-Id: <20250701170320.664704-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751389401;
 bh=ElamdPO8RKdKgJ+EuMdY87L01r1YkI6+FcnA1dRFNX8=;
 h=From:To:Subject:Date:From;
 b=OYLl7t2kpwMK6D+FepUMsCp0g0oGbFAjAZ+o9etzfluz5HQB0XPf/yWJC+J8+cAZz
 /W1SVPrRsZxLZ6bf9upTEtVWasb/56w/NbYmNCeuX+FuneLynBuy77El8S8Nk6JBFS
 oEuZXYrPfgC5QVgBujYb3KA0JnAyz6zYtRyCPyTdJwdONY5/oGUQXPBFnnW4ghuz+b
 2WmZROuJWBJzuycLS7jveP379LSxpnRQ3I/E/QjmYnxE9MQNT/EVyRNCu4wt41bQN8
 Ere/46H9kkAYeVWmy9VwRIiCcXJB1aRDRYGTy/h+mzPqVWWjBR0HYXQXX9Y406hgk4
 bBemx0d32Xg5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=OYLl7t2k
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 15}.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3dcdbd5128..83184363f0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.15.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index db1da163a0..254682d009 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  12b50c89925438d9cd7385a0cafc9c433e6562ac5df00a21889fce9f548d65b0  linux-6.15.3.tar.xz
-sha256  a7f3fe381f67eca4172e9b63efb61a14bd7f9e1278e03603d0ff5a93f270c24d  linux-6.12.34.tar.xz
-sha256  713981ea26b20b476ba4ce880b76b21294576788d5db1c2188b167bcb06ecc56  linux-6.6.94.tar.xz
-sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
+sha256  0eafd627b602f58d73917d00e4fc3196ba18cba67df6995a42aa74744d8efa16  linux-6.15.4.tar.xz
+sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
+sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
+sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
-sha256  07c852940dc2dc03fe84f7fcf697648d7cba11c62d20504380492ba07aa46bb6  linux-5.10.238.tar.xz
-sha256  c879d0ba817aaa0fde318d58d7e1f141d9c29bd8569a96b73159ebc448077b99  linux-5.4.294.tar.xz
+sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
+sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
+sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a27e52c4c..2a8b2a863b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -444,13 +444,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.294"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.94"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.34"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.3"	if BR2_KERNEL_HEADERS_6_15
+	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.4"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
