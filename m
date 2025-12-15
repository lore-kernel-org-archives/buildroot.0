Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06561D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA04B80767;
	Mon, 15 Dec 2025 19:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCmfM48kgdeu; Mon, 15 Dec 2025 19:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77DE807D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826115;
	bh=q/8I0rmTte8evUl3AupKnhT1NqRixGy2fVYbkKj0LOI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CS5P+hBxd+8c/SmFbNK/SUYT7Oo1m7n9wOX+OPG0UjqovWQCj3K/7f7MPTmmGoC4C
	 8H8tp1IkYMwOegJhO8+aIHgsY12I+6OkmrLwXvX1hLQRpFD6EyC3gVKYTGw8Ma2Aae
	 Jr09TqosnO2/I4+KNQnHy5GvS8DRlKX6XfCORQ69pq7hr489r8jzKFVEJEsiHJcLEq
	 zpiadYpGadrcQWBbUJrGR7ALyN93ofKIjQjexL6/OlccQmnLONOk/nkhNx3DMR3cfz
	 nijYHHIgl9+iLVszU3UapxyPHBXSu9FdqGorpmUCrlC7iWq4mq4CZ3IVpsxc/28ABK
	 sfyaXXRJx/p7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77DE807D0;
	Mon, 15 Dec 2025 19:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B804A255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DE2C407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TILxFBnqId4j for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80C1C4046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C1C4046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C1C4046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 541E7A4C4276;
 Mon, 15 Dec 2025 20:14:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-2vT4;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:55 +0100
Message-ID: <20251215191416.421755-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826066;
 bh=/5PeWIKoTuMF3y6r0CJHxDlEVa4hBDrRVHGz760jRdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mvNSoj1+skujnaxUiWLmKYdl5D9WKGKQncodKns4zNI23jsF23+z5rN9K5T4iDoBX
 etOSJSSWcwicq7uaY5wJuiv6E12fH9WxSIdZZWqNJTg6NeyOwTTjSCbPj1xtKiprqR
 1fkfko/XT/qwi7iNzWw7OXQjbFtVcOcOxI2Mkx0BxgKzOlx2bIEyDf1iFh9Q5jKr37
 s0DkuuiVct/J5uPzFtK+jV9O0EZoDe8mE6/csdRDRAY5VGDFjP4td95y9iJVzXk1iZ
 MEvnqNGrucmBcBSDaO9dYqB6zYz7d1qa5Ml76WZCEzG6WBqUJqZvIdBksZD2/RGBmr
 iTZJ0ivfP5rvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mvNSoj1+
Subject: [Buildroot] [PATCH 06/27] package/python-pycairo: bump version to
 1.29.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://pycairo.readthedocs.io/en/latest/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 633b31d975..6f03581ff8 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  12097575a1bb683cab7dc425d9769a68  pycairo-1.27.0.tar.gz
-sha256  5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430  pycairo-1.27.0.tar.gz
+md5  8202d252ea754e2a17852b9031e01b32  pycairo-1.29.0.tar.gz
+sha256  f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142  pycairo-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 8d9459e9e2..fb1d2bac74 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.27.0
+PYTHON_PYCAIRO_VERSION = 1.29.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/07/4a/42b26390181a7517718600fa7d98b951da20be982a50cd4afb3d46c2e603
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
