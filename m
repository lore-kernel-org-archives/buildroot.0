Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F36C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF37D60C18;
	Sun, 18 Sep 2022 07:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF37D60C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e32OwYb3dyfy; Sun, 18 Sep 2022 07:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034F060AC1;
	Sun, 18 Sep 2022 07:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034F060AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 850E21BF484
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C25A4240B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C25A4240B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjOy8yZnWHQB for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:04:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 553574032A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553574032A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4133984761; Sun, 18 Sep 2022 07:04:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 09:02:11 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 31f1414020e5a172960e3de2b0fe4dd52772f579
X-Git-Newrev: 6c7de82baa1458eb74a14ed5bd4b6d90f5c27cea
X-Patchwork-Hint: ignore
Message-Id: <20220918070402.4133984761@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/glibc: glibc on
 or1k needs a toolchain w/ headers >= 5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c7de82baa1458eb74a14ed5bd4b6d90f5c27cea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit [1] enabled glibc on or1k since it's now supported but it
requires a toolchain with linux-headers >= 5.4.

From [2]:
"Here we define the minumum linux kernel version at 5.4.0, as that is the
long term support version where 32-bit architectures start to support
64-bit time API's.  The OpenRISC kernel had some bugs up until version 5.8
which caused issues with glibc fork/clone, they have been backported to
5.4 but not previous versions."

Fixes:

  checking installed Linux kernel header files... 3.2.0 or later
  checking for kernel header at least 5.4.0... too old!
  configure: error: *** The available kernel headers are older than the requested

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/2875256686

[1] 68d0aede597d32816c5b2ff32de0ce33cc14eb93
[2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0c3c62ca7d9ff3bdacdd13e636bc858101e3e288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 7537419257a1ea1b3bd82a2f72e900d68cbb3645)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 2c6dc40139..85c25482c7 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
 
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index b58c02aea9..e67e9f406d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -72,6 +72,10 @@ comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
 	depends on BR2_arc
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
+comment "glibc on or1k needs a toolchain w/ headers >= 5.4"
+	depends on BR2_or1k
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_PACKAGE_MUSL_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
