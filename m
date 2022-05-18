Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4CDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 12:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACA6340D79;
	Wed, 18 May 2022 12:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsyvLymQP4u7; Wed, 18 May 2022 12:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89DD34060D;
	Wed, 18 May 2022 12:14:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45AF11BF4E4
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 12:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3373E41866
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 12:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfM3w24ojP5p for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 12:14:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE0341762
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9512385FE4; Wed, 18 May 2022 12:03:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 14:11:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 70f7599e595ced918febc6e4730e10ee1fbe0b47
X-Git-Newrev: 542df24db7f5eed5be0514451df725a3fdd90db6
X-Patchwork-Hint: ignore
Message-Id: <20220518120338.9512385FE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/janus-gateway:
 Add systemd service file
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

commit: https://git.buildroot.net/buildroot/commit/?id=542df24db7f5eed5be0514451df725a3fdd90db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4e5c1dbb22bdd0e1daf9302ddc5ac7c89c461b05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
