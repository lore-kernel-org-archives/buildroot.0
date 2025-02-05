Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA94C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 575BD70A8F;
	Fri, 28 Feb 2025 17:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmAgx_l4595D; Fri, 28 Feb 2025 17:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E1D70BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E1D70BC7;
	Fri, 28 Feb 2025 17:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8D21DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9009242D26
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRBZW0JVXTiA for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268B442D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 268B442D21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21A26865FC; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 15:17:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5da83ec50ff4ed11883f224541ef6c37bf2c305f
X-Git-Newrev: db86b18af503ebe45ed9142fec0abe7d9f96ced0
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.21A26865FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lxc: add libapparmor
 optional dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db86b18af503ebe45ed9142fec0abe7d9f96ced0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ian Merin <Ian.Merin+Entrust@ncipher.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/lxc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b2afb978e6..7a5f91e1a8 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -13,10 +13,16 @@ LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
 LXC_CONF_OPTS = \
-	-Dapparmor=false \
 	-Dexamples=false \
 	-Dman=false
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+LXC_CONF_OPTS += -Dapparmor=true
+LXC_DEPENDENCIES += libapparmor
+else
+LXC_CONF_OPTS += -Dapparmor=false
+endif
+
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 LXC_DEPENDENCIES += bash-completion
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
