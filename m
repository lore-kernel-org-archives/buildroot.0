Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8FBE6749C
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 12:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390FF80990;
	Mon, 22 Dec 2025 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gcNuvppyF0w; Mon, 22 Dec 2025 12:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B5A8084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766407253;
	bh=ZndLv/V4ozySHqq26Fgp6cVfHRwLXUxittithLVOA/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Zy8LXYtyYLGkayHrPSwSz77CrQfxPMOuIvul8nWnE0+ZO+BKZymTjrxZAKujgfoST
	 jGpd2zKXQFnr3Qhcx+LhaoinFXHAQcCgmTIjTFMGZqsnde/fBbC6xsrD8z0+v3RQD0
	 2N9Pxrib4DX/MGl7zhOGTmHD8olLhfA8WNCISpTl8C7JC2U9SZM3i7pYbbr0cRRVZl
	 WQwItxz8Yc2DMezRPIfpCZCnzWJj03IT6tSsdyBJr0tZgI9OveYhQbv5gSgr/8vnE8
	 N5/VLVL9p0/E1WoTaggAXqZyvKYPuKqBIMVuMXx+CwScDLg6DqeOtcL25/f/+koawH
	 W6uCaX9dCJ5qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B5A8084D;
	Mon, 22 Dec 2025 12:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4A1C195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAA918084D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVEQT1VwIocc for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 12:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EC8F80844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC8F80844
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EC8F80844
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:40:50 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1A9D32C80CD5;
 Mon, 22 Dec 2025 13:40:48 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 13:40:49 +0100
Message-ID: <20251222124050.77775-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766407248; bh=A/lW+SQjJJWX7agjXj+ZREMRvdC3dGhZZ6T88862fAI=;
 h=From:To:Cc:Subject:Date;
 b=LoT77zgBJoyOsUDqTtsYuX7/xdJUKuB5EqLI8/a08A6xG1Cj9u0i6RMYsd6QgEKm7
 S49n25fpaXPsBvrFeF+2W4sNE7pSN+lvjvbN1rfPXoXn2CBGfAv+YOq4EyntJI5SAY
 YxJcH/K8yK+F1SOEhshAaNIixANWRQnwwLwWCOrY6e4hD23ENc53ZsaGksOZk9ZCI5
 3BsqMx1hVt5vA0fcJ7VmnYQ9PRs6WoHOg4l+7XjX6TY5g1dc/d6zO1VLmzAldbkXMo
 X+Lt+SKmpmnEvM2egIpLj0VS9bMbLc7V7CBjKTPU/LaWM/Z/u8H+ksoOy1Fi0e1oEI
 TPKTRKkVMiS4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LoT77zgB
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.127.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/fastapi/fastapi/releases/tag/0.127.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 6814876e50..a514fe09e7 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  bbc8c95d2b4566f55b8628f4ed4bd673  fastapi-0.126.0.tar.gz
-sha256  f099fceb2a6d56dd21c59c4543d00be123dedacff869e76ae31ba3c0f963e2cd  fastapi-0.126.0.tar.gz
+md5  b2126a9a8e4645e94cf07190d9a37bdd  fastapi-0.127.0.tar.gz
+sha256  5a9246e03dcd1fdb19f1396db30894867c1d630f5107dc167dcbc5ed1ea7d259  fastapi-0.127.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index aa076779af..36b892c060 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.126.0
+PYTHON_FASTAPI_VERSION = 0.127.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/03/6c/28773e19bc203a2f3cf1d54a8e96ca7d05b58157a350aa4d8d37f2a5ba07
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0c/02/2cbbecf6551e0c1a06f9b9765eb8f7ae126362fbba43babbb11b0e3b7db3
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
