Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B4D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E713680BA6;
	Sun,  7 Dec 2025 09:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYEQ1Qi4N1G7; Sun,  7 Dec 2025 09:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0996E80BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765098871;
	bh=SRQVHOX2vrdavfy+0BL7tynB33H8eKnxR/xaIHJUjvg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WncfNYEIg9YuAZiibyf9xOYMI5hXs8Wik2wd66r7/+HBSy7P//CKcStqwPHz6rvgT
	 FUDGqRxo+rad2ZF/pK5+TWOXNGSaBVz+iFvM+i0g0S8GpiDMIW7ZX6Yv8hzzWvEy0U
	 LO1i4Vckrrxy9D0LMHOjpbsxcgHI+QDAjdkUwksV7JN9t2ibnCQZuKUOA27N/11bIq
	 CBXv1rzk2/+7vLduHLAjVKJ37VkhHp+u/KuZCk8uqdFzhzyPvBtyrJYzhGgER44ECx
	 W1ztmWwP/DwOs/oSAZuNKD8/ZaQHxExtResYihugrEZF7jNqFUxLiIUiGz/XCwNbzz
	 yQMpRZmws3wZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0996E80BC5;
	Sun,  7 Dec 2025 09:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4766F151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ECE64092E
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FYNxi7BJ20E for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F14B040843
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14B040843
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14B040843
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 807FDA4C10F8;
 Sun,  7 Dec 2025 10:14:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSAqI-0000000033z-1Dxe;
 Sun, 07 Dec 2025 09:14:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Dec 2025 10:14:07 +0100
Message-ID: <20251207091410.28979-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765098851;
 bh=jdpsuK6iHje8YaBnYXw+ueOIA7HMAakoBLqxKf9UeSU=;
 h=From:To:Cc:Subject:Date:From;
 b=YglNDDW+OrkylVM8i2I6ilOB5d946+LfXsE0j93PlvvzZci3N9W0BB5opqhhYYeof
 YWjRRoZlBFjUWKBVtQ30Rfk8XSN5txxtR7TZUMHcGFDfJZe1lwAwxW9c0NsQ+vYLfX
 aFKIb5QM78nfUDRWGrz4l/HaqILSbvQW2VLnAL5OoYZIrqaS576aV8CgOmaJT4eKOU
 6cSVw1pF0QH5RiuL7HH2ZOl37L4+Is61ezUa0Y2LXn1WEGdyTOym8ed3oY3csmzcit
 x1gIz/rXtz/eKxeD+NEhSfP2/kAjJu6imZfgKsRyo9KkV0dJEfkH/+dq3RSJMz1IxW
 1HpL0CNQFalqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YglNDDW+
Subject: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 17}.x series
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
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 78483c9b48..bde36d33ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bca5756926..fcb5bdb113 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fa7f344f3a50dad0af2e0066d51bd3b9183fd24587861042343ded3d1fd5c8cd  linux-6.17.10.tar.xz
-sha256  a63096b2147411d683cecbf87622bb2ff4885bac2b3641d3d4f10250c89cdcf8  linux-6.12.60.tar.xz
-sha256  4bdddce35474afc8d26f74ebfbcd0e1045ecd15f69e60f53529dba143374b17d  linux-6.6.118.tar.xz
-sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
+sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
+sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
+sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
+sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
-sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 79e73dab3f..a53f1a36bd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -459,12 +459,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.118"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.60"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.10"	if BR2_KERNEL_HEADERS_6_17
+	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
