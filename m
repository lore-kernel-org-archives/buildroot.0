Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA54C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF30611EE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FF30611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12237606DB;
	Sat, 13 Nov 2021 15:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZzkcS5C7rsZ; Sat, 13 Nov 2021 15:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D946067B;
	Sat, 13 Nov 2021 15:32:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 653F81BF306
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5488481068
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-tbAtC-7c0X for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 15:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1E8280F41
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 15:31:41 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z8so24757646ljz.9
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 07:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZMuwLvVb0vxJ+1vgNsZe9yXxfGdK13NpTe73iJtTvw=;
 b=L6syBBEu0baAXAz8rVO912gn0E7wlE5ntbSto9EWFVQDuR2rLfFC8Ie9ny5cQ2l5sR
 F+UQZR5yZYI7ExTbUpYI4M0UfmAUEu79ZvKyjHgpuV5Vz3wP6ztWXabzLf9B+RXfpV+P
 lhotKkqBDrorKkPZ85/Hm+aK0C4G7jIGDNZ3qLg5Z4swplFr6m6Sb1rw2wZJZUW9p63w
 /WBskT5pnHCTyjEIhmim1ReVwBFTsLdlEwFFGrXtUBRvJwT2dFnHjeo48XUOtstes+3N
 RQm9qxXzOxbCry/wasj31IVmU5fHmdb49p3sZeNNPHn4pnO+9U5UPnaml0+83QOFPxYw
 tmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZMuwLvVb0vxJ+1vgNsZe9yXxfGdK13NpTe73iJtTvw=;
 b=OB2ctHjmliQRUs2MIgffybvLkqJC6S2JG9mUfJ57/kYsE9OUzd5Pkb/LLZ72CtIjQM
 3bfPFdQrnDIoZd4HfLKkcCKFgDjdGXFwRU1zxj8KBwJgwCYMGdjDZ2BPMGiCYCgnDaJ2
 myjnLX4sHFD+KtkF+ba+mnQHMxCfRQkoZGNXPeWbAB9c0r51Pw+YIgcG+boxMuXU0ydG
 wS0rhTQBo5jelM2+f6garw6z0BC9UcQxCKqF8CBIbYVZOQo/ssYeYwcTn8kGMTYrkfXz
 qWieTH2K7w65d1ZgFoV8kfpB/4G7CF2fyzimsqdqOvrqLchl1Tun0BDsiJ/C+txPYrBx
 rLsw==
X-Gm-Message-State: AOAM531WP1HSAMJSoYsBrFMev+4p0luKysG6L/LPMSpLdzRzcgfUhltd
 0LMhdWA3bZYNdVbZAixkjfI5sIiiDBI=
X-Google-Smtp-Source: ABdhPJxtDNdW1QtVRHPlrE1Cw8MCwP+mrfrkmcqAdO/7DbQbgcYxF/pOv0c/uqxf4u4iNB5V8uLQIQ==
X-Received: by 2002:a2e:834b:: with SMTP id l11mr23027498ljh.339.1636817499563; 
 Sat, 13 Nov 2021 07:31:39 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id i12sm891723lfb.234.2021.11.13.07.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 07:31:39 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 16:31:22 +0100
Message-Id: <20211113153122.1745140-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211113153122.1745140-1-troglobit@gmail.com>
References: <20211113153122.1745140-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Joachim Wiberg as
 co-maintainer of SMCRoute
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add myself as co-maintainer of SMCRoute in Buildroot, handy since I'm
the upstream maintainer anyway.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70262eac8c..b190c0f356 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1349,6 +1349,7 @@ F:	package/libuev/
 F:	package/mg/
 F:	package/mrouted/
 F:	package/netcalc/
+F:	package/smcroute/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/watchdogd/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
