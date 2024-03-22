Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D79C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D30408EA;
	Fri, 22 Mar 2024 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkPBmjC4wN2D; Fri, 22 Mar 2024 20:08:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9110240974
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9110240974;
	Fri, 22 Mar 2024 20:08:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66F231BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 615B2820E3
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQ8g7ardnQmo for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F7981E1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F7981E1D
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D9A9838A5; Fri, 22 Mar 2024 20:08:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Mar 2024 20:56:36 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 98ecfc6c0e618beb1a204d52742df93bc67a81d6
X-Git-Newrev: 043a342d793e162dac052e8c87a57d2c59c9fe96
X-Patchwork-Hint: ignore
Message-Id: <20240322200843.6D9A9838A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/poco: needs C++17
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

commit: https://git.buildroot.net/buildroot/commit/?id=043a342d793e162dac052e8c87a57d2c59c9fe96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

poco needs C++17 and gcc >=8 since bump to version 1.13.2 in commit
433c4fd38b15efcf74b410e5068e2e51eeba6e46 and
https://github.com/pocoproject/poco/commit/78234857bf416b718455496800d1b7be3a0d0a53
https://github.com/pocoproject/poco/commit/10f41c06d9416a6ae0884c4827ea2a91bf5d2cf8
resulting in the following build failure with gcc 7:

In file included from src/Thread.cpp:28:0:
src/Thread_POSIX.cpp: In member function 'void Poco::ThreadImpl::setNameImpl(const string&)':
src/Thread_POSIX.cpp:162:56: error: no matching function for call to 'std::__cxx11::basic_string<char>::append(const string&, std::__cxx11::basic_string<char>::size_type)'
   truncName.append(threadName, threadName.size() - half);
                                                        ^

Fixes: 433c4fd38b15efcf74b410e5068e2e51eeba6e46
 - http://autobuild.buildroot.org/results/7b1c144f39a8be4ce8f964aa13a52d0bf62dd0aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 54dbd8e2c5c0b2f40cb53066b265535266eaf8d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/Config.in | 6 +++---
 package/poco/poco.mk   | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 7cb9987ec7..9bdef125ad 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
@@ -116,8 +116,8 @@ config BR2_PACKAGE_POCO_ZIP
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
+comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 8"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index cc8a22fc2a..233252c67b 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -68,7 +68,6 @@ define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux \
 		--prefix=/usr \
-		--cflags=-std=c++14 \
 		--ldflags="$(POCO_LDFLAGS)" \
 		--omit="$(POCO_OMIT)" \
 		$(POCO_CONF_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
