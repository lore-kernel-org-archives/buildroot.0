Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0CCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22002430DD;
	Wed,  1 Nov 2023 11:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22002430DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvUhz0wNVrbQ; Wed,  1 Nov 2023 11:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B55B430EE;
	Wed,  1 Nov 2023 11:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B55B430EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296321BF97F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E5894000B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5894000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYNDZ478oztX for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4473F40156
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4473F40156
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D175862FC; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:13:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7713240284b215d5e3d87c424c7464cfa950be49
X-Git-Newrev: 198e834ee3d8630d4d2e5f60b760b37d373736ac
X-Patchwork-Hint: ignore
Message-Id: <20231101111643.2D175862FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wolfssl: security
 bump to version 5.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=198e834ee3d8630d4d2e5f60b760b37d373736ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

[Medium] A fix was added, but still under review for completeness, for a
Bleichenbacher style attack, leading to being able to decrypt a saved
TLS connection and potentially forge a signature after probing with a
large number of trial connections. This issue is around RSA decryption
and affects static RSA cipher suites on the server side, which are not
recommended to be used and are off by default. Static RSA cipher suites
were also removed from the TLS 1.3 protocol and only present in TLS 1.2
and lower. All padding versions of RSA decrypt are affected since the
code under review is outside of the padding processing. Information
about the private keys is NOT compromised in affected code. It's
recommended to disable static RSA cipher suites and update the version
of wolfSSL used if using RSA private decryption alone outside of TLS.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.4-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c4658ede712305455eaf72a67a74509d4434a46a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 3407586edd..fb5a570de8 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a  wolfssl-5.6.3.tar.gz
+sha256  031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4  wolfssl-5.6.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 9b35a6a84a..17452fdcaf 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.3
+WOLFSSL_VERSION = 5.6.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
