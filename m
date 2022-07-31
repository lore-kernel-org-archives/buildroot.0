Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61187C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0793E831CA;
	Sun, 31 Jul 2022 06:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0793E831CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIxUzcT536fZ; Sun, 31 Jul 2022 06:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AEF082ED2;
	Sun, 31 Jul 2022 06:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AEF082ED2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4743F1BF976
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C1E60B43
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C1E60B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2URgpjTXMXH for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:18:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1ED60AE9
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1ED60AE9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AFA31868CE; Sun, 31 Jul 2022 06:04:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 08:18:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: dc6b4ba66721e9b91119440a3bf402807c9bd2db
X-Git-Newrev: a8705c4706451ed936e8a426dc2fcfcf453dd8de
X-Patchwork-Hint: ignore
Message-Id: <20220731060456.AFA31868CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libopenssl:
 security bump to version 1.1.1q
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8705c4706451ed936e8a426dc2fcfcf453dd8de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes the following security issues:

AES OCB fails to encrypt some bytes (CVE-2022-2097)
===================================================

Severity: MODERATE

AES OCB mode for 32-bit x86 platforms using the AES-NI assembly optimised
implementation will not encrypt the entirety of the data under some
circumstances.  This could reveal sixteen bytes of data that was
preexisting in the memory that wasn't written.  In the special case of
"in place" encryption, sixteen bytes of the plaintext would be revealed.

Since OpenSSL does not support OCB based cipher suites for TLS and DTLS,
they are both unaffected.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9cf73b3fe186c6a14c4d2eb5900976dddff7309f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 2f76241c72..8457df6c0a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1p.tar.gz.sha256
-sha256  bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f  openssl-1.1.1p.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1q.tar.gz.sha256
+sha256  d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca  openssl-1.1.1q.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 195438c6b5..135129d47f 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1p
+LIBOPENSSL_VERSION = 1.1.1q
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
