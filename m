Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E22410AB827
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B2340945;
	Thu, 26 Mar 2026 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQcMavIrIzTZ; Thu, 26 Mar 2026 21:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE9340B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559679;
	bh=6lMs9lWIsvmtTTvrw3DLwKKtjmnI32JLKyIL//MbRuc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S6L6pF71XzGkp39VbQVx/8+T3TidSPMan8sNHgNjm57HBQzAA+/IMycIMpSm86fel
	 IocDAVN2MVayUVccVvnoR3OuZXRRQdRR6h8IdiYA0b3Vazd2O+G4boeYXz+1JovCXh
	 319JSav3YUzEPDU0RGbcjbnyfMpXgrtbhp8WKvGi36HNXsQ2g/g2Qo9SIDKgt+UNAG
	 FndVKFRSaqze1mhyfZwd1cn8QhSVBWS6ArNq+bjqc2IdHUP/gKgBJM3Spy2hlwQ2cn
	 w6iZRYyijaF5WoIJNJG0FZSVPj0tLpqMTihYhgt0xUcY1PoOb9Z7S1kpYzAd3I0Yeg
	 fe0O5JpIcHk+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE9340B5A;
	Thu, 26 Mar 2026 21:14:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A22249
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 604CF814BF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IA_toAWUSAgH for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D47B4814BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D47B4814BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D47B4814BE
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5CB2BA4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:14:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34152)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s2B-000000006qk-3nBB
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:14:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:14:31 +0100
Message-ID: <20260326211431.3598591-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559672;
 bh=Z5gV3qzmbK8xMh8+n3wz//jWUA0LugS/KPcN4qt5hG0=;
 h=From:To:Subject:Date:From;
 b=tNCk33Ery754usLrAZ5WnU/fHEEm5DwTpR/1+G6GwS+Ds7VE49Aj9p4NCPX3xNL6s
 hxYy3OAiKogVoNkFf+fT1f87XVUmwHmZDKKLqCNb3UlHhq6TA2ESZTHcXujEm5XKKX
 fe70TIaPn3fLujUQUi6sO9GQWdQ7O+Qd0DoukWsUfIxrejnacrVAuDg1n3O1zDOJDV
 4ra+KoOimbDSeJwcybIyFB3eMdtO+A6nPX3hZb/K9tsxlYgX2mIhshm9XBVuG7zdvk
 +8XXAG36nFKaYLM/54As32wp5zKhp3x1XdHVyILjiSm5RX2YdrPoqesywPuBo3FWD+
 pEi17tmg/jVsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tNCk33Er
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12, 18,
 19}.x series
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
 linux/{6.19.8 => 6.19.10}                  |  0
 linux/Config.in                            |  2 +-
 linux/before-6.17/linux.hash               |  6 +++---
 linux/from-6.17/linux.hash                 |  4 ++--
 package/linux-headers/{6.1.166 => 6.1.167} |  0
 package/linux-headers/{6.12.77 => 6.12.78} |  0
 package/linux-headers/{6.18.18 => 6.18.20} |  0
 package/linux-headers/{6.19.8 => 6.19.10}  |  0
 package/linux-headers/{6.6.129 => 6.6.130} |  0
 package/linux-headers/Config.in.host       | 10 +++++-----
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename linux/{6.19.8 => 6.19.10} (100%)
 rename package/linux-headers/{6.1.166 => 6.1.167} (100%)
 rename package/linux-headers/{6.12.77 => 6.12.78} (100%)
 rename package/linux-headers/{6.18.18 => 6.18.20} (100%)
 rename package/linux-headers/{6.19.8 => 6.19.10} (100%)
 rename package/linux-headers/{6.6.129 => 6.6.130} (100%)

diff --git a/linux/6.19.8 b/linux/6.19.10
similarity index 100%
rename from linux/6.19.8
rename to linux/6.19.10
diff --git a/linux/Config.in b/linux/Config.in
index 28772ca646..f41b03c795 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 1c6a6ab553..e81e4254e8 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
-sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
-sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
+sha256  719781b4b4faececa0f568bbcbd4fea8f4aef40155e85ad66f61624bf2f4af3d  linux-6.12.78.tar.xz
+sha256  2460aa67b9494cff6f9fc2b235470867d2005469d40f29da452e8ee82940248d  linux-6.6.130.tar.xz
+sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 5e4f727a84..03202b91d6 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38  linux-6.19.8.tar.xz
-sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
+sha256  466d441a0ea5e04b7023618b7b201bfd60effab225f806fd41ce663484395a1c  linux-6.19.10.tar.xz
+sha256  837a5abd98e46078a0ae1400e2daad89ece45cc3209037b09c2265dab2393553  linux-6.18.20.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.1.166 b/package/linux-headers/6.1.167
similarity index 100%
rename from package/linux-headers/6.1.166
rename to package/linux-headers/6.1.167
diff --git a/package/linux-headers/6.12.77 b/package/linux-headers/6.12.78
similarity index 100%
rename from package/linux-headers/6.12.77
rename to package/linux-headers/6.12.78
diff --git a/package/linux-headers/6.18.18 b/package/linux-headers/6.18.20
similarity index 100%
rename from package/linux-headers/6.18.18
rename to package/linux-headers/6.18.20
diff --git a/package/linux-headers/6.19.8 b/package/linux-headers/6.19.10
similarity index 100%
rename from package/linux-headers/6.19.8
rename to package/linux-headers/6.19.10
diff --git a/package/linux-headers/6.6.129 b/package/linux-headers/6.6.130
similarity index 100%
rename from package/linux-headers/6.6.129
rename to package/linux-headers/6.6.130
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b1f090a2a..01331e9d98 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,11 +466,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.18"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.8"	if BR2_KERNEL_HEADERS_6_19
+	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.130"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.78"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.20"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.10"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
