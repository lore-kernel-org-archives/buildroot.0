Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE4AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926ED81D0C;
	Fri, 13 May 2022 22:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gmzehn30k7T; Fri, 13 May 2022 22:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E6C8140D;
	Fri, 13 May 2022 22:17:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105531BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CEF641487
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZT6FgqfW8P39 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4320940936
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0A59185E29; Fri, 13 May 2022 22:00:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f307337446ddf9024c3ba6ce17ad2f839c06c519
X-Git-Newrev: 260e7fda6adca10e0341532d03a8e1f4d08e9a10
X-Patchwork-Hint: ignore
Message-Id: <20220513220046.0A59185E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgi: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=260e7fda6adca10e0341532d03a8e1f4d08e9a10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following static build failure on sh4aeb:

In file included from /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:20:
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/include/libcgi/cgi.h:81:31: note: expected 'char *' but argument is of type 'const char *'
   81 | extern int slist_delete(char *name, formvars **start, formvars **last);
      |                         ~~~~~~^~~~
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: unable to find a register to spill in class 'FPUL_REGS'
  352 | }
      | ^
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: this is the insn:
(insn 1084 1081 1085 105 (set (reg:SI 4 r4)
        (mem/f:SI (post_inc:SI (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])) [0 MEM[base: _414, offset: 0B]+0 S4 A32])) "/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c":323:3 189 {movsi_ie}
     (expr_list:REG_INC (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])
        (nil)))

Fixes:
 - http://autobuild.buildroot.org/results/84a2339568d23b328af2416bfcec1ef41eccdce5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
new file mode 100644
index 0000000000..3ec674ae70
--- /dev/null
+++ b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
@@ -0,0 +1,44 @@
+From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 17:54:42 +0200
+Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
+
+Allow the user to disable tests through the standard BUILD_TESTING
+option: https://cmake.org/cmake/help/latest/module/CTest.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cbf0d97..e3329a1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
+ 	"Global flag to cause add_library to create shared libraries if on."
+ 	ON
+ )
++option(BUILD_TESTING
++	"Build tests."
++	ON
++)
+ 
+ # subdirectories
+ add_subdirectory("include/libcgi")
+ add_subdirectory("src")
+ 
+ # test
+-enable_testing()
+-include(CTest)
+-add_subdirectory("test")
++if(BUILD_TESTING)
++	enable_testing()
++	include(CTest)
++	add_subdirectory("test")
++endif(BUILD_TESTING)
+ 
+ # cmake package stuff
+ configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
