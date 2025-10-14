Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC5CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813F34043D;
	Tue, 14 Oct 2025 18:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOk-QlZ6CLPp; Tue, 14 Oct 2025 18:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B052D405C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B052D405C9;
	Tue, 14 Oct 2025 18:52:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1207294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35F0411DC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXNqHtc47lZ0 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C42F5405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42F5405AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42F5405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7092BA4C6C36;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-0hIH;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:03 +0200
Message-ID: <20251014185113.3583315-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=3Z9RmqLhzDRe11sU7NPSBPoa8J4d/Ye3I8dGa6keZHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Eqqha8pwZhFRYXM1CUJtyEddONfOhR6DLVctzt9VkdzVxSrh6sMeXnrxm8J2NEohm
 +ilStJC4m+YUhrOn/onUSHnZrLc6ob9pOsAWGQCQqxS387gkcxVZIZV9YqYMmANjcQ
 RwYea340Qx/Oq5SiNoPyjjdE05fqP+YDGSa69DtnOWbTHxt4nxlxE3pgWZSNPYaRhN
 Iyllu5gMb25ykAFnqQj4d0UGspw7VwvqZl5/8kxqy691eIetsUj0zy0RbCmL9YyiJE
 Dzi0VBq677He/dzaNo5LDYJqiJrOiWaQYu5pSiYZD63txz6yVQP2iPpQMynJMTHbt1
 YtVXdv7Va+kvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Eqqha8pw
Subject: [Buildroot] [PATCH 04/14] package/python-validators: bump version
 to 0.35.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://github.com/python-validators/validators/commit/6d8a1abcdf2d92e113b1707bbf372bde4d48e3a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index e60f540f7d..94825df32f 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  8cae932ff53da1607ed2ca354a93ba54  validators-0.34.0.tar.gz
-sha256  647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f  validators-0.34.0.tar.gz
+md5  8376f37ec2028053cee8f4789dadd947  validators-0.35.0.tar.gz
+sha256  992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a  validators-0.35.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9d10adf59f4505a733162ff7de6887645dcef1fb495b8070d8b207da0f6b3a16  LICENSE.txt
+sha256  43f5c5d4ed194818baae8b6e2d2d09e9630752392efaa4b3f8da673d9a1a844a  LICENSE.txt
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 7db6d98546..3135b288ee 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.34.0
+PYTHON_VALIDATORS_VERSION = 0.35.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/64/07/91582d69320f6f6daaf2d8072608a4ad8884683d4840e7e4f3a9dbdcc639
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/53/66/a435d9ae49850b2f071f7ebd8119dd4e84872b01630d6736761e6e7fd847
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
