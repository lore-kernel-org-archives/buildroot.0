Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1646ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4793C61015;
	Tue, 30 Aug 2022 20:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4793C61015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDjA9A37s0o2; Tue, 30 Aug 2022 20:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30ABF61003;
	Tue, 30 Aug 2022 20:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ABF61003
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2DD41BF4E6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F4240481
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F4240481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiKsH_kdzPj4 for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 20:33:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D6D0400AF
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 20:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D6D0400AF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 712D58818D; Tue, 30 Aug 2022 20:17:59 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 22:31:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c72795e3d6d321de82b888a24962061dd5c30353
X-Git-Newrev: 7537419257a1ea1b3bd82a2f72e900d68cbb3645
X-Patchwork-Hint: ignore
Message-Id: <20220830201759.712D58818D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: glibc on or1k needs a
 toolchain w/ headers >= 5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7537419257a1ea1b3bd82a2f72e900d68cbb3645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 23cbfcd9aa..ba9f691d80 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
 
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 836af3b22a..154cf69ef1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -67,6 +67,10 @@ comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
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
