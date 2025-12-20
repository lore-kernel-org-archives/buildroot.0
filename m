Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F8E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDC360E58;
	Sat, 20 Dec 2025 21:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GKW5qtXQMFQ; Sat, 20 Dec 2025 21:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E967160E47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267062;
	bh=HnixUhiIQNoPgKsQjIYB+JwXNQLpXwtZMxYEjMDIJ/E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bbppYvYpxL+7pAqjeq9zbbFBTD8hYInhhgTMZfUAgTnjJaeEcl/eErdIm67j4VT4E
	 xggsk5wv7DJJL5WpX2QZ7zzjvvDFxQoVmXJ/IBH8oQ11lFkYCLY2Ayp9lZaB7XHhfF
	 n07uZHFNK3+pfVcpQBUfxsqR/H9WTEQNVzXBCkCXHlkIBI5UDr1HJ4DUfu5D/TJmRm
	 NQR/SfLdzr+BGKuZXjsq3sY9mbFy2bhWknStGoXCsAniHc3tmRLwe3ktqMjO5bi3wy
	 txnVG9r0kbdY65AgYNm2J7bv+wvAJekEmStdMBbRdNPA8d04bXjR9D+tjxjRlC1rWv
	 zp6fcSGJlGl1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E967160E47;
	Sat, 20 Dec 2025 21:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5688D23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4788860E46
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wDwDqYY2Yzt for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D6AE60E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D6AE60E20
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D6AE60E20
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F90AA4C4D7A;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-1aex;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:57 +0100
Message-ID: <20251220214206.1089100-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=alK5bkmbekukxmQKk0NTAHocESimjKtmlUTreJfPJBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=E9cK1gacirodFiuEzjGZgqyHvpWXJIAEsY9KlWNa7BPZwnAZ2vWXIROykJUzZYtVn
 JSTFF2dKJZL0ExIld1R07BNaIi+IKxoVRxvXe5GPKo8iJ/Xartq4wXGT85DdcxxSlw
 Ed5Ff8Ecel//T4po4j64JdK9yLqhPbm+zxCMmiiLyujeeQPGEm6Etgt6tDdFNY3KI3
 r/sB4cH9+5MhcJHtF8VNxHzmKY9drMisZy6/qEawzugFcm1HHv1x44lndpJJQZC4vz
 ZyTb6sqT7KcizqVBWNNq6KpoRmygJ2Ywa7yQY7TAtmG8b+UsQMTFt51RKfCbDS2kCS
 SlUiRU0+l3qXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=E9cK1gac
Subject: [Buildroot] [PATCH 09/18] package/python-fonttools: bump version to
 4.61.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/fonttools/fonttools/releases/tag/4.61.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index b83663e8fb..61dfad4f79 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  55a7d3d40e191410bbe604d0d795baa4  fonttools-4.61.0.tar.gz
-sha256  ec520a1f0c7758d7a858a00f090c1745f6cde6a7c5e76fb70ea4044a15f712e7  fonttools-4.61.0.tar.gz
+md5  98125fbc3dd9254fd8b95c309138b837  fonttools-4.61.1.tar.gz
+sha256  6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69  fonttools-4.61.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 592ef51354..85c589b616 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.61.0
+PYTHON_FONTTOOLS_VERSION = 4.61.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/33/f9/0e84d593c0e12244150280a630999835a64f2852276161b62a0f98318de0
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
