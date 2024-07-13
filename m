Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130DCC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D554382051;
	Sat, 13 Jul 2024 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ1AIrGp5wni; Sat, 13 Jul 2024 20:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45FA8205F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B45FA8205F;
	Sat, 13 Jul 2024 20:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51AFD1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D446E607A1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOroGZ0KxCjY for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD6F60759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD6F60759
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6F3D86668; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:21:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f82b58d2286fb5b39ef7461b7d26d567fbccdc59
X-Git-Newrev: 2c73a973615cc6d2be0418cb9d40ec340601a1e5
X-Patchwork-Hint: ignore
Message-Id: <20240713203104.D6F3D86668@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: add host support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c73a973615cc6d2be0418cb9d40ec340601a1e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host support is required for ccache.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xxhash/xxhash.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 7708ba1e19..fde8e464f9 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -41,4 +41,17 @@ define XXHASH_INSTALL_TARGET_CMDS
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
+# we are a ccache dependency, so we can't use ccache
+HOST_XXHASH_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
+HOST_XXHASH_OPTS += DESTDIR=$(HOST_DIR) PREFIX=/usr
+
+define HOST_XXHASH_BUILD_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D)
+endef
+
+define HOST_XXHASH_INSTALL_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
