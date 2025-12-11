Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56987D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E0541147;
	Thu, 11 Dec 2025 19:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhZ_rWGVjGX5; Thu, 11 Dec 2025 19:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E4A4113C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483155;
	bh=tSdC3FYUCHnAsvmv3kprlzsh1E0re+G3D/0FaVX3CpI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eyivRIdn7H9JMn0WVzoMHjH0w+pAk0Jwh3DAeiQaoW6I+VbkmY5rJmHki5Zj0wqck
	 cSFIeS7VOz+Ke45WquDEoHZnecqJ/P0CVgJ8IlHSwTEMsRXMzasw/fEGVu2wmiCBhS
	 E7HPwbuihmexL4iCUjPXgUKY84fLRml+RSKes4R+XbGosk3u/T6fyUdSGv9YvG34nG
	 Ror3R5RZEkCERPtxrBDHjrCPbnR9ZqeBpXrQriGj33ryK6TgC6c6Xdy9YZYsH0j+mB
	 dYohKaburPgGx0rHsmDZttmYm2kbW9Pg6wqABThCMmXkACRVzltZuKkmAEx+rLT2pu
	 OaEnV2lHn8Jug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E4A4113C;
	Thu, 11 Dec 2025 19:59:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2652C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10733606A8
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z42b1fOQmLEW for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04E3D6069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E3D6069D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04E3D6069D
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA320A4C393B;
 Thu, 11 Dec 2025 20:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-1iBY;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:24 +0100
Message-ID: <20251211195527.3276900-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482938;
 bh=k4OP6BCwx20Owm3EXryJZR5mu/r2iAN1BweISU9O4gs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=s0DSSPrNyg9530yttp+ELUVinet3uHhHj1tdxHWyujqlj8A67v9dMA9lroZcOmzPJ
 vjf2Cbbnuhi1wiv3Vz0FKZlEmvgR2zOc3T9ro9CgmX9aqW+qdlaakeMRCKo2puanyv
 4fMyHXd+nbMHPt4h8+xO7GorVP0EVx1g/pQYqSksuttFBAEVj/Wv1sLr4S+n+U0HfM
 qctmyO4bOHQN+sBgMKHHHIvBgB6o/pDODUTvf3P3tQS8zeJdQKfG6izhOLGd0bRCoS
 nXd8X9CDf3JI9rSf4Mr7GcFNp68mHiE4KFOIzJpWEl1/Lege8LZ3k7UaL9cHq0lmkM
 itsPXlnzxrFNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=s0DSSPrN
Subject: [Buildroot] [PATCH/next 18/21] package/python-greenlet: bump
 version to 3.3.0
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

https://github.com/python-greenlet/greenlet/blob/3.3.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 3f444fb8cb..ca70b5293c 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  9aed26a4881c49d5f56c3f32f73e8572  greenlet-3.2.4.tar.gz
-sha256  0dca0d95ff849f9a364385f36ab49f50065d76964944638be9691e1832e9f86d  greenlet-3.2.4.tar.gz
+md5  1922c3b620792044728281d0139dc254  greenlet-3.3.0.tar.gz
+sha256  a82bb225a4e9e4d653dd2fb7b8b2d36e4fb25bc0165422a11e48b88e9e6f78fb  greenlet-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index bfe8f5d851..e4d4c03961 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.2.4
+PYTHON_GREENLET_VERSION = 3.3.0
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/03/b8/704d753a5a45507a7aab61f18db9509302ed3d0a27ac7e0359ec2905b1a6
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/c7/e5/40dbda2736893e3e53d25838e0f19a2b417dfc122b9989c91918db30b5d3
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
