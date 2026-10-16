Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBCCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046B460BBE;
	Fri, 16 Oct 2026 13:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGTiJYNomBsx; Fri, 16 Oct 2026 13:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D694160E9B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156168;
	b=rr82/c7Dky+lotab3jPugOIn8ZrEyjxElG8mNjgn6aQM28Z5EKw/8MpEFU0RQNjwCRHi
	 3e9JTripmKzh3RjaIbVilEE+v2+IccfdXltOpaPgNaiyN7WEWYHhIcZzSWztPF3Ln987u
	 h1MsqrS6WfYbb+dg4FSjgNJQ/T1ifUDycYdwJUR94lej70dHnrP3DEOkv2dBopUOFN0Zk
	 CJDtKbQGXFApo+MYWxse6wH4gtaBKsOc2EpC9zcohUbjg9CqlYLxP8zIYVuIbcucYLR9Y
	 e7MP6RA8WW2oc/Xe+QNXxCN5upyZp3l1VZkHJhsXvW7h83l4p173ZyJ3l5JNh0eG+GA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+OImVCMWWzHrDnv25IdFtXbs1I0efisSAiOSRhbxNRc=;
	b=sYncuDtgksQ/r/f+hbMEfvYmHvWJmguKxaeestICMPnJ6lRAJf/W4ZJF37939Y3lWLhP
	 edRBSps8enxf8kiHbM8ozJASOL6mNIrr4msMzIQkijcpxbNDvhYewVLve6CfArGhqctZT
	 PaHx7Ckk7HZegZoJNe9Xt8rCocQgEuujR49lG2S+12MuBrPVPu/1IybiT5XtNPEhorVDg
	 ZiMo0q/B4YoKQrPc1PFGDJlF3weARgS6ORKbvli22vZinC2m89bxv54PqMqq1ySwzXgPU
	 vjMIDCKz8mVmdM7VBdh41au1s7R0X527Hg4YAgnpPMs4R5J0Mt+ATSZh0BN7AuHyj0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156168;
	bh=+OImVCMWWzHrDnv25IdFtXbs1I0efisSAiOSRhbxNRc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UnyOS2HHBwYp/4t3dR94oDS2qiqXCF7xkOyZLtkacs6km2vgkOG0+TM3SqGi8JyW9
	 u9/PDWskJKnjVDc9G2DsEA7qg/hyltR6pDPxe60jrDP/CuqnEbj60CkinQ0R+0ShMM
	 JH4JOsa/fCo91wBgy3molicXk291RRbU+zZgRsWEUQzGyIje04o54anJT+eWJoO+wx
	 6WMzEleyre3lrF+GAeEi+B87GSj+cXK7bKbxA0j111+bx632vnRO/Tr9ZrYVBKrrA2
	 07+2d0jlviNscWZfK4bA9eRePbVrg/GUI8bnygPFwBvP4u3juAJLzTFoDjfqu/g3T1
	 3T6s2/6EWJCPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D694160E9B;
	Fri, 16 Oct 2026 13:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A23151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED61881510
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypFbMhy65KMT for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 501D5814C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=llWkcZOO+pxzX/13ZyuJUkhdEzIMO3V6d+CQNB4rQ9mprI3QlbzN+6zuHYnCSvVkHqKe
 R+1IMuGKnI7Su8L/mMCXWpsUnTglo8ZEv/ywqZa89VsE4m3eCGNlFq2K29fxB9XtAio68
 EiKFbnv7OV2huSzzpGFzKU5/etgWcNrfMHD4ILeDNpK1MUxG0N8p6xtAL12z46GRgEclR
 cmaoT7k1us+59N1qmzN5Wt1IbapU6a+aVWo7KeO+JYr1T2uAl90NW1sGfT+Y9499y5gn0
 9N2L7l7h+CfHz/3frEnToBZpGZtgJ2dAyjYtbDICEUJQZJ9ZzJCI0wZGLbcLzOuuXjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GH/qaupGSyfjWI5xaqeUGsOJX6z6ubJnS/G+zkEUoRY=;
 b=VsVrAF2xWMcenRY1JYmPY9R18gdJy2NfUvEBqncsuG7Zrtw/AiwAn5k+5jovo99dW3wc
 wSwNWw5Ac7VihV/qXA8GbcYGKjQ9ks0yQG3Q+aUimZLYlE03/Hfyvp9aYAWxa05GCFdJh
 VqMSElQINAQLDYj6yNOAn+0Sq0Qwv6BNL6E7lTuNITcylGtMwQfws/6Gq35SM3nCglS1S
 DyZ/b56psjk4p7/WdBgeqBzStpfHalmz3IzBNls99gAymZrZCVwqB+XYbrWuCmKmLLTNY
 LejVyX43CmdECsMNQyRjeFpnN4q77z3H7szJ8QXvJxPaM5d8XWafBu6+m03Mggxl+Aw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501D5814C4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4111B960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 082d4c7d5345067d3b8fdd733b0e0fed9f5f5956
X-Git-Newrev: 2422be4c570978719d36f279361462642255ad10
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.4111B960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/luvi: fix build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5885085352743692955=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5885085352743692955==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2422be4c570978719d36f279361462642255ad10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============5885085352743692955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5885085352743692955==--
