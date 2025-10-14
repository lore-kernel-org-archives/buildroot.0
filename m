Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08290CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21AB40CD9;
	Tue, 14 Oct 2025 18:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qE1EzhcdOsMC; Tue, 14 Oct 2025 18:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81B740CDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B81B740CDD;
	Tue, 14 Oct 2025 18:51:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBDB4BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2BFE411E2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aUbqcLrFnjF for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30F6D405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F6D405AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30F6D405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFA58A4C6C34;
 Tue, 14 Oct 2025 20:51:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-08t2;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:01 +0200
Message-ID: <20251014185113.3583315-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=qt1BokCFZ8n2ItSwogKluhrOhr+yz7rX6Q2N6SVKXoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BBd/OXNxQE6vLuCD1LPeIIS/hyqNI0vTSqdrvcdQPinxsB5qUp9pN828f9/fchiyJ
 5RWtZNOSgLvt+KDlq5mN291TgVeDieqM40ULGV9aPcRhv4uRhYgRjCyPQy8ILjHRSc
 udZS7ZeBxJuTtguABkihddOpQnAFHsecFQY61VPw8Uiu7tvdulRJMjfTbSzEzFVpVf
 7Vb7yP43eFSFddhNuHSOBjD3qUyTKpIPUJyBtsXhWchW6mFZ7bJpiieXEORzU+koIJ
 irGLeXnTq22kVR1WFuWpJDtWiOizeAX+mpw5bue2hgQuMGTDpVLEptzfxLjaRv1SIG
 al/bTuxecwKAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=BBd/OXNx
Subject: [Buildroot] [PATCH 02/14] package/python-trio-websocket: bump
 version to 0.12.2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-trio-websocket/python-trio-websocket.hash | 4 ++--
 package/python-trio-websocket/python-trio-websocket.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
index b7e8302b58..3c73f33f37 100644
--- a/package/python-trio-websocket/python-trio-websocket.hash
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trio-websocket/json
-md5  3d9bb51b62f562dbdbc2ec067132c4a6  trio-websocket-0.11.1.tar.gz
-sha256  18c11793647703c158b1f6e62de638acada927344d534e3c7628eedcb746839f  trio-websocket-0.11.1.tar.gz
+md5  d46fc1eddcd2b3bcb704d4cba65ad663  trio_websocket-0.12.2.tar.gz
+sha256  22c72c436f3d1e264d0910a3951934798dcc5b00ae56fc4ee079d46c7cf20fae  trio_websocket-0.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2d5e3fc506b6c87ad93b77b9aa76009a58fea72be5fb56e6803bc08cb2887999  LICENSE
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
index 3e79bb7108..f4a9304f15 100644
--- a/package/python-trio-websocket/python-trio-websocket.mk
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_WEBSOCKET_VERSION = 0.11.1
-PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
-PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/dd/36/abad2385853077424a11b818d9fd8350d249d9e31d583cb9c11cd4c85eda
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.12.2
+PYTHON_TRIO_WEBSOCKET_SOURCE = trio_websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d1/3c/8b4358e81f2f2cfe71b66a267f023a91db20a817b9425dd964873796980a
 PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
 PYTHON_TRIO_WEBSOCKET_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
