Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0ECC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55F6640533;
	Sat, 15 Oct 2022 23:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F6640533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRR9n2iKhV9e; Sat, 15 Oct 2022 23:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DCF9408C0;
	Sat, 15 Oct 2022 23:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCF9408C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40C51BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A80640291
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A80640291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pK0EK15ZvDWY for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A43D5400D9
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A43D5400D9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:47 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id b79so6407657iof.5
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AtvvYb6UxbA8PiHKF4SWpBwL+8Oqneq9zdGti8RJIrc=;
 b=F71A1gOvAdgCSXLl/7bS57/MyKtYHJI+3Kds9jK3yXY4ZdF8qkGj/A4Uhe+UQGb6kT
 wiAzUG50pK1+neOzUkXGkaMQasXbumIM/RVWgJjljdgtGgiQ2HIobVcOrZHy7Nn94pkd
 r4jPWjxem+z+o8JrFDYQc9Pb6nti+njPPeufgO/J8puGxzU5yBVmu+iSyzpVuf6eo2Nd
 MtPK/zv3+IhVWjuV1b8xapsGpV0JRnE+PYpW+6t79oAk71c7EJ9tKoVgrAXH8ry+tC+v
 4TscQ1dnAXhy8C32DJHrcgw9Mmwg/PZ9W9o6WJQis9gBpYAAPtpf4BY5hUjneCXxWuLh
 +9rw==
X-Gm-Message-State: ACrzQf0m6/MwclLOBQlGqrr2Q6HpX1qNcPgSZnj0olc/xvaRTKzjQjyM
 MJNj/ZEtjUATqFCAfYirL8J9ziZWEh1/gw==
X-Google-Smtp-Source: AMsMyM4m3u5ysZtqcTYXO6lQAPiHAkBCw1Fas9fSAYZTn+cyr47IOIJVMEaLVnuAGX2lnaUa7Z5Phw==
X-Received: by 2002:a05:6638:2401:b0:363:c40c:af09 with SMTP id
 z1-20020a056638240100b00363c40caf09mr2035026jat.212.1665875146379; 
 Sat, 15 Oct 2022 16:05:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:32 -0600
Message-Id: <20221015230534.4016536-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtvvYb6UxbA8PiHKF4SWpBwL+8Oqneq9zdGti8RJIrc=;
 b=dt/nHEAeZjI/XCx59By2PjB3xoMummsrIcW/qopnOfpUQJILP+aP2dvsm0t7qhZ4Px
 NB8bvfdGxJEbQ/UOOFhB5yiXYHUaLV0Sf2xzP7rUtntjYIl4EIb9ptHuBkLudPSxN4Vw
 99D9qQQGL/4TwxA9xOMfMf+6IMgjoUZBeMKA8otUNdXuX2twd+293QyttrRiZ6gTGLuh
 UJbcCNtgZmppiGt8A9Vl8tj+clEyBqEoDpui1SoPCJK28GxU4BbzjIegII4IhrzXrWKv
 dOTeic3caUcKqyj8XA8ne8mRY+vZYVAZWou1U6Js9BPzyyfvsQrUjQS3I2s2MgyqIICj
 6Ajg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dt/nHEAe
Subject: [Buildroot] [PATCH 10/12] package/gstreamer1-editing-services: bump
 version to 1.20.4
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
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 18dd1a79b3..308596d7cd 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.3.tar.xz.sha256sum
-sha256  5fd896de69fbe24421eb6b0ff8d2f8b4c3cba3f3025ceacd302172f39a8abaa2  gst-editing-services-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.4.tar.xz.sha256sum
+sha256  aa03e983af5d79c1befffe3575b034e60960619a96bf877447cb73c28016fc41  gst-editing-services-1.20.4.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 417aaf2a45..77feb15991 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.3
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.4
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
