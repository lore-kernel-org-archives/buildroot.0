Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD2C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:08:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4647660FE3
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4647660FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFCDF6152D;
	Fri,  5 Nov 2021 13:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXHdVaYR5Ljx; Fri,  5 Nov 2021 13:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B140607BE;
	Fri,  5 Nov 2021 13:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59A651BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 484E4605E4
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmXKozb-irpH for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 13:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30908605D5
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 13:08:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d5so13673433wrc.1
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csd1Hr3mk4iZZlAzhoXzzttRLe/XLlkx9z6/UjA1wq4=;
 b=fmAsl0dl2i/aN0ypYG7uaaYqb9LQu+U2WsEJipUYVqazJKJU+ZOHhH0P3buI2Y/IwK
 pVop+ryQ8ZsyDPUbUBGMKvhbYBQdHcho0vSZXbeRlyzWj5t0dBbweaufx7r+Ul5tPo6C
 lZVBsVvYlXGy5x05nf5JZr9f+wBSyq1sC7Al+lae8GUS/vBkGF/yeIxyz5Ln67cdB7AH
 73dK96tzQvuD+x64YejwV46aCgAEwYmr5kEAADuhGX6FGJqXmu+jWSHgrPZPutDNBlwa
 dMwRX3iS91RwG7VOuIySPn0ZHFlgXPWl8CzGOEZDujRKCKF7Gbz8BINR7mo+CSR+9hC0
 Vwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csd1Hr3mk4iZZlAzhoXzzttRLe/XLlkx9z6/UjA1wq4=;
 b=JzS/OqH6CK16V4PPO4UwIvsbykJEEqD5u+YJypeehejU5i/OhTnp6Og4MSWcqHqkHM
 W4KXMJxUE34n6FwMn15wlvQvjXa54S95+23vcODhM6wv4t7C4Rq/5iiFfbObZvP1CjAE
 SU32ZcEpoy+4g+/diO7ZkrsoGyZG/jV35j0Ee5J3cuVxBoAdfTcUaZcecoXwkPWV4f2M
 I5VBQO1v7D5MQ1LNtQ5D8Jjq2eUwe2NbJZQngGykpVnUj+uEBfHtUDJhl/dJd3zwdDQG
 cSvVEDVJNkt3ivWsjdC8ySlDAMIPVSkhQz5tlJKYJrNjLtHcQet+ypWBZyGL3zHeSEBL
 tN/g==
X-Gm-Message-State: AOAM533HRcvnpzkpPaySjrnsqVSvo9zMPDCmokVAPwlL7qplGaS8CeL2
 2U1OlA3lDuu2W0LPWwt5uZ7QVDbLPYA=
X-Google-Smtp-Source: ABdhPJzbeIVV0buEiF4W4PflXnfurr6Iu7YdU9YfClBO0cHCjq98l5lcrp7/H5bEcd4vsNNtvhc6iw==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr30835257wrq.264.1636117680249; 
 Fri, 05 Nov 2021 06:08:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a134sm8243937wmd.9.2021.11.05.06.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 06:07:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 14:05:15 +0100
Message-Id: <20211105130515.2275926-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpd: drop tidal option
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tidal option has been removed from mpd since version 0.22.10 and
https://github.com/MusicPlayerDaemon/MPD/commit/97c43954e8df3f772899cda951ad5a7dd4a24f25
resulting in the following build failure since bump of meson to version
0.60.1 in commit 78d3f2ea03dfba07a73fe0405c2aa4778f063ce3:

../output-1/build/mpd-0.22.11/meson.build:1:0: ERROR: Unknown options: "tidal"

Fixes:
 - http://autobuild.buildroot.org/results/b8c5879a02078f4962088dff5ae2ede1f0e6b805

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy      | 6 ++++++
 package/mpd/Config.in | 7 -------
 package/mpd/mpd.mk    | 7 -------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 24d0dc1d51..3551dd9982 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_MPD_TIDAL
+	bool "mpd tidal option removed"
+	select BR2_LEGACY
+	help
+	  tidal has been removed from mpd since version 0.22.10.
+
 config BR2_PACKAGE_MROUTED_RSRR
 	bool "RSRR for RSVP removed in mrouted v4.4"
 	select BR2_LEGACY
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index b075df0d03..e5de77f1bd 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -58,13 +58,6 @@ config BR2_PACKAGE_MPD_SOUNDCLOUD
 	help
 	  Enable soundcloud.com playlist support.
 
-config BR2_PACKAGE_MPD_TIDAL
-	bool "tidal"
-	select BR2_PACKAGE_MPD_CURL
-	select BR2_PACKAGE_YAJL
-	help
-	  Play songs from the commercial streaming service TIDAL.
-
 comment "Converter plugins"
 
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7a18783386..14390fd0f4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -284,13 +284,6 @@ ifneq ($(BR2_PACKAGE_MPD_TCP),y)
 MPD_CONF_OPTS += -Dtcp=true
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_TIDAL),y)
-MPD_DEPENDENCIES += yajl
-MPD_CONF_OPTS += -Dtidal=enabled
-else
-MPD_CONF_OPTS += -Dtidal=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
 MPD_DEPENDENCIES += tremor
 MPD_CONF_OPTS += -Dtremor=enabled
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
