Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A24D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7653180A93;
	Thu, 11 Dec 2025 19:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhjt5Friy4t4; Thu, 11 Dec 2025 19:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93EAA8162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483092;
	bh=XefMeLK1kcIEHuQwVQLExb/KNrr/lGMbij4mKyp3Gdw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a+FoTys3HQuuikuKW7QW6IfjBv+GfrchjhZl44P4DSCaksmKDcyYkdXS7p+/4bN+H
	 R/twzeaWTarhY62OMduHLXEhaLvY39d1ZAMM+s6UiyrpqI3XWOcI6srWS5L1uxyNFU
	 GKqvhkaBe2wxlJZuj6ZtsKHq4kB9b/pFuVt330uTmsOy29TlOjetgMV2lY2noUrOSF
	 UayPbWVwQfb6nuVYrQ5CY45LcjeiWNb8PQceoeF2vvitodNB0AZZwdI+6hAT/tWFqy
	 ZRWaw9q5omIlGCOcaw3pMmvW2C5FuPAR93XkyqS/w8JfqDAWhs+AGKgDeyQvB1evhO
	 GfZ7ShuZY98Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EAA8162F;
	Thu, 11 Dec 2025 19:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFFA02C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26EA409EA
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqhOZHtssgti for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA833403C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA833403C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA833403C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C3B4A4C38EA;
 Thu, 11 Dec 2025 20:55:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-04vB;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:19 +0100
Message-ID: <20251211195527.3276900-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482937;
 bh=ltCd8h46PmHH150jJqL4cVf6Vt0PQqQv9kVNlvT3B+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=knD3dDWKUGP2n3RdzJNxC0rfTs2j3TGzbbHN5X1cH9nUCPj/B2zHy53faE25vk46u
 rQ0JltA8NRtr/pXnhCD1CIsXawNWuUZPZ6dLDpc5n+tSyYLCXN4QRp6S/W9hc213Nw
 5gwKKt+RUNnQUqwfBl8CY5vYzfc0EIYqn7PRFU1X06d3WL7k4uKFdFMXMCH6sGw01N
 l8zQTLTN2WjzI060Jhf1U5gkdej+M5bec/QCNMvyH+eXqxxTfMyqgoL7FDl67IEUVC
 UiizSI35YplJmr98g8ZX68pZglKMuSn1KNvOKs/Lcv38guscJ5VgPP+KA1y5saQU//
 xpzyGnEMLqwgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=knD3dDWK
Subject: [Buildroot] [PATCH/next 13/21] package/python-frozenlist: bump
 version to 1.8.0
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

https://github.com/aio-libs/frozenlist/blob/v1.8.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index b9e91cf4c3..784f4dbcb0 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  0882f528872840df39091fb5085e258a  frozenlist-1.5.0.tar.gz
-sha256  81d5af29e61b9c8348e876d442253723928dce6433e0e76cd925cd83f1b4b817  frozenlist-1.5.0.tar.gz
+md5  3d8350ebe62603b7be5f516292c7aa6c  frozenlist-1.8.0.tar.gz
+sha256  3ede829ed8d842f6cd48fc7081d7a41001a56f1f38603f9d49bf3020d59a31ad  frozenlist-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index d6ced4b176..b0d408d836 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.5.0
+PYTHON_FROZENLIST_VERSION = 1.8.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8f/ed/0f4cec13a93c02c47ec32d81d11c0c1efbadf4a471e3f3ce7cad366cbbd3
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/2d/f5/c831fac6cc817d26fd54c7eaccd04ef7e0288806943f7cc5bbf69f3ac1f0
 PYTHON_FROZENLIST_SETUP_TYPE = pep517
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
