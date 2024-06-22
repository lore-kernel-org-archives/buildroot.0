Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7282C2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 908B440567;
	Sat, 22 Jun 2024 08:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztzKYPzD9xvw; Sat, 22 Jun 2024 08:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3647740550
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3647740550;
	Sat, 22 Jun 2024 08:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26D121BF27A
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2059640799
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-js4d_08yK0 for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E20AC40727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E20AC40727
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E20AC40727
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:43:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82230A4C0403
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 10:43:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60794)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwKs-000000001hu-46rM
 for buildroot@buildroot.org; Sat, 22 Jun 2024 08:43:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:43:03 +0200
Message-Id: <20240622084303.10459-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045783;
 bh=C7qsN5X9SCsmEJF2E0TuvUn28lroLcmf9UEzdj+bTJw=;
 h=From:To:Subject:Date:From;
 b=u85sbpmGkuSwZNkMNeGMT3RBXDxFDDGUL+AT7wk3nFRxiKaklcG+uIg9zp9Z86T2O
 7GOExYUYFMUCeqZawi53z42m9gBEcxZVb/HwqoXptMsQT99h1tOaVmROvaAFcKcWrL
 Ouw3dDrgKMVu6CMDbvPnlKunQHvb6AMZccxTdBSB/0vy3SZD2iGc0R1t8yHerB8ULs
 Peab3zmDt5WWdqCVx/n/jj8bBH1aCxg7wd0SHoUMfUBZeOl691YjCTrAN/PAI1cV2r
 V+GbCSJBkuLuDzRXqrzxdyZTnjVQl6GjlC4m2JPpjBzGzJLqnsj8ljNZ86bwx87gJF
 vy3D+hgyeULog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=u85sbpmG
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
index 865b7fd240..decc520680 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.9.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ebd708bcb..85a2e7e391 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
-sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
-sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
+sha256  5d4366e2b89998f274abe03557ef3bc78b58e47fc62c102d51e6f49e5ed96b4b  linux-6.9.6.tar.xz
+sha256  fce3ee728712ed063aa8c14a8756c8ff8c7a46ba3827f61d2b04a73c7cf5dd9e  linux-6.6.35.tar.xz
+sha256  2960f0aa1d75665f39114ad3c272a999c54796e553a2355d0379f5188d14dfbd  linux-6.1.95.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
-sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
-sha256  7e1f5b28588e49ddfd18e7772476e4e8b52bdc9c3e19beafcbb7c103e6c01f51  linux-5.4.277.tar.xz
+sha256  d629f78680dc4b65e3d78b61406fb7757b960c83c206e63ad8c2606b3e3c474c  linux-5.15.161.tar.xz
+sha256  7cc3aff924e9707a5dbf1200c79a7f01617e097b9b175d02bda8ca762aeee19b  linux-5.10.220.tar.xz
+sha256  e5a00606115545f444ef2766af5652f5539e3c96f46a9778bede89b98ffb8588  linux-5.4.278.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
+sha256  e4ff378baca72149d685abed9b59ba784fc97412b161796adcf3284a3287be52  linux-4.19.316.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b7928549c..0a17e7947b 100644
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
+	default "5.10.220"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.161"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.95"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.35"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.6"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
