Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637E7C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B56E607F6;
	Sat, 31 May 2025 16:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu6F-zRVBmcJ; Sat, 31 May 2025 16:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CA8F60760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA8F60760;
	Sat, 31 May 2025 16:55:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D403235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1419940B56
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBRlpigdZc7o for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307BD40B97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307BD40B97
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2102987578; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 10:15:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d87a2dea29c7be0a00408fd8bc20bba0862b83e2
X-Git-Newrev: 70aac2d9e8bbf3fbbfaae713c996abff6bdf1c97
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.2102987578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-cmake.mk:
 force config version >=3.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70aac2d9e8bbf3fbbfaae713c996abff6bdf1c97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Some packages have CMakeLists.txt requiring CMake <3.5.

Newer CMake forces at minimum version 3.5, leading to build failures:

https://github.com/skiffos/SkiffOS/actions/runs/14208988354/job/39812576139#step:8:638
https://github.com/skiffos/SkiffOS/actions/runs/14211566256/job/39819600184#step:8:26664

Add the suggested build flag to force version 3.5.x and fix the error:

  -DCMAKE_POLICY_VERSION_MINIMUM=3.5

This is applied to all cmake packages to force 3.5 as a minimum.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-cmake.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c7032312fb..7bff3851cf 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -53,6 +53,10 @@ define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
+# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
+# Set the policy version minimum to force these packages to 3.5 or greater.
+$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
+
 # The default backend, unless specified by the package
 $(3)_CMAKE_BACKEND ?= make
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
