Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC8F94CD3
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 06:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B599D42383;
	Wed, 22 Apr 2026 06:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51EpdchomGEO; Wed, 22 Apr 2026 06:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1F742397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776840737;
	bh=pmYyFHEiYKJl6IZn5PvskMJH+Of3W4PTKQHxxpt+7Q4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FhsOKVLn0hoJ4tLhiK8wjAILyWkjd9f8dSsnok0xL+Y3Zf5t27KydgQcLDFG3LYbl
	 2ErCKIy4V8xXwhjbWV2rCrIWpgvBjITVcNgpD2Gawa/KbGtrN2ZhjJTWaqtbISMyXK
	 t8MV+0S+1BzqOGAwyjjMyZumcA2P4vMM6fuxn6cGFFhVmNJy4FUw15dd3zIOtwG9hS
	 Kk2TOIjX5UDkunw6alePuOQEtjTZG8fCeHEQDGbrsB5jeOzzHzwpZl5j70Wi/W/Jcq
	 l+AY3JP5UvsSlWHrnbTFl/6QbEIBs9rrqByAPyENIptetx3d1aWggeJ5GF7ndP7nfd
	 1GNkmL9cOr/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1F742397;
	Wed, 22 Apr 2026 06:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1BC24D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 06:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A339E616D6
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 06:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXpMSshYUn9U for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 06:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.42;
 helo=mout-b-112.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2CA9616D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2CA9616D5
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2CA9616D5
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 06:52:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4g0qf06wd0zDv9F;
 Wed, 22 Apr 2026 08:52:08 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 08:51:37 +0200
Message-ID: <20260422065137.768158-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4g0qf06wd0zDv9F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1776840729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=85ZXBnafzEt2gfRYFVEpRYVBfMjE0CFYNNeqf9ln7rI=;
 b=yJVN80eC+P5ttqGHoGTFyaNRAETBSI1EoB3rSLi9DUukFtOppfSoxt0OVXW6vZxRaR+BBY
 /9EKBkemQxL7X6YrHjdBdYZG6DEzx2BNgfZCR12D9r/NRb2bH/RwOScA6hR8kKhB/GSlsR
 caparFcoWBNui7m8Wig4dw0QnKW+rl1k0gG7fcyME/pB3ZPGlX3QBdSEsN1ymb7floWLQl
 +DZB9S9UYJJBO8GzuDSgbJVWwUWiBUIr4AWieVA8/ar+/cwf96capDq4yMTp+rC57IcxS5
 hQPE6vpCxA+rxgw7UYswFqKypv/3t9JeNNMlXDLCOFfTHAL/j23HLTUJPxZIMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=yJVN80eC
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.136.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This includes the following releases with the release-notes:
- 0.135.2: https://fastapi.tiangolo.com/release-notes/#01352-2026-03-01
- 0.135.3: https://fastapi.tiangolo.com/release-notes/#01353-2026-04-01
- 0.135.4: https://fastapi.tiangolo.com/release-notes/#01354-2026-04-16
- 0.136.0: https://fastapi.tiangolo.com/release-notes/#01360-2026-04-16

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 1a2305db5b..30be9955fa 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  2715eac2931aa6e53a0507d8574c1901  fastapi-0.135.1.tar.gz
-sha256  d04115b508d936d254cea545b7312ecaa58a7b3a0f84952535b4c9afae7668cd  fastapi-0.135.1.tar.gz
+md5  470ab99de13de14ea88d7071257944f5  fastapi-0.136.0.tar.gz
+sha256  cf08e067cc66e106e102d9ba659463abfac245200752f8a5b7b1e813de4ff73e  fastapi-0.136.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 6aa70f2f2a..b1775eff88 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.135.1
+PYTHON_FASTAPI_VERSION = 0.136.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/e7/7b/f8e0211e9380f7195ba3f3d40c292594fd81ba8ec4629e3854c353aaca45
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/4e/d9/e66315807e41e69e7f6a1b42a162dada2f249c5f06ad3f1a95f84ab336ef
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
