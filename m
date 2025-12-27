Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E26E8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A0E6078A;
	Sat, 27 Dec 2025 11:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cl-oxwPu8XgU; Sat, 27 Dec 2025 11:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFC0E60741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766833430;
	bh=rwZ8XZNG2cGHQOvotRmSaBGwRDI+uf839j/4KNCEkQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qAYqcu0UaGH5pJnUabuURNT7RdwiuAggOYstfPohd4bmlc4YMwCn8+4UmwJ4PhvrI
	 7i3HDatAftzMzckvtVbftyMrlxPztNeyfLm45wtQucV1plDv53sVhVJzYRNrZjPKxb
	 EZFJsS6fbZlJkG57aRymr5v9K+Fr+pryzKvHjeuZFOrzLaQzzU48pCL20Tg+tWGnGg
	 w32aXD8g//lOmVDrVK47cWbx7ri30Trjukje4XsLc/XH8MgJ9joTAgCVivdd+m97Uv
	 niRiI8nv9/wNlJn62fJAhJmVoqx3WfpQCM4ski87PA3qtlD1GcMApj2WKCetcqCQrL
	 qKZ9XX21JQQdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC0E60741;
	Sat, 27 Dec 2025 11:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D81119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5528940062
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5A4CzOXUd6v for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC7D40054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC7D40054
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:03:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F066875A0; Sat, 27 Dec 2025 11:03:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:00:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1abaf013dede73cb148a95d4ed708429776033f3
X-Git-Newrev: 070ba987b1dc43be934bb486d23c92d6a8979298
X-Patchwork-Hint: ignore
Message-Id: <20251227110347.4F066875A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcuefile: fix build with CMake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=070ba987b1dc43be934bb486d23c92d6a8979298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/b92211c11edcbf4a0c5abe823e0deaa14133ae89/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...03-CMakeLists.txt-fix-compat-with-CMake-4.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch b/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch
new file mode 100644
index 0000000000..c1858f3fa5
--- /dev/null
+++ b/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch
@@ -0,0 +1,35 @@
+From bf7598c2f5a40d16f16a9649bb6415c3594c0a45 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 10:26:49 +0100
+Subject: [PATCH] CMakeLists.txt: fix compat with CMake 4
+
+Fixes:
+
+CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c1e4a8b..96bf5b4 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.4)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ 
+ project(libcuefile C)
+ 
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
