Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A4D2A54F
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01D7817F5;
	Thu,  4 Dec 2025 22:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRJsQp0jKpm5; Thu,  4 Dec 2025 22:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B8B38136E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764887705;
	bh=Kf57iPRVU967PXQ6nGTB50ip3q6XniIR3W9LYQzg+SM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z9yNkrM/NO4jwShjbYDl7s8Coz9Nkh/ThgsK08PKUr6XJRPQ/60c9SnfPg6n4nxGy
	 GbMXc2/94NKjnMHKjyMeMmlDjeGIbtiOk7eko/CdZN9z8/d2NBnqNJzeEKknJ1GdHg
	 +ER3UbFXqSE1cBkS1YeKYB5D24Cgbag0qul0p2GxDEmfvQmyzGUpwKGFUvyR1ngkOY
	 jfkthgJm7cvldiC1vJkgndxhtqRNnIU6teWaueMUQzlTsCFYaGVQSDDlMBbev5ANEZ
	 b3JB2KfKtvkkEBRFaiA/An1wzGjm5EQ2tgkSZ9N2crA/TBbYehtY3DUKmYYff0qPXn
	 +MgrHZYft3WVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B8B38136E;
	Thu,  4 Dec 2025 22:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CCE9E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EBD64026F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtL86uox015C for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 22:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE4644028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4644028D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE4644028D
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:35:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E78E5A4C238E;
 Thu,  4 Dec 2025 23:34:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58258)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRHuP-000000002M1-0fp1;
 Thu, 04 Dec 2025 22:34:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Dec 2025 23:34:43 +0100
Message-ID: <20251204223445.3426350-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764887686;
 bh=adv+K7cMbmGKGNAR7rQdFq7PJkvbBLEe/K7+wefwoa8=;
 h=From:To:Cc:Subject:Date:From;
 b=nPwU7IHOh0IpurbrpDxLp9GEM/wDzALJ9ygABhkYD++/RQgxElslEbS4Q16Oz8VAC
 Lc01XdjjDG5mucfLbc4KnL1xqhFnetZvozy22wp8uPkVdIab75VAfzmVVI3X2LTBS6
 TutAW5OTWzK901O1LCTqH97F15pt+thqkrH4IKZas9XVgRQYnRM9eTJAY2odPZZUVt
 R1woHA75IrhJiX7G2SZGtABIxr+uZSc4WhzDgUznwXl1lGQ2G13NM/3dQC67FvcMg4
 G5Box+fbWG9UzZy8xeF9BE8CPs8y3OwYO6U/qGCOIgI+dSV/j2sjB/q7a+U3dpE5Ou
 cA31f6SfsWMlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nPwU7IHO
Subject: [Buildroot] [PATCH v2 1/3] package/libnpupnp: bump version to 6.2.3
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
6.1.2.

This bump fixes a gerbera build error introduced to buildroot by the
gerbera bump to 2.6.1 with buildroot commit
f8bf78911576672443a8d11eaf99bed4d383acef.

Fixes:
https://autobuild.buildroot.net/results/b6b/b6bd96cb9dbcaff9351ef156edaec7d1b5290b9e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed typo in _SITE

 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 15ee26c6d2..9e4f211ecc 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.2.tar.gz.sha256
-sha256  cb3968773d30e2bfc765547df514fdc8927b9a37ecccca2e260ee8b612e756bc  libnpupnp-4.2.2.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.2.3.tar.gz.sha256
+sha256  563d2a9e4afe603717343dc4667c0b89c6a017008ac6b52262da17a1e4f6bb96  libnpupnp-6.2.3.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index d7192ec3f1..38b631fe58 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.2.2
-LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBNPUPNP_VERSION = 6.2.3
+LIBNPUPNP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
 LIBNPUPNP_INSTALL_STAGING = YES
 LIBNPUPNP_DEPENDENCIES = expat libcurl libmicrohttpd
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
