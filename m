Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB95C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975A8418A3;
	Sun, 22 Jun 2025 10:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUVG09so6tZD; Sun, 22 Jun 2025 10:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F7D040A64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7D040A64;
	Sun, 22 Jun 2025 10:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B77FC8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77CA98145A
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMHfNh5NEgp2 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8615380F5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8615380F5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8615380F5B
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:03:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF8C1A4C0298;
 Sun, 22 Jun 2025 12:03:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55912)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHXx-000000004xg-0NaR;
 Sun, 22 Jun 2025 10:03:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:03:33 +0200
Message-Id: <20250622100333.3836532-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750586614;
 bh=M37+C0ZytDRUmenrt8TJ9RrIT7VhzrqTHcP56IAem0U=;
 h=From:To:Cc:Subject:Date:From;
 b=igAlUahcLxtVcwxzNMTMKoheUP9VopGrOqVbZO+LMkFD2C0icmY2qy64jlGG6Vaby
 o75K51gCptx+9RaRk/ItmgBL+bTJBdYzPLGXJaPi7R7OJgWU7SKMxYsFH58pOk00HK
 jL4L6aFeIySgQTOTpBkl0/WxHka3v4TA6V++xSETfr3MV9oTfDNt9ISzhnGbU5uYe6
 9lbP6hU9Z0ze5oYnCAOefO88+T0I0Bjv6HI/NiI9Z/aIb9DUYornc4a3y4SiGUQ1uG
 2PqfVPeUBGTpLfdd2T0oulVkJm/5L735xiB0Ncd7ipKQhcv9ngMfP5hSsdVUznqjqn
 djIliOnLSUBtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=igAlUahc
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump to 3.13.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

3.13.4 fixes CVE 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 2025-4435
and CVE 2025-4517 but introduced some regressions fixed in 3.13.5.

Release notes:
https://www.python.org/downloads/release/python-3135/
https://www.python.org/downloads/release/python-3134/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b13f5cc742..2ca8ad4930 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3133/
-md5  8bb5f0b8c9d9d7b87d7d98510e8d58e5  Python-3.13.3.tar.xz
+# From https://www.python.org/downloads/release/python-3135/
+md5  dbaa8833aa736eddbb18a6a6ae0c10fa  Python-3.13.5.tar.xz
 # Locally computed
-sha256  40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041  Python-3.13.3.tar.xz
+sha256  93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640  Python-3.13.5.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e6273a773..ec210ccac8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
