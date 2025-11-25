Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F62D0EE24
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E91C40E66;
	Tue, 25 Nov 2025 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4sFazDYEBDG; Tue, 25 Nov 2025 20:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A004B40BEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A004B40BEF;
	Tue, 25 Nov 2025 20:33:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3C02D2
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E68E60A7C
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV6Y6634ZNss for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DD5607C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09DD5607C7
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA96585EDC; Tue, 25 Nov 2025 20:33:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Nov 2025 21:22:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3837c92d7160d2af4e7c44810b69ce76fb5eb8c6
X-Git-Newrev: 742d83eea90eb88fc2dbf2751f9ab3907434a56b
X-Patchwork-Hint: ignore
Message-Id: <20251125203340.EA96585EDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/yajl: fix cmake 4
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
Content-Type: multipart/mixed; boundary="===============1157565080112442267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1157565080112442267==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=742d83eea90eb88fc2dbf2751f9ab3907434a56b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes deprecated CMake options.

Original patch by Rudi Heitbaum, rebased and applies with fuzz 0.

CC: Rudi Heitbaum <rudi@heitbaum.com>
Signed-off-by: Andreas Kässens <kaessens@sra.uni-hannover.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../yajl/0005-Allow-build-with-CMake-4.0.0.patch   | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/yajl/0005-Allow-build-with-CMake-4.0.0.patch b/package/yajl/0005-Allow-build-with-CMake-4.0.0.patch
new file mode 100644
index 0000000000..8f162b2249
--- /dev/null
+++ b/package/yajl/0005-Allow-build-with-CMake-4.0.0.patch
@@ -0,0 +1,68 @@
+From dd88e2ea2fc3f045722f6fee362af2643b5394f5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 09:31:40 +0000
+Subject: [PATCH] Allow build with CMake 4.0.0
+
+fixes deprecated cmake option and uses cmake 2.8.0 TARGET_FILE
+update cmake supported minimum versions to 2.8.0...3.10
+
+ref:
+- https://cmake.org/cmake/help/latest/policy/CMP0026.html
+
+CMake Error at .../CMakeLists.txt: (GET_TARGET_PROPERTY):
+  The LOCATION property may not be read from target "json_...".  Use the
+  target name directly with add_custom_command, or use the generator
+  expression $<TARGET_FILE>, as appropriate.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Fixes: https://autobuild.buildroot.org/results/0b6/0b6ada93f45c16cc8c558ec23a0eb56da2aa86e9
+Upstream: https://github.com/lloyd/yajl/pull/256
+---
+ CMakeLists.txt             | 2 +-
+ reformatter/CMakeLists.txt | 4 +---
+ verify/CMakeLists.txt      | 4 +---
+ 3 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 471eee13..deba3a40 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,7 +12,7 @@
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 2.8.0...3.10)
+ 
+ PROJECT(YetAnotherJSONParser C)
+ 
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 52a9bee8..267d02e2 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -39,9 +39,7 @@ IF (NOT WIN32)
+ ENDIF (NOT WIN32)
+ 
+ # copy the binary into the output directory
+-GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_reformat POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_reformat> ${binDir})
+ 
+ INSTALL(TARGETS json_reformat RUNTIME DESTINATION bin)
+diff --git a/verify/CMakeLists.txt b/verify/CMakeLists.txt
+index 967fca16..2f390082 100644
+--- a/verify/CMakeLists.txt
++++ b/verify/CMakeLists.txt
+@@ -33,9 +33,7 @@ ELSE()
+ ENDIF()
+ 
+ # copy in the binary
+-GET_TARGET_PROPERTY(binPath json_verify LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_verify POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_verify> ${binDir})
+ 
+ INSTALL(TARGETS json_verify RUNTIME DESTINATION bin)

--===============1157565080112442267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1157565080112442267==--
