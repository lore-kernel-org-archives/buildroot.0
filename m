Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A67C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0162260F01;
	Mon, 27 Jun 2022 05:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0162260F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0NWRMhRWLir; Mon, 27 Jun 2022 05:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101DC60E19;
	Mon, 27 Jun 2022 05:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 101DC60E19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF0E41BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B3F60E90
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B3F60E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12u1oW-RbtNH for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F9A606EB
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46F9A606EB
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id s17so8472827iob.7
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gLg5IF8y7reMSv5k1YpHwiyfg79Gvm/+X9zvScvNSA=;
 b=40zu1x29rDIPY5KqZmDHriJN2PLAR3kI+syS42oOHSLmjmm8AnOk8AxHzfaaNLpXra
 gKpa5kPl4zf3BG2bdOfpFRhNz7rQQt3Q4iTq2yCuTSV/HEdNoOSii62/Nx1LvN2Yd0At
 qICZLKqIYKdNCckBrFKLCkbYikuFJbUOGg4N8Jx72GQKA5nHh5QmuiiShgIp+GdCzNxX
 FnpNCkif7yXi5aIdIoaFEZNZQPX506N2BOK8MsCje7wvnORp6TjtYJO1fBRgdwSl3/Ms
 83VUnBBI9Gta+2bNALOAXmaxFqs8tg4ZOMQonY2x6GKzejX7y2N5xiWcIMmFNMoKZA8s
 /5Qw==
X-Gm-Message-State: AJIora+T/0JBUEjPAld1LCmeVc2k5WNHWOsrJ5wlNAj/EOHpc4nUgQIj
 XWVO+HSB++PT6RDOKh46GPfI2FpfIv4=
X-Google-Smtp-Source: AGRyM1uy4z9IeO6Qm0ZouDyxumas2WcW7BKetV0W4MZ2dwHSIXdjAGzqvhnyufeoveP0u+hXSP0cbw==
X-Received: by 2002:a05:6638:16ce:b0:332:44e:af98 with SMTP id
 g14-20020a05663816ce00b00332044eaf98mr6611766jat.112.1656308073210; 
 Sun, 26 Jun 2022 22:34:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:19 -0600
Message-Id: <20220627053422.618280-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gLg5IF8y7reMSv5k1YpHwiyfg79Gvm/+X9zvScvNSA=;
 b=bmWC9nIZMd91ij4Tazb5XBWqawo1PEQ+Uu2cDcLTokgzacNnB23H2tNhvIFCoAn1U6
 FNLE5L2jfX/XhPih0uhR1NRUzQkgvQ+5i8oWGoPzqK+xSA6qdHvmc2EqlCVEYIIavik1
 8TFFnmyQL49UdUEnT/3a04LIqmtzLFq1UTblu26aOUdLmTrpjkCHXq3IL0blzOQGKwiF
 TnaMPSg8xCNyBCjunWjvrDVifog8OQLD4RTgRmuD5eW1fABQ90sN7TPQlBoeHoHecfJj
 O1t/dWqv59TcRD6TI+eDQX/NywSGE7/vUEK4pcEI5ynZNB21vkExm+i1Wp2U0y2jpL3+
 q4Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bmWC9nIZ
Subject: [Buildroot] [PATCH 09/12] package/gst1-rtsp-server: bump version to
 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
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
index 1e66ed7246..13dcb764d8 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.1.tar.xz.sha256sum
-sha256  4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509  gst-rtsp-server-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.3.tar.xz.sha256sum
+sha256  ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca  gst-rtsp-server-1.20.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 978f7b4491..02cf9e5eb1 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.20.1
+GST1_RTSP_SERVER_VERSION = 1.20.3
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
