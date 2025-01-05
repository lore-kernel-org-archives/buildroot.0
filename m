Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C3C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B914EFEB;
	Fri, 28 Feb 2025 16:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7AGQ0I20XD3; Fri, 28 Feb 2025 16:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 595CB4FD50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 595CB4FD50;
	Fri, 28 Feb 2025 16:50:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E2A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7412E42ECD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXMD9VWB1vcv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D479F4240B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D479F4240B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF3698345D; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 11:48:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9114d48b313744fd163e4eeea0f5b0407568e771
X-Git-Newrev: 1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.CF3698345D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-kernel-module:
 disable CONFIG_TRIM_UNUSED_KSYMS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel option CONFIG_TRIM_UNUSED_KSYMS=y allows to trim unused
kernel symbols... which basically prevents building external
modules. This option has been enabled in the default MIPS architecture
kernel defconfig since pretty much forever, and it causes build
failures of all our external modules on MIPS in the autobuilders.

To fix this in a global manner, we handle the problem in the
kernel-module infrastructure, by appending to the
<pkg>_LINUX_CONFIG_FIXUPS variable provided by the package.

Fixes:

  http://autobuild.buildroot.net/results/c26abec4e24d06557079654b12825efb2211996f/ (cryptodev-linux)
  http://autobuild.buildroot.net/results/699c618730cb33f0ccf54f90e4b722198fd3d3bc/ (emlog)
  http://autobuild.buildroot.net/results/f1d5626f5698a955bf378217528fbf4f8f741435/ (rtl8812au-aircrack-ng)
  http://autobuild.buildroot.net/results/c9a507757ce3a01cd08d596cb519ee9f19caf77c/ (mdio-tools)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-kernel-module.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 4f64a73f11..032874c3ca 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -62,6 +62,9 @@ $(2)_MAKE ?= $$(BR2_MAKE)
 # the root of the package.
 $(2)_MODULE_SUBDIRS ?= .
 
+$(2)_LINUX_CONFIG_FIXUPS += \
+	$$(sep)$$(call KCONFIG_DISABLE_OPT,CONFIG_TRIM_UNUSED_KSYMS)
+
 # Build the kernel module(s)
 # Force PWD for those packages that want to use it to find their
 # includes and other support files (Booo!)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
