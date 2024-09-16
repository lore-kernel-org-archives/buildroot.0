Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE17C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B87C401CF;
	Mon, 16 Sep 2024 09:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWrRIvwgKcck; Mon, 16 Sep 2024 09:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8CE3401A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8CE3401A6;
	Mon, 16 Sep 2024 09:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10381BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF64F40110
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PGA3nn23xIi for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FE84018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2FE84018E
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB21B83776; Mon, 16 Sep 2024 09:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:24:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3b655b9cb1c6b661a2f8c2c211370314b817e069
X-Git-Newrev: c76454f0e75fb4d668a22cba85062a6ee2d908df
X-Patchwork-Hint: ignore
Message-Id: <20240916093225.EB21B83776@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libpcap: fix
 m68k-cf compile issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=c76454f0e75fb4d668a22cba85062a6ee2d908df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Compilation with -Os triggers this assembler problem.
The problematic C code contains a long switch statement, so
everything looks like GCC Bug 104028 is triggered.

Fixes:
 - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6362dd1d1416949cfccb2469f4da4c52b4ac8491)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a4523f2218..3d05590da3 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -57,5 +57,9 @@ ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+LIBPCAP_CFLAGS += -O2
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
