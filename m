Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC32C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570E381FCD;
	Wed, 19 Apr 2023 08:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570E381FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTgaWF0y2Bvw; Wed, 19 Apr 2023 08:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F48884010;
	Wed, 19 Apr 2023 08:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F48884010
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA681C4323
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021B641F10
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021B641F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnPAoS6MJLln for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF8F241F02
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF8F241F02
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-32b2485c0b1so4793405ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893114; x=1684485114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wX8BRgMEeU72uoKjuU6ykeIo8fis8yBDoZZTkZhcuM=;
 b=NE8Km/7JUFHQK11S9btm3F4hamUjtJ3GSPKgI7s4/eFc/gXkEjAPPa+0UzPjnrjPRj
 xGoZkKm224lm6py58TmnAndfMd6srC6F0a2T6yYSEOIE1rYp2J7N0Muji7qtksgLrLSs
 bc2sX2fNCbpGDl2DRzUL9deDRH+4TgLjXHZVKBhpkAO4pNoWcPgm7tJ3FoI5DneCCb7/
 Q8U+bwcEV6Bk8tCYzjOzNr+mshWrSvZ73Lxf723L4g/3tSwe5JBpOjlwC1qV7dRSrD1r
 +ZxygMh9ftEuq23wZ5UK3FPtxEw8dUwgWdcileSM7lR4Rs4OZm+qy0rXWWSq7u4dTDiQ
 y9vw==
X-Gm-Message-State: AAQBX9emQ7U0wxelNBkb0OOeNnKQlJFag4XwXc0F1sv0KZAs4bbtrNPz
 ePDNehcYDkvc3TE9gFGI4SYmu120zNs=
X-Google-Smtp-Source: AKy350ZKp09k/CrjziY/Mq0lX25P27xx3NUX3obdmE44mFIksythXI6a1pkFmI1kmF77XbH/dK09xA==
X-Received: by 2002:a92:a30e:0:b0:329:3c3b:93f2 with SMTP id
 a14-20020a92a30e000000b003293c3b93f2mr16728564ili.26.1681893113783; 
 Wed, 19 Apr 2023 01:31:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:41 -0600
Message-Id: <20230419083144.212921-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893114; x=1684485114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wX8BRgMEeU72uoKjuU6ykeIo8fis8yBDoZZTkZhcuM=;
 b=V6tV3oAsS6tZAHQ77Y/zirjT3SF94Og2WthCtNN4ZJc9PvLjWtrtPCaMXaX0ff0wzy
 uSghvKyCGMvfJD0qFUP5YQFXbWGGEr/NhsjUXDI9xpIdOVYUPNlVOYtxkuQfdhymTNJo
 snRrwilz/jkkLgIpxr1MfFuwLdnIENfyj1CLYH/LHbeGqP/44B4dmPRfIYxdKc0dD3uS
 gnntuY2flVWBTbiy5bCoQlNZS5rpoMZebKAwjjqZA10pC2xnmdYI8p13V5r/Laq2zPWV
 LApuOmrUWkEsCavpwdOllDQPDMCGUk4fRwRFjI5Smsm1egoBtvLwFXGi1UVjyXbCgJKz
 gHjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V6tV3oAs
Subject: [Buildroot] [PATCH 09/12] package/gst1-rtsp-server: bump version to
 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index f37e7bb292..c98d10d79c 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.0.tar.xz.sha256sum
-sha256  aea24eeb59ee5fadfac355de2f7cecb51966c3e147e5ad7cfb4c314f1a4086ed  gst-rtsp-server-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.2.tar.xz.sha256sum
+sha256  2be4aecfb88710100ea7115ed0216403e8094344ebf146094271b8d4d73828bf  gst-rtsp-server-1.22.2.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 6b4bd49fde..6f5fc4f7aa 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.22.0
+GST1_RTSP_SERVER_VERSION = 1.22.2
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
