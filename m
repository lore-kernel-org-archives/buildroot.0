Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05DCCCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 982C6832C2;
	Mon, 13 Oct 2025 18:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av0i-413GmZT; Mon, 13 Oct 2025 18:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AEF0832C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEF0832C9;
	Mon, 13 Oct 2025 18:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D7CCBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0B64041C
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3S6-tbh12zw for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EDE74041B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDE74041B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EDE74041B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 127AAA4C6A19;
 Mon, 13 Oct 2025 19:55:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlS-000000005Im-1LXM;
 Mon, 13 Oct 2025 17:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:55:11 +0200
Message-ID: <20251013175513.86276-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378119;
 bh=Y2oJBIErPUWOP116P3v97Af7aaW5GQOZLR04k1g9kzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vgwI1CSWvllQvl/dl9KCa0qAyOAIsE3uZ1TmEvChym4xupEAqrqyDIqoLjBm9IStv
 NZ8uXACTPedsuvG1bfRRG7ky/gqBAD8eXtmvy66O/cegYdZE7iqT8JGpfwlGxWuppk
 uL2y2FomxZXlzDpKdqSZy9Kz8Nte9aQHwzzEyYU6QqZQJ0vFOX5ITgSL03PzN/mPgD
 SrUiLC9COnEUtCCnPsGxIRMvr4HW1WrEuv0PjEwjLFnz2DsDwIiYDcFe2StM9kuQo+
 1T2D6HVDFZ3ZElrBSdqwvBpQ/9UUpQKXRmC6eQ/KWtmCxGi+x/m+Rhg8Z1iIIVR4vc
 toNvWADXdyGtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=vgwI1CSW
Subject: [Buildroot] [PATCH 34/36] package/python-sympy: bump version to
 1.14.0
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sympy/python-sympy.hash | 4 ++--
 package/python-sympy/python-sympy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
index 09cb0bfd71..efd09d7196 100644
--- a/package/python-sympy/python-sympy.hash
+++ b/package/python-sympy/python-sympy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sympy/json
-md5  0902c1a6a7399c8a5ed1bbe95d559c10  sympy-1.13.3.tar.gz
-sha256  b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9  sympy-1.13.3.tar.gz
+md5  9872deb5bd7816dfbc89bec086b9e522  sympy-1.14.0.tar.gz
+sha256  d3d3fe8df1e5a0b42f0e7bdf50541697dbe7d23746e894990c030e2b05e72517  sympy-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
 sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
index 246da3b219..817b56ddee 100644
--- a/package/python-sympy/python-sympy.mk
+++ b/package/python-sympy/python-sympy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SYMPY_VERSION = 1.13.3
+PYTHON_SYMPY_VERSION = 1.14.0
 PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
-PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/11/8a/5a7fd6284fa8caac23a26c9ddf9c30485a48169344b4bd3b0f02fef1890f
+PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/83/d3/803453b36afefb7c2bb238361cd4ae6125a569b4db67cd9e79846ba2d68c
 PYTHON_SYMPY_SETUP_TYPE = setuptools
 PYTHON_SYMPY_LICENSE = BSD-3-Clause
 PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
