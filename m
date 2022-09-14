Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062DAC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95B580C58;
	Wed, 14 Sep 2022 22:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95B580C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcD7AT6NJDpW; Wed, 14 Sep 2022 22:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9CD80C05;
	Wed, 14 Sep 2022 22:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9CD80C05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC641BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 100078195D
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 100078195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sywEKRJT0ew5 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 345F18198A
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345F18198A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2236083B1A; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:14:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fefefefd78c051921c45ff703f1be133b28c38e0
X-Git-Newrev: 5a69737e5ddc3d44392a27a97e70ffa2c6edf349
X-Patchwork-Hint: ignore
Message-Id: <20220914222919.2236083B1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wolfssl: security
 bump to version 5.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a69737e5ddc3d44392a27a97e70ffa2c6edf349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following vulnerabilities:
 - [High] Potential for DTLS DoS attack. In wolfSSL versions before
   5.4.0 the return-routability check is wrongly skipped in a specific
   edge case. The check on the return-routability is there for stopping
   attacks that either consume excessive resources on the server, or try
   to use the server as an amplifier sending an excessive amount of
   messages to a victim IP. If using DTLS 1.0/1.2 on the server side
   users should update to avoid the potential DoS attack. CVE-2022-34293
 - [Medium] Ciphertext side channel attack on ECC and DH operations.
   Users on systems where rogue agents can monitor memory use should
   update the version of wolfSSL and change private ECC keys.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.4.0-stable
https://www.wolfssl.com/docs/security-vulnerabilities/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd82a913d420458007bb43460fb6a7281f963771)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 63eebf93bb..01b21596e7 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  409b4646c5f54f642de0e9f3544c3b83de7238134f5b1ff93fb44527bf119d05  wolfssl-5.2.0.tar.gz
+sha256  dc36cc19dad197253e5c2ecaa490c7eef579ad448706e55d73d79396e814098b  wolfssl-5.4.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 58b6f296ab..536fd863fe 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.2.0
+WOLFSSL_VERSION = 5.4.0
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
