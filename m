Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7A2C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40BDF80CBD;
	Fri, 11 Jul 2025 10:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dswU5hCqv7SH; Fri, 11 Jul 2025 10:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214DA83EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214DA83EA1;
	Fri, 11 Jul 2025 10:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1187114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FEB740C84
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9VW5fzMwzqw for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B0B40CAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45B0B40CAD
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43AF3862CE; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 16:09:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 58cdf8da6324d7f04f1c1c57c41cf18babfc207f
X-Git-Newrev: 946b7ff2280aab9f848020598a145c6d468858b6
X-Patchwork-Hint: ignore
Message-Id: <20250711100953.43AF3862CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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

commit: https://git.buildroot.net/buildroot/commit/?id=946b7ff2280aab9f848020598a145c6d468858b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since the introduction of CMake 4 in several distributions, build errors
started occurring on those distributions for cmake packages that
included calls to cmake_minimum_required() or cmake_policy() with a
version older than 3.50 (see [1]).

To avoid backporting numerous individual fixes for affected packages,
commit [2] was previously applied to the LTS branch as a workaround.

Following further discussion (see [2][3]), that raised concerns about
policy changes between CMake versions that could lead to breaking builds
in non-obvious ways, a different approach was chosen.

This patch reverts commit [2] and instead of applying a global
compatibility variable, we now enforce building host-cmake when the host
system provides CMake 4 or newer.

[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
[2] 70aac2d9e8 package/pkg-cmake.mk: force config version >=3.5
[3] https://lists.buildroot.org/pipermail/buildroot/2025-May/780262.html
[4] https://lists.buildroot.org/pipermail/buildroot/2025-June/780372.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-cmake.mk                     | 4 ----
 support/dependencies/check-host-cmake.sh | 9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 08fe7c431e..ba287d244a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -53,10 +53,6 @@ define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
-# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
-# Set the policy version minimum to force these packages to 3.5 or greater.
-$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
-
 # The default backend, unless specified by the package
 $(3)_CMAKE_BACKEND ?= make
 
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..c7aa16f48d 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,9 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+major_max="4"
+minor_max="0"
+
 shift
 
 for candidate; do
@@ -32,6 +35,12 @@ for candidate; do
     major="${version%.*}"
     minor="${version#*.}"
 
+    if [ ${major} -gt ${major_max} ]; then
+        continue
+    elif [ ${major} -eq ${major_max} -a ${minor} -ge ${minor_max} ]; then
+        continue
+    fi
+
     if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
         exit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
