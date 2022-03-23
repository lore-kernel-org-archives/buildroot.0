Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7895C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689AB60B68;
	Wed, 23 Mar 2022 20:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvtZpFOjSntt; Wed, 23 Mar 2022 20:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6216E60B4A;
	Wed, 23 Mar 2022 20:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB5AF1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26D5B400C4
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsB8g_j3EX_D for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402BE40FDE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 85584854E7; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b2adbff1585b2581c76c9abcc8d5529134be60c
X-Git-Newrev: ee6d734f08e772202320841208f11a1a239ea49b
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.85584854E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix build on sparc v8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee6d734f08e772202320841208f11a1a239ea49b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on sparc v8 raised since commit
5770a645a3a49a3f0f02972131a4ff5283b4c11e:

ERROR: detected a std::atomic implementation that fails for function pointers.
Please apply the patch corresponding to your Standard Library vendor, found in
  qtbase/config.tests/atomicfptr

Fixes:
 - http://autobuild.buildroot.org/results/5a2/5a20e984a5536165056b3fbd93b8712e8ddbeed4/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...b-configure.json-fix-atomicfptr-detection.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
new file mode 100644
index 0000000000..5f0f81a4bd
--- /dev/null
+++ b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
@@ -0,0 +1,48 @@
+From e9d1f80dffb4e29e44fc0b0627704af15cdd281a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Mar 2022 12:05:04 +0100
+Subject: [PATCH] src/corelib/configure.json: fix atomicfptr detection
+
+Fix atomicfptr detection on sparc v8 by linking with libatomic if needed
+to avoid the following build failure:
+
+/sysroot -std=gnu++11 -w -fPIC  -I. -I/home/peko/autobuild/instance-0/output-1/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
+> /home/peko/autobuild/instance-0/output-1/host/bin/sparc-linux-g++ --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot -Wl,-O1 -o atomicfptr main.o   -lexecinfo  -lrt -lpthread -ldl
+> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: main.o: in function `test(std::atomic<void (*)(int)> volatile&)':
+> main.cpp:(.text+0x40): undefined reference to `__atomic_compare_exchange_4'
+> collect2: error: ld returned 1 exit status
+> make[1]: *** [Makefile:69: atomicfptr] Error 1
+
+[...]
+
+ERROR: detected a std::atomic implementation that fails for function pointers.
+Please apply the patch corresponding to your Standard Library vendor, found in
+  qtbase/config.tests/atomicfptr
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5a20e984a5536165056b3fbd93b8712e8ddbeed4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://invent.kde.org/qt/qt/qtbase/-/merge_requests/138]
+---
+ src/corelib/configure.json | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/configure.json b/src/corelib/configure.json
+index 9b5d19d41b..ac88f5856c 100644
+--- a/src/corelib/configure.json
++++ b/src/corelib/configure.json
+@@ -309,7 +309,8 @@
+                     "test(fptr);"
+                 ],
+                 "qmake": "CONFIG += c++11"
+-            }
++            },
++            "use": "libatomic"
+         },
+         "clock-monotonic": {
+             "label": "POSIX monotonic clock",
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
