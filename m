Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD574D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 843F0843E7;
	Tue,  9 Dec 2025 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILphuLz8rSaE; Tue,  9 Dec 2025 19:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA22D84395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309536;
	bh=gmyZaeynJmmlKWfMxBsVzzD3zEoHRZ5XRsEb9oLMKg8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EYDbItd/+KfWslqXn8klWXt0fJZq+lsxtLPGJ7g8UXJN1+a+iCkW/jA7WVirRnsLA
	 IbyVCw6835MqCVUW08eP/b5SSsXD3q9jMPVaiOW/DG80l5+Gg/h3lZMGdRw1leSWW4
	 CdoHqkTnRr57DglhN4z0ivfvB11scaSj53+YDZ4bElvZUxc/V+6SdGsRVI5TM5of0i
	 PkBR3oPhiT65ISbFd8swE+6NESFmrxNxoQQglFV6rP2mjFpkgysVmwT/dB1cwyq1/X
	 gbGbFPdQVzJ5vtQX8PpIJKq4+dFk0k65iyKRK1dSdJfEyqCMfFuQxblwcaMhphxc0O
	 NRj660pXNNpQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA22D84395;
	Tue,  9 Dec 2025 19:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DEA72C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B9C184395
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9Og-OUTvcmM for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8231E84388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8231E84388
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8231E84388
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACC88A4C2D3B;
 Tue,  9 Dec 2025 20:40:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yw-000000006DN-05vw;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:49 +0100
Message-ID: <20251209193951.1000100-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309218;
 bh=lBFN/VEireEL3idZvUbvE8mNKMDQjQdf72LV6o3P4+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RYzRCB8SzIEuh3BLMfrGWjZrQQ4jk4/ML5p80Kcnn4hwWqEKkoTQvzZQLxpfM6d08
 qpLbJifioUG0rHJeqSM9fFeVTSdUwnbdKKF5fVMW92VH/X12tFE2sPnqLI6Pwnzu3V
 DqduuzNV0tLhf2F9z6M81hpBQFfzXlYMmPEamenyl1qbKz8k6wHiAUh32geG1ZWVZd
 Hx1c/lCKhBMrAakfhs6baY6x6+vkG1MNC04dzRPDPatmPDcmXp3CkHcEqLGpN58rER
 5q9DoVyIN+FxX9nvX/ITeahsKp8cd0sH4EOuheZS77cNCUDAMNHGQk+LLWYRUeTquD
 5LH87nb81bGlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RYzRCB8S
Subject: [Buildroot] [PATCH/next 29/31] package/python-maturin: bump version
 to 1.10.2
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

Changelog: https://github.com/PyO3/maturin/blob/v1.10.2/Changelog.md

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index f439f5d9b9..b530d93b49 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  32ed28b14691d95daf862ec78cc26fcf01ce55eafd4b22b0c27c02f8d4530806  python-maturin-1.9.4-cargo4.tar.gz
+sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index aab4ccef6f..e4d91a6545 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.9.4
+PYTHON_MATURIN_VERSION = 1.10.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/13/7c/b11b870fc4fd84de2099906314ce45488ae17be32ff5493519a6cddc518a
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/02/44/c593afce7d418ae6016b955c978055232359ad28c707a9ac6643fc60512d
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
