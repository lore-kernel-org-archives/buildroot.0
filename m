Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8204EC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC9C822FF;
	Thu, 21 Mar 2024 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pP8j7JAbB-OO; Thu, 21 Mar 2024 21:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32A582343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32A582343;
	Thu, 21 Mar 2024 21:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B94E1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8167F6084E
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIUWBlm0gUsM for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C004860686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C004860686
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB17A83749; Thu, 21 Mar 2024 21:02:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:07:08 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bb6d0c06eb2981325c712cab197a73f44c15c1aa
X-Git-Newrev: 2154c51a8618d6366cb1bd49af51bd1c39b048a7
X-Patchwork-Hint: ignore
Message-Id: <20240321210225.BB17A83749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php: add
 libucontext optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2154c51a8618d6366cb1bd49af51bd1c39b048a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Select libucontext if the toolchain doesn't support ucontext to allow
building php on musl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2824aa8a23a765b660219c129d4980f1b7c7691c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.in | 3 +++
 package/php/php.mk    | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 69b4268c1d..af8574ac75 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	default y if BR2_s390x
 	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
+	default y if BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PHP
 	bool "php"
@@ -25,6 +26,8 @@ config BR2_PACKAGE_PHP
 	       BR2_USE_MMU
 	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
 	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
diff --git a/package/php/php.mk b/package/php/php.mk
index 4daf7f633d..28893be4c6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -40,6 +40,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PHP_EXTRA_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+PHP_DEPENDENCIES += libucontext
+PHP_EXTRA_LIBS += -lucontext
+endif
+
 ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
 PHP_LOCALTIME = UTC
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
