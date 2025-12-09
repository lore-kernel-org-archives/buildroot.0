Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1222D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 657608438A;
	Tue,  9 Dec 2025 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jjr2L8XxOTLE; Tue,  9 Dec 2025 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851AE8438B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309232;
	bh=7dYhY99W/jXzDxxbS2/1QYN0RhUGvMAoi8iBSfGgios=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eWVaH96RBkh/SaCIqop9TiCMD58ExlCBdqeCSB/lwMM3AEWZ0s6lKftyFgjW7Z28T
	 vbOTfKGDt+a2e5lDQkjVlQv8bYH5WjZdPTQ7EbUarSSE6/ddu+skV+oW6LOh0UOygO
	 xYXrps1FpwGarpTXuA7MFZI+ld9hHbw/vE1WvteKa3wAqIBO0v3X0gJkdAYMXGot/w
	 ej77M1HfbXE83CYdWH6m0+kir8ENY3/sM3b6MwQnmpdOGBIbZRSmA0v/DCtthoCgEt
	 QrUOt251VgS/Pwkql4CiorSfjEgTKx2Imq+dV+pZg2UOdzGit0pZoORilq9L+TxUHz
	 5zMkcPyhmUWgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851AE8438B;
	Tue,  9 Dec 2025 19:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99642E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF7B6136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KR61F190y9V for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61100612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61100612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61100612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 312EBA4C1F53;
 Tue,  9 Dec 2025 20:40:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-0CxH;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:35 +0100
Message-ID: <20251209193951.1000100-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309213;
 bh=w2qNgP5FLR8Q5FtbxxgjbOa75JrB0bs6TVjKne2URvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BTDP/sHeIk//YiOZzVSkOMO+66DuFjN0ywaM7L15Vq1gWJEFGJ5h3JMuhGZkPe4WA
 RqlXOKIft25zfqB8hSklm6JQev9fq7Yjp86mK0SvnEXBkNYLM7wxt5SCc8FbWzyirr
 S7a3HROrwOaSL5gkILAj/ej1aYQ9/bP+DdvgCH3bpCss7pS36QWjUc6qUG3IEsw3Nz
 QyVugZVb/fJs3755zkTx3Ao7oXu+KxCLgJvkbcyFdPyZX32Q4FWmy56zVp+2fjGr9w
 vSx4p8aKOrNfYql/Wi3iA474V1N07H6egA8H3YH1sbCC6vxjIAIrGHNM/AdugwgPBG
 CXCHlCtPyIP6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BTDP/sHe
Subject: [Buildroot] [PATCH/next 15/31] package/python-autobahn: bump
 version to 25.11.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 4b9e7c1be5..ef26ba346f 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  cedc5252be771288b19c237cd54a63e9  autobahn-24.4.2.tar.gz
-sha256  a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9  autobahn-24.4.2.tar.gz
+md5  d3cb29a6d5e8cc4c9671aa46ba1f2d0c  autobahn-25.11.1.tar.gz
+sha256  52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1  autobahn-25.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  49c90822821c78934079a4bfed0a880790a868bc6dba90ea8fe8274e0f985ada  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 458739f7f4..0ba2b3fb4f 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 24.4.2
+PYTHON_AUTOBAHN_VERSION = 25.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/38/f2/8dffb3b709383ba5b47628b0cc4e43e8d12d59eecbddb62cfccac2e7cf6a
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/3a/aab5632fbd88ed26d330ab156af80c9a90419dfa2841296fd556a65e5fac
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
