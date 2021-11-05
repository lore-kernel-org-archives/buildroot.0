Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE752C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E3361252
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9E3361252
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96146407C3;
	Fri,  5 Nov 2021 16:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QF-X3MjANGB1; Fri,  5 Nov 2021 16:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D370B40773;
	Fri,  5 Nov 2021 16:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 375A41C1148
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 274CE6154A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hs2QNPxqlZwB for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E915A61579
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 22ADE8A650; Fri,  5 Nov 2021 16:11:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:08:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d3428beca1cf5a900c330e2fcbb0e622fd1385a
X-Git-Newrev: 3c83c1fd4a06dc3ef2803fe160ad57c35546ba7b
X-Patchwork-Hint: ignore
Message-Id: <20211105161120.22ADE8A650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: needs gcc and host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c83c1fd4a06dc3ef2803fe160ad57c35546ba7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ruby needs gcc and host gcc >= 4.9 since commit
5f1c6758a561134e30fe9fb7fae55e5d6e97d01a and the addition of AC_PROG_CC:

In file included from vm_core.h:85:0,
                 from iseq.h:14,
                 from mini_builtin.c:3,
                 from miniinit.c:51:
thread_pthread.h:108:43: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
     RUBY_EXTERN RB_THREAD_LOCAL_SPECIFIER struct rb_execution_context_struct *ruby_current_ec;
                                           ^

Fixes:
 - http://autobuild.buildroot.org/results/f196f8bc68d1b4c20bddced89478598a3fcd3dea
 - http://autobuild.buildroot.org/results/81bdac585600877d3fa8d9478b7f160dbd1537a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/Config.in | 2 +-
 package/ruby/Config.in          | 7 +++++--
 package/webkitgtk/Config.in     | 2 +-
 package/wpewebkit/Config.in     | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 65f08d1c5e..4abb04844c 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 141db90140..c210120945 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -3,11 +3,14 @@ config BR2_PACKAGE_RUBY
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
 
-comment "ruby needs a toolchain w/ wchar, threads, dynamic library"
+comment "ruby needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 425bf81e4e..bc8207d93b 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 6fc1e668fd..8357051e93 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
