Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B615FC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE3B61004
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE3B61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B25682726;
	Sat,  7 Aug 2021 18:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Kg2r2TQztWs; Sat,  7 Aug 2021 18:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0E88267F;
	Sat,  7 Aug 2021 18:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1359A1BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22F640019
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olMw6g2bdDNT for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 058CC40112
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 344C487596; Sat,  7 Aug 2021 18:11:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 20:10:33 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 8449e7107032657fad1dfadfee80dbd4da5c8c0f
X-Git-Newrev: 75aae80a2eb3898d523843a664857baeade327db
X-Patchwork-Hint: ignore
Message-Id: <20210807181139.344C487596@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/wolfssl: security
 bump to version 4.8.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=75aae80a2eb3898d523843a664857baeade327db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- [High] OCSP verification issue when response is for a certificate with
  no relation to the chain in question BUT that response contains the
  NoCheck extension which effectively disables ALL verification of that
  one cert.
- [Low] OCSP request/response verification issue. In the case that the
  serial number in the OCSP request differs from the serial number in
  the OCSP response the error from the comparison was not resulting in a
  failed verification.
- [Low] CVE-2021-24116: Side-Channel cache look up vulnerability in
  base64 PEM decoding for versions of wolfSSL 4.5.0 and earlier.
  Versions 4.6.0 and up contain a fix and do not need to be updated for
  this report.

https://github.com/wolfSSL/wolfssl/blob/v4.8.1-stable/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6427f12bba5f8df06b6ac375d74b3e62f3e086c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 05fee25b6b..9896713ca7 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  b0e740b31d4d877d540ad50cc539a8873fc41af02bd3091c4357b403f7106e31  wolfssl-4.7.0-stable.tar.gz
+sha256  50db45f348f47e00c93dd244c24108220120cb3cc9d01434789229c32937c444  wolfssl-4.8.1-stable.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index fe21ddcd4f..d3dce0a401 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.7.0-stable
+WOLFSSL_VERSION = 4.8.1-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
