Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580E2D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2258476B;
	Tue,  9 Dec 2025 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgGJOpXAieZV; Tue,  9 Dec 2025 19:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2FC28439D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309354;
	bh=rfCFk9F5vijARzVICeKSdBIkUnU2vTqwygqK4u94WZ0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JZFK39FiKPaazZMdtHfz7Q/c4gOpVXBcYz2PeiLMMc+HaqFFjO/WgmiPlRAw7AY0y
	 9maKVBywFLeNToNSftsQxX2nGuyfsyRg7JPIKrQUaF2dPnbk28tGkc4gS7NBOPouR2
	 xsoK3SEWp91ONM8r9kYA/g5cSuCx+Yb1bTZ7Or7M40Er154iMc2kRgDDuxozRpJOue
	 irXRI7w/qDUHuSPnFtPkyIDQocHDwf67qK0RoeGg3s+fU2mVlAbtE9f9t2aJdwdas0
	 WohZKlTXdv7aWAAug157oQCtW1SHRtQVcc0CSdqUtrnoPRB2rSDI19WfW8uLvchDg/
	 8NTp5M+bdXAAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2FC28439D;
	Tue,  9 Dec 2025 19:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 538342C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A74C40967
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnmprHNhvfzX for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27A5C40377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A5C40377
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27A5C40377
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C182A4C2C83;
 Tue,  9 Dec 2025 20:40:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-3qIs;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:33 +0100
Message-ID: <20251209193951.1000100-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309215;
 bh=m0gLA+OCEVvjNpk6MCtaeeELsP/umOzWCIEpAwlxmgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mBpuYyGR5IOd6UZgavUw3X1Rq542t31S4eVZnw5TZwYUmFFVd8QE2sLEk4BpjECKc
 j504JTBfr9jnjdWF7485k77eQCQ9DMXOxsaUjY6Li4GJL2jiJnqjnXIg3qZ2CxFtaP
 3pmhLTmAzUL6pLXx0gBaX2JBt+i8ySqfDEgiw1NmoLYCbqOaXX5auJ1Vb+WH5O3z4f
 uemchlZryXl475vWThtiP2ZhUMg4egYqdraT/8E4RZyciN09fwo/veHbTZwrlqJkOI
 Zar3c1IOHG1S7yPqrmXDhx9YOOcSP2ECfY3IMfR6GfGRIv+0wXn0VimtfTy03t/eA3
 KqRqKM0Gu2c5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mBpuYyGR
Subject: [Buildroot] [PATCH/next 13/31] package/python-asyncclick: bump
 version to 8.3.0.7
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-trio/asyncclick/blob/main/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 1a2603d2aa..15e8b1fb02 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  3c8af1a8b6151c24a102e5ed891d19d1  asyncclick-8.2.2.2.tar.gz
-sha256  014f6b7bfb1ef34a2215bc36aebd5150d5d2e50668b12eceb749961e32c24660  asyncclick-8.2.2.2.tar.gz
+md5  9087d387a981ed313cbea4a4b54a13f3  asyncclick-8.3.0.7.tar.gz
+sha256  8a80d8ac613098ee6a9a8f0248f60c66c273e22402cf3f115ed7f071acfc71d3  asyncclick-8.3.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index d413242def..32d1eedfa2 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.2.2.2
+PYTHON_ASYNCCLICK_VERSION = 8.3.0.7
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/35/51/b01dd77c9a14fb0b312d799fd8c10b145b882535dbaa9ac055a52515b390
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/f9/ca/25e426d16bd0e91c1c9259112cecd17b2c2c239bdd8e5dba430f3bd5e3ef
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
