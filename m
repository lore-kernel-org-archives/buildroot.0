Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434ECCA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADF383FAE;
	Sun, 24 Aug 2025 09:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBpTcNzlmpEM; Sun, 24 Aug 2025 09:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D586083EDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D586083EDF;
	Sun, 24 Aug 2025 09:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B32B219C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99443616FF
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz_EEJUQ7LNA for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63266083B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63266083B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6CB587998; Sun, 24 Aug 2025 09:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 11:41:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d402ffe2763cd9db3a01a15c7d6a89c3433af7c9
X-Git-Newrev: 164d6e65c74305ee19343c7db0b83c30057b9c50
X-Patchwork-Hint: ignore
Message-Id: <20250824095051.D6CB587998@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: CIP 5.10 versions not available for
 Loongarch
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=164d6e65c74305ee19343c7db0b83c30057b9c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Loongarch support was added upstream in Linux 5.19, so it is not
available in the CIP versions that are based on 5.10. Prevent from
selecting those kernel versions when Loongarch is used.

Fixes:

  https://autobuild.buildroot.net/results/eebcf605f8f868a668960152f30c08f700405a4d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 27321eee50..1d2334dde1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -36,6 +36,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -56,6 +58,8 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
