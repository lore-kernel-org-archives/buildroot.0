Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A9DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA70F61108
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA70F61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD6340479;
	Wed,  3 Nov 2021 12:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xo4Aswps8JsF; Wed,  3 Nov 2021 12:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE3940474;
	Wed,  3 Nov 2021 12:34:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6916E1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5919360622
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOJMPkDoqDRp for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 12:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 979076061D
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 12:34:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 17so3610785ljq.0
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6gbvK2jA2vFiLl6HKoxYMooRdvgt26athFB87M047G4=;
 b=WVubgryKzg0zhvnEZmWy0Vr8K81avXLoVDXdYbSAw7DZaNa/hc1dp+GEUZ4WvunlFL
 ZgrLk5C734kucU99IIBFn0fpTWQds1AmuIAyEs+GTJSzLLbpgHcrN171Rs8EthD706S9
 eC82Zjhh+DAX39cptqMI7rnyYnnHVGh/kGip6d9SQD7EmM/vHxWN1tEvtEdfV+g6g42F
 dBkZwJkFowKVN1F6if+pVum6h2Fzdp4bR0X/eeZFgPvtT+AF59b9E/5SuZuIXgQo9nP0
 k4U2D6LzX5Z9uf2F3/GwNMfj0gMJGGFCK+MspRINmNGqygSKh5+MiQoH1V8ZkS2x68vT
 e7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6gbvK2jA2vFiLl6HKoxYMooRdvgt26athFB87M047G4=;
 b=iENY4pZdhidt2MAZKXJrRFB5lYfv0qOOjPBhMh/P8pJxj34em3FLt6tNiBILgkPhlf
 2Mz9rqHodysqhPnJk8wjOfGhY2JNE16bwA4hcSegwt1AfaNHroA7vbEpwmQWxRvDR0xq
 B0NwLhzWD8CROPvO3hp3QdGR04ZdrSGRxGOmGgh17fpN1uRp4o32/boxg88lJs+ukD7/
 VAunRBoPEuduK3HOuhjAjPWJ4J5nqg7Mx2ukV5byxNDUVPVLAH7y2vPf4+WEMQTHXTfz
 QXFYZGtrYbdredPOUy5U5UsZ6GFOWgIfjmxZ3y8/KxXYwAH/JfPjbqBUsS2AW2Lib5Uj
 N74w==
X-Gm-Message-State: AOAM530SnRClk573Vzx+UDDVXoKRC1C5pRW0N7tw2rfPTfOxwQy/vGmm
 jCudm3Z0D121MWgykJ13CM9VkE+R7r0=
X-Google-Smtp-Source: ABdhPJyECmoQlzi7btqgE7srTeVy2gQcCjEaG4mDVAj7fHvAe7unQB5HGw+Mw/Sv1X9COq1GAOMLKw==
X-Received: by 2002:a2e:8015:: with SMTP id j21mr4048370ljg.313.1635942871379; 
 Wed, 03 Nov 2021 05:34:31 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id s11sm181827ljp.60.2021.11.03.05.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:34:31 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 13:34:10 +0100
Message-Id: <20211103123411.3116067-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103123411.3116067-1-troglobit@gmail.com>
References: <20211103123411.3116067-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Joachim Wiberg as
 co-maintainer for mrouted
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

Since I'm the upstream maintainer, it'd be nice to get Cc:ed on any
issues with the package.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65240615b0..4ddd855233 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ F:	board/globalscale/espressobin/
 F:	package/libite/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mrouted/
 F:	package/netcalc/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
