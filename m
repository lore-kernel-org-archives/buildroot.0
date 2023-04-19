Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B6FC77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5502B84003;
	Wed, 19 Apr 2023 08:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5502B84003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqTDwwoYEo6E; Wed, 19 Apr 2023 08:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A62783FF6;
	Wed, 19 Apr 2023 08:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A62783FF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3C91C431C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0211D83FF9
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0211D83FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqX3cPz1__TJ for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C1881FCD
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1C1881FCD
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-329627dabfbso43378375ab.0
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893110; x=1684485110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBesIWc62hvXhVxztACND7L3GZN6WsamNA1Mi0HQJSY=;
 b=RAg6TPu3z6P5ibYfO3Cs8+unIEg30ytaJKFfZoXAQWXt2IZ6SR7MU6s3cGeqdfACCv
 Ax6e5qnO7gAhgKuOOAwaL0gUQHj8bST1FPquyzSrYPsAWsIAQEdiKEz36Rm2NNRFP7zD
 lFPFzb+0cHbp3LAu7YtG4Hlb8qF4YdUvefp5LTgR1RxXVoCRhCaPtLBKjarM9/zN08Uz
 XGTwSRkblWTD8c8xDLcO53OhvhdOyendlyB0GyRVy9uRLp7dyJz2Pkr1ud0t4rfZLeRx
 eg8e0l9WBv37HDJf7HDOFBvr2Tx/+OeGQACnrinM6zfw5MDwc5DNX/Fj5LKewAW2pPFA
 HuJg==
X-Gm-Message-State: AAQBX9cLiwFWOMOk5ti+hC8f2JctM4RloyzDv128Plzn+Dp+SOejUIsQ
 +gvZVp8lauPE13n1YMbiVS4sEfUu34M=
X-Google-Smtp-Source: AKy350bnugkfmynbCWLLR2e95FIHvYUP3Qz4ONC18jj+ldrt9pz4b1H2FZR7T2oXBtACJ1rEaB2suQ==
X-Received: by 2002:a05:6e02:1aa4:b0:32b:5dda:1313 with SMTP id
 l4-20020a056e021aa400b0032b5dda1313mr1356260ilv.14.1681893110546; 
 Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:35 -0600
Message-Id: <20230419083144.212921-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893110; x=1684485110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBesIWc62hvXhVxztACND7L3GZN6WsamNA1Mi0HQJSY=;
 b=EAqbNTxkPqTnlvrWEBaQhSbtADZ/5spg1qu0KMFGKDF6OIATeYFiQ+JHZhQBmsOM0j
 qLMvV1NWTrNk7AIYx4UHsUC9UFV0dBkPPx6NJjie+NgwWFUwUawmC1WcSnOVti8uMEpt
 ebQk6izp0LhU1K/vTFuicczEdv8oY0wYj+99aWYK5gzlYS953eYwAM8yt2SoJsCHeTgl
 QX0cU+Vq2JUuUGAfcX8DLg2dQxIICloed5JGZdvh475hARUv+A1ucgC+LrxFupZkLIs3
 Q7GA0vGwzmmmwhO+MU4g9cnjfBYaBEn8bJ4dprT2OlVkJ2jaowLhOTdNKxvn6jTKg9Ng
 olZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EAqbNTxk
Subject: [Buildroot] [PATCH 03/12] package/gst1-plugins-good: bump version
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 3e219faad8..604e74b57d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.0.tar.xz.sha256sum
-sha256  582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0  gst-plugins-good-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.2.tar.xz.sha256sum
+sha256  7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd  gst-plugins-good-1.22.2.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 93c2328bda..bbcd3aecab 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.0
+GST1_PLUGINS_GOOD_VERSION = 1.22.2
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
