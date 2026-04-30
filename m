Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8772CFF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42911849FA;
	Thu, 30 Apr 2026 04:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhhM_ldBRoTU; Thu, 30 Apr 2026 04:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62957849F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524675;
	bh=wXiAJyxr5Yk/likRwkNmdLxXJOx8W5cMFV9+yRDAr30=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OBJB14JiJV6ibbJ/8DtLNz+55kN7efRPug817GcCX0CpDtkkEP+CA/rKD+vRg2/qG
	 6BuA4sXTaCIpW8CTI4b9cgFch/EgcgE2O1kSfQQ075K9SXe8anIB63SEnEHIQMzeYC
	 ib1St6T/JzPjbdJtKLCQOmBFFrFC7BNh03oibwzuVM/Pf6uq6XmVmgAjjCM7fSEbo6
	 oNN0kk9fzWBo6gHnNN8ULbUrYYXMpYrdgANAslsGVdaOqtwfO9Qf+2xAqd5zysdfaX
	 pisnXDfrx8VRL/WeXDDOZYHeH2gNDQfF/JuuMWlnxDLzpEbx1EVse42hCZ4RPPhIej
	 7gXYjkdE07zzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62957849F4;
	Thu, 30 Apr 2026 04:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 061B6192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E02564217D
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ON9-017Kqefw for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E869D4217C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E869D4217C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E869D4217C
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:51:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17470A4C0EA0
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 06:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34988)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJMj-000000000HI-1Pbh
 for buildroot@buildroot.org; Thu, 30 Apr 2026 04:51:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 06:51:09 +0200
Message-ID: <20260430045109.59810-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524670;
 bh=OVHobJnGs/ADuJgkWmSRaeX5U+0pru5mlxXYGR0XQXA=;
 h=From:To:Subject:Date:From;
 b=QtN41MBvgurDBYa3l03XTlQ8egXj2iOGXDi0sWSH5a7j1EVeRs7HaTm8dGwEUEhm7
 /5uebs3bAZBEMFYfps6v/mfluP6x5W4voSMxqAQJ0haF24IW6vHwf8QgMZ9MEurqfz
 EpqmOO2RUNlBFBjGQydRfmG4bzR2HRUadilbXMw1iwYihv/qd7FiGAkPYboD9YAT23
 YKxuRluYk+Z+LTRkwJ6yty83mJ7uu7aG+Dh2ghfVRDosaqsq3rnMpgpao7TmxN3i0X
 YOiMbrRmyj9dx/jzM+exy8tYRd5jRXZD05+KvxRUjZ4uF3JuBTHECb0C8Bs/R6GReR
 gAAA1Rss9Mb3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QtN41MBv
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to version
 3.8.13
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

https://lists.gnupg.org/pipermail/gnutls-help/2026-April/004922.html

Fixes the following CVEs:

CVE-2026-33845
CVE-2026-33846
CVE-2026-3832
CVE-2026-3833
CVE-2026-42009
CVE-2026-42010
CVE-2026-42011
CVE-2026-42012
CVE-2026-42013
CVE-2026-42014
CVE-2026-42015
CVE-2026-5260
CVE-2026-5419

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 209b6aa220..99a721d208 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.12.tar.xz.sig
-sha256  a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51  gnutls-3.8.12.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.13.tar.xz.sig
+sha256  ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e  gnutls-3.8.13.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0844bfe50d..6411a7d621 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
