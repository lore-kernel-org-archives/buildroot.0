Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1399D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08B661C23;
	Thu,  4 Dec 2025 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apdBZvfwRRNO; Thu,  4 Dec 2025 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0045961C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880847;
	bh=JiVx2+GF4REXrYtx+1tWslinClu1znftpCyeZzZnJpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=muxzmr0rR/FPRQmXhKSgP+Yxhbfgn/myFRF+OMqSNCyNcwdh5RbxIwCV/6YRLjNid
	 985NHFVCfxoVsyFUnENw+ntUiLGTqjukJ4DE0yx+GieG36v8WrKdUvUM465BtHBLnL
	 cmJ8lvCIbTVFPDPmWFIHTyQmA0K9bKPbcPtWxIq/tMb7fg0kIGbNLYs9RSaky0prcM
	 f0sRmTRi4wPC5pO0ZWeXiPCeTa/nrWLovzGr2GVsXzMnuaPr80Aovrpcvp6LSeMkys
	 LAsnwzZSo6J9vEWjybr/vwaz8AO5I94SrYeFEAfUcqUfT9hUGUIaD3mXP5c9tCfiW4
	 QAxi1UuLxBmsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0045961C8B;
	Thu,  4 Dec 2025 20:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5394ED3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A038B409F0
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4F0XRxC9VVgR for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8039140A02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8039140A02
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D67C8651A; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:22:03 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c5e54e26ddcb33b6432942d6d1062da26363ad42
X-Git-Newrev: 06a77553e14ae83cabc758145d4af7657e1c5c84
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.7D67C8651A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/pdmenu: fix build
 with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=06a77553e14ae83cabc758145d4af7657e1c5c84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/554/5545162ca0206cacfca1617280f074237e72aec1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit baaad289ab94e5317df900cc4a369650735e9f06)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pdmenu/pdmenu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
index 2691a67ef6..72eb95bddc 100644
--- a/package/pdmenu/pdmenu.mk
+++ b/package/pdmenu/pdmenu.mk
@@ -11,4 +11,11 @@ PDMENU_LICENSE_FILES = doc/COPYING
 PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
 PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+PDMENU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
