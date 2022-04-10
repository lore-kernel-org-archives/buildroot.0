Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA9FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 19:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64CC415FC;
	Sun, 10 Apr 2022 19:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wc0V_5rrUl8I; Sun, 10 Apr 2022 19:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821C8415F4;
	Sun, 10 Apr 2022 19:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76C8C1BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5697C60AFF
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4AHm2RoK6uy for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A0ED60BA4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60D32838C5; Sun, 10 Apr 2022 19:49:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 21:57:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 15c6374a56691addbf718078143a7ff16ecf3e23
X-Git-Newrev: 7fb40b1468867d158b7aa497abaad5592f267c5c
X-Patchwork-Hint: ignore
Message-Id: <20220410194900.60D32838C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libest: doesn't
 support libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fb40b1468867d158b7aa497abaad5592f267c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit c4872446c8c5cd34b2f8e0ed66932cb3ba62556a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
