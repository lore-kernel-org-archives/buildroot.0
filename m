Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B6D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B1F40690;
	Thu, 11 Dec 2025 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YEtClv8y-tY; Thu, 11 Dec 2025 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989564110C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483142;
	bh=Li41rh4XTBp6o7rXzuPXL+M+pVhRZSsaxk2G0hkbgCg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KS2kG9jxij83eAcf4BIkMfB2rFCuBP8HEhWcJc4vePKSEHOLqom9H9zM6bEbe+xSD
	 9yZmu+4szxqDwkSQRhplNEDisNpUAbvXatSwJG+tctJ496XWqcMQv6rFFzVz0OZC4a
	 oSfbyvjh/OYIfgMg2vggk5I9m2mYnurTrkcQ2hoLcQtiFTdmuZkHo1JSsep+7DgD51
	 STMJdnIU23kt6gG+KkIdmYfoIJCNFAHYhuuZAJQrbSlNnt+zQMF+zCA/S8Ih7Jh6Pp
	 YY66cUsSwHeAsmaT3gM9Vv8lqyWbPeTpSP0gY5pRbPwu2CXB921l/LGffou/2vm59s
	 LKsu/XQPn5TsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989564110C;
	Thu, 11 Dec 2025 19:59:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 041D92C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE7F381586
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_4DrV45lrna for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2F6580A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F6580A93
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2F6580A93
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B050A4C3938;
 Thu, 11 Dec 2025 20:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-1NUi;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:23 +0100
Message-ID: <20251211195527.3276900-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482938;
 bh=sgl9tVQBLyW/bHpbXRkls3+DMk/bseKDeTu1BMCfO8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dVNy03S3txkLp9DtRtbpuB7MtT52M2RFGCER9XKHRTwNEvGjzi4tXeLrtKE16kBUq
 aWjWVNqCdyv/VRTRSILbeFUNwBxlRzaCkAxElW+SLX/BJjUTfXUMUseQEbo5YeX5mn
 QnOwfDtBkd1+Qjmvo7PY1Zbs83TFRKGM0ekX0gT8MdhodvR5PV5pzvozOCgdmyGZ9K
 hJf76rxkh0hVsIVcVJKVIIxgizifYnUUTewJiVNZrWnbXXmEnEE+LcqUWuolovGiNh
 qBVp6JVn3b49LogZGzV6UmNNhBIGGPipcreJHHv68MpDAlUGeHMuigb0pjVYRxkgTe
 vahdoQuU3T9pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dVNy03S3
Subject: [Buildroot] [PATCH/next 17/21]
 package/python-googleapis-common-protos: bump version to 1.72.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/google-cloud-python/blob/main/packages/googleapis-common-protos/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-googleapis-common-protos.hash                      | 4 ++--
 .../python-googleapis-common-protos.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index a00b871bb8..682ea22690 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  fca59b82ad99d5dc1da6a94e5ec6e819  googleapis_common_protos-1.70.0.tar.gz
-sha256  0e1b44e0ea153e6594f9f394fef15193a68aaaea2d843f83e2742717ca753257  googleapis_common_protos-1.70.0.tar.gz
+md5  58ddbf8920c529b542af9be18101fe61  googleapis_common_protos-1.72.0.tar.gz
+sha256  e55a601c1b32b52d7a3e65f43563e2aa61bcd737998ee672ac9b951cd49319f5  googleapis_common_protos-1.72.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 6afd1ea740..e72a7b45de 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.70.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.72.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/39/24/33db22342cf4a2ea27c9955e6713140fedd51e8b141b5ce5260897020f1a
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/e5/7b/adfd75544c415c487b33061fe7ae526165241c1ea133f9a9125a56b39fd8
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
