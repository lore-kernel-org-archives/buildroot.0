Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DCAD2A54F
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 22:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB48A82404;
	Thu,  4 Dec 2025 22:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiJtwVApLN6y; Thu,  4 Dec 2025 22:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 986EB81A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764887717;
	bh=i2xCUKY/j+GLm1HCBFFSwiMRbwn0vOiSVYmfA99C2p0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akPziuAdHYmJQr//p5AV8HAr6R4+nRvSyGruxo60BL7Zz3jZVXerfagNhqII1UjVo
	 6hTUJiOr0miQxsh2tpTpeW95WCZsmLH3XCdJWIihQrGFaASbWONorTt+z8AO/T53WY
	 urcIRZ3Kax3U+6eSWj5EZB8cflbWjdbsLa8vL4a3sXF3Guq6UaIdsoq+DHfJhsTt6b
	 g0wIe4BwQw2ga8G32kAfFOg27xx0h8sbPqvZBLXxsY/N0/uH5Fn8QDg9Egd+mQ0WnS
	 lT/ytnNXy+O+8fd+w5npOm9X5N4uawU111i9DWvp/gn6ipqphL0ljEE91YEEw148fr
	 RAYytHHr8TVRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 986EB81A16;
	Thu,  4 Dec 2025 22:35:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 443E6E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 366A082261
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oErt4OcODsb6 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 22:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B72482229
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B72482229
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B72482229
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08570A4C798E;
 Thu,  4 Dec 2025 23:34:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58258)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRHuP-000000002M1-0yUi;
 Thu, 04 Dec 2025 22:34:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Dec 2025 23:34:44 +0100
Message-ID: <20251204223445.3426350-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204223445.3426350-1-bernd@kuhls.net>
References: <20251204223445.3426350-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764887686;
 bh=vBvVH+0mvy/Y9bElZRQCNtqood50ZMQ8aPJqlRDIatc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BzaY55jtcKRS9AM+UH9eqoDOJMHIJffKD4+TuyPMHc/FKk2WuXx8DFaF3/zkHZTDj
 k5maacfAgKCCKpUEuuN8wjuqLsRyEaBGX8Fj6nNoWwGaoAp7N2t5Jr5EnBOIl5uU5g
 I4GHyl9sJqpphI40Bd+ZP2hSK5EndaKhbWYpgZ1lKWXYpLFxkXzOxhidwInhUyAEOn
 YJ3z4I4tbeDo94hUKIuE+3p1m6CV9pWhmgQ8c1whl1KakNNcxxdJ50FzTABjH3zMwR
 hCRH6XEMdJoHHJDIlVZmGZJXGQ926l0xJjG3SRj99FtCdSuWHNLYG5/505Vby/quke
 7JC3topRbDhbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BzaY55jt
Subject: [Buildroot] [PATCH 2/3] package/libupnpp: bump version to 1.0.3
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

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
0.26.4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 5bc282f270..79b4770ed2 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.21.0.tar.gz.sha256
-sha256  e43dbe5020ed25152aaec71b325dd80498e72038da5aeb50ed7dd51e213cd903  libupnpp-0.21.0.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-1.0.3.tar.gz.sha256
+sha256  d3b201619a84837279dc46eeb7ccaaa7960d4372db11b43cf2b143b5d9bd322e  libupnpp-1.0.3.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index fc76a43a11..a1be3e9738 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.21.0
-LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBUPNPP_VERSION = 1.0.3
+LIBUPNPP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl libnpupnp
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
