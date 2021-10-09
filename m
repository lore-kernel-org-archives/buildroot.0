Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C67AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:20:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001A060F6E
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 001A060F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C117760758;
	Sat,  9 Oct 2021 20:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7Z0eD7WMQP2; Sat,  9 Oct 2021 20:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2292760732;
	Sat,  9 Oct 2021 20:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6021BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A393829DB
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0MZopbhCW1J for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:20:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77DD982919
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:20:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DE86594C43; Sat,  9 Oct 2021 20:17:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:20:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a49697761b8270866e7a9ff99aa0d921cbf153a
X-Git-Newrev: dec95d8d79923fbf96f5692b24ea987eeec1d516
X-Patchwork-Hint: ignore
Message-Id: <20211009201738.DE86594C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_43744
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

commit: https://git.buildroot.net/buildroot/commit/?id=dec95d8d79923fbf96f5692b24ea987eeec1d516
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnuradio package fails to build for the SH4 architecture with optimization
enabled with gcc 9.3.0:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/    http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/
and I've tested it shows up with gcc 10.x and 11.x

I've commented it and supplied preprocessed file to reopen it since it was
closed with gcc 4.x:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 1223e95c9b..0782fc6922 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -115,6 +115,16 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_or1k
 	depends on !BR2_xtensa
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744. This bug no
+# reappeared on gcc 9.x and is still not fixed on gcc 11.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
+	bool
+	default y if BR2_sh4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_63261
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
