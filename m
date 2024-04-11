Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB55EC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E083608DC;
	Thu, 11 Apr 2024 21:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CThY0vk1_r9h; Thu, 11 Apr 2024 21:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966A9612B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966A9612B5;
	Thu, 11 Apr 2024 21:02:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A3B1BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D581782274
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqPmrRMkvYfo for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E660282269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E660282269
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E660282269
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:02:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10CC6A4C3057
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47548)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1Ya-000000001Ky-12kV
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:02:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:02:04 +0200
Message-Id: <20240411210204.2127966-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869325;
 bh=NKY3sHQxZ8hnzpnPI67nZltc9ArFTZKmjS//CuRVkKs=;
 h=From:To:Subject:Date:From;
 b=WsZXtCdvguZ4HEk5OD/8GfX3RWFh2hwNWXjmWo/F4VntBOCuoDJq4ho8Cs0r1Vh2j
 42yFT8TLp2MPbeebQzXnBUViumwJX52RLPf+1/x3Xm0sJrkSiExCNeo4Kr4tqwF6dx
 4okSWHAdNecbj7pw/unvD9xCyeSocb1ZjVn90VzD15RJVA76TxATguEEjv05EIU3Ra
 mzDE0Pn8cQri3OTSvzy+Fp2SPZmvVW3AhioPSWk0jvn0ZqISbEWNOTnQREXtyASszM
 EiO0FPq6JT8gD58PFsXb3V8fCw6FQ8Xk8ySvkQNgecL+O/WUxsFW0Q+H381RBbs7K2
 m6zYHztnq8/gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=WsZXtCdv
Subject: [Buildroot] [PATCH] package/libopenssl: bump version to 3.3.0
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

Changelog: https://www.openssl.org/news/cl33.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
run-time tested using my usual defconfig

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 841d4b4cfd..aca75cf9e4 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.2.1.tar.gz.sha256
-sha256  83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39  openssl-3.2.1.tar.gz
+# From https://www.openssl.org/source/openssl-3.3.0.tar.gz.sha256
+sha256  53e66b043322a606abf0087e7699a0e033a37fa13feb9742df35c3a33b18fb02  openssl-3.3.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index feb5026c02..5ac6bf9713 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.2.1
+LIBOPENSSL_VERSION = 3.3.0
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
