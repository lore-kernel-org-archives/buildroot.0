Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:36:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B0C60FDA
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B0C60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C9860EA2;
	Tue, 21 Sep 2021 20:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a70N8tIVYuiC; Tue, 21 Sep 2021 20:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0313D610D8;
	Tue, 21 Sep 2021 20:36:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15EDD1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3495480F71
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czSgjRPgXUeX for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F20581C26
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8CD2C8C070; Tue, 21 Sep 2021 20:33:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:22:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23a8baa779825554105c6b002d4acbe4e9bbe340
X-Git-Newrev: 883d5a2f3ddac1ece7170502a724c5b0a8005714
X-Patchwork-Hint: ignore
Message-Id: <20210921203343.8CD2C8C070@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_lxc bump to kernel
 4.19.204
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=883d5a2f3ddac1ece7170502a724c5b0a8005714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel 4.19.79 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

The issue was fixed in 4.19.114 [2]
Bump to the latest 4.19.x version.

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_lxc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index b32b7a20c4..d98bed8761 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -12,7 +12,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.79"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
