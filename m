Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5B3C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 15:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFEF41855;
	Wed,  6 Mar 2024 15:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QR8Hnt7v2Ihr; Wed,  6 Mar 2024 15:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9289E41852
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9289E41852;
	Wed,  6 Mar 2024 15:53:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 839FD1BF2FA
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 15:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D19C4167D
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 15:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBM-mI4aGJ53 for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 15:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C2C416DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67C2C416DB
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 15:53:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CAA388179; Wed,  6 Mar 2024 15:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Mar 2024 15:17:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ac2d5a41ad776b493e6b0c44c760968a28ec81e
X-Git-Newrev: c944f455adf9730b1c72e70cf5b5e14a64a470be
X-Patchwork-Hint: ignore
Message-Id: <20240306155302.5CAA388179@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: fix build without NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=c944f455adf9730b1c72e70cf5b5e14a64a470be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

botan unconditionally uses pthread_setname_np since bump to version
3.2.0 in commit 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813 and
https://github.com/randombit/botan/commit/313e439c786d68bcf374b2cb0edfe3ffd891db94
resulting in the following build failure:

src/lib/utils/os_utils.cpp:625:22: error: 'pthread_setname_np' was not declared in this scope
  625 |    static_cast<void>(pthread_setname_np(thread.native_handle(), name.c_str()));
      |                      ^~~~~~~~~~~~~~~~~~

So only enable threads if NPTL is available

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/03677de6270ff5de61fff2a76e5cd723aa34e64e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/Config.in | 5 ++---
 package/botan/botan.mk  | 6 ++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 5c3f31726e..c74128bb9d 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
@@ -24,7 +23,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads, gcc >= 10"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+comment "botan needs a toolchain w/ C++, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 88dbfa5807..95352ea41b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -48,6 +48,12 @@ else
 BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+BOTAN_CONF_OPTS += --with-os-feature=threads
+else
+BOTAN_CONF_OPTS += --without-os-feature=threads
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
