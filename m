Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E881CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2EB061278;
	Fri, 16 Oct 2026 13:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GvBo-gCqk90; Fri, 16 Oct 2026 13:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1537B61286
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156364;
	b=U6U3vawysH1GNQsF47TyyJAvC1K/aKv63FVGaPbd+PJGeVDitLm0oYPzMO6IaMqcNddP
	 AZWfniyU8DUTYQnasbIgo2c4fVypF4Y4BhyAu3b4cLPPsGyWcn1igfryTYv4TjbViHyW6
	 euUEtDcxO5QsBbzJ7QxIAiaRoTPuAPZoqRIYg2ORn74BxW8fwFVBTxxzv81I/H+KifMAG
	 O1VFqVkwe1QIA++zwT00IwaKH9FddRjyGE+BG/6tu4C7Wjm+dDO2+Jb2c0+X48JP0VgKJ
	 Hux+MwNIWuEGX7ueXeAWRA5uyue8XNL6GRmWf4GX95ZXF6Hu4cTcQiDSaELTAZ+hRzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qLyoSNjHI5T11G7EujH2KItgvLKYwD4WBcnsUW2UjXM=;
	b=oi8FNioSKkaeSxNNF0J5HJB16CppBoUly4M3YJfuUG+I+hnzyj/dPyKg02CdxKoi6PF4
	 tkryJidi9esuRA9GlJBHn1T++Y1H4M5pbKDOJJHfWnAyjN+ksAJjP01D1j9qaLEFssELH
	 P6eE1jVJhqj6uQVnojG2GWTcfBbK+ljFcW3kG1QEY+N/cyH1IxQ3H0FYKKuyv2xHbwiFi
	 QzXr+PSC3S1pEDh5MHzqI3fj5SW8klPqYFotKWMnQzyLZx18a+Q0QahOFdXACfm+aBda4
	 0Qpa6GRdTD+gEvuuAqnap1J0gGQc/fwOON7usNVj8uPx9jgN+d2JL+ZbMg9t6ZDWnqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156364;
	bh=qLyoSNjHI5T11G7EujH2KItgvLKYwD4WBcnsUW2UjXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k9i6Nx0QJdIRu7xsr9mggMzksmtNg+ESSU7pQM9KlgrrL7/Y0x16FeqDJ2CU19Gyp
	 U2OA1UHFWZeYvPJj27qwNEYHPn0Sf65d2DVmjla/7OyKyRkEdqjy6M+l2MYqJ7NREg
	 fRbiIFQ/on8mLTnRF/M7DTddpPzOEh601BIG4wNI6kcFmt6ioOodNlv1yKw0chVRoS
	 a/1YNPxydLDYQQ9Z+LuSumK2RQkUiXze8MZ0lsnALjsmgCb0bREo4Cab+TE7ti2oB4
	 xCg05O8LHj8m16iB4IucIdyV5VqeUEO6KeyTr6H9QPUpLYRCVxiyPBwwX3nk5f51lh
	 bulIH1DvdtgjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1537B61286;
	Fri, 16 Oct 2026 13:12:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA5A4105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF41E60E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwmrUdmEErIt for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A69B760F25
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=pN3w5RfbJ6lc3lEFhYW8Y8RLBIfjqOJBhlIboeCFpTAFSUT+ZxkjCGPTxHaPcpoYXVAm
 yTL2aSCaOIhELKrkwxrOjgo7GUyPc4pOLprIF/GQ/tTPszUcqMSOxZf7DnvGhz5v4fwZ/
 EVpH1pM8GrTDdxu8rTY8ujT5YQKy56tFiLidVMG18V2RCnkf+knEfYiNu+/5LBmYMIPAM
 Rr1VkFtgHzbr5T/1ax4o3ef0L5P0uVMzyA+4GgweJ9vKRtOtVbHaT3hzFj0mt9G5iq3/z
 jNmd1h/N+g3giDGDZRyKL2tng2THxBwtSZCwH2jKpiPcB7g9/hsTsyKWoN2OnpJQs0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KuEdJzsiRVZykQE3thL9/AoQPR7tHxF4O4KoWI5Zo8w=;
 b=fH0Ud/4YTaWYKkISfZK60fQJ4Xvj0bCVv+pJa888PFsTCs9HoWNzinSRn81T1JVrXoC/
 Sm9j9ckeX/8falI1HXmbmUNhoV66jZygEuLQYdX3Y+MPoMPthC72wNm+GR5uPb3W2ow/X
 +u065UCJ4YgDXfu/kjn4C3XcgAx1Uv7PUWsV5HbnNCGF5VL9KW1f79FLjfRTvuLhWkUwQ
 hA8dfnbUwrPNk/oUGaY9/tGBUzuSRezW98mOraobK/b/2LFm0rAxyDwUJ+10uir8iXgqj
 zNRh9Vr0yjj0048MGaT89cfLsE4wqAOd+an2FDx0fU0D3nuEP99E9fBkALzWFcUZejQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69B760F25
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 970D0960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 33ea536021e6b8a57569af46e46eeed838f66572
X-Git-Newrev: 3f859c10afd3c5ad5c0f3b7978acf2f97464ca79
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.970D0960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/luvi: fix build
 without c++
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4049436318558502058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4049436318558502058==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f859c10afd3c5ad5c0f3b7978acf2f97464ca79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d267b59fa9219f3a6127dd687cf68a0c51e189ac)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-CMakeLists.txt-only-require-a-C-compiler.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..6f4ecdea80
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,45 @@
+From c6a1f6a3650e8487e506080eb34a244e75e37a78 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 8978910..55d1cde 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -298,6 +298,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++	enable_language(CXX)
+ 	set(CMAKE_CXX_STANDARD 20)
+ 	set(CMAKE_CXX_STANDARD_REQUIRED YES)
+ 	
+-- 
+2.55.0
+

--===============4049436318558502058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4049436318558502058==--
