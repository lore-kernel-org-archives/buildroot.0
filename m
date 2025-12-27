Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47847E8FDD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0836860766;
	Sat, 27 Dec 2025 11:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WmLrcUfCGlO; Sat, 27 Dec 2025 11:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D2F60777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766835141;
	bh=DBaBf97bY/alqHH0xTVIZ9FFMU9DLP3udeO9xfexwhQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h3dYqxi3P2yUxcepc9yAG8Ucz2zOCOaMmLXCp9iD8OkNksCtzuaAxUqR3gg4NpZ/r
	 kkCFhkhrqMT9AGbdz0lFtmEMk9k0XwvLS81kieic8B+Ub2bMgxZX0xzZVagCacC4JI
	 3vKNDjK/oCK8M0mpiTiNJWFPm4xumH78ZHpZokeTcJpnFRrUg/zCX/RKLwRMctKHBz
	 S7k4UFtIRzP2H6EINZEg7MIGE8gAeSe+1gd5isfhFgsXjUiUN4IOapu/hqKFD0hKzB
	 2ytmBszPvqd6K8CTRMpsPFbBeTh9VlH2ZxFUr3/2/ENnaQVZnwxbqqH1BreI8sawCM
	 3FxaWDdhqitOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D2F60777;
	Sat, 27 Dec 2025 11:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E69EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A14060766
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMYtl57OmhHn for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B459E60777
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B459E60777
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A47508769F; Sat, 27 Dec 2025 11:32:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:31:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05b8a09e62d4377ed4ecb89409194ad951469f86
X-Git-Newrev: 81bd1b50678d8b1174e6c6abf3aab72e7ea5c9e9
X-Patchwork-Hint: ignore
Message-Id: <20251227113219.A47508769F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix build with CMake >= 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=81bd1b50678d8b1174e6c6abf3aab72e7ea5c9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

freerdp upstream is now at 3.x, far far ahead of what we're using in
Buildroot at the moment. So to fix the CMake >= 4 build, we add a very
simple non-upstreamable patch (upstream 3.x has a much higher CMake
minimum version already).

Fixes:

  https://autobuild.buildroot.net/results/51365593ad059325e1164d36fff06905d1c6e8af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...s.txt-update-minimum-CMake-version-to-3.5.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch b/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..5f8ad5175a
--- /dev/null
+++ b/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch
@@ -0,0 +1,59 @@
+From 27f9300b55c483a9f2ff482833ee4fae01447c69 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 25 Dec 2025 21:03:37 +0100
+Subject: [PATCH] CMakeLists.txt: update minimum CMake version to 3.5
+
+This fixes the build with CMake >= 4.
+
+Upstream: N/A, upstream is at freerdp 3.x which already has a much
+more recent cmake_minimum_required() [but the patches are too invasive
+to be backport].
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt       | 2 +-
+ rdtk/CMakeLists.txt  | 2 +-
+ winpr/CMakeLists.txt | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3d4a5e515..0538d026c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(FreeRDP C CXX)
+ 
+diff --git a/rdtk/CMakeLists.txt b/rdtk/CMakeLists.txt
+index 764a545c2..389ad1db8 100644
+--- a/rdtk/CMakeLists.txt
++++ b/rdtk/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(RdTk C)
+ 
+diff --git a/winpr/CMakeLists.txt b/winpr/CMakeLists.txt
+index 77ff23302..f5bffd644 100644
+--- a/winpr/CMakeLists.txt
++++ b/winpr/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(WinPR C)
+ 
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
