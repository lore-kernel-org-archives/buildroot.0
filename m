Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98917C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E5644093B;
	Fri, 22 Jul 2022 06:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E5644093B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlbA2D3vV_RO; Fri, 22 Jul 2022 06:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C83354091A;
	Fri, 22 Jul 2022 06:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C83354091A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1FC1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A69846E7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64A69846E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KdpaqemWQ4K for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DDCA846C2
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DDCA846C2
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:05:10 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n138so2995126iod.4
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 23:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciGvcZ+7IEoWlctITGYSMgRT+EFoWN6gfJFU8dn+QAY=;
 b=E6esmlXGTM9d13kDrvaAdlcFYAPGCzEFBxp1VEaCb5Tf485Q6EWAjkDYsBF5T1Suvj
 9xYgbACt5tdhBj6UkMX6yLXvgY0L9ueHN6csUk/dCxlNlwiA7VZxj3C37bs/TzrGcGaA
 Lhyzp0cKz9CvvirCYULETLz4rwOtOax530YU/9TvlDn7RfBxRdSMuDikLOHMIe2vWotl
 NvhwlU0a8IbEKy6kogsB0vvmgbFZrb/7BQ9VFRX/qWY5jLYxb6VdDe3Pk3tOP8OnWZGM
 pu8PcBaC7tzyFs51Sui7zQJI+gRshQFZMo4/IAQ/pWYIeeyTDr8bJHh84rcgI6JQcP7U
 O0Gg==
X-Gm-Message-State: AJIora+8+YAX88c8vSsKB0c+Kikwj/0M3disw9HQn/v/1iAw+dJoKBY5
 Gss9Oc41iH7bSD3zRsb8+Hpvf1RG53TgwA==
X-Google-Smtp-Source: AGRyM1smYUFtpOdm86+Uc3/lT4KOorvUZOWeP019p3A9IYXBYojbNg9SgrU5cwxzoK3L9QjuY+06xw==
X-Received: by 2002:a02:9705:0:b0:341:468c:7724 with SMTP id
 x5-20020a029705000000b00341468c7724mr790576jai.143.1658469908874; 
 Thu, 21 Jul 2022 23:05:08 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05660214c300b0067bcbb0d258sm1769582iow.46.2022.07.21.23.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 23:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 00:05:04 -0600
Message-Id: <20220722060504.566262-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciGvcZ+7IEoWlctITGYSMgRT+EFoWN6gfJFU8dn+QAY=;
 b=PbVoMey+wcJ/cfApYnZbBxKCZMOd/X4PS05R7zk+qoJxWv1laEa0lg20BIKRs4bo4U
 MkQYN7k3PbcjFX2Z5am39Zog4DcGZr9adkKM+ZKzs6Vy+Q/oO3XekoSSxrWs9qhs+KiU
 xL6/onLFilTHjDzdiZ9yNVTEqkccQVPunzq2TpF29f8hrhr2oakWsX0wcIbBcmCLKQ7r
 pipIk12a1GtC4ueTO3/djiqGjE03u8B5joiHEuXcktOwlgigmQ5ZMH08GCVKw6/TjHWD
 5RI/qOWlyaLo5MTJFVbFCqErF1Z5D54CPIQq5Ql8Lfwd4DSw+A80oMQhR4q97FVUHgdq
 ds0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PbVoMey+
Subject: [Buildroot] [PATCH 1/1] package/poppler: set
 g-ir-scanner/g-ir-compiler paths
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The g-ir-scanner/g-ir-compiler paths don't always get picked up
properly by cmake.

Fixes:
[ 98%] Linking CXX shared library libpoppler-glib.so
[ 98%] Built target poppler-glib
[ 98%] Generating Poppler-0.18.gir
/bin/sh: 1: /home/buildroot/buildroot/output/per-package/poppler/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/per-package/poppler/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/../../bin/g-ir-scanner: not found

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/poppler/poppler.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 18c044a9f6..b54262e7c4 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -44,7 +44,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POPPLER_DEPENDENCIES += gobject-introspection
-POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
+POPPLER_CONF_OPTS += \
+	-DENABLE_GOBJECT_INTROSPECTION=ON \
+	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
+	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
 else
 POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
