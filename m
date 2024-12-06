Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695DAE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1C540363;
	Fri,  6 Dec 2024 22:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTLGFCPTBcqV; Fri,  6 Dec 2024 22:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88DB40336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88DB40336;
	Fri,  6 Dec 2024 22:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F817ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41BDC40177
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOZ_xXrtfcKL for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B8740106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B8740106
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0FF486ADF; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:25:53 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d016e8b8860f8a8dcae3739f866dcedfdd1c33d1
X-Git-Newrev: b3fad7e10566b90385a0c85554913fedbeda4015
X-Patchwork-Hint: ignore
Message-Id: <20241206225402.B0FF486ADF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libvpl: not
 supported on mips64
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3fad7e10566b90385a0c85554913fedbeda4015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Although adding " || defined(__mips__)" here:
https://github.com/intel/libvpl/blob/main/api/vpl/mfxdefs.h#L71

would fix the problem, libvpl alone makes no sense and the only
dependee, intel-vpl-gpu-rt, is unsupported on mips anyway.

Fixes:
http://autobuild.buildroot.net/results/50d/50d64ab2d547c70b39e2421ee2763d8309873125/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 014a8201c857e81abeca026211e84f9c9353c9ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index b9e9a20fd7..5a370ed2e3 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARCH_IS_64
+	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
 	default y if BR2_arm
 
 config BR2_PACKAGE_LIBVPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
