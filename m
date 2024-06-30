Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE51C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2095F817AF;
	Sun, 30 Jun 2024 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVJiGy9QlqSv; Sun, 30 Jun 2024 15:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 325C4817B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325C4817B1;
	Sun, 30 Jun 2024 15:31:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17C8A1BF36A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 15:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 057D760703
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 15:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FHJzHpGTjXp for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 15:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E64806067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E64806067A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E64806067A
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 15:31:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a87.dip0.t-ipconnect.de [91.58.10.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 738F5A4C0A6E;
 Sun, 30 Jun 2024 17:31:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47022)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNwWV-0000000060D-1y7l;
 Sun, 30 Jun 2024 15:31:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 17:31:26 +0200
Message-Id: <20240630153126.259530-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719761487;
 bh=1vFiWgZwWddToqKd2ZKUPodOIZPhoniWbnPeG8+RfRc=;
 h=From:To:Cc:Subject:Date:From;
 b=k1okjMTWHcRtAKHQUUIYwU3K6SBRVo7FmBJhLjGye9Gxkp2vprXm7WuMvIW2HENeB
 Bv6WU1Q2EVW6wcmX+wtYpjOhfS7BTg5lTJ8Pdm2CzKNRfuYa4z6Kl3rQjc929tKuKN
 CGR9mcs/beu+PBYIIlWvTU690ZbITBoNCX8GS4NbrSBsBRa1mpDIAPQ6fK90iJJ8T1
 H/HWPCudoDxLU4Ahoje8100V7j8jbon956NGDgtH5YGEvCEZS4dq8h1bcnRNAbs80S
 16N2D/FAfN1jGrMldw0pFnTIv23XwKKPlYNpfahUQxMWnwUoRtwIm4Ii85wtktnAo5
 dNaLfFvnpx9nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=k1okjMTW
Subject: [Buildroot] [PATCH 1/1] package/llvm-project/clang: update patch to
 be applied with fuzz 0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, host-clang fails to build with output:

Applying 0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch using patch:
patching file lib/Driver/ToolChains/Gnu.cpp
Hunk #1 FAILED at 1725.
Hunk #2 succeeded at 2011 (offset 277 lines).
1 out of 2 hunks FAILED -- saving rejects to file lib/Driver/ToolChains/Gnu.cpp.rej

Rebase the patch to fix the problem.

Fixes:
http://autobuild.buildroot.net/results/75b/75baa62275d64c699d9757f7c756fc03ea717877/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
index 08371154d5..ffdd5d187f 100644
--- a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
+++ b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
@@ -44,7 +44,7 @@ index 2ad45097dc..90d6b5b748 100644
 +++ b/lib/Driver/ToolChains/Gnu.cpp
 @@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
  
-     Prefixes.push_back(GCCToolchainDir);
+     Prefixes.push_back(std::string(GCCToolchainDir));
    } else {
 +    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
 +
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
