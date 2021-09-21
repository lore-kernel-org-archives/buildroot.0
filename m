Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D121C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B6260F4C
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B6260F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2740406CE;
	Tue, 21 Sep 2021 19:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCAeTjttuM1j; Tue, 21 Sep 2021 19:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 011D140660;
	Tue, 21 Sep 2021 19:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910D01BF9AD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8146440660
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wmn3mHBAa4w8 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:26:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D00AF4065A
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0FFB88C071; Tue, 21 Sep 2021 19:24:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 21:06:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde3bf94b105d94d3d9a04acb11ee31f6e73f11d
X-Git-Newrev: d52be73cbb90642e2d0724f7555c9fb86c0499f1
X-Patchwork-Hint: ignore
Message-Id: <20210921192443.0FFB88C071@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: install systemd services
 when using systemd
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d52be73cbb90642e2d0724f7555c9fb86c0499f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also create a pipewire user, which is used for systemd service. There is
no sysvinit start script at the moment, but if there were, it should
also take care of changing the uid to pipewire before starting the
daemon.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pipewire/pipewire.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index e4ea60c39c..d088710827 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -49,10 +49,16 @@ PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PIPEWIRE_CONF_OPTS += -Dsystemd=enabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=enabled \
+	-Dsystemd-system-service=enabled \
+	-Dsystemd-user-service=enabled
 PIPEWIRE_DEPENDENCIES += systemd
 else
-PIPEWIRE_CONF_OPTS += -Dsystemd=disabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Dsystemd-system-service=disabled \
+	-Dsystemd-user-service=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -150,4 +156,8 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+define PIPEWIRE_USERS
+	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
+endef
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
