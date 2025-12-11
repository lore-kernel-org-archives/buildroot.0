Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BB7D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB381410F8;
	Thu, 11 Dec 2025 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3gc-yIDmWGf; Thu, 11 Dec 2025 19:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE0B40A3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482934;
	bh=skdQo1QTTCBsYb+7aBHVeZEJY/7Iw8z8nIwrzaWcbKw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MXWuplPtFXP7XXiBNZ/l2lxWJ1FfApTzLUKBU7Ud1Yp8MHC9Iic3LiYMeE0L3jqZo
	 oGkrB+Mwntcnsk9U4Rdp72ZGMxb3oZHqb77m5JcC7ijdYP4uTauAF41ZtIVLDFTYY9
	 4USEhWO0pvXienSJ9HOhcQ0L6Cj3PQzivtHAtIzQdkIznyuWk7V9JWUy41jPRZi8h6
	 8kGWiT6vQ/XHg5v8KjezvWA3t8IFlVXqn2x8pCD5FGV541SB+W2l+oyJdsDEzOw5im
	 qj75nefFS8V2A3NpYyV4llYbqQYZJiJDCyUTpw3JufkijV34W1kh4OUd5kw9Yhr1PT
	 u1iJ94nM7eBbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE0B40A3A;
	Thu, 11 Dec 2025 19:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F512C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E821B40029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzh6_jN7wegv for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D268D40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D268D40012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D268D40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30772A4C1FCF;
 Thu, 11 Dec 2025 20:55:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-0DP5;
 Thu, 11 Dec 2025 19:55:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:07 +0100
Message-ID: <20251211195527.3276900-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482928;
 bh=LWRKZ5UmmnLYrFgNoHp2rMz5TLJ8LOJbDDbLNHcVtH4=;
 h=From:To:Cc:Subject:Date:From;
 b=un9w8RtN71nEmu7JsMarLEDUlEBb0g+ROJSmqs+K0MUby9gD0qGsSHd8xSVDq+VKr
 fETdgqUgLWfJfM70JrN7ti1KLSjQqFcBouRP2bMhrHWax/nBbEbrDYqsf+GninD8yh
 RxPR5EXdfo7uLsW+KJwj/aJTYygXt3ahIusxPtEDkl0ptyOsPI8D03t3+ly7HYWgOA
 HhOG5u4jlu/u2KgHfZu1Q93i6ezd0PHOI5rK+o7Ov5jql7uQXifqLXcLAv1maxkf12
 etqEsL+C7XAIufl9B1AWXOsVI4XNq3HuE08llg2AkvMf7MNJvlzhHU0LXCWqZwFC7r
 fmFL69AnvTu8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=un9w8RtN
Subject: [Buildroot] [PATCH/next 01/21] package/python-cheroot: bump version
 to 11.1.2
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

https://github.com/cherrypy/cheroot/blob/v11.1.2/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index cb3119def9..64d7eebb28 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  5299bba86f892b2a8e7f1678e45b96ff  cheroot-11.0.0.tar.gz
-sha256  dd414eda6bdb15140e864bc1d1c9625030375d14cbe0b290092867368924a52f  cheroot-11.0.0.tar.gz
+md5  08ccbea749c4cd35b7371ced995d08b2  cheroot-11.1.2.tar.gz
+sha256  bfb70c49663f63b0440f2b54dbc6b0d1650e56dfe4e2641f59b2c6f727b44aca  cheroot-11.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index b0086b93df..4bd382ad65 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 11.0.0
+PYTHON_CHEROOT_VERSION = 11.1.2
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/f4/01/5ef06df932a974d016ab9d7f93e78740b572c4020016794fd4799cdc09c6
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/68/e4/5c2020b60a55aca8d79ed55b62ad1cd7fc47ea44ad6b584e83f5f1bf58b0
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
