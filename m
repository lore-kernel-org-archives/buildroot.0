Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69603C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30ED460F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30ED460F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 076AD426C7;
	Fri,  3 Sep 2021 16:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxBezaEMnAcY; Fri,  3 Sep 2021 16:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609CC426C1;
	Fri,  3 Sep 2021 16:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4651D1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362A480D96
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhyKwQHdUzbO for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAA8E80D88
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:40 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id u6so4690033pfi.0
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vkvo0uHKR3O8C8Y6KX+ZyU7wcwPniSvzSFj8twsBlnQ=;
 b=OWXEkgwMFIj5MBcPi8j2ahf/BIx1mLdWwZQupfjpRVbPH4QqE8yFUOPSfmQhpiw9MB
 acnmgJRww0BlkdGHmKfaDNNTZqQyKE8uypSx6lhwtyz+f7jmbhvEQ+Epgjhj+CTITqHY
 JJB8dXZFNTsclSBStM1P2RIRHN0W2GUJhOvtgK8adM6duDvdpnHPDndCzYmT8G6iESYb
 g9Ec4ZIkeiRwO2Fp9jNyR7Bkps63/9LCCtZEdkAL+6vMQQKHEaZGgDy/0oF10o0sQhbx
 25wd2ucG6fbhFPx+QzK7nM5KdaaG6wkuigrAfWalqQwlVurhJfC/rpds3V/2QUu0j6SV
 cpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vkvo0uHKR3O8C8Y6KX+ZyU7wcwPniSvzSFj8twsBlnQ=;
 b=mojlFcK3VpvhG8LtHDJI4Mu4Mf6xX5XEF8S8LtEKGHYUbApHYkFKnePPRg63m+qu0Y
 EVGg/k72kXHBSLGNoWci/n3ImO91g6A/TNzeE89kVdf6L2mbux+ZpLZCqBL70f3p9Op5
 Z7WG1noDY4XfCFH1s9OaKbcTpaA0nwQmfINGSoPSnwADt2ByWkCzHItbqaoM6faUedaQ
 38ySQz8eVztwveji+PLIvy6VRufBazUOIr3oggjsG9+l5MZj4OcuI7s7x9tZJTjWzzJm
 C+NrjNs0poHCUSiiinv9B768zFMCMS2W5NLibYyRlPOKbepptO5qv2j5sVS6rI8nM38Q
 XArg==
X-Gm-Message-State: AOAM531dbqcAf/lGzuBDBDS4hOgPHy+t3dPZ6Ho/da7+Gu+KSAdWwnRL
 m43UjrL2IzqIa6deX2YZnpHOQgVGe8NAsg==
X-Google-Smtp-Source: ABdhPJy+qNPSQr/T23criTQDYsKC/WpblFzuTcLZ0jV+o9gjHh7yaIJU5oMTS0lJsxgJ5bLBhwqIUw==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr4219758pgj.272.1630686039286; 
 Fri, 03 Sep 2021 09:20:39 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:39 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:25 -0700
Message-Id: <20210903162027.1935040-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 5/7] g-ir-compiler.in: Fix shellcheck
 warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/g-ir-compiler.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
index 3313cc501f..712753023a 100644
--- a/package/gobject-introspection/g-ir-compiler.in
+++ b/package/gobject-introspection/g-ir-compiler.in
@@ -1,3 +1,3 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
-$(dirname $0)/g-ir-scanner-qemuwrapper $(dirname $0)/g-ir-compiler.real "$@"
+"$(dirname "$0")"/g-ir-scanner-qemuwrapper "$(dirname "$0")"/g-ir-compiler.real "$@"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
