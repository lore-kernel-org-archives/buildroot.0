Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB1C47258
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 11:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667CD83122;
	Tue, 16 Jan 2024 11:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 667CD83122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6SBO5iOONL1; Tue, 16 Jan 2024 11:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEB083103;
	Tue, 16 Jan 2024 11:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CEB083103
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F12F1BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 11:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E8D341AFD
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 11:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8D341AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OW8hE0X_8m6y for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 11:00:33 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A159C41AFC
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 11:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A159C41AFC
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e86a76c11so1086505e9.2
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 03:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402832; x=1706007632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twRDMSvyAYZgy4JUI9jXPj5ABbsorOpPtVvPokUzKj0=;
 b=BrMfw7sLDgBIf0X/TTi2b8RnmcV1SWHu9lKbUfTKnL/9CReRiVO2BF76DMQ9XfiSWk
 a40gnDp/baJTl6ol2lJB8XI4XeVEpUwDKhb6BjlaL6KCVrfX2ne0bsYdm5DtH/B62Kq3
 39U1hX2dW4Jrs2e4utdbDJQNM2ZWVq3I36bSDLuj9x94EQP93GzmhdgmOciJNZqIw+x1
 jreqXvP87lBW7a0ctQlthwPHqa9pFJgOdsOiiMk62dIljvJBSPMc7ILfGut3oU0GRUyj
 e5Ud+RAQfeALVQHVtsW7xJPflbxSK+8+ZPGV2wv6uKQ4hxnRWl1OcUCFToLN7AiRZQ1K
 UWkw==
X-Gm-Message-State: AOJu0YxjV+Gh92pCKWGCfAbuHMLU1Rc9veq+9ukEfBQZlpsP16/inZ2g
 EpXFDEwGtb4kk/dserPyN1/07Izz3oQ=
X-Google-Smtp-Source: AGHT+IElKTT4R/0ryHQa0/smJcWjAE5TMIYdOfVhCTThPfDP5RY5gOhaPMx4yBw8kteh8aOHIxjjXQ==
X-Received: by 2002:a05:600c:792:b0:40e:6239:317 with SMTP id
 z18-20020a05600c079200b0040e62390317mr2653645wmo.253.1705402831305; 
 Tue, 16 Jan 2024 03:00:31 -0800 (PST)
Received: from lanodev2.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b0040e3488f16dsm18758240wmq.12.2024.01.16.03.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 03:00:31 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 12:00:02 +0100
Message-Id: <20240116110002.2146885-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705402832; x=1706007632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twRDMSvyAYZgy4JUI9jXPj5ABbsorOpPtVvPokUzKj0=;
 b=ZpGAk2O8MSlX7WCc1BipndbHatjLjWohGZbkfi6czIT4z7ShrckPMz2nTqvpgvBpZx
 MlWbzk+XVTMwWkXI/excLAye/zERFb9CWjTFBAmgd3c6CQ9cMZkIwfi9J7+8kyE6/S1j
 VcMAbEL664bApX77VSflhOOqY5C56zB6Ibaa/6e10+7lpgAtVhtsHHI4y/bY6xOxNRSy
 3FsDY6NBeyfZzXbuXiuaACs1c+OHWBDB+OMH30/pU+mJqcKbfwhKs72bq5g6k+hBcvrT
 2qlTa0bIl86yumUk6VvrYv/wOciy2QeUZDKFl+sWWs+ilYKF1a0thyj5W17HJjY4KhSV
 Iz7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZpGAk2O8
Subject: [Buildroot] [PATCH] package/psplash: fix systemd unit ordering and
 dependencies
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a typo in the dependencies, and switch the type to 'exec'.
This ensures that the psplash-systemd service will find the
FIFO created by psplash.

Change the psplash-systemd dependency to BindsTo, so stopping
psplash itself will also end this service and free resources.

psplash-start service need to start early, otherwise it might try
to compete/take away the framebuffer from the final graphical
stack. Order it before sysinit.target.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/psplash/psplash-start.service   | 2 ++
 package/psplash/psplash-systemd.service | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash-start.service b/package/psplash/psplash-start.service
index b97e883e54..74cbc33955 100644
--- a/package/psplash/psplash-start.service
+++ b/package/psplash/psplash-start.service
@@ -2,8 +2,10 @@
 Description=Starts Psplash Boot screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+Before=sysinit.target
 
 [Service]
+Type=exec
 ExecStart=/usr/bin/psplash -n
 
 [Install]
diff --git a/package/psplash/psplash-systemd.service b/package/psplash/psplash-systemd.service
index 249aa54039..f89bc5f4fe 100644
--- a/package/psplash/psplash-systemd.service
+++ b/package/psplash/psplash-systemd.service
@@ -1,8 +1,8 @@
 [Unit]
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
-After=systemd-start.service
-Requires=psplash-start.service
+After=psplash-start.service
+BindsTo=psplash-start.service
 RequiresMountsFor=/run
 
 [Service]
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
