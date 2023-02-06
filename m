Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB11DC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E79640364;
	Mon,  6 Feb 2023 10:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E79640364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6adu_TbYete; Mon,  6 Feb 2023 10:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98F9540360;
	Mon,  6 Feb 2023 10:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F9540360
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE9D71BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F504031D
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F504031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A08hXBYl7Liu for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:46:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E618340328
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E618340328
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:46:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso10415407wmp.3
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9DqLNUGWIVg2FvdhNLY0UG63Oo9HZgp2qq3ZOGtjWE=;
 b=qxtqQkVdpX003ARlXZAPX8OEygy9cXvSWcRRmN+LwmkyfnW5XDmT4sKmTzTZfVYYZv
 sPoctRMoRkK2Bg0zbaO+DMPx8gjwJAg0T5TllXYkKbtxosZE6vwlDTej8BJevbMg7A3h
 f0sOQ2xTOiWuDuPE8WU34owQLil79Lo8Siu9BLc/bqE0oGOr7uYmaefGujMwshnJRtVt
 j7EzIlATIN5ns+9YnitvM+gO2M147goszHEjKMVctUdredHjSCYo5zuNCGeBFnLkexs5
 8/TOylU4kkkLZExG1Cx7XXptAu9hlRWjFB0/0Dyg6/tlquQykOvwg1zrFQFRigY1lSyz
 QFvQ==
X-Gm-Message-State: AO0yUKVmC6izHISASFtDSjoxUA65oeQOJkm7JLyeXiXtIqbkl/fljLp3
 eKtff9OczA1nvXJG2uqiuouJdgcukj2+zmufs6Zyug==
X-Google-Smtp-Source: AK7set9E/LzGiT1mj4jutsczXSpQ7G0Du1lWVtDqbBVv8gFdNC8bSykPOqTrebd3W1ovVlWHTCFxEg==
X-Received: by 2002:a05:600c:1d05:b0:3df:f85a:472f with SMTP id
 l5-20020a05600c1d0500b003dff85a472fmr6459334wms.13.1675680361795; 
 Mon, 06 Feb 2023 02:46:01 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc851000000b003dc530186e1sm15759709wml.45.2023.02.06.02.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:46:01 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 11:45:59 +0100
Message-Id: <20230206104559.86803-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u9DqLNUGWIVg2FvdhNLY0UG63Oo9HZgp2qq3ZOGtjWE=;
 b=VRNoW7gg17C3nqKsbtTAQmiTYzZzr5RSPrWAYH111yxcXswvMzgbe+5RbTrXofZ+Aq
 uQbpmfuGLIVtfhHNPL7VIUr1i3lnDbIUD3Kiygup0RDYKrHMITcRTzyltLazXNJE9hlZ
 H8iUS4v0d1AIenJ4o/QQ9mdXlwS21W8lLojkE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VRNoW7gg
Subject: [Buildroot] [PATCH] docs/website: better recent commits/discussions
 output
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
Cc: thomas.petazzoni@bootlin.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing the "[Buildroot]" and the "Re:" from messages title to have a
cleaner look on the "news" boxes.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/website/js/buildroot.js | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 288e3e745c..b2975fb609 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -19,6 +19,8 @@ function display_activity(result, activity) {
         let link = document.createElement("a");
         let d = new Date(entry.updated);
         let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
+        data = data.replace("Re: ","");
+        data = data.replace("[Buildroot] ","");
         let text = document.createTextNode(data);
         link.appendChild(text);
         link.title = entry.title;
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
