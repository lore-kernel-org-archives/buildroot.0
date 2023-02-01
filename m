Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2542AC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE8A7813D8;
	Wed,  1 Feb 2023 05:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE8A7813D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wekZSLmrSxJs; Wed,  1 Feb 2023 05:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D299813C4;
	Wed,  1 Feb 2023 05:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D299813C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 570DD1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31054410C7
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31054410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeeJbp8Y7upm for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCEE4109B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FCEE4109B
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id w24so3178486iow.13
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ELYPT0yt/0EQuMBAJoJbz/46Z6akH1n6U2YxW5YW74o=;
 b=L1XI1Uo8sWoQbPNi8xqQvw6HklTOp3H4VwOrKfcfAjRx9o4pswo3NNEdW2FWeBV594
 mzRsqqln3EcRbr1haf4EuRZrRarFyFkZM5ED4diHh/6nicy48X5+Fjrj0YW7utDWijv4
 mzQNKgBYhOpzsIc8mk3Ww+oLV8lQYDmGGl98znFQdgnhZf/HR4NLJGEJriXf3XXVbQGx
 bAyM3ph9Tn4UjoJqDktw1bR8AsK5SojXlF5uWTIin4K2tvsoWiR/ZLicIkXdqC5YnYO2
 Fv7rpR3Z0n1Ekt4cKE+r//tD8kLDYXiL7PgzlHhNqqwM+m/jkx7uOmProG+29Xr1RsuG
 BTVA==
X-Gm-Message-State: AO0yUKV7D8Xe+b3j4dfoJw47ivODFypKPJrlPlBMyNE8XXkiLPy72fEK
 VDC3/pJ47nAVtVGGFzj7/XlnQaoU7i3WlA==
X-Google-Smtp-Source: AK7set9OraGG+RkM3n06jUMx/prWEGTAKcz1I76l9ikhtvlpRA1zu/C6Qv8/RRkLnzSXmz1r8xPV8w==
X-Received: by 2002:a6b:fd09:0:b0:71b:cc7b:db4f with SMTP id
 c9-20020a6bfd09000000b0071bcc7bdb4fmr752781ioi.12.1675228633990; 
 Tue, 31 Jan 2023 21:17:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:52 -0700
Message-Id: <20230201051658.383420-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELYPT0yt/0EQuMBAJoJbz/46Z6akH1n6U2YxW5YW74o=;
 b=SlDspqyHo5MS6yLB9QjfyjlnZSSTrEcyuGM/0vq2eyUBEdPj/2uxD7K1YRAFFI90fZ
 7wEni3jY/JLjswJDuKN/+ojxn3z7myfWoBUf39H8R4VQ3SGg9hGnNCGRdThzKWiUBVoE
 X5bBXZ7sgVc0gCHS6zJa0cgjH/nk3BvpOHNN8mlNY7gpPR1nSS9xuoJX9ByEvcdAkKSM
 qiRuXNg9knxh71XahWpEAHIRP88Ld4NiBwjOwmEBEpzvr0MU99g5CN7djzHw8JIi8ZTD
 5pupYKNkUZnTkWqvGScL0ECE6nPuN4c6pAcynP1ZPIm6b35hF7haP7KyiDEytPFhxZ5i
 aa6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SlDspqyH
Subject: [Buildroot] [PATCH 07/13] package/gst1-devtools: bump version to
 1.22.0
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
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index fc504a2c12..46480445ab 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.4.tar.xz.sha256sum
-sha256  82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84  gst-devtools-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.0.tar.xz.sha256sum
+sha256  4d21fee5c15f2877c0b1f6c2da0cdba67ce7caab2c199ab27e91a1394d5ba195  gst-devtools-1.22.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index fbb04c92ef..8fd3321d9e 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.20.4
+GST1_DEVTOOLS_VERSION = 1.22.0
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
