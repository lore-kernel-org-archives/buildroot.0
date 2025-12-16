Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1748DD637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9886107B;
	Tue, 16 Dec 2025 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIIIiVgUldoB; Tue, 16 Dec 2025 19:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E908461034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914159;
	bh=aysVbYB8p4N6cIC40Vb/lgcjQ0sXXOXGYqZNINWOrfM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IvgzP//FEZ4ADkPZiaQSRzggglp31MqsLlfg22wpGOdUyfd2RUpTarN+JA6w9W0Ly
	 aJKZDe81UCtdWGJYolGnsWwqnN7wm7ebZi6JvSCA0Q3D2zOKZ6c/tHPsijqz5BjM2T
	 k5a9/op5Jf7ULt4h3ROFeXsJGwgsEfvhq+ULlzX/oiy6n6zyqd9ocClv5j1noMN4eU
	 D5ndFLa6NBMKZQWo7eNtgIXlolt18k9RetEki0li6/9RJzqAujn0YhY+wH5dOsgj0C
	 PyUX0CYjXXJsWLbQpuXiMmOQNoUE1R0GM4/XC5qA/qRDp+7DCVREcgRAdy+BEq/bPx
	 zE6lfFxuxjSVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E908461034;
	Tue, 16 Dec 2025 19:42:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D2FE364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D862E813F4
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQt8aeMGdb8L for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC3498125D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3498125D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC3498125D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38610A4C45A2;
 Tue, 16 Dec 2025 20:41:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-0mhC;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:57 +0100
Message-ID: <20251216194119.3020421-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914089;
 bh=CvsAjH8jmknEXjZmAD1qjkoKMdfpNLs85lqDkt81WL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c3gKSRkN34nlUz27NFawaHsIpbTP0qZznQzEfcnPr1pye3zE9bJHDB/y2RfAQrPpl
 j8fLOMRYLKkIy88FdQrS+7BGVQe6EgcewF4DtKtEd+HHn3zfJ4PwKXrJkOr1nNftL/
 tl9/Ie+HJG6AqeYQddm+cvfndPy6ZWaVtph+6zAoN/wXfuMD7cfuAtlgAnOO4/Pzmx
 3+v2XPjBWuqZNhdcCiVSXwYvT6OJK9Vc8bi5m8i/vAHFXLpViQDHCHU8/P23KrvBht
 aXqqY5VdQv5WlPcJroYqWvmvivHfyP3Ze/a8S98+izPFIlnYNSe8OoyOpRFQkofT2F
 Fi0D0Wd4g4h3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=c3gKSRkN
Subject: [Buildroot] [PATCH 04/26] package/python-soupsieve: bump version to
 2.8
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/facelessuser/soupsieve/blob/2.8/docs/src/markdown/about/changelog.md

Updated license hash due to copyright year bump:
https://github.com/facelessuser/soupsieve/commit/a616022df73ddc5ecb71092155be9baba876b52d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index d220c8c772..8dbcd237f7 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  19126989f90d775ebe752b7fcacf1fc5  soupsieve-2.6.tar.gz
-sha256  e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb  soupsieve-2.6.tar.gz
+md5  111f637c4017009883667bea09b0a442  soupsieve-2.8.tar.gz
+sha256  e2dd4a40a628cb5f28f6d4b0db8800b8f581b65bb380b97de22ba5ca8d72572f  soupsieve-2.8.tar.gz
 # Locally computed sha256 checksums
-sha256  7e1f14c81e9939ef23b472176cda08410cc238752d180abaa0151d8a1c48f594  LICENSE.md
+sha256  571d0dafef795a196a0bbc3ac9b160a06b3cad41c320fecd98da3e26a8c81971  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index b37d552fe1..cec1b63b19 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.6
+PYTHON_SOUPSIEVE_VERSION = 2.8
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/d7/ce/fbaeed4f9fb8b2daa961f90591662df6a86c1abf25c548329a86920aedfb
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/6d/e6/21ccce3262dd4889aa3332e5a119a3491a95e8f60939870a3a035aabac0d
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
