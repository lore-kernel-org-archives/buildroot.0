Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE871C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0C78400F;
	Wed, 19 Apr 2023 08:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0C78400F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjVpJUr9pQWI; Wed, 19 Apr 2023 08:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65CE38400D;
	Wed, 19 Apr 2023 08:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65CE38400D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57B901C4323
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3192A615EF
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3192A615EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN686JqCt6Pz for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B7760AFF
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41B7760AFF
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-32ad8ca1e69so25303125ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893110; x=1684485110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S336/hmyKxUJlna8KFX5EQkt3/46iidoD3FI53Q9FIw=;
 b=A2mZBuSiLyWnOJj4ZAmzjxISHVMgOoPiqLs2o8pfb4r0ZQPsEuO9N36sCtFbzjh3o6
 hHe31KJ7f3DbeeGk2pBW03LdvWJRVMQJ0MxbEkoJw11hyHkQ8kKuPMQRgBAVPf7u+o2D
 Jucvtb6HJ2wrj7A0IMxqLx1huBwVPCGaW8ZRgpJAHHvaRRjtVkLYPcXspsQ01nQbb6cP
 WEy9vMzxevbBMDWYGPP+80KKfSejH3Lj/sKXrQRkxkn8MazMLnUQW0AzmviWOeXwSkuO
 +VrlILzmmiRgAQvhbFe8qmM2yyfTo//WTnts6cPwHd8ekSvevUzPUiBY3WZGQGNsxSwI
 R5uw==
X-Gm-Message-State: AAQBX9cDh8leX5zFH7UzWazOOKSa7ADXButxv2YBEykz8TlcWFq22Ixn
 qp5/jTAtGsT1E3oxTAfraD/EDqHMors=
X-Google-Smtp-Source: AKy350YCAWSE1Dv+jLjqpQrbfcTu0ob5kI9OFVATHdG4N6bMPXb0mPDpfmFtLOaeVOKmPdXO+/jURA==
X-Received: by 2002:a92:dd04:0:b0:32a:a16c:d28d with SMTP id
 n4-20020a92dd04000000b0032aa16cd28dmr12493878ilm.12.1681893110046; 
 Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:34 -0600
Message-Id: <20230419083144.212921-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893110; x=1684485110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S336/hmyKxUJlna8KFX5EQkt3/46iidoD3FI53Q9FIw=;
 b=Bgz21I62UspYsuoJyaimnFMaSI8aKM4tQanzdLIN4cgb753SZKTnCC2B9xLuCR45eY
 CW0+NxlX2bRqDEDP1lJBHLsMH5uHKurkrDLmunW6E8CMAAWpnbXgdXqJF8USeKJ98HuD
 0ZVlZOV7vbiSh0jhpTMS31ZP4s7+FrZBIxaraK73Bc37rVrjCgJDV0kmqsugV0OL3Q+K
 wvu1DiRZv/2B8X+XQ5dkASna37FwXCKBfGv9woCASx1NhJsu5KNQdX2hOIWdcxidmF6Q
 R0TuFXBB0PTcHcZ8yam8SP5bAGxb6IPdnm3rQbS1snDf4zjuNt+4JDryeZ417ex2z9f3
 M/JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Bgz21I62
Subject: [Buildroot] [PATCH 02/12] package/gst1-plugins-base: bump version
 to 1.22.2
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
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index bac4f8398a..173f359afc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.0.tar.xz.sha256sum
-sha256  f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d  gst-plugins-base-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.2.tar.xz.sha256sum
+sha256  eb65120c4ee79b7a153c3c1972d5c0158c2151877cc51ec7725bba5749679d49  gst-plugins-base-1.22.2.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 7d509331fe..153187f743 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.22.0
+GST1_PLUGINS_BASE_VERSION = 1.22.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
