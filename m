Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2146FC4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 15:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CD6408CA;
	Sun, 11 Dec 2022 15:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CD6408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u13WVvolf_Qd; Sun, 11 Dec 2022 15:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A4140360;
	Sun, 11 Dec 2022 15:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A4140360
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52D0C1BF860
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A9E540360
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A9E540360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seI1GbZo1vNq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 15:19:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E45B40350
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 15:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E45B40350
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2984E8641C; Sun, 11 Dec 2022 15:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 15:59:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28f31d4694ad212d9b511c53ba35c6443eeef972
X-Git-Newrev: 071fdbf963228590b453e5111eadc8a74b579aa2
X-Patchwork-Hint: ignore
Message-Id: <20221211151913.2984E8641C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: propagate dependencies
 from pcsc-lite
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

commit: https://git.buildroot.net/buildroot/commit/?id=071fdbf963228590b453e5111eadc8a74b579aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d590003e31dd (package/pcsc-lite: needs gcc >= 4.9) propagated
that new dependency to a bunch of packages that select pcsc-lite.

Then commit 8aaa7ecbce1d (package/opensc: new package) introduced
opensc, which selects pcsc-lite. However, the package was submitted
before the dependency to gcc 4.8+ was added to pcsc-lite, and that was
missed during the review.

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opensc/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index 2cec096ac2..8c6a95a41d 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPENSC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -13,6 +14,7 @@ config BR2_PACKAGE_OPENSC
 
 	  https://github.com/OpenSC/OpenSC/wiki
 
-comment "opensc needs a toolchain with dynamic library, threads"
+comment "opensc needs a toolchain with dynamic library, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
