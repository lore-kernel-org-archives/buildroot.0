Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BA1C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19BF60B9A;
	Sun, 14 Aug 2022 20:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A19BF60B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncFZ6vU3CY2J; Sun, 14 Aug 2022 20:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 014BC60AA4;
	Sun, 14 Aug 2022 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 014BC60AA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2473B1BF3BD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9B540126
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C9B540126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4MWIe7KR4iy for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C77400AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C77400AC
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 656A2875A3; Sun, 14 Aug 2022 20:42:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 22:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 375f5dd1bd036fd8213bade31881b368d2650603
X-Git-Newrev: ac98e808e4485cc93b5456f57d12cc247926c701
X-Patchwork-Hint: ignore
Message-Id: <20220814204201.656A2875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: ftdidmx needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac98e808e4485cc93b5456f57d12cc247926c701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since re-introduction of the
package in commit 16ff948444c3978d63f483344a3d92d994c64312:

Makefile:575: *** libusb is in the dependency chain of libftdi1 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/f65baf4dd4c9a313745cdb9aefad2eae7a295469

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index cfca09a936..701083b5d3 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -86,10 +86,14 @@ config BR2_PACKAGE_OLA_PLUGIN_ESPNET
 
 config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
 	bool "ftdidmx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Build FTDI USB DMX plugin for OLA.
 
+comment "ftdidmx needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_GPIO
 	bool "GPIO"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
