Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E66BCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3512E60D7A;
	Sun, 12 Oct 2025 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxBJgNptNYPF; Sun, 12 Oct 2025 20:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF8260BDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF8260BDF;
	Sun, 12 Oct 2025 20:23:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9D7512B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABFD2400B7
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjfJX6aQ69Sw for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A81694009C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81694009C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A81694009C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10A27A4C6725;
 Sun, 12 Oct 2025 22:20:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-1SDI;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:58 +0200
Message-ID: <20251012202002.178080-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300405;
 bh=kvDiAcXiTR4Ed2S+H6DsmSabTs7JzTUddNO88ISybE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f+sczvUT3XjJYCfcLkMGtivlfs6DrY2bOQ6qSGf7AmFC727to2olpnJr5DAFSZ9LW
 JA/EHRjkz3hr26C5TuHzoNSAdN7J72SNJtAgCzhhbZtMTq4Q70Wzwem1De+O1O7MIy
 k9KXmaKeoRZTPh8SdGtyrz3DWiDBb4LdC2hXUqJjt3VQU7bDBJUGPk41PAkuV3yxZF
 pYpYseOo2pX+OXsGmzMMQpSzfoE/FYShyYvGwnC9UBI6AUTK8cungHemeDRNkQFeBN
 J4sYvF+vSOU0Ij5QH/N/4Tfmi7cVGHEF4AhuZfAhg+4hR7570Ho47Vl9F0SiIiEVw/
 viCRj6IuJDG7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=f+sczvUT
Subject: [Buildroot] [PATCH 19/23] package/python-markdown2: bump version to
 2.5.4
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 2f7162e850..c412c6c012 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  38582a01de352b173b0cf86c9864ad2e  markdown2-2.5.3.tar.gz
-sha256  4d502953a4633408b0ab3ec503c5d6984d1b14307e32b325ec7d16ea57524895  markdown2-2.5.3.tar.gz
+md5  b61518f0e66d3f35d404ed595252853c  markdown2-2.5.4.tar.gz
+sha256  a09873f0b3c23dbfae589b0080587df52ad75bb09a5fa6559147554736676889  markdown2-2.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index fded790801..a8737b5b49 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.5.3
+PYTHON_MARKDOWN2_VERSION = 2.5.4
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/44/52/d7dcc6284d59edb8301b8400435fbb4926a9b0f13a12b5cbaf3a4a54bb7b
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/42/f8/b2ae8bf5f28f9b510ae097415e6e4cb63226bb28d7ee01aec03a755ba03b
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
