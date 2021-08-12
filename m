Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EA3C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59E9B6109D
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59E9B6109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E0D64023D;
	Thu, 12 Aug 2021 21:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hk0VS0fDu00g; Thu, 12 Aug 2021 21:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F823402A0;
	Thu, 12 Aug 2021 21:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53EEE1BF36A
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 382AC407A3
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-exU0VHeau2 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:19:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A96CF40793
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:19:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CB95F8D453; Thu, 12 Aug 2021 21:18:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:19:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74196b7d059684e555a87e5409c21c56c727066b
X-Git-Newrev: c20d31baf471daeeec50d62cb8baa79bac06fa51
X-Patchwork-Hint: ignore
Message-Id: <20210812211838.CB95F8D453@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: fix install of polkit.its
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c20d31baf471daeeec50d62cb8baa79bac06fa51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install polkit.its in $(HOST_DIR)/share/gettext/its as suggested by
https://gitlab.gnome.org/GNOME/gvfs/-/issues/508 to avoid the following
build failure with gvfs because polkit installs polkit.its in
$(STAGING_DIR)/usr/share/gettext:

FAILED: daemon/org.gtk.vfs.file-operations.policy
/tmp/instance-3/output-1/host/bin/meson --internal msgfmthelper daemon/org.gtk.vfs.file-operations.policy.in daemon/org.gtk.vfs.file-operations.policy xml /tmp/instance-3/output-1/build/gvfs-1.44.1/po
msgfmt: cannot locate ITS rules for daemon/org.gtk.vfs.file-operations.policy.in

Fixes:
 - http://autobuild.buildroot.org/results/ba9a8b31e6e275d4db1905241a9153a0513eb335

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index d5b3955ddb..23adb534d0 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -41,6 +41,14 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+# polkit.its is needed for gvfs and must be installed in $(HOST_DIR)
+# and not $(STAGING_DIR)
+define POLKIT_INSTALL_ITS
+	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
+		$(HOST_DIR)/share/gettext/its
+endef
+POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
+
 define POLKIT_USERS
 	polkitd -1 polkitd -1 * - - - Polkit Daemon
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
