Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5829ACAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD94C6E73A;
	Thu, 11 Sep 2025 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lpmXS5CRHWv; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F5DC6F48C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5DC6F48C;
	Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D987E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1321B6F48C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho6fZXLG1zTq for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2761361CBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2761361CBF
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24B16840F1; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:15:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1c46bc69e8f25f2534f7a8e78dda9d199e5312d3
X-Git-Newrev: 2b21f3fb354030ec4161f5bc1b87b115dbfeece2
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.24B16840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ecryptfs-utils:
 ssl support needs engines support in openssl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b21f3fb354030ec4161f5bc1b87b115dbfeece2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes https://autobuild.buildroot.net/results/f32ae62961aac7e8344f4be109040e7de2eb415e/

The openssl logic in ecryptfs uses the openssl engines API, which is always
available in libressl, but only available in libopenssl when
BR2_PACKAGE_LIBOPENSSL_ENGINES is enabled, leading to build failures when it
is not:

ecryptfs_key_mod_openssl.c: In function 'ecryptfs_openssl_read_key':
ecryptfs_key_mod_openssl.c:305:9: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  305 |         ENGINE_load_builtin_engines();

Fix it by only passing --enable-openssl if libressl or (libopenssl + engines
support) is enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f309a6e0f969c2baf9e5c1598c80aba0049742d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 6eb3add98b..03e7f3e34f 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
