Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C253C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:38:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6E060555
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC6E060555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E56F6082C;
	Mon, 25 Oct 2021 08:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhR9V_q9yhXT; Mon, 25 Oct 2021 08:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F36606EF;
	Mon, 25 Oct 2021 08:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B47151BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A48BA4032E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuXaz_m-2cog for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8B8140322
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:38:21 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h20so5029140ila.4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M94C4yGACxr/KeFfzCEWgs4P7Q1FiSYFeez4aMeo2Ak=;
 b=mA8UmPyVOt0R3BSjAX9n9MkF2YpLpXMwFhX5PzU9IJtBE4AX8aOgPBnTcJClHl0Zj+
 gBdg87UFK539tbQ05BOnetlUGcuVeOgnCv+/vbn5wORE8IDeJJq7Bzk3vY2FLJRQomjE
 K5AsSfuz+bD5XN1GO3jF+iRrv2gORBcRlD2H3zZffmBHgYw5rWpmgIXg4gt6rgNSV4/D
 IdjbMxAedkL/bAXMP9N5MUQSpG4wP+uHsV/t9CGw8VHVGeLQBL6fcrAh0gSx9suOHaSL
 mq4OUmz/w9EYyLrxoAuhgmVRHlO3NqHiE1vrW9CDK8EwS9d/RqcyDHcw+OnIC502MclI
 atTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M94C4yGACxr/KeFfzCEWgs4P7Q1FiSYFeez4aMeo2Ak=;
 b=HUXaFVau5yOUg7PO0HgQgJV6QO2Iu/CD9iUpEdFmabaqg7yFxJN+zcKdS7/vU47YpI
 4x8SW1wzgRZSjJqA9uhNGREXWCQsvT05JiFFdG+KgbjLfWV5rFNuNgDuf/zpMyZifFH+
 O2G8wcrOlIlAJQppZsOmchmuVTsYY5EGTB8GUXMVEUuN0CMsPo9GOtIBqK0fEA4wkkzU
 AldQUOiVnXCtnvu29mxpgNfIax6kCrAe1eAzMni4qoj6bwkYCbXG3WlYM8lKiA9CAY1g
 RFBLRFRd3tXhyH0VZDNPiwHNH69EBpp97+xMc2cA70/33ztcqkqKFYPYYYbigdg7bWJF
 CAng==
X-Gm-Message-State: AOAM531XBjGjaUICvpeyLLDGGGzXZNCrwjyxfdqB94JDkKVUlF3GgstV
 KaGhjZApIqWbR/qrobJZ8AQbG+Q798w=
X-Google-Smtp-Source: ABdhPJz5vcPBu9ab738mDGO+MD79QM50nnOWJsJcSo/VL2h9WKR/at0W2/H61kHbnmbriOLEn5MiAA==
X-Received: by 2002:a05:6e02:1aad:: with SMTP id
 l13mr191327ilv.220.1635151100301; 
 Mon, 25 Oct 2021 01:38:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id l3sm2376415ilv.46.2021.10.25.01.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:38:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 02:38:17 -0600
Message-Id: <20211025083817.4045062-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pango: fix fontconfig meson option
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

Fixes:
output/build/pango-1.48.10/meson.build:1:0: ERROR: Unknown options: "use_fontconfig"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pango/pango.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 104551a1fa..7d3d6626d9 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -13,8 +13,8 @@ PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 PANGO_CPE_ID_VENDOR = pango
 
-PANGO_CONF_OPTS = -Duse_fontconfig=true
-HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
+PANGO_CONF_OPTS = -Dfontconfig=enabled
+HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
 
 PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
