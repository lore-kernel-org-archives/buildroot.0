Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81ABE9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C89A4093C;
	Wed, 18 Feb 2026 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrS0jlnzL3ML; Wed, 18 Feb 2026 20:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA0140933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771447665;
	bh=H5RcQanlnaP9P+YIiiA32U2Fn9+uv1WtcFPaKWdF5Fc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d15h/FuQ9VkofJ/53I9tWA8KgIG8oEOzzj0Hne7PA9xvuCR4P7qbU/jP/T7rzAocE
	 cK0Oii9jThVG5sN0lMG/HY4SH4Oig2xK/INrtdUkP0u8/BahuJ+hmz/4+gG7s4AKEK
	 3o2mzw3dAR+z3yTn3m5D6VNACdkwGN1hdve1BOk1KtKBv3T2MdeFtxfrS6CGhpqRDS
	 Vh6gXbKXI/ZGdHMmok5hPqQWIVxdFw+MuBbr/mzyZv5/GNkt1sQjLkj6pDGNo58dgq
	 UI7ohsgyGsvf9/rVuVZ0kM6UhLaYbQRVYhz9F8watdt4R8eNUaw8K5ugPDTILH68yj
	 7/1kFF8lPWGiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA0140933;
	Wed, 18 Feb 2026 20:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A2C1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034BE40933
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pqp0u-DqXpTy for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75EDF40931
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EDF40931
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75EDF40931
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:47:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id soSRvE5xJclBZsoSRvHPqo; Wed, 18 Feb 2026 21:47:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 18 Feb 2026 21:47:38 +0100
Message-ID: <20260218204738.915516-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFAuu4jEIai1DDMTSyyaQv7zb5kLet5HmLUoKA2X/Q0AFQHAztjONvY77QNJL982Bm1hXiRZXy83w1t13gGGbaOKIe4qRPGwzJAeG3HrZhTkwE5tehUO
 dT1Rm1+yjlT95aDyteLDLEBqu5yECJyqQf1KB0JkUUBwdbsLDnW07PYjIPQJ5BVku1YvtE9G6P2uFQDisMVhVEiZjNka7gBcarLZD1OJ61YtIcddSnJzeGn3
 Uobj+DXC0H3DPh5eMgSs4oSderjR3w/mdot4Eq2KepA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771447659; bh=8b0QDop8SdJKCd/NydR4r1a8qzoEQ9FFP8XNflqnMgc=;
 h=From:To:Subject:Date:MIME-Version;
 b=mHUL0g2uz5Z21MS5FsfZ14KSn8XuZafM/G/hJwIT/0nwkJ/YlZTcYw0JMzqLkWETN
 rEyD2eWOw8Q3eHacQ9MwLIh4lC9s460NOStOu9m4Iqh7knP9sql5P3QpoKCCKc8chB
 +oADwsRRCT5/JTYy0BgIjBddaDH1YU3tdwzBjOzqIwlHLjp2XQhdD+k1Ufx9pZHSyO
 10FVbJJbofqH5rG+/Zg9ZVp49ggV9jxmlgtAtB+Dpl4NUdrNqRcHmFkAJ3Xb+EL7qo
 mQt2a25byG1DnQ+v9DhfJrT0SPzWff1TTdqQOYo2RB7snrxHg4rk7tLN+7M3OwLHdb
 NoXBrlJC1mLUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mHUL0g2u
Subject: [Buildroot] [PATCH] package/bind: bump version to 9.18.45
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
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index aaf3519ced..6f016a3317 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.45/bind-9.18.44.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
+sha256  096ec94c10bc9d2ba686325660a615962d0fd6529429149acfcfb7daefaf2421  bind-9.18.45.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 041541b037..1b71bcbf66 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.44
+BIND_VERSION = 9.18.45
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
