Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10792CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 08:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F11429F3;
	Thu, 28 May 2026 08:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vih4agd4HCMf; Thu, 28 May 2026 08:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E539E429F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779958253;
	bh=n964/0mhmTl3lwIvx08LoV59/ga18cmmx1MS7I/ey9E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TjQYnr49LwSZngAeUplJsptP2MhPD/8lZ9o5ReRZEUGM00tQEscWRXsfLaSm2j2WB
	 mq9KRhjeVziHIJQRIOLK6M9vRKF8bVJn2Lh1ZczmoB6DV6tqvb6Sejzwdwo4i4AlDX
	 j3AeW2shLfEze/k5nQCqwaojOmbjFa4+NwJb9BLp12/y6tWe2neBhqzCDX2KlQBAff
	 06NFxKkBMttyyy5r/9cZBkcM5tc3uh8TrwLblC21F14GO/jvIyXGtigvIUVU1jZN2f
	 MRNiE06UiRTJ32hcwuaGqpCpVa0a6POIY0ti5FkX4uVALXnnjyaPHiP7xbVTMTwlQa
	 xi8Ue4pa2EUsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E539E429F5;
	Thu, 28 May 2026 08:50:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4430288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA5F284CE0
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBxzUyRhSnnc for <buildroot@buildroot.org>;
 Thu, 28 May 2026 08:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF89884C8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF89884C8E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF89884C8E
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:50:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2043399597; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 May 2026 08:50:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wSWRy-00000001Rbp-2t4G;
 Thu, 28 May 2026 10:50:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:50:42 +0200
Message-ID: <20260528085044.344439-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mArHu8k2dAbFmDEw8wTRhG86sSi1zM73iI+gYpbDlV9hUt3Rt/PKF8nezJKOGhWoS6RpWZKgMgv4gCGOdJ7m8FfnADK9pZPmDctZoY4C+eoaahX0oHVdAmFKYhEPMFIctcxoZ5TwWV+vvSlbzJEvIgclAdsrB96VrleAtx07uX7/YBpmHa5hZq1DwDB/tRWPzyQIXb+X3PfnqF1qQL6VojArJHYwIEoWhCsVkf0vgl+dhS0HguIItrQP4//sT3zTpMXKLXAo55F3Ee1xjsOHaMhu6TC3iQw+vVcS4dqEyCmni26x/QJPSsMaPVOt+t9i3hgo0YdBbojaSSq6wgF35A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=NHJXCkq/SQm+uR29es8nBE2ofdTEfVmZ4w0lG4FibZw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mArHu8k2
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/radvd: security bump to version 2.21
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

Fixes the following vulnerability:

CVE-2026-48715: Stack Buffer Overflow in radvdump Route Information Option
Parser

https://github.com/radvd-project/radvd/security/advisories/GHSA-52px-gh9p-m379

Release notes:
https://github.com/radvd-project/radvd/releases/tag/v2.21

The release is now done on github, and a .tar.xz version is available so use
that. Notice that we cannot use the github macro.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.hash | 4 ++--
 package/radvd/radvd.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 8415b8d854..a9937aa232 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.20.tar.gz.sha512
-sha512  798d8476ab5ff43083b181d6d6ec43c47d06e4067d30c71e038cfd890bcf1ca23e809f9e184c4363458bfa25a916625dd2d7553290fb3e5459034d477b80ebaa  radvd-2.20.tar.gz
+# From https://github.com/radvd-project/radvd/releases/download/v2.21/radvd-2.21.tar.xz.sha256
+sha256  91df2ed7faca0716bbd726a17d6467ed92fcb2b6e45b57d9e619f9686ab99e1b  radvd-2.21.tar.xz
 sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 89d8f55d51..32bbcf57ee 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.20
-RADVD_SITE = http://www.litech.org/radvd/dist
+RADVD_VERSION = 2.21
+RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
+RADVD_SITE = https://github.com/radvd-project/radvd/releases/download/v$(RADVD_VERSION)
 RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf libbsd
 # We need to ignore <linux/if_arp.h>, because radvd already includes
 # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
