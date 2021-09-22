Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599F7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:53:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725466135F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 725466135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ABCE404C5;
	Wed, 22 Sep 2021 08:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrDySIJxssZy; Wed, 22 Sep 2021 08:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E65404A4;
	Wed, 22 Sep 2021 08:53:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 053FE1BF30E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EAB404C5
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHhcQaAVACNW for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55D364049D
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:53:25 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 37B60240004;
 Wed, 22 Sep 2021 08:53:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mSy0F-0005CR-G8; Wed, 22 Sep 2021 10:53:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 10:53:06 +0200
Message-Id: <20210922085308.17902-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version 7.79.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fixes the following security issues:

- CVE-2021-22945: UAF and double-free in MQTT sending
  When sending data to an MQTT server, libcurl could in some circumstances
  erroneously keep a pointer to an already freed memory area and both use
  that again in a subsequent call to send data and also free it again.

  https://curl.se/docs/CVE-2021-22945.html

- CVE-2021-22946: Protocol downgrade required TLS bypassed
  A user can tell curl to require a successful upgrade to TLS when speaking
  to an IMAP, POP3 or FTP server (--ssl-reqd on the command line or
  CURLOPT_USE_SSL set to CURLUSESSL_CONTROL or CURLUSESSL_ALL with libcurl).
  This requirement could be bypassed if the server would return a properly
  crafted but perfectly legitimate response.

  This flaw would then make curl silently continue its operations without
  TLS contrary to the instructions and expectations, exposing possibly
  sensitive data in clear text over the network.

  https://curl.se/docs/CVE-2021-22946.html

- CVE-2021-22947: STARTTLS protocol injection via MITM
  When curl connects to an IMAP, POP3, SMTP or FTP server to exchange data
  securely using STARTTLS to upgrade the connection to TLS level, the server
  can still respond and send back multiple responses before the TLS upgrade.
  Such multiple "pipelined" responses are cached by curl.  curl would then
  upgrade to TLS but not flush the in-queue of cached responses and instead
  use and trust the responses it got before the TLS handshake as if they
  were authenticated.

  Using this flaw, it allows a Man-In-The-Middle attacker to first inject
  the fake responses, then pass-through the TLS traffic from the legitimate
  server and trick curl into sending data back to the user thinking the
  attacker's injected data comes from the TLS-protected server.

  Over POP3 and IMAP an attacker can inject fake response data.

  https://curl.se/docs/CVE-2021-22947.html

In addition, 7.79.1 fixes a number of regressions in 7.79.0:
https://daniel.haxx.se/blog/2021/09/22/curl-7-79-1-patched-up-and-ready/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 5e5776d1e3..b13f01c874 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.78.0.tar.xz.asc
+# https://curl.se/download/curl-7.79.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  be42766d5664a739c3974ee3dfbbcbe978a4ccb1fe628bb1d9b59ac79e445fb5  curl-7.78.0.tar.xz
+sha256  0606f74b1182ab732a17c11613cbbaf7084f2e6cca432642d0e3ad7c224c3689  curl-7.79.1.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4e3c6d4523..a70ebe4113 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.78.0
+LIBCURL_VERSION = 7.79.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
