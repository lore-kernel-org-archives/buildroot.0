Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2541DCA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CA082206;
	Sun, 14 Sep 2025 14:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH7exW_lqPdR; Sun, 14 Sep 2025 14:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAAA82232
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAAA82232;
	Sun, 14 Sep 2025 14:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E029B255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 14:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D201640C6E
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 14:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhC5Me1CSP8c for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 14:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15F19407DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F19407DD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15F19407DD
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 14:34:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1379247817; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Sep 2025 14:34:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uxnoP-000DNV-1v;
 Sun, 14 Sep 2025 16:34:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 16:34:40 +0200
Message-Id: <20250914143440.51414-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SFF4pEcrcRDH0AifEyPFvqdlF7jv3cKMDTdRlmaeXAspfNXMdnBYiaxLmr2dBu75CQYAFw57OJN9ipyQ/nNfIoNSWUid8geoJ+kGSMLeAVOJWDD3NUfU2Eu9APC24y/JXxhRD4yW3Z6v4q/HfOjzdnHO4QNynsNy7Z0AR9NFk+mWdqa8ZegL+eyYz04D4BclKwPQBAxaKzaRYTLtx0cwefsFwqLIS9oobgBgYbaIZ0dcwFoQKIDyK4oZboKsirLA31rRwuzq9unFOyF728pkzvU75H6ODHGaZ/RblnVyjNLCJjKfqM949b2sjrpwg81zciwqVv5Vv/gfUp3lJRYt+w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=pWHFxA8E/fEfunt707vK+SFML6alxn45mHhzUXDCCas=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=SFF4pEcr
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/pcre2: security bump to version 10.46
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

Fixes the following security issue:

- CVE-2025-58050: PCRE2: heap-buffer-overflow read in match_ref due to
  missing boundary restoration in SCS

Compared to 10.45, this release has only a minimal code change to prevent a
read-past-the-end memory error, of arbitrary length.  An attacker-controlled
regex pattern is required, and it cannot be triggered by providing crafted
subject (match) text.  The (*ACCEPT) and (*scs:) pattern features must be
used together.

Release 10.44 and earlier are not affected.

https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-c2gv-xgf5-5cc2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 35b87ad854..bd2422d991 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.45/pcre2-10.45.tar.bz2.sig
-sha256  21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4  pcre2-10.45.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
+sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
 # Locally computed
 sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 6d2b729dfe..1d0a3b845f 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.45
+PCRE2_VERSION = 10.46
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
