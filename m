Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53DC43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1239284086;
	Sun, 10 Jul 2022 19:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1239284086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZ9TMjQHtTZH; Sun, 10 Jul 2022 19:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AA684082;
	Sun, 10 Jul 2022 19:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12AA684082
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20BA51BF5DA
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E4B740B61
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20tnbkz1hmCt for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 10:03:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08585404CF
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:03:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w4so2184920wrg.12
 for <buildroot@buildroot.org>; Wed, 11 May 2022 03:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eT4bg77nuWh1nYu0qCxJFhSYPOXsASHIeBQtMTVILRo=;
 b=zXkZ/eExDLPCuB4R8A2iZzivi/fp4Xk9rcehL2QqdLWGYBkxEb5tFrxPY4EUAuqiEz
 KuA3EC/0718bfwHMZZ7sH0ekRDH7+il0OVnUX96+ZVbw7VKW2UocmZIPN4+WnRSzumta
 f5vnpWja3KbhYdvK0zK6WLiGnaSE6xWuTKOSCd98tUN7yfXmvOVAEvmJh4Kn1QwXC3TS
 8LtzjE3OrHVNcnU46Jt6mNVNUDcvl4+sYEKN4twqXbJx3Lk1hraLeKibZBnmU79S4Hmb
 vTyDxtUsrkHHEGY8+a6O9x9mJ675JTbq1xtqcBVG/E+1oepz2RY4GfrGtIVAg32SnWiJ
 zjJg==
X-Gm-Message-State: AOAM530CnrejuLmznf+9DGStK9NoElzQFiUGb4wg/m7E0TCHKfYTWg/x
 fuHBLCivkNsUobqxpsVwbhvaBFIVBfU=
X-Google-Smtp-Source: ABdhPJwaNCB4AY9OpO5TRZvbNQCODyvo0AHb+NTLmDNYQ8evVztOdUNx1ZjwOAbP8JMLHxjtBwcjWw==
X-Received: by 2002:a5d:4806:0:b0:20a:da03:711b with SMTP id
 l6-20020a5d4806000000b0020ada03711bmr21563580wrq.395.1652263422692; 
 Wed, 11 May 2022 03:03:42 -0700 (PDT)
Received: from git-linux.eu-west-2.compute.internal
 (ows-5-104-102-157.eu-west-2.compute.outscale.com. [5.104.102.157])
 by smtp.gmail.com with ESMTPSA id
 az31-20020a05600c601f00b003942a244ee0sm1583082wmb.37.2022.05.11.03.03.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 May 2022 03:03:41 -0700 (PDT)
From: Remi Jouannet <remijouannet@gmail.com>
X-Google-Original-From: Remi Jouannet <remi.jouannet@outscale.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 10:03:23 +0000
Message-Id: <1652263403-9321-1-git-send-email-remi.jouannet@outscale.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 10 Jul 2022 19:35:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eT4bg77nuWh1nYu0qCxJFhSYPOXsASHIeBQtMTVILRo=;
 b=d9sQdmVI9THUUaCxBjEx4aFOeRV9hRuMyFsbXaW79Hwf7cp9yf7OcnAfVJPSI3Q4cK
 VeWZJTXKxC6L8rNi+BA0R93mxx/ymWMR+stUah7ZabnPNjblB0PMyTrHK4ZFsNDVrvfx
 /xQz7CPfgLiXyF06hPqcd5ay7YI6Oj0Dq1z2DXxcQG1WG7VajJAbU0jPpSrdcx2nj/9i
 C3roHNDuaz4SQNY3gOnFRBk5jsn/vu4frZabJjdQDaC3DfaIuBxqzdIItYc6I5AKWivE
 BQGKwAicZiJXnPZmbs9Z9WZM4D7PIk9YvwVvnCVmQVauhT75hXoZpkrBjQqk7BVDNOyN
 IMUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc
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
Cc: Remi Jouannet <remi.jouannet@outscale.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 udhcpc default script can handle staticroutes but it missing from ifupdown
 options

Signed-off-by: Remi Jouannet <remi.jouannet@outscale.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 52cb8ff..a614662 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search -O staticroutes"
 
 #
 # Print Utilities
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
