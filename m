Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A980C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1FB81769;
	Tue, 26 Jul 2022 20:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC1FB81769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-HMJ9GA0834; Tue, 26 Jul 2022 20:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6175381766;
	Tue, 26 Jul 2022 20:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6175381766
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F053D1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E20408E5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E20408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8OmY-s43lvb for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E28840350
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E28840350
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A036786025; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9522dde0708fc49c337e94b0653a41a83acb93ac
X-Git-Newrev: b4cb2d3ebc6e2c08fb79e1c195a5028ed24a0cde
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.A036786025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/toolchainfile.cmake.in: add
 definitions needed by Qt6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4cb2d3ebc6e2c08fb79e1c195a5028ed24a0cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling Qt6 applications for the target, CMake needs to have
two variables defined to find the host installation of Qt. These two
variables are unconditionally defined, regardless of whether Qt6 is
enabled in the configuration or not, as they do no harm when Qt6 is
not present/used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/toolchainfile.cmake.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 30c0e63bf2..5d2b8695b4 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -125,3 +125,12 @@ if(@@TOOLCHAIN_HAS_FORTRAN@@)
     set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
   endif()
 endif()
+
+# For Qt6
+if(NOT DEFINED QT_HOST_PATH)
+  set(QT_HOST_PATH "${RELOCATED_HOST_DIR}")
+endif()
+
+if(NOT DEFINED QT_HOST_PATH_CMAKE_DIR)
+  set(QT_HOST_PATH_CMAKE_DIR "${RELOCATED_HOST_DIR}/lib/cmake")
+endif()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
