Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950E8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C24540B81;
	Wed, 21 Dec 2022 14:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C24540B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdyzSuW4tQzi; Wed, 21 Dec 2022 14:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8139B40393;
	Wed, 21 Dec 2022 14:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8139B40393
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 239271BF5D7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B678417FC
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B678417FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5xdrLmpKtLj for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA20417BC
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA20417BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E551786BD6; Wed, 21 Dec 2022 14:24:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 15:23:22 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d4882016b7e829a7b83b6b9f23664d7a2ebff1b8
X-Git-Newrev: bd26055b43aa7f1dc541e87abcf85b8e9749fad1
X-Patchwork-Hint: ignore
Message-Id: <20221221142432.E551786BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/opensc: propagate
 dependencies from pcsc-lite
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd26055b43aa7f1dc541e87abcf85b8e9749fad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit d590003e31dd (package/pcsc-lite: needs gcc >= 4.9) propagated
that new dependency to a bunch of packages that select pcsc-lite.

Then commit 8aaa7ecbce1d (package/opensc: new package) introduced
opensc, which selects pcsc-lite. However, the package was submitted
before the dependency to gcc 4.8+ was added to pcsc-lite, and that was
missed during the review.

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 071fdbf963228590b453e5111eadc8a74b579aa2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
