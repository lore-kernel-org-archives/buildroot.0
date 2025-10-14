Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7206CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 19:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B784119A;
	Tue, 14 Oct 2025 19:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZ--6U4s0nHA; Tue, 14 Oct 2025 19:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D12411AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D12411AF;
	Tue, 14 Oct 2025 19:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1AE2BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8155826DF
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74DbKOtXbup4 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 19:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3B10811BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B10811BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3B10811BA
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:03:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 835F3A4C6885;
 Tue, 14 Oct 2025 21:03:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43478)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8kIv-0000000061N-3QU6;
 Tue, 14 Oct 2025 19:03:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 21:03:26 +0200
Message-ID: <20251014190326.3589194-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760468606;
 bh=6RO8sGcNQS5rTvY14Uz3YenTxHH7oj4aHRfVbiwFvPY=;
 h=From:To:Cc:Subject:Date:From;
 b=uClZ+5iNV2zgghCMiiCh7vN3wHUfqr7depm9FEKJZbyZcHf0wW3SS1zZtERQfaaEO
 tcyAn/DKsWD6SN0Yv0ucveFX3/aWSlbwo/bb4BEt1t9ZJwGPWT1pYLAXBkfeThEXAT
 ux2Kh0E0IvqQLHxTNmrw2DpcaWGjk/OCmOkdFurW7qaIDlpUmOSQE3D41KKUhuHm98
 vEFNy1LXGsbGu6ywgsv0EOptXV2VPT+5ssUVW4O29uqYU6WmYE+gSMpFPrqOziV1hB
 ciaiqXpF2q9h8y5dukpr6EeeOZ1OiIz8jpQwwy48ey+6eHkkEDCyKmyew8dSO5Xi2i
 nhcruWfYLFAKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=uClZ+5iN
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump version to
 3.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/oauthlib/oauthlib/releases/tag/v3.3.0
https://github.com/oauthlib/oauthlib/releases/tag/v3.3.1

Updated license hash due to upstream commits:
https://github.com/oauthlib/oauthlib/commit/1137a2fbedb586f105c6512dabe3da17d0f8f88a
https://github.com/oauthlib/oauthlib/commit/059875a888d2200e43e18b818eda8442b2c3d0cc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-oauthlib/python-oauthlib.hash | 6 +++---
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 6a2ad003e1..5ee9a0ce05 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  2f7b898cc1af8c1409cc329e8843ea8f  oauthlib-3.2.2.tar.gz
-sha256  9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918  oauthlib-3.2.2.tar.gz
+md5  856bc51662afb26ac58b1d7742606b2e  oauthlib-3.3.1.tar.gz
+sha256  0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9  oauthlib-3.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
+sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index eb0ccbf46f..bbf59acedb 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.2.2
+PYTHON_OAUTHLIB_VERSION = 3.3.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
