Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5AFC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131A94072D;
	Fri,  2 Jan 2026 23:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y9IIxf3IG22; Fri,  2 Jan 2026 23:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE6540721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767396830;
	bh=WOlGqy25q097D2DNm6H9I8MJt+8ynVUT/SCdYsRtg7Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ti104XWdznXj9FFSYtPGNlBaxTyzvaVh/hExIVOjUKXsVnIUUoSQhV9RJyLbX+AkJ
	 Qs8iF6mIQjvxju1klLNg7HfBeTu5pNUCW+hs07rxzwR0RGa7uSTZ5/qBcXvhP3tuiZ
	 Prkcqh69R4CrmDUrS6lqNrngzYwRXwewVGy8EXI4aTP+kfZPQLhdyBhMyU4rmHizxd
	 g0O23sxaRKTmAFpDAiBa33nt+HuXNo8y54pKUGtU6gJ1VPsNupSSivd1h60ZOdsFBw
	 6uVHLL8qY/0dV/P0zBXg4u/lSn+fM/RZ0MA1uTzazStKZy5pIQSsTUMaJr8teevYFd
	 QoBPKR14hh7JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE6540721;
	Fri,  2 Jan 2026 23:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B841440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E10608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVBJKaXfzq5b for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5215A6088B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5215A6088B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5215A6088B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:33:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EC5BA4C2CFD
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:33:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47134)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vboeN-0000000072B-3Vlo
 for buildroot@buildroot.org; Fri, 02 Jan 2026 23:33:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 00:33:43 +0100
Message-ID: <20260102233343.324019-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767396824;
 bh=HQ7928l2LAGAWt1+bSGDk30HKiBXH1wQNFP4WbFPXrQ=;
 h=From:To:Subject:Date:From;
 b=glMaM0t5zj1rfCyimcBnLQz35JbEoFct12QcTSxyAQlfD6mvl1HxuxuYOYkH3hEZ2
 BwSiaiqYifKtztol8/swCIBWB0zH6caDVbClzxtH0uil8QAG3+i4tifoi7TFyBEisl
 26CzBLzB7ulM/sm1iTNX18AlISEmcCYB25A6iSRGf1YpmGnOy7jNTW8wENCvq6ECtX
 6ewjKOMa+M1eDHswdXSnTtzHjb9bzhv5ULRJpM8PRq/6nv9LytghRw+wgQqNID7T+C
 Ujk/z04vjelbWKd5YhwDTbnYhfxJzNyU2p4x0wN3cgPMYZd+UK2/HeGBmjZ731JWhY
 jnkLDZlXCfGCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=glMaM0t5
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: fix systemd install
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit e859686460a30af0868d68810645c2208562039f bumped alsa-
utils to 1.2.15.1 including upstream commit
https://github.com/alsa-project/alsa-utils/commit/f047a8a66917960ef5a9ff0e41de507f0e58f381
which moved the systemd files to alsactl/conf subdirectory.

Adjust ALSA_UTILS_INSTALL_INIT_SYSTEMD accordingly to fix build error.

Fixes:
https://autobuild.buildroot.net/results/31a/31a409308924fd7f60dd94db3c10e2a25c73020a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9af2d0136e..82f4b12e8d 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -85,9 +85,9 @@ ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL)$(BR2_INIT_SYSTEMD),yy)
 ALSA_UTILS_DEPENDENCIES += systemd
 ALSA_UTILS_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
 define ALSA_UTILS_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/conf/alsa-restore.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
-	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/conf/alsa-state.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
