Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854DED43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9E6816DA;
	Thu, 11 Dec 2025 19:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kg7apIg2jH3G; Thu, 11 Dec 2025 19:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E8580E70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483118;
	bh=dc7Me/+QIke44hlJVLPmuN63x4Lb4ivek7InyJGLOKc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W0Op8233GZizEeqzrPVwYrzTPKyH0T+BTPQTjH635EBee+rjgObQB2JHtHxSN/V3p
	 KjckML8Jw06m26QmaJiX0sLLRronRbZhw4KL0LcK7L9DrRUJxgVe38vyNwxkzwc//t
	 OK8/hfqOLjSOe19zYhZ4MMmRo7g9W2y2xTISdC28CvTqfQPUpCa8CIfhYfPynNRm7r
	 ckXgcnbUcifMZV3pqas057WdrRcmE5v9Sno2ohdCOWUZl5ljLDrIFViWX8Pxskp2B4
	 nvNETH994STWDCZMKzABLCYHKOVxm6+8L2O7DKmEZ9JY5Jo0YhCsKwKuHSx+Mb/+4W
	 gL6su/kCMhmBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E8580E70;
	Thu, 11 Dec 2025 19:58:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B30F82C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF5240012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhzdhBZLwlWW for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A65C340028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A65C340028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A65C340028
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06E24A4C3937;
 Thu, 11 Dec 2025 20:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-0iwN;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:21 +0100
Message-ID: <20251211195527.3276900-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482938;
 bh=RPOy25cmFpNVcQEy3TzwOKLn2FUCcNkfPYIG3AQqetA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fY5Pu91BeCzVU3kIMBxPXgI5xPzBlA2WL9yb+s+4ol+9WI0zPbjFBK/dutJnufkCW
 G1smdNFrvoLzxM+XblBLrIBtNEYIuBxjJJ+Gw+W0FDkPI5kiavCMov3a37WPadfRx3
 Ag4rro2Xz2mw99jDEiOcTseMH6cDySqcn+GABPJTsNfqX2FikOgC3tN7NLJGQhJMYI
 DvuzWV9LnrXR5DAO5pL+3h/v09Uc5C7Rqw0ny8MV/83vGuU/K2Se+You/olWvOR6+m
 qgwfD+vJdBh8RlGWcfULq/lqcXTVI63be2jfF/qXFob2fgCYq0sgXC5gKpG+q3Uhi2
 2tZPSbZNrlNXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fY5Pu91B
Subject: [Buildroot] [PATCH/next 15/21] package/python-google-api-core: bump
 version to 2.28.1
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

https://github.com/googleapis/python-api-core/blob/v2.28.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 16845addb4..9e3c732773 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  160d95edde90db1d72b6de58b673c993  google_api_core-2.26.0.tar.gz
-sha256  e6e6d78bd6cf757f4aee41dcc85b07f485fbb069d5daa3afb126defba1e91a62  google_api_core-2.26.0.tar.gz
+md5  fc633e6fd830f249f8dd205f10544660  google_api_core-2.28.1.tar.gz
+sha256  2b405df02d68e68ce0fbc138559e6036559e685159d148ae5861013dc201baf8  google_api_core-2.28.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index c88fb2ec28..908a37c3e4 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.26.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.28.1
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/32/ea/e7b6ac3c7b557b728c2d0181010548cbbdd338e9002513420c5a354fa8df
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/61/da/83d7043169ac2c8c7469f0e375610d78ae2160134bf1b80634c482fa079c
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
