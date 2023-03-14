Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF64C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CC760AA3;
	Tue, 14 Mar 2023 14:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CC760AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M77B2epnDXit; Tue, 14 Mar 2023 14:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44833610D8;
	Tue, 14 Mar 2023 14:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44833610D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47A3E1BF329
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FB1B414C6
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB1B414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QawkH6C2E4s4 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 14:03:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1366141496
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 14:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1366141496
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0F468730F; Tue, 14 Mar 2023 14:03:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 15:01:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bd6c387ddba9b3d6216d466b6bf0d70b2f430bbf
X-Git-Newrev: dbf4bfff6790bed0fca2e8337f28df07ecb9be7a
X-Patchwork-Hint: ignore
Message-Id: <20230314140313.F0F468730F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pcm-tools: needs
 NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbf4bfff6790bed0fca2e8337f28df07ecb9be7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

pcm-tools needs NPTL since its addition in commit
60eb2cec80e5258a0c43090f539749606744e182:

cpucounters.cpp: In constructor 'pcm::TemporalThreadAffinity::TemporalThreadAffinity(pcm::uint32, bool)':
cpucounters.cpp:252:9: error: 'pthread_getaffinity_np' was not declared in this scope; did you mean 'sched_getaffinity'?
  252 |         pthread_getaffinity_np(pthread_self(), set_size, old_affinity);
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         sched_getaffinity

Fixes:
 - http://autobuild.buildroot.org/results/8bbf9c36af332bbf5e7c1abcbb594a0b231ef97e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9d74f85c97d21461a5a23b27eb682c1157875bdb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcm-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
index ca9719dc5f..6bf05f32d7 100644
--- a/package/pcm-tools/Config.in
+++ b/package/pcm-tools/Config.in
@@ -1,11 +1,13 @@
-comment "pcm-tools needs a toolchain w/ C++"
+comment "pcm-tools needs a toolchain w/ C++, NPTL"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_PCM_TOOLS
 	bool "pcm-tools"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PCI_IDS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
