Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA44C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4595881396;
	Tue,  8 Feb 2022 19:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTiiheN9TOWe; Tue,  8 Feb 2022 19:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F85A81303;
	Tue,  8 Feb 2022 19:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4D191BF5AE
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3318410D0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8rlldvDSP2C for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 19:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 940BA410C1
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 19:21:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f17so204749wrx.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 11:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNgYs/Ib77AuVwZZ+6CwGF5bnCSrmW2J+NHtKdZpAQ4=;
 b=gS2HE4OKS1/xqVYQXb70+U+sTxfzYs9vtbDR7SS9FEHbfLSYkV01uEJiKouZYzO6ED
 Rq8JoZgbMWow4Qni8pxeHOONPzUBStluwJhp/5I2eUFIAuTqsMGJeVqQNhaKpOrpA1xk
 wyPwAkeWnqr00+xMmmRLIGv4amKy3XCkwE9R4yRmbQfFUGRD8U8GLi6hP8t4tPqcY0re
 5dzCKtb9rLiiAAAz5N7yrF1PkSub6goaTojDLUo+UmoCHM3wQmyS7zW0MJFTBRJnjMuD
 0AsRZyu2805BZWB5942UNYge8BikVDsa1uXAjPB0nhWuuzIpt4VPETinmbqzAM5RUhH6
 XCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNgYs/Ib77AuVwZZ+6CwGF5bnCSrmW2J+NHtKdZpAQ4=;
 b=GXl1Sr7xygz/Wzr/wg4DQY5PtMWdunydAG2zsxhEfI6EuqgzY8WFZxfCr0DL+pLK72
 ZS0N4yF7EkECVXdP8IkLTcc5bPfWR090kPuIk+bPC5uY5oix9ybIGBepOdsWOTqzGZN0
 SpXJyJ2Jo4oYzaxiygLccHZ5iLC543Kva386Y6UOOlPcHdCU5ST9Rx+BM4jevthuWWku
 BXNyfmP9S5BgIbYXuHbzpOtHoqRv6i0Jujyn660V9hAQbXtQYtnICAy/q5ow4oqUKwFs
 6Fe1zZVZgH19qyzrqZR+dUt14V78jho7qN44xN9SrJZqiPf2v8W+vJiuyFOcrEVQyWcK
 +mEw==
X-Gm-Message-State: AOAM530P6jR9YFxWEnX0CgBQuwLwK64toxv1jpWrdxMY9bfyGSEwnHf8
 gYeSM7qf/mN96+ESjWUiEha8DtxWqg4=
X-Google-Smtp-Source: ABdhPJw/LuRJYr63mjoRCCkwfqBnka4ANfhCTrPCVRSH7qqIsbUpv7IUMaQIpwqP302WmH0CE45ZfQ==
X-Received: by 2002:a05:6000:1e1b:: with SMTP id
 bj27mr4546781wrb.506.1644348086419; 
 Tue, 08 Feb 2022 11:21:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l20sm3030074wmq.22.2022.02.08.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:21:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 20:21:57 +0100
Message-Id: <20220208192157.4058193-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208192157.4058193-1-fontaine.fabrice@gmail.com>
References: <20220208192157.4058193-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/keepalived: fix build with gcc < 4.9
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable track-process to avoid the following build failure with
gcc < 4.9 raised since bump to version 2.2.7 in commit
79f631000fe6846e72f44810452bb764c228ad44 as suggested by upstream in
https://github.com/acassen/keepalived/issues/2094:

In file included from ../../lib/rbtree.h:24:0,
                 from ../../lib/rbtree_ka.h:26,
                 from ../../lib/scheduler.h:40,
                 from ../../lib/notify.h:31,
                 from ../../keepalived/include/vrrp.h:41,
                 from ../../keepalived/include/track_process.h:31,
                 from track_process.c:50:
../../lib/rbtree_types.h:31:25: error: initializer element is not constant
 #define RB_ROOT (struct rb_root) { NULL, }
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/2132570fb0407abc0e70146d771471e13ef10237

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index c7e8c3e2ec..5d6cf174e3 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -56,4 +56,8 @@ else
 KEEPALIVED_CONF_OPTS += --disable-nftables
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
+KEEPALIVED_CONF_OPTS += --disable-track-process
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
