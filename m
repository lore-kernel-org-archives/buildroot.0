Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BC5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE79982505;
	Sun, 19 Jun 2022 12:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE79982505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzSdxJZGPvyv; Sun, 19 Jun 2022 12:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED85881CAD;
	Sun, 19 Jun 2022 12:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED85881CAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A56521BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 206B1405A8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 206B1405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2p-WX0Cinc3m for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4465A40895
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4465A40895
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 58C5487133; Sun, 19 Jun 2022 12:28:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:30:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e69d30e8b5a57fec01aedb3d6b0a9910aabca6ab
X-Git-Newrev: 6c7b46945e656e03713ffeb1230211ec81791478
X-Patchwork-Hint: ignore
Message-Id: <20220619122848.58C5487133@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: allow ualpn with mbedTLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c7b46945e656e03713ffeb1230211ec81791478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the update to mbedTLS 2.28.0 in commit 0f8aab08, ualpn can
work with mbedTLS without restrictions.

References
https://git.buildroot.net/buildroot/commit?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
https://github.com/ndilieto/uacme/issues/23#issuecomment-1043409796
https://github.com/ndilieto/uacme/commit/bbee626cf5f60908f064c123f7a9622639348c3d
https://github.com/Mbed-TLS/mbedtls/pull/3243

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index d693436115..58b7c534e7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -19,7 +19,6 @@ if BR2_PACKAGE_UACME
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBEV
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
@@ -28,7 +27,4 @@ config BR2_PACKAGE_UACME_UALPN
 comment "ualpn needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "ualpn needs either OpenSSL or GnuTLS"
-	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS)
-
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
