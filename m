Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C92C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 04:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECD8F432B3;
	Tue, 18 Jun 2024 04:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C38tX6G7qAtN; Tue, 18 Jun 2024 04:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73CD340535
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73CD340535;
	Tue, 18 Jun 2024 04:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D07F11BF286
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 04:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE4E36088B
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 04:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G88K4ic0Bj3C for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 04:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1EDF3605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EDF3605E3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EDF3605E3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 04:33:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c264.dip0.t-ipconnect.de [79.214.194.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DCA0A4C2134
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:33:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43158)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sJQXL-000000005P7-0R0z
 for buildroot@buildroot.org; Tue, 18 Jun 2024 04:33:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 06:33:38 +0200
Message-Id: <20240618043338.7027-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718685219;
 bh=0rfX+/g5p6ZB2nYqcrZHXOx91bemdwO5G7Dnx9mKM5c=;
 h=From:To:Subject:Date:From;
 b=nG1J5FN3UYtwCB4bF4lKPL4OhqZb8KoecznIlGXTmGkTKLorVKUtt75F6gKpL/u83
 d5+ILMp3P8SSxl8ODkRRKV8JC7aGEzJ2djGynaffC4/LRcOO6MkE8/PlPvE7UfdI5G
 vx53z42uG6xBcMPv8CqrulCZ93kOK+WYBlC6+IB0hLiMog/FPfmF5ngwSDYU9itmii
 aS4CR5D9zvb2qkjiuhtzXKAik4EOeUVqPyQ5LUzLLOfLqbT+y5NLByWf1dmlmu8hZY
 JnYk33sEMH292FahU73NurfYNcRLC7X6FR9LtGJMYoqFM2hEm/uZ4uwePtUN0tO9o9
 iU916Wc4Q4nTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=nG1J5FN3
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 9}.x series
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
index 865b7fd240..588d7cab10 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.9.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ebd708bcb..3e2b923cfe 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
-sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
-sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
+sha256  a51fb4ab5003a6149bd9bf4c18c9b1f0f4945c272549095ab154b9d1052f95b1  linux-6.9.5.tar.xz
+sha256  c4e0ec8f593aa3717e85abad940466e7d7cbc362989426eb37f499330a461ba0  linux-6.6.34.tar.xz
+sha256  38ea71ad22ae0187fd8ee5ff879b33b0d9bd58161ac9a3e868ae0b4c66b95369  linux-6.1.94.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
-sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
-sha256  7e1f5b28588e49ddfd18e7772476e4e8b52bdc9c3e19beafcbb7c103e6c01f51  linux-5.4.277.tar.xz
+sha256  d629f78680dc4b65e3d78b61406fb7757b960c83c206e63ad8c2606b3e3c474c  linux-5.15.161.tar.xz
+sha256  93b73f15cc376463e6422cce09ccd9d0a20fb113921ffebddf3352c44d84cd30  linux-5.10.219.tar.xz
+sha256  e5a00606115545f444ef2766af5652f5539e3c96f46a9778bede89b98ffb8588  linux-5.4.278.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
+sha256  e4ff378baca72149d685abed9b59ba784fc97412b161796adcf3284a3287be52  linux-4.19.316.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b7928549c..7fd603db2e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -419,13 +419,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.315"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.4"		if BR2_KERNEL_HEADERS_6_9
+	default "4.19.316"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.278"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.219"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.161"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.94"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.34"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.5"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
