Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A66C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E7541545;
	Thu, 14 Apr 2022 20:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyGezAdOKdHj; Thu, 14 Apr 2022 20:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8011D416B5;
	Thu, 14 Apr 2022 20:12:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD6691BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9B9C404D7
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naiQ09xeSc2R for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A7840142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 69C4283CDA; Thu, 14 Apr 2022 20:01:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:04:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f94ba5c31cf7f863e6fae996fc042a56e20118f3
X-Git-Newrev: 4e5c1dbb22bdd0e1daf9302ddc5ac7c89c461b05
X-Patchwork-Hint: ignore
Message-Id: <20220414200153.69C4283CDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: Add systemd service
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e5c1dbb22bdd0e1daf9302ddc5ac7c89c461b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/janus-gateway/janus-gateway.mk      |  5 +++++
 package/janus-gateway/janus-gateway.service | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 84ca0bc116..381843a0af 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -131,4 +131,9 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-systemd-sockets
 endif
 
+define JANUS_GATEWAY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/janus-gateway/janus-gateway.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/janus-gateway.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/janus-gateway/janus-gateway.service b/package/janus-gateway/janus-gateway.service
new file mode 100644
index 0000000000..6e6bc7f017
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Janus WebRTC Gateway
+Wants=network.target
+StartLimitIntervalSec=0
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/janus
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
