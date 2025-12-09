Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9149ED3B98A
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6101983F28;
	Tue,  9 Dec 2025 19:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xxRv5mpPJbX; Tue,  9 Dec 2025 19:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7342283EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309208;
	bh=n9bJyTipsjIkFlbLS0FY+2XTKN4lqoh5PE9Fr3fVO9o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WDByK1mJxvDlyUmh0IeJjEai3KHjfi25g1UNDuJ/de0uTl3s14cKn9cpKNDKXhpIq
	 gvdpLR9qlPUnlId2IV6SW5zKlOlTjW0RwtcWPWBTUg3r+80g7/EtkBl+nlLSuWPawr
	 Be2fsc32YpM6rQBe2IGvJTsLp2KLZBNRuQhSvqA2oTVPyQCqQgyos/7iAjL/wcpkd9
	 UtEfSnT9cMHoRg718hmnABZ9xl1jDJwYLOw3USRQajpi8UFb/5Z5ar1NACK8QvYaSB
	 mPkr7OWoSDeYRSINmpzQcpHF7ZhqhKCvakpV13SC6i1GiLYERjlHHRvNvzamXfnRHQ
	 uTZW/YHvocamQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7342283EB0;
	Tue,  9 Dec 2025 19:40:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C5C4E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D97C6136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l54O1yMhSIpr for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0ECA612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0ECA612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0ECA612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3554CA4C043A;
 Tue,  9 Dec 2025 20:39:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-0KHE;
 Tue, 09 Dec 2025 19:39:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:21 +0100
Message-ID: <20251209193951.1000100-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309192;
 bh=HxzZuWKAQhecWdC15FCUWulJ1vVwsBY7cBVhP4G9oao=;
 h=From:To:Cc:Subject:Date:From;
 b=TIAQ/N9vzwlQbvSQ/R9+XdpTGVCI1VRbs/LZQvFjTxbStCxUHXB05Tsqb3WNeu4Ow
 oxTNJ9p3M0tzrGtexfGcp87nj+ZfWhFOHzoU4LN7YCED5FhX0UPHVLXNoil1iEm1PT
 uZxnyL3mXg9VB/3ZvKpBfaeuH8rg9L0ozXx72VaJSxoXIhyro4Wy7APippTo+y6feI
 ZQ7IkVLEJsQsCYq+rWlkojuEb4My13iT2cyb7O/6n+oRqdeu0H6rEvy5IsHq6NLFwG
 zyH89qNrvzfoKJ5LdhHHFrR0Sk6rmbr3Bzj5cqhtFKOX9bajIqBtkoBfbFo6xUwi68
 5oXY6y/6bq25A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TIAQ/N9v
Subject: [Buildroot] [PATCH/next 01/31] package/python-aioconsole: bump
 version to 0.8.2
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

https://github.com/vxgmichel/aioconsole/releases/tag/v0.8.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 945dad6a66..97ecd1a730 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  f14c575a38cc70c1bd26d83157cd1adf  aioconsole-0.8.1.tar.gz
-sha256  0535ce743ba468fb21a1ba43c9563032c779534d4ecd923a46dbd350ad91d234  aioconsole-0.8.1.tar.gz
+md5  b1f49c48b6652fbc41e67b946879b83a  aioconsole-0.8.2.tar.gz
+sha256  25cb5530f58f7ab431e9af84fbb5417178287b6c3300d5b1185e3b129a227cef  aioconsole-0.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 646cf3181b..13b0f8eea7 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.8.1
+PYTHON_AIOCONSOLE_VERSION = 0.8.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c7/c9/c57e979eea211b10a63783882a826f257713fa7c0d6c9a6eac851e674fb4
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/76/4a/71f535c85991e18e1626429a283d4fc6720053f38211affa888809089ded
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
