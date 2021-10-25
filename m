Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D37AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F4560524
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6F4560524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A825060823;
	Mon, 25 Oct 2021 08:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kX_XdRG8yxMx; Mon, 25 Oct 2021 08:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEA26069B;
	Mon, 25 Oct 2021 08:04:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1F7E1BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B04B66069B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQBV9LrFNClq for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:04:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C46E60649
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:04:50 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r134so14231840iod.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K3fIevPv0ABPWWH0qxbUID3nikwOlym8nZOrDxcc+bY=;
 b=OggfE8b8nG6XcfmFeAvDrdfBbu3lq6qXLs6bVum5sWd36wFZQIAKzQau56AzX5G1Q8
 gKOnA2f6czeyUtCoesfYvSyTD/2s3hBwaV2UJmfDYyKRRzWD0GF1A8vr8j0ZLRFegZa5
 Bdf9khdT1N0o/WisNfdbazxX1tOJ1Ospt14/ei6obt+YxVWSPqFoDLzOep9IvO1JciNj
 PS3yH3Olf4VY8GRHGxz8IqAMp7gLzU/gu5QLraxq+u95oR2uYbBdgLZTRcKqGIxKMRfX
 yTW2HN4I4TgzsJV1QQiyVOXYE82yJet6DEqK8otzMLbqzGpUCtnm6mcQ7aXsVfnb2Pfo
 SodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K3fIevPv0ABPWWH0qxbUID3nikwOlym8nZOrDxcc+bY=;
 b=Iyg7lAaU0kjepZxXXL3WZlml/+Cl7ih/PJjWzFoHkoM1hphHQOtzqkpbq30QpY16t7
 wZhhG3p7TD3O414//W92yLWcY+4yfRzdqaWrN1XzlMiKjR3EGU+byXQLgXr4Hu2wBgAj
 gRccO1K5dpNC90N+Fv7RL2TJMhLuLmUjRGdqm5Gedtmzfqlk8vJXImzCH0H8lPKQXuxi
 3kU/wwZYGiJ99U7AVqnTba4wMSW5yS4E+uG0KoAEvQuaoOSdagxBffuUdg5zzcOIWcyg
 SdfmlGmCNGbUSstO2pLOTx+dm5C5mEwd5RPkZQfIszjXZ8FefU2smfC1Lrf3Sl8nirvg
 Go6w==
X-Gm-Message-State: AOAM530gO2qDmaD0Xngh+lsyX8cQdQWU3BYcnsG8+UHYwWZhV8uUu/dm
 lO0doLAEp9b8Jomor0WckjJzdz164bs=
X-Google-Smtp-Source: ABdhPJxU6jAMJPZC2Q+ANT689Aj1vEZdTfI96dpSRQqz9IfRP91RBUwgjyA2x7hz7CqxcptPXbj7tw==
X-Received: by 2002:a05:6602:2acb:: with SMTP id
 m11mr9023854iov.155.1635149089198; 
 Mon, 25 Oct 2021 01:04:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id y6sm8979959ilu.70.2021.10.25.01.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:04:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 02:04:46 -0600
Message-Id: <20211025080446.3860462-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libpsl: remove docs config option
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option is only available in master and not any release.

Fixes:
output/build/libpsl-0.21.1/meson.build:1:0: ERROR: Unknown options: "docs"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libpsl/libpsl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index 69e5da4ca4..5dc03a7c24 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -10,7 +10,6 @@ LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
-LIBPSL_CONF_OPTS = -Ddocs=false
 
 # The order of checks is the same as done by libpsl when configured.
 ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
