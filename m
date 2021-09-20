Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE33C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 20:30:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CB1610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 20:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3CB1610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D2680F1B;
	Mon, 20 Sep 2021 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GzzJHnglm-b; Mon, 20 Sep 2021 20:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F5480F12;
	Mon, 20 Sep 2021 20:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96A091BF383
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 20:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A8940378
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 20:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7IK-z1Rkz0m for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 20:30:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C2F640372
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 20:30:47 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EDE741C0003;
 Mon, 20 Sep 2021 20:30:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mSPw2-0006BT-Rb; Mon, 20 Sep 2021 22:30:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 22:30:39 +0200
Message-Id: <20210920203041.23723-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version 7.79.0
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 5e5776d1e3..d9732e1669 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.78.0.tar.xz.asc
+# https://curl.se/download/curl-7.79.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  be42766d5664a739c3974ee3dfbbcbe978a4ccb1fe628bb1d9b59ac79e445fb5  curl-7.78.0.tar.xz
+sha256  2a1420076f9ffc35c982c78e85b7a69e2ef5d532267895fdb2eac16ad9b680c9  curl-7.79.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4e3c6d4523..4f637aea4e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.78.0
+LIBCURL_VERSION = 7.79.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
