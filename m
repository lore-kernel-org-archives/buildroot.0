Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7D3C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817D260E8A;
	Wed,  1 Feb 2023 05:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 817D260E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LccduDriB-mQ; Wed,  1 Feb 2023 05:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E5760E4F;
	Wed,  1 Feb 2023 05:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E5760E4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9B21BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19B71813D5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B71813D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MLBqg0fn8jY for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C25F813C4
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C25F813C4
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:19 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id y2so2965280iot.4
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PL3mQ7TK7L7r+sbgRSN0rpUAuUdUJfDmygzVzRrAIc=;
 b=t6XaYi3OMXj9q+9/+f+YAO7nqaJHTwPsCIgq5X8eN0C/oLzuxfRANN+3SO8ymSBf0B
 rbVoTcZMxzw07mSVHGqnRjgdWaSCjuxUl3We7RS/Q5LLoRAn37ODliTbvUQc9949bD0U
 J3C4/K19yhHNk6Yu7jMBGw69CBC4CRHHk1/v5rYGVYcPYMf9s/e9SR/Bkt8dfUDAG/xl
 GRKpwX6lPTIMIVJSK06pcP4b2TaMmSsgVKEsYQ+XYCj3Rh+bOh/JHgelPFcmPKabGKO0
 ERWxO7tKjnWsTsdRkQm29ZvHUY3Yt81XzM+TuSzJHDb5uCx4s6xmqIcmeHdYKvu+gyRy
 hY+g==
X-Gm-Message-State: AO0yUKVVTrOY57qrTZqdcKCJDeTZrDY6XdqZZzE5nJkp2ske6nUMqCg5
 WrYg7EnEmK7oSgimt+BBcCl1doIT0pzmkg==
X-Google-Smtp-Source: AK7set/qhdXmy68uQrdgzwNxIl5IMaXMSkTy7jLrb6/jcIZROtCcqdxFhiMURxNs3NhZUxGLO7e/cA==
X-Received: by 2002:a05:6602:1c6:b0:71e:15f:2911 with SMTP id
 w6-20020a05660201c600b0071e015f2911mr722125iot.1.1675228638135; 
 Tue, 31 Jan 2023 21:17:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:57 -0700
Message-Id: <20230201051658.383420-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PL3mQ7TK7L7r+sbgRSN0rpUAuUdUJfDmygzVzRrAIc=;
 b=O0AQOOR/YIvA1yPYyPCOp2kor2mc9FJxgcnMOfStmgX6u8R/vpQhOHoNWPFSYHfEYj
 4uiOuQbPt6QtVVAmQGwMZYtBKBc1D1A6Io9cKps6Me2T3skVW60FHF5TyzBYRHpTe2M9
 lRMl/NecYAONW8DyaWXIjBpSAwzeb9PjIfm3m/G8ZPav+Oj6mvwhQLds3LSfXsMeqyrw
 lj0XL0+i1bf61xUMxT+BnyvJAFQ4c2yk2UobCQTap5TIbZf9+gSXd3PE3dq7x6x7NPyL
 0Q4onaJYtUw2VxIC2cH+NWkhUbGOSxvcK0dkSFiyyYzFNdTuHzskkoR8Yu7TWmRUApJK
 7bjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O0AQOOR/
Subject: [Buildroot] [PATCH 12/13] package/gst-omx: bump version to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 140ad626f7..51ea74a0cb 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.4.tar.xz.sha256sum
-sha256  70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd  gst-omx-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.0.tar.xz.sha256sum
+sha256  dbc951a99af532380e599aa8acd9e1385fdb299b46b5868cd2be4230ad888341  gst-omx-1.22.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index d644c44995..6f7168279b 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.20.4
+GST_OMX_VERSION = 1.22.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
