Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE091C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5712843E1;
	Sun, 18 Sep 2022 09:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5712843E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUGokUbYkqdq; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCCA843F0;
	Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCCA843F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D94671BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5313860E1A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5313860E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDUP569SNI1y for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583F26FB0C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583F26FB0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4282484A78; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:54:26 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 58bfc75d29b7b20d41bd5ab57d871e9a11cf8776
X-Git-Newrev: dc33bac56dcbf2a2bdd1c3eb43d9de72aab9bd1a
X-Patchwork-Hint: ignore
Message-Id: <20220918093346.4282484A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/wolfssl: security
 bump to version 5.5.0
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
Content-Type: multipart/mixed; boundary="===============2957957713100490526=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2957957713100490526==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dc33bac56dcbf2a2bdd1c3eb43d9de72aab9bd1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following security vulnerabilities:
 - [Low] Fault injection attack on RAM via Rowhammer leads to ECDSA key
   disclosure. Users doing operations with private ECC keys such as
   server side TLS connections and creating ECC signatures, who also
   have hardware that could be targeted with a sophisticated Rowhammer
   attack should update the version of wolfSSL and compile using the
   macro WOLFSSL_CHECK_SIG_FAULTS.
 - [Low] In wolfSSL version 5.3.0 if compiled with
   --enable-session-ticket and the client has non-empty session cache,
   with TLS 1.2 there is the possibility oàf a man in the middle passing
   a large session ticket to the client and causing a crash due to an
   invalid free. There is also the potential for a malicious TLS 1.3
   server to crash a client in a similar manner except in TLS 1.3 it is
   not susceptible to a man in the middle attack. Users on the client
   side with –enable-session-ticket compiled in and using wolfSSL
   version 5.3.0 should update their version of wolfSSL.
 - [Low] If using wolfSSL_clear to reset a WOLFSSL object (vs the normal
   wolfSSL_free/wolfSSL_new) it can result in runtime issues. This
   exists with builds using the wolfSSL compatibility layer
   (--enable-opnesslextra) and only when the application is making use
   of wolfSSL_clear instead of SSL_free/SSL_new. In the case of a TLS
   1.3 resumption, after continuing to use the WOLFSSH object after
   having called wolfSSL_clear, an application could crash. It is
   suggested that users calling wolfSSL_clear update the version of
   wolfSSL used.
 - Potential DoS attack on DTLS 1.2. In the case of receiving a
   malicious plaintext handshake message at epoch 0 the connection will
   enter an error state reporting a duplicate message. This affects both
   server and client side. Users that have DTLS enabled and in use
   should update their version of wolfSSL to mitigate the potential for
   a DoS attack.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.0-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1891419db38e4d85595b2111db448f68eef684b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 01b21596e7..f1401e4cda 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  dc36cc19dad197253e5c2ecaa490c7eef579ad448706e55d73d79396e814098b  wolfssl-5.4.0.tar.gz
+sha256  c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d423ded67f  wolfssl-5.5.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 536fd863fe..ca360312c9 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.4.0
+WOLFSSL_VERSION = 5.5.0
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 

--===============2957957713100490526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2957957713100490526==--
