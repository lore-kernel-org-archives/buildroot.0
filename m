Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68293CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 18:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B6A38587E;
	Fri,  1 May 2026 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rc9Ff26Q1sgH; Fri,  1 May 2026 18:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826758587B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777660480;
	bh=0IeboFmIwBWW8fdCYU1Zs0qEzwCNwitnbTE7IaGyA14=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KeQagDUbilmvIPPJCJI34w3i72ectcIILdMh85wtR4vd2gsrEtvrpDMowxJ45d5oj
	 PJxgvWwcU227bDsoZmXEkMftHVvQqXUGqJ7O/ro4E7e6GhiV9BLzskuj3HS14yxltb
	 kY05ZDmW51EiXwYvXEZKpSASFnneuGB972Y82OsbENfIaBiBAmfDW3lZcHFuL9TMR3
	 rNcCvMVN5GhaPr59qay88loc+gg0ttov7eonZOj/dadLG4BvL3tIt5HzyiM/mbY/Py
	 sH+gxzyUkOAMK9SrvwsEZgg9R6gdlfBq7+AA8v7zubj1K91JISoqMzRes9W+4Xt/19
	 rNUq7z5Y3HIkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 826758587B;
	Fri,  1 May 2026 18:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A39293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BB9F41278
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0wdEpKQHbp8 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 18:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AF6741262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF6741262
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AF6741262
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92FD3A4C0258;
 Fri,  1 May 2026 20:34:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIsgv-000000000Qz-2ocE;
 Fri, 01 May 2026 18:34:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 May 2026 20:34:18 +0200
Message-ID: <20260501183421.2459291-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501183421.2459291-1-bernd@kuhls.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777660461;
 bh=XMnUJLqv4DZJk2BkZeNtqr+NqYi4Pqo4slAeZkZMooU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hYWkvvXMPR9n8nXgGSmtn9b+O8zxgFCL/QQJCHDQbmw+7uzAOjaAnVbpxZ0y5NrgT
 SPe5YWHD8vZXMDIsGq8YZnglNlQrwXgNkTRtEmhWz8BQQME1P8M9No2lkbSA8SBtw8
 /odWJWsQ8m51V+DlY6c4NnGBmatzdCknsanWJp1rE9SreHqkKVZyedmPqdwvA+ffcQ
 V42aG1QKe60q7mGKA23RPovffyFMJzwPAXe9HCHIPjaAYe1DHZtrftiiJjj2zT/2c6
 q7MiBHIUzEUnMg0eC6G6TKUgMbKnrW8+awpZogznM8hI+BbhQn9mS8CDT8wslyw6NM
 1r9pCPhGkqorw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hYWkvvXM
Subject: [Buildroot] [PATCH 2/5] package/stellarium: bump version to 26.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://stellarium.org/release/2026/04/05/stellarium-26.1.html

Added dependency to qt5svg needed since upstream commit
https://github.com/Stellarium/stellarium/commit/a5c374bfa314a75c19aa65cc758c68517ef608ad
which was added with this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/Config.in       | 1 +
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 566f8edc83..20f32e747a 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_STELLARIUM
 	select BR2_PACKAGE_QT5CHARTS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 67e053eff7..ffd84151d6 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
+sha256  578bada2531e39146ccefcf6a0d202867e403b559f54239e8db9f9c003e04443  stellarium-26.1.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 48dadfec61..97a0cddfa7 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.4
+STELLARIUM_VERSION = 26.1
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
@@ -14,6 +14,7 @@ STELLARIUM_DEPENDENCIES = \
 	qt5charts \
 	qt5location \
 	qt5multimedia \
+	qt5svg \
 	zlib
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
