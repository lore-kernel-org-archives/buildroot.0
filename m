Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD4D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15D940A96;
	Sat, 13 Dec 2025 14:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wF-BgvHQ5HG9; Sat, 13 Dec 2025 14:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE0F40A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634756;
	bh=bgNM3y60Q3BuvkunWkU5RGxaTF8uOvAd/kaZwTf9ppI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e+sgWT5HftcOeE9lZRpJ6jfjMyGRlJogOMyOZxuTznwajL0I6z2tjlLMPUQRvOOy7
	 e0HHHjRiFC6+0s0XBVFi5GLYjHnD3+tQV1VYcQcbw3fdwrZRKeSnTMJ9Aj4Uyt+zG0
	 2JzkOKGFEw7FBqHH63I7ohk5t/AWfNBKsm2OGqTDWKY/Sgktc35v7UJrjWn2nsQ15d
	 93Ue/rZTG1HF9sfmJljWacCzb+U4MmQxN3ofi+gDqK2tziiK4rhz/FTDheywsvLesI
	 idwFfEyJnKWYFNLmDtwW6dyUfxXjMCGfCWYtEcGbc/C0gJOa7N56oaJQZLst2I930H
	 FYJY70BchBE3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE0F40A9E;
	Sat, 13 Dec 2025 14:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C0E2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E00F240A9E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhCceDChp-wX for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:05:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8DF240A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DF240A96
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8DF240A96
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B631A4C405D;
 Sat, 13 Dec 2025 15:05:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-2BvN;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:11 +0100
Message-ID: <20251213140522.1322763-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634726;
 bh=hcka70Bfe+QAxrD57YHnvTA7qdq8GOHTwyWGcNzS2a4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AbXYN8jC/EzryjBj44JVF89mhFfcW4wlyCCFb33C/kg0i4rH4yGvZ0UNbFttWRejd
 9K752vGUZx5OoCcSUCOvVFvYJ9+maSLeAF+w+TVuj4DBQAWKubo2p5oqKdUxfCMhBG
 nJwbvwfnByn39QScP7bmZDJ1BcN4hNXmPLQsZHp1hTlY128/4C2/Ica/5BsDdXBs2m
 aMKwpbpMrrIsI5xnvJ2HL1hR5WiUryhirqleGuvr7tMHd8Zdk0lQ7QeqC1UWP7+Ytt
 nhaZPS9bYUvg18FyOR8H66+/CtQbtqX4cbIxjnMZcVUC+pQ33mqM1cYJmRN+7HUYe2
 OeoedJbzH+95g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AbXYN8jC
Subject: [Buildroot] [PATCH 03/14] package/python-legacy-cgi: bump version
 to 2.6.4
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jackrosenthal/legacy-cgi/releases

Switched build system to hatch:
https://github.com/jackrosenthal/legacy-cgi/commit/0ea10a20213fe89d77110dcaa3f4c932d4a70310

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-legacy-cgi/python-legacy-cgi.hash | 4 ++--
 package/python-legacy-cgi/python-legacy-cgi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
index 53af4ef691..74dd629c98 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.hash
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
-md5  5750721070ad829796ef830308e76907  legacy_cgi-2.6.2.tar.gz
-sha256  9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f  legacy_cgi-2.6.2.tar.gz
+md5  bbb85dff278de9bf03a3f4e941398ea1  legacy_cgi-2.6.4.tar.gz
+sha256  abb9dfc7835772f7c9317977c63253fd22a7484b5c9bbcdca60a29dcce97c577  legacy_cgi-2.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index 457463d9dd..cd87024111 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_LEGACY_CGI_VERSION = 2.6.2
+PYTHON_LEGACY_CGI_VERSION = 2.6.4
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
-PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/ad/2e/e1860989bc6cfdecba66db37f2f783636b97a1248ac25fbe864b6e931c22
-PYTHON_LEGACY_CGI_SETUP_TYPE = poetry
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/f4/9c/91c7d2c5ebbdf0a1a510bfa0ddeaa2fbb5b78677df5ac0a0aa51cf7125b0
+PYTHON_LEGACY_CGI_SETUP_TYPE = hatch
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
