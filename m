Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D646C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD68402AA;
	Sat,  1 Jan 2022 10:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dkhbz4OKvVT; Sat,  1 Jan 2022 10:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2871740871;
	Sat,  1 Jan 2022 10:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94B4E1BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D349817ED
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IAyKH1HEGj1 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:20:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E10817AA
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 662E981A0E; Sat,  1 Jan 2022 10:14:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:17:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6990000654e564a357c446ee2bf5afb04ae046a2
X-Git-Newrev: ef7ace1017f13ca9266bb689c18bc008cca92ed2
X-Patchwork-Hint: ignore
Message-Id: <20220101101449.662E981A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: Make sure for ARC only
 Zero is selectable
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef7ace1017f13ca9266bb689c18bc008cca92ed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a5d2c379ebf5 (package/openjdk: add ARC HS3x/4x support via "Zero
Assembly Project") forgot to limit the scope of the ARC support.

As of now for ARC we only have fully-interpreted mode AKA "Project Zero"
and so all the JIT'ed modes must be explicitly disabled for ARC.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openjdk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index b6eb2d7818..8b7fd4653e 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -126,19 +126,19 @@ config BR2_PACKAGE_OPENJDK_FULL_JDK
 
 choice
 	prompt "openjdk variant"
-	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !(BR2_powerpc || BR2_arc)
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_arc
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "client"
-	depends on !BR2_powerpc
+	depends on !(BR2_powerpc || BR2_arc)
 	help
 	  Quick loading, but slower run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
 	bool "server"
-	depends on !BR2_powerpc
+	depends on !(BR2_powerpc || BR2_arc)
 	help
 	  Slower loading, but faster run-time performance.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
