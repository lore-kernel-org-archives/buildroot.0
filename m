Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324DCD3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19FC383B5C;
	Tue,  9 Dec 2025 19:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPWdCt98fBRl; Tue,  9 Dec 2025 19:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E8C8276E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309196;
	bh=EJ3IQNxHbBZpb+Zjr/8DsOxUTSTFJAQkxJeO5u1jiQI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rVMP+D2VKR9M01pg34BmjqwbZdW0QDyVbuYtps7X/+XNeb++IYE08FiUYXgWSN1Mv
	 R5snL4o6Nvs4q5Wh5JwCto8hp3KzbI0/VO6X7PDSd4Jd0FPNFOeJkSrnK/Z5yn2ICn
	 FBkkcQT07MmteN+sZfu6nPAPaMmg7nPI6nrMcQM3Bevk8YcGBgfTmNitKwwnP4VPEH
	 mSFAhXkoTVBp4VRwKi6v0cFXKMv2U9VwJl9WiZze8qmnI1HQ01mLaDSDCo0kdPK7A9
	 oA/EpbQBxCj27OoFfOHfNyuJq6vi6ccDXz6KRc9NTHR/sux16v0O445gnDk1RX/Zz/
	 HlQxUdDZO/EDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E8C8276E;
	Tue,  9 Dec 2025 19:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37E98E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F2C40A88
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8veSLjYI90z for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CD9540967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD9540967
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CD9540967
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:39:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 400FDA4C1F53;
 Tue,  9 Dec 2025 20:39:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-0bVr;
 Tue, 09 Dec 2025 19:39:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:22 +0100
Message-ID: <20251209193951.1000100-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309192;
 bh=IZ1iyI3JLWanzup6UlPbJO7pTRan5LbJ1DZbpSBoBac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Z6FgzkBm3t9vBp8gMaBzBi8WdrM3FWbQjLB/2wOU3slXhC/n1v0bPiZYF4goCK0g0
 qk2e1oXF2IMa7ntS0m6TfRvGJTAJ+x5Bfhc1bskEsAc0AuKCyDw/YAqhdVlbTUmEVS
 JVIsuC2GwmTluWY66Ftq9+tx60ab0TD6Qb8oriPnUUS1AFflBLZTmdZ3t6jK6TMxoT
 Le7H3deS5iWwT/icE3LuiRuRXzH5KvA58jFX9XvOSEmToeCI1XKNM22AstLFgwxw6K
 JkTe88snukpLgLXh5grU89nxSjdtRh7qglgNF/gPqtD8kn67QZ3YySX4a4/8ZqpJvq
 CWPTtDD/Xtrdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Z6FgzkBm
Subject: [Buildroot] [PATCH/next 02/31] package/python-aiocoap: bump version
 to 0.4.17
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

https://github.com/chrysn/aiocoap/blob/0.4.17/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index dfe0d02c80..045a325b93 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  028b0ce02cb94317a24d31adbb22150c  aiocoap-0.4.14.tar.gz
-sha256  01a34233b6f9a97df9a61f30bc64c0399bac498eaa160189a7f1f48f89d18717  aiocoap-0.4.14.tar.gz
+md5  27b37cc163f3a7f777d131053cbdae6a  aiocoap-0.4.17.tar.gz
+sha256  464c8d2b85ec1ef435dabeaa3fb6c8256b40fadfe6ce4ca83b93acb8d555f436  aiocoap-0.4.17.tar.gz
 # Locally computed sha256 checksums
 sha256  8baefb820ca33d8176df8d0430ce05d15764617cd07ec04238c56d641273f472  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 26909e7dd1..bb08eaf133 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.14
+PYTHON_AIOCOAP_VERSION = 0.4.17
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/28/76/de52f7fa51ddbb5255f7b80d8965903bfa718420ac5d21b0852f5d81c1b1
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/1d/7c/10483df04d7910e21d55d47ab7c014fb02644b5b58ba741161360f8e9e8d
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
