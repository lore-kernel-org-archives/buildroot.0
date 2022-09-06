Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46CCC38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 09:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633CD4179E;
	Tue,  6 Sep 2022 09:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 633CD4179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8KD8bU9YX0h; Tue,  6 Sep 2022 09:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B63415DA;
	Tue,  6 Sep 2022 09:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B63415DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ACED1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC3A40B9D
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC3A40B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KU5AEjpCjwWG for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 09:39:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0201E400E7
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 09:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0201E400E7
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F0696812C8; Tue,  6 Sep 2022 09:24:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 11:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 713fad52ad1358299d19f7530cb26fabe66236fe
X-Git-Newrev: 1891419db38e4d85595b2111db448f68eef684b8
X-Patchwork-Hint: ignore
Message-Id: <20220906092409.F0696812C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.5.0
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
Content-Type: multipart/mixed; boundary="===============5001153363431856272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5001153363431856272==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1891419db38e4d85595b2111db448f68eef684b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 

--===============5001153363431856272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5001153363431856272==--
