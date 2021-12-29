Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64526C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D7F40147;
	Wed, 29 Dec 2021 09:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqW2BljMNhxn; Wed, 29 Dec 2021 09:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D43D400C7;
	Wed, 29 Dec 2021 09:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29EAB1BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CE460B60
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHsnh36ln5Xv for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:02:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CB5760AC3
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:02:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o7so23476907ioo.9
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 01:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4quVsqzzSAV4sExF+c0bX/Opt1R1lw7RaHYaBgndy0=;
 b=ULlTPxH4suw8k2KCL9ordjqjkxm8FYN8Kqxf5c4fY4McNdLgW6wNSsleRVaXcMEFz8
 3bI98LBh4pj8eVXcIhN4YC3hFYu46iFutyaS5R5HCKH6F2MqfidrhfRmFcDpdEFmRhKj
 14qBmadcTOx3Ofvb2W7Byg161rmN7UJMvsU/WDO+EuUgaK0ov0enbe1hnB839zdpr2WW
 m59w7tnPANYnwgEYsYe7P0QYLdEu+jchdHme7fabH4NjcYzIct1FmGLDr3nq98skv/Nd
 gvZRO4Qy+2xzM9R506ChlUv1Ztkvr3yq/QEDqGsB6Bljt/2oEFcTtX6C9YpQ0Yr4GCWs
 2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4quVsqzzSAV4sExF+c0bX/Opt1R1lw7RaHYaBgndy0=;
 b=1dOwL+4HF3TF8Ed27XB3kZQbiR25BXhrjgLLqraWFPC+QusgT9YVPPM4ZTRUcCPYzd
 dWJLCVF3OI3qb7eN1XPQMKGpn9uqYhJuAVpO7Dm4P2b9VdLgDdzyfv+ZvM86WTOgrRMx
 s+65Fm+8hnJDAD4D6gyTD4+IdDzay09JzS4kiOhv+7/c36uxCY9MQGmXObE8rsRVoTA7
 YrLBSCofSTp6X+Udx3U4su6PK/MZRaPaY6Y1RU8x9Cuwp4t8iURuUKO6GYp/bonqW3CX
 aq1n9l1mHOWYWdPzojLsVuBU3dPhW6NpKxqFLjqaDEafEgiFtWuXOOF6WWMZFdxIzhKg
 UYMw==
X-Gm-Message-State: AOAM530NOWmpeUSVKBKF6XIr6P3OcPITcd+LJjeQi4BmydJqk/1b4IV/
 DVRrnCdwP/NdG12J3JjIPL/czwdBXjvUYg==
X-Google-Smtp-Source: ABdhPJyA7frzDmM7hgYFB1u17RQOd5Vwlm5feQXgmMUSLTjYr68+t8+U+5kf1Xqp27UPOP+fdarZNA==
X-Received: by 2002:a05:6638:2194:: with SMTP id
 s20mr7813821jaj.129.1640768550517; 
 Wed, 29 Dec 2021 01:02:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id t6sm15104931iov.39.2021.12.29.01.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 01:02:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 02:02:26 -0700
Message-Id: <20211229090226.627743-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional zchunk
 support
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
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is required for delta update handler support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e16060f5cb..065ae772ba 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -172,6 +172,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=n
 endif
 
+ifeq ($(BR2_PACKAGE_ZCHUNK),y)
+SWUPDATE_DEPENDENCIES += zchunk
+SWUPDATE_MAKE_ENV += HAVE_ZCK=y
+else
+SWUPDATE_MAKE_ENV += HAVE_ZCK=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 SWUPDATE_DEPENDENCIES += zeromq
 SWUPDATE_MAKE_ENV += HAVE_LIBZEROMQ=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
