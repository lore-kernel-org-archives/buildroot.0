Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DACEED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258AF40776;
	Thu,  1 Jan 2026 18:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0__PdmM5fRv; Thu,  1 Jan 2026 18:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE96404AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290964;
	bh=XuDmzc1iYAvyLVPRCzSZ6W5q/gDiVbNNETLg2XKikHc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cv8qPOg8bEmaSBKVOUy8I9lUwtot+gcnsNQyA1x3vIyODR9TF0oO3ztzAszemUE/U
	 lzq5wlNAYnp4jQdDyNucEhili2KCSINlPq0Mf7npEFmzgflk58VSjZO/j+MVqJvBum
	 IPW2OFVioMfqxF1o3uIPj2SFQ5AsOPrbghIA4hgVFBz7LDlyDa0m17Xn0d5ZDEPoyS
	 2KdVhCmqiOR0GSEWzd8PrVDC8IhMqGubyuLDclYkQl/HuJnJtC6wOT8oCq1c8pMK3T
	 O2E6t/MrYRoQu7TTaP7e6pO+13z0vgJWOK7fEICPiLsNPHVdQzncEDABuEOn8hdW74
	 8LAeoahkihoug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE96404AB;
	Thu,  1 Jan 2026 18:09:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D10206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A58B4020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGWjEA03ngql for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FB5C400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FB5C400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FB5C400F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0C76A4C2EDC;
 Thu,  1 Jan 2026 19:08:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41084)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbN6L-000000006l7-17SK;
 Thu, 01 Jan 2026 18:08:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 19:08:39 +0100
Message-ID: <20260101180843.247730-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101180843.247730-1-bernd@kuhls.net>
References: <20260101180843.247730-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290925;
 bh=kXCHX8y/cpvaCfLYz32WsCFP8gbQ35RjQMdNcKHsaKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MmKBdKqdWBpdPJQbVaWVoh8z6kj17bFNmORryMuHgu0gx3AKRzEUvb8XEtmLVJTxD
 ID2abn/f13oBo348dcGOaRi9/ExJ4P0PEQHGPiVYgu8FZ+Ac6y375XtXpPFFewdjWi
 j0+FdF2Z/eitRsvjYwkqYY03SUP791X/s90dJKYqtlm4jg0k9dft93TQvqmV8odYms
 zzUzg65mt4JZ9a37cxeg8VJLL9rnd1MJXrrpKL80FKH4wKKkH7qXEFpshKPexEYHMJ
 +4hQBO7m58TgC5BocN6gR7V78YDLyaUrAbYXWw5sGbyIdlnSVXnItENRc9l6xYjxV7
 UiBmiTG2hGIwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MmKBdKqd
Subject: [Buildroot] [PATCH 3/6] package/python-web2py: bump version to 3.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 098f8dc490..b100a1fec8 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..5b473698a6 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION = v3.1.1
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
