Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F199BE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33F782228;
	Sun, 21 Dec 2025 22:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giJCjfhuVqLK; Sun, 21 Dec 2025 22:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EB782208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356679;
	bh=/HRgSvLUFswKok5Bv4LfyYzjMHTiFbuX69iPT27iC6U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MhZ7HUdNMDIq3+dl2mGMjRT3QYJfM6BmdyYLbGljVkedMSSAokZYZQQWyzSmotGo/
	 /DrgY1QTpfEqj3TvYb2yGMuQ0bkQ0TmAHYeZ/anf/xupl354DwNkUpDvWDWRtaVa1d
	 +3ZG15XHGDAeY2Wjte08GCD7kr2WwwlyERvQk1Gu1WDwC9gD0mz7g7vtWSa9WZ9UwZ
	 H4s6YTQCmbDOoFsltGHBvCRns2Gn5gEwD/Ce4LlHlg2R/a0J2BAB6u0TXAriNJIK8t
	 uDWNASFsI60mc3rHjAr03YO9DUiu+HHiqCp0lfdkf1A9pKfZyepzsMjTX8bmRJQsbk
	 zQlwox2nGCnUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5EB782208;
	Sun, 21 Dec 2025 22:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D82E6119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA936407B9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rWdYG-elR9d for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA2B5407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2B5407A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA2B5407A9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7EDEA4C4E51;
 Sun, 21 Dec 2025 23:35:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-1wjS;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:35 +0100
Message-ID: <20251221223441.185169-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356505;
 bh=NghGlSA+dspr/sEkUoL2AQLsSTuXiP6uiSyG0EvmLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mULW9F19+atnKdlYwRLJ0sIqKgEakcsCmjgqfppR8xgwWoa1GSe653i6tlzXJn2ng
 T2CJpZoa4kBy+k3bLqAqZ7Q7jAvpJdxxAXEsQ0P9CkVgTbW+78o90LgV/2gu0G7lb2
 59qflxPpIrmpel6x42Wap7na9jNxw0rCY/h/OWhJu5NAXyn7pNaKTnVMAzfWPVCEhU
 qO5E3qEbGxS36a3NJcgNoJQdxiXrncdlPkBTYrp6v9s04r+vjJZWJ5IdBvnCooDgjT
 WKsdXaurnHuBdwG/GVDHgavM7qvxUeaip9mYgRoydgnve+23fuTkKnFzFGmzy+JiPn
 2YYUe88Ey4M6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mULW9F19
Subject: [Buildroot] [PATCH v2 17/23] package/python-pyasyncore: update
 tarball URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyasyncore/python-pyasyncore.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index 4b1e3c98b6..d86ac2cad8 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCORE_VERSION = 1.0.4
 PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
-PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
+PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
 PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
 PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
