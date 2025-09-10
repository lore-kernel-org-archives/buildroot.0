Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E966ECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F8A60651;
	Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyZ44MWNSnZJ; Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98FF60B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98FF60B69;
	Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05730E1F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB84D80F12
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzVfS2MgjQCl for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA5180ED2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA5180ED2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BB9683D37; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb007fe2db461425d9e6ba70d7542c13bfd58f84
X-Git-Newrev: cfdd4ed4e3e2776199897cb0080751956dc5ec4d
X-Patchwork-Hint: ignore
Message-Id: <20250910111949.3BB9683D37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cni-plugin: simplify installation
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cfdd4ed4e3e2776199897cb0080751956dc5ec4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In all theory, we could iterate over CNI_PLUGINS_INSTALL_BINS, which
already contains the basenames $(notdir) of the binaries to install,
but *_INSTALL_BINS is now an internal implementation detail, and
can't be guaranteed to be stable.

Hence, iterate over the list of targets, and somewhat duplicate the
install commands from the infra, using make's $(notdir) rather than
calling to the shell's to call basename.

Note: we need to stop setting _INSTALL_BINS, as a following commit will
check that it is not explicitly set, and fail otherwise.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/cni-plugins/cni-plugins.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index d682053e75..85783e433f 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -28,7 +28,6 @@ CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/meta/sbr \
 	plugins/meta/tuning \
 	plugins/meta/vrf
-CNI_PLUGINS_INSTALL_BINS = $(CNI_PLUGINS_BUILD_TARGETS)
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 CNI_PLUGINS_DEPENDENCIES += libapparmor
@@ -47,9 +46,9 @@ endif
 
 define CNI_PLUGINS_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
-	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
-			$(TARGET_DIR)/opt/cni/bin
+	$(foreach d,$(CNI_PLUGINS_BUILD_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/bin/$(notdir $(d)) \
+			$(TARGET_DIR)/opt/cni/bin/$(notdir $(d))
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
