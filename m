Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CBCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF85E42368;
	Wed,  3 Sep 2025 16:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVevDrGUNk-r; Wed,  3 Sep 2025 16:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D653142366
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D653142366;
	Wed,  3 Sep 2025 16:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF0692BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA9E36002E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8r96JT-OiRc for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 481BB61554
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 481BB61554
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4376E87EA8; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:20:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa4148d45a0e4bed3c8444c6ebc41bb7444580c7
X-Git-Newrev: 2f309a6e0f969c2baf9e5c1598c80aba0049742d
X-Patchwork-Hint: ignore
Message-Id: <20250903162314.4376E87EA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ecryptfs-utils: ssl support needs
 engines support in openssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f309a6e0f969c2baf9e5c1598c80aba0049742d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
