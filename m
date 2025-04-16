Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B82C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACB16FA40;
	Wed, 16 Apr 2025 21:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXws1lRRlhQi; Wed, 16 Apr 2025 21:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097906FA3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097906FA3D;
	Wed, 16 Apr 2025 21:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 125D220E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4BD6F6C6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7en-kIshmhFO for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C3B46F596
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3B46F596
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A3AA83DE6; Wed, 16 Apr 2025 21:40:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 11:32:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f60abbcef85320b5e18373de6935b31a3ee3fa6e
X-Git-Newrev: 1f07498068b67574e844d9d77505461b6e7c0460
X-Patchwork-Hint: ignore
Message-Id: <20250416214042.0A3AA83DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert
 "package/libopenssl do not build in parallel"
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f07498068b67574e844d9d77505461b6e7c0460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This reverts commit 27ab880ebb9a3efdec15733841f7b88063604247.

With the (proposed) fix from the openssl developers added as
0004-Serialize-install-process-to-avoid-multiple-make-dep.patch, the
workaround can now be dropped so openssl can again be built and installed in
parallel, significantly speeding up builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 86f173a74408a35536429198ec10970ee762bafb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenssl/libopenssl.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 663e8d9b9f..c1c5b818d7 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -132,26 +132,24 @@ endef
 LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
-# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define HOST_LIBOPENSSL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
-# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define LIBOPENSSL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
 	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
