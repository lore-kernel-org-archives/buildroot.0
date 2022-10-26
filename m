Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C1BC38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79FB98135A;
	Thu, 27 Oct 2022 06:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79FB98135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDkAJlP1iGfZ; Thu, 27 Oct 2022 06:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997F181348;
	Thu, 27 Oct 2022 06:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997F181348
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3332B1BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B71360AA7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B71360AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKRtFR504u9b for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:45:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D6A60742
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D6A60742
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3CC587279; Thu, 27 Oct 2022 06:45:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 22:35:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51ecbe500f1bce6725ea78c8193b9efae5da2e6f
X-Git-Newrev: c86b69a16dee0281d75890118110be934367430e
X-Patchwork-Hint: ignore
Message-Id: <20221027064525.E3CC587279@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: install in the correct lib
 directory
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c86b69a16dee0281d75890118110be934367430e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libbpf build system currently uses the output of "uname -m" to
determine if the library should be installed in "lib" or
"lib64". However, uname -m returns the architecture of the build
machine, which often has nothing to do with the target CPU
architecture.

A patch has been submitted and accepted upstream to address this
issue, by using the $(CC) -dumpmachine output instead. This ensures
libbpf is installed in either "lib" or "lib64" depending on the
bitness of the target CPU architecture.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-cross-compilation-for-32-bit-targets.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
new file mode 100644
index 0000000000..12c22f3147
--- /dev/null
+++ b/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
@@ -0,0 +1,38 @@
+From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
+From: Tobias Waldekranz <tobias@waldekranz.com>
+Date: Fri, 14 Oct 2022 21:14:14 +0200
+Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
+
+Determining the correct library installation path (lib vs. lib64)
+using uname(1) breaks in cross compilation scenarios where word widths
+differ between the host and target system.
+
+Instead, source the information from the compilers '-dumpmachine'
+option (supported by both GCC and Clang).
+
+We call this the "host" architecture, using the same nomenclature as
+Autotools (--host configure option).
+
+Upstream: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1
+Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
+---
+ src/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 3cd0854..d535f81 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -77,7 +77,8 @@ INSTALL = install
+ 
+ DESTDIR ?=
+ 
+-ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(shell uname -m)),)
++HOSTARCH = $(firstword $(subst -, ,$(shell $(CC) -dumpmachine)))
++ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(HOSTARCH)),)
+ 	LIBSUBDIR := lib64
+ else
+ 	LIBSUBDIR := lib
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
