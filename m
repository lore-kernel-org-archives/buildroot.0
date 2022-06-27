Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7234C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E12A40469;
	Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E12A40469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JepmTIVRgwaT; Mon, 27 Jun 2022 05:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3E7B409EC;
	Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3E7B409EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4291BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7349682F06
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7349682F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LE91PPM2nL2r for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E45C82EF1
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E45C82EF1
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:29 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v185so1794009ioe.11
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKf4nuXW8WSiq2rlF3FCQcm7vDt485xYBUYivtzNR5c=;
 b=oXh6hzPDE9Ms9nWRGEuLpxbqPWvUIbr2PyzNtk/JJwGotqa8qqEDo+bjkhstuF9HRD
 1EmUInyg0x+U5CKBxAw9GMJKDxcuw5AbLPowWicvc9ZlWvqzVVww8LAhBasluH3Hycqa
 yudfkE5YND1e7iiiEJk51+hv4pa5tfZlnuY14aGTjMFKeo97QAq//WsTNOL9p6wdBDtc
 7+LXonj3VAdTICi8MK78XEvKdJH7fnSCge7+9gLYiKDv9Sb9NBNwkRTIZ/q0epf8pNzQ
 LjyPrV6dioA7L4XVu7GxOI/bAUie4wHW62XciPIZsxFlP/YudFFERPdj5XHOWdXjtmnS
 1oqw==
X-Gm-Message-State: AJIora91Nzlrg02Ul9cQ1tzM0ooKF3nT62uuUmdUNYVWxzkW1D0/E2ka
 +OvpbaGFhI/q2LeKDTCB678r4QsO9X0=
X-Google-Smtp-Source: AGRyM1uOPsWnN5q0LYkQd+WZrzV1ldPlcxKBfaEL9lukLzrdB+AUuv1dXBveYL6EDxYOZef12ZQ2Sg==
X-Received: by 2002:a05:6638:3043:b0:314:7ce2:4a6e with SMTP id
 u3-20020a056638304300b003147ce24a6emr6808999jak.258.1656308067725; 
 Sun, 26 Jun 2022 22:34:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:11 -0600
Message-Id: <20220627053422.618280-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKf4nuXW8WSiq2rlF3FCQcm7vDt485xYBUYivtzNR5c=;
 b=aT2tyQILC9rd8qaQnBiFujmsS1Zvh0XQh+rwb+YcFdXDUUSjPvOolHM25IWqFB8lz1
 iOEkemoDSV8u9gJAWDI9uUq5NOd9XQb6AfaRaY0m/56Rr/3bX1p7/NuexpYpg2EfU49d
 fmGyAYqPMhyasuz0qmwRPBQa4U8kg4IZT0PY0qzxms2eJregCHGa+MOA1ssyY4O7JTDd
 MXOIVZfAvqDJL5t3K7NA4rJM6GWIhd73gCm0RDEGaxSlzFWDX8UzAycH1rA4Ic+XLU8e
 pRfDzxZPPaiAak3J4fnbnBZzxeH7fdLjChI+/pSO2aignyEwWMyO871VUAIrrc7FGWL1
 OHGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aT2tyQIL
Subject: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version 1.20.3
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
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 128bb564d4..5daadfae74 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.1.tar.xz.sha256sum
-sha256  de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031  gstreamer-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.3.tar.xz.sha256sum
+sha256  607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a  gstreamer-1.20.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 995c5b118b..89d5f93d43 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.20.1
+GSTREAMER1_VERSION = 1.20.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
