Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C322C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 19:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042BA82121;
	Wed,  4 Jun 2025 19:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6bd_efCWGDW; Wed,  4 Jun 2025 19:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D53820F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D53820F3;
	Wed,  4 Jun 2025 19:52:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7FE91A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EAFF83AB0
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EUWLWB-0OnQ for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 19:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB83A820BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB83A820BC
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:52:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F2A87941; Wed,  4 Jun 2025 19:52:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 21:51:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c874399d3c5cfa7e2f24e0ec2f2b7b3dd0336b80
X-Git-Newrev: b674736ae20c61089cf580db2fe96ffc52d96bfa
X-Patchwork-Hint: ignore
Message-Id: <20250604195208.E5F2A87941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unzip: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=b674736ae20c61089cf580db2fe96ffc52d96bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

unzip fails on hosts with CMake 4, such as Arch Linux:

  CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
    Compatibility with CMake < 3.5 has been removed from CMake.

    Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
    to tell CMake that the project requires at least <min> but has been updated
    to work with policies introduced by <max> or earlier.

    Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fix by updating the cmake_minimum_required to 3.5.

Fixes:
  https://autobuild.buildroot.org/results/211379177fbc293bcae3a16d951d263035a1d8a3/
  https://autobuild.buildroot.org/results/5701aae037df6997724765cac53c3247c367508a/
  https://autobuild.buildroot.org/results/d1d48040e7db67a54dc5ce24d19d97084407a401/
  and other similar failures

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
index cbc58e484b..bdb3eae6af 100644
--- a/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
+++ b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
@@ -31,7 +31,7 @@ index 0000000..27951b4
 --- /dev/null
 +++ b/CMakeLists.txt
 @@ -0,0 +1,17 @@
-+cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
 +INCLUDE(CheckFunctionExists)
 +
 +project(unzip C)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
