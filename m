Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B607D58B08
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 09:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548B460AFE;
	Sun, 15 Mar 2026 09:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qON9LQrbAHZH; Sun, 15 Mar 2026 09:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BCA260FBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773565436;
	bh=4RlNQW2wW+wyaiPPmT4k8aG1L38syJYKtfIAgzDhgUs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AXAvuxLn3BDD/RCCz20EoKxBqYdvpkkOHvQV1XJaORyJkY7vu+E3CtNa/ruB1I3WF
	 jJ4covLyLWdWCIznH6WL8zXbCZD4Pbn4YOVod/Pon7bUJXfTp4Wsd3Y2ayHMWnSGl/
	 67HIZ51ZdbPnIXrl88DHK8sPIvdoH4bz0e+v4C0U8QHdGemfKQ6GufUxobL0pTC+7M
	 +LwVej7vUtPavw/LXc0cKDUJaVyo1lTQ3jkkTpRCWqsQPT0Jr7fEV7F2aOWZVry3py
	 pH6tA3Bddw4DRCHH+foOUhxD2AeT9c8NgAtBKlpNsr44TLQBKajigCoJshAS/QM+rV
	 YpTkjbyq0LnLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCA260FBA;
	Sun, 15 Mar 2026 09:03:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A94D1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 09:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 073D7404DC
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 09:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzhWRYCocqNt for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 09:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12397401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12397401F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12397401F1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 09:03:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B1F0A4C0DB1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:03:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52288)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1hO2-000000004jz-2pTK
 for buildroot@buildroot.org; Sun, 15 Mar 2026 09:03:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 10:03:50 +0100
Message-ID: <20260315090350.748082-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773565431;
 bh=sdAZYYRFtRa0NZETuyN4AShjAYd+GPnvzFWIxKL/Bw8=;
 h=From:To:Subject:Date:From;
 b=g/YxO4geqnY5FFZgVqiPHgLPx65L1WAf8NDY+qjT3vldm79uyn2XzrB7IwpdNv0b3
 uMYvu4ymN7q5Rx2BkaKDT7Z+kfPYv87n+w4Bt38YKQ9IXVDpCVy28q7SQ+JwFn3YnD
 ++70hGI+ryhMlYDo5l36d9IB3LkYnhdUzFfDAwp+I5rJCtzSiJwyqPng7GcLacVUGW
 LCEcU9n+fUtcHSq0DDySXtP2M8OdHHMhfnPcy9aP/baBgq1CNxuy99BqQaHH0jbyf5
 ttPq9wjlhukSFYFjqvwQuZv32SZEH88NSz0zsBTp+LBAFF7NJUFu+KdsON0jCL4TN7
 GLh296UihF4tA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=g/YxO4ge
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12, 18,
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
 linux/{6.19.6 => 6.19.8}                   | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.76 => 6.12.77} | 0
 package/linux-headers/{6.18.16 => 6.18.18} | 0
 package/linux-headers/{6.19.6 => 6.19.8}   | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{6.19.6 => 6.19.8} (100%)
 rename package/linux-headers/{6.12.76 => 6.12.77} (100%)
 rename package/linux-headers/{6.18.16 => 6.18.18} (100%)
 rename package/linux-headers/{6.19.6 => 6.19.8} (100%)

diff --git a/linux/6.19.6 b/linux/6.19.8
similarity index 100%
rename from linux/6.19.6
rename to linux/6.19.8
diff --git a/linux/Config.in b/linux/Config.in
index 7114aabc4b..28772ca646 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 90e67be8bd..1c6a6ab553 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  bbb43e834c46e6bd49a5c28f22e679a937443404e1f653204d4b24929f3ad896  linux-6.12.76.tar.xz
+sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
 sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
 sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 93ba293fa3..5e4f727a84 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
-sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
+sha256  aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38  linux-6.19.8.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.76 b/package/linux-headers/6.12.77
similarity index 100%
rename from package/linux-headers/6.12.76
rename to package/linux-headers/6.12.77
diff --git a/package/linux-headers/6.18.16 b/package/linux-headers/6.18.18
similarity index 100%
rename from package/linux-headers/6.18.16
rename to package/linux-headers/6.18.18
diff --git a/package/linux-headers/6.19.6 b/package/linux-headers/6.19.8
similarity index 100%
rename from package/linux-headers/6.19.6
rename to package/linux-headers/6.19.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c2f9a7aa2..5b1f090a2a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,9 +468,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.76"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
+	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.18"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.8"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
