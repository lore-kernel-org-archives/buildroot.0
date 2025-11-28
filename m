Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF6ED116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 18:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAC584787;
	Fri, 28 Nov 2025 18:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izSPqHcrG290; Fri, 28 Nov 2025 18:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F96E84714
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F96E84714;
	Fri, 28 Nov 2025 18:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38DD5273
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F59A400A2
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i_2QUcSX9-5 for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 18:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB92340028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB92340028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB92340028
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00E82A4C76D8;
 Fri, 28 Nov 2025 19:31:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58620)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vP3FX-0000000033n-2a7o;
 Fri, 28 Nov 2025 18:31:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:31:18 +0100
Message-ID: <20251128183119.3254445-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128183119.3254445-1-bernd@kuhls.net>
References: <20251128183119.3254445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764354680;
 bh=TybfwFu6wZhDqW6Z75taeEUzB99CNMvplIdvaAGKpTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bf3qRNq3Mg0mWM8IXSRb9n/RTK6SWgTP4A6FY3nYbv2+6PP8b2O9z99+P862o6R27
 1RXQBl4c4mdpF/UsOLyEfZdggbnUUmZs41PjTLFu8B5EXzyEsZdVQ1dencUBY3FR/I
 M9DQcGAcHogkWMiWKAPq2FZgleC1+vjwcm+fT4aIWkKqpsA77Jhy/j46zOKKefzsPu
 wzrHu7M7mBvgvAZ4/Vl3ZZxPad9WOgogtPP5OzXeBcyMcj5lUPjvR918nfFJXI2sM+
 WS/I6CHStJ1VzUsUJR8ENKUJjictB5NGL6fYuFtAdUG22eTIuvLS3U1C8ZVl71q2TL
 JzN9ZteVtmfJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bf3qRNq3
Subject: [Buildroot] [PATCH/next v2 1/2] package/python-pyicu: bump version
 to 2.16
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16/CHANGES?ref_type=tags

Needed for compatibility with ICU 78.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index afd14437ce..81cdd4f459 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  6ae2145f2a98433f461b128c3ebef233  pyicu-2.15.3.tar.gz
-sha256  f32e78e1cb64d0aeb14f027e037a8944861d3114548818a6adf0081ef51aefc3  pyicu-2.15.3.tar.gz
+md5  00715b86c27c150f48554a863688e878  pyicu-2.16.tar.gz
+sha256  42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9  pyicu-2.16.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 5025bd649b..9d3f5f6004 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.15.3
+PYTHON_PYICU_VERSION = 2.16
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/88/b0/c8b61bac55424e2ff80e20d7251c3f002baff3c07c34cee3849e3505d8f5
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/11/c3/8d558b30deb33eb583c0bcae3e64d6db8316b69461a04bb9db5ff63d3f6e
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
