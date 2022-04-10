Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB799C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF5F4156D;
	Sun, 10 Apr 2022 14:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_6rWJaB3UHZ; Sun, 10 Apr 2022 14:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C9941524;
	Sun, 10 Apr 2022 14:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4704D1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E1A4055D
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Al5FWiTRyIe for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F95E408C8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9D418837C6; Sun, 10 Apr 2022 14:38:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:38:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df3cc4bb1c91114d29e48d8bc8206adcc35e9b9c
X-Git-Newrev: c4872446c8c5cd34b2f8e0ed66932cb3ba62556a
X-Patchwork-Hint: ignore
Message-Id: <20220410143837.9D418837C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: doesn't support libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4872446c8c5cd34b2f8e0ed66932cb3ba62556a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since the addition
of the package in commit f6f0e1e58168dfa9194db2e073efd20a98c15728:

In file included from est.c:28:
est.h:27:10: fatal error: openssl/srp.h: No such file or directory
   27 | #include <openssl/srp.h>
      |          ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0dd755effbdddfa1b578fec9f1b1c9366b6822bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index d8271ad69e..6abe9d2848 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBEST
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  libest is a C implementation of RFC 7030 (Enrollment over
 	  Secure Transport).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
