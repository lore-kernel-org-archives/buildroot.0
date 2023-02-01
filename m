Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4EBC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA3A4148A;
	Wed,  1 Feb 2023 05:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA3A4148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3AW6yd8ldk0; Wed,  1 Feb 2023 05:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED874410D3;
	Wed,  1 Feb 2023 05:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED874410D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 366341BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B75CF409E6
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B75CF409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEFlpm6fUWpc for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91AE8409F1
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91AE8409F1
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:11 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id i6so3608267ilq.8
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=li7u/uYSgJgDRo3Cr1EdjZ+kRynOwzc5Dt8eJi0U8rc=;
 b=CGs/RDCRnOGFZJE0rfn6zFBKs9NMaB7RKGLhLQte/aCHjOrFxcPrAmIpS2Z1Ay6wGX
 Zcixbv050uugU9hwZ3Y+AiPJ5OgTm/RAIt4DJWIHdJ0T3NVcvaRdpHPg8jltszvDhP5o
 T9zZDFnydFhfY6pfFuAmiDDMGV3XUm1G5TyBKLAeKJzh4mBtcUH9N0xKPl6oKMj/Gxvv
 mjpgQgeBuMuQwzX2sSAdEesHgVHMibwBnZHvUppYd+DoAKAOc7g4W5auTEdi031erhof
 db4ZkBUUyhV+tO2dE4o2kQEBEr68kfaYyGgFwdmUZnrOO31xM3k0sZ9yrHmmLdVETTQ8
 ko9g==
X-Gm-Message-State: AO0yUKUdzLrxTI8mUkV9lKHpUoDFFZFaGQhF/tmIeH3ldnH1G26VSH+B
 9EO5La7d1RuINMz4SEN/L5Cdg4rKBRUPZg==
X-Google-Smtp-Source: AK7set/pChq+BpL6OwBHxSshgq7aBdsnBY+UdOLcJlF/Psv+gE6I0MV6Vf4B5eXPZqf0tDhoGgAB7w==
X-Received: by 2002:a92:cda7:0:b0:310:fad7:e1ca with SMTP id
 g7-20020a92cda7000000b00310fad7e1camr928131ild.24.1675228630384; 
 Tue, 31 Jan 2023 21:17:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:47 -0700
Message-Id: <20230201051658.383420-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li7u/uYSgJgDRo3Cr1EdjZ+kRynOwzc5Dt8eJi0U8rc=;
 b=LHIAzP5GQ19Mi9dyJx/pDG9mvZFye1JAUDyhq4gaVy4p3qVdlojhJigxQ/On/d1bsL
 dhEtI/U0Wkf74DJZh3EM/Ufb58BJ4GDaf7nlH2/Q4EBL74l8Is1PSM01kR/SlDuNfLCK
 V/n2WC+d2b3bXQZtArrR8m/9lgkTdBW/U9YTcnPXcGgPTmlsAtHHmEfg/B21lIfrZqFF
 7ju/+8ScZyzX1QHsxQ9x9lZDAyXHbUnf91zc4n1j4l59aY4IT9ZxqAcVCzHaTNDmiTqu
 /P7limZkAsuc4s8kgqB8eseNlZfyVvCKlUE0g2lsU1B9kydyk4BXDTin0qwIzv742Su7
 FuKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LHIAzP5G
Subject: [Buildroot] [PATCH 02/13] package/gstreamer1: bump to version 1.22.0
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
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 5fb52606fe..db0ed5bede 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.4.tar.xz.sha256sum
-sha256  67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f  gstreamer-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.0.tar.xz.sha256sum
+sha256  78d21b5469ac93edafc6d8ceb63bc82f6cbbee94d2f866cca6b9252157ee0a09  gstreamer-1.22.0.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 16c016b145..09d1a10ce7 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.20.4
+GSTREAMER1_VERSION = 1.22.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
