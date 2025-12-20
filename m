Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE9BE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50ACF60E69;
	Sat, 20 Dec 2025 21:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEgCAOgKFBi2; Sat, 20 Dec 2025 21:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9A0760E53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267084;
	bh=GtDnAzqT4N89TOZbbnDHqIW1nen6V2nOnEKoB3Q18CA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ScYGR04+W2U8TbUg4lHAUexkOAmNPLBkhs7jg/oow4knOOrw4tZVkQLhmNOHm2GNA
	 X2DrVQSfcWIhwCINhQApz4zeBDzoQHmSH91iJj9vEysJKAbKF3xMrYGqVQlkgwJsyq
	 npsHxQYBfu7m3DxNza25tqHadupRc99jyFe8ofHKFcciNjc7Igoua0ORS9F82t6hc2
	 wBQRgIN45KcmghOBSS2s0LXpvwZuuoGJe8gzPbz7NWlZc6fA0iNi5PYDHUm3Y3eG11
	 SGjyioofzzoDhLVqpyZl5prVslXkFJ5nDQ7DZemtn/WpUfUw7/oeJEV/ObRJT5oiq9
	 DxJpjz4x21cCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A0760E53;
	Sat, 20 Dec 2025 21:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7E723D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0101E82057
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6Dn_pw7MvCV for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE61B82028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE61B82028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE61B82028
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C78E3A4C4D86;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-1sNH;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:58 +0100
Message-ID: <20251220214206.1089100-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=Ho8/cQ1kdqVq7z7AOMK+9tMbDIm5/13kcutwvwWH32Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mOdjLCL9HAyugdCF+svEVgWuuDjGJrDOnFV8UqmdGdS4KOjFEgwzQWcCxh5mig0A6
 Rsm7eeRZVe84qMi4x22whwnTyiegUXuT2kPPszA1DMCr+4v/4vyykP7N/vIhVykxRs
 0Pye9u1e1sHCrj4zkRSChFXStwiAPT76z1yWyN4rKS8i1IQyc+2Dh8Ba7k3gPkC8H9
 uWA+hKqi+gb9lmM0RNsJtMA/lB9UYxKiebRKKiODtkj0fH9xiWGMf5IzjBa9qHzFfU
 Ke2PNSgdiNtrsLJykQVSaM7jEVWAmjqALVkUdu3H2g3Aj44ppzJeVgqQ9ZqgZY6AkF
 dWJKn5i0Xo9uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mOdjLCL9
Subject: [Buildroot] [PATCH 10/18] package/python-google-auth: bump version
 to 2.45.0
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

https://github.com/googleapis/google-auth-library-python/blob/v2.45.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 17ca9ddd61..6a7b5cd170 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  43aef15e30f2646226add26c54256302  google_auth-2.43.0.tar.gz
-sha256  88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483  google_auth-2.43.0.tar.gz
+md5  702a1aa7d2a65e7ae2702167be9183f4  google_auth-2.45.0.tar.gz
+sha256  90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3  google_auth-2.45.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 53e5900856..69c2a32b70 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.43.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.45.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ff/ef/66d14cf0e01b08d2d51ffc3c20410c4e134a1548fc246a6081eae585a4fe
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/e5/00/3c794502a8b892c404b2dea5b3650eb21bfc7069612fbfd15c7f17c1cb0d
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
