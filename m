Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B95D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6ADC80B0B;
	Fri, 12 Dec 2025 07:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ku-RRlH_vYt; Fri, 12 Dec 2025 07:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFEC8423A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526337;
	bh=ynUW9j57HnXI4Ut8vwRNN5OrTcI3RvveXXsphJKNE8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D7BHfQqJ//1lbYwJVh0C+pwswiAdKumf22XdrraphcE+Y1uYntbZARjvmJ6cTM9Yq
	 n6eJ7cPmUqkxknt8aFtLDzzwHrAWjQupPQA76cQNxBgCtsM8K8Q4lfNvvqWYOtIagv
	 +41K4EXVias/ESkbfQnCvW4+cyKbNLu0dfl66aCn9WgJTNNJDz5IEk3zOOueyzuZUT
	 72EBiynqx5HZHiB/Y02AQaY2ERbXk0So0eDCL/prZhWzG1/dFhkJsDo6Pf8hfrMq8C
	 mwAB4jozdj69Fvx1mUm+iNqIGHm4UAwz6JjEPzP/O3CNKQjCAoBG8hJMpKcvKPWoML
	 Rb2sIQVHIFa9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFEC8423A;
	Fri, 12 Dec 2025 07:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB7DE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B1D341162
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXwEMLH-Kszo for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183F641116
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 183F641116
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17789869E8; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71c6b157db233ec803f0a33f52e4d1a12058ba15
X-Git-Newrev: d50b1bdd58d81c83dac401f927d95dd1601aabc8
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.17789869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: fix cmake 4
 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d50b1bdd58d81c83dac401f927d95dd1601aabc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-fix-cmake-required-minimum-version.patch  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
new file mode 100644
index 0000000000..097a44cf85
--- /dev/null
+++ b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
@@ -0,0 +1,34 @@
+From b9bf3936b3778912444eff7f7866db1d66f4c50b Mon Sep 17 00:00:00 2001
+From: Thomas Perale <perale.thomas@gmail.com>
+Date: Sun, 6 Jul 2025 20:14:31 +0200
+Subject: [PATCH] fix: cmake required minimum version
+
+When trying to compile the project with CMake 4 the following error
+shows up:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+This commit bump the minimum required cmake version to meet the needs of
+CMake v4.
+
+For more information see:
+  - https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
+
+Upstream: https://github.com/zhaojh329/libuhttpd/commit/b9bf3936b3778912444eff7f7866db1d66f4c50b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6719e5f..0392f25 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libuhttpd C)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
