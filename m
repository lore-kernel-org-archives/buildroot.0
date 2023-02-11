Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146CFC636D4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6EA41527;
	Sat, 11 Feb 2023 18:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6EA41527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiHh6z08PxDI; Sat, 11 Feb 2023 18:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA444151A;
	Sat, 11 Feb 2023 18:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA444151A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1391BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 537A4403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 537A4403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nmI4dp24GwIB for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:43:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5774E40148
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5774E40148
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:43:50 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h4so223627ile.5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIi9LpQ7Wwg4gp4wDEA+lNsnd3DtkWAtu7iyw/QoI+g=;
 b=HI0+Bgs5T96RKSqP2wpYYcwA+gvDl3kTxiJ4MuxKZCNEOxK7XOUfzql113ECCJ+b6h
 ZJUh1tDF1VXIjXzZhi+53dCA3J7iJfkhiMok5uSaPIacX3TgdRiHsKZxcUtOB8kIPs2+
 s6C/sBYPpFZ2WitxVU6QU2McIySRl34DJjBMDuO+UX8TBdg3nzuroaxBW35C23Eqo/4f
 iuR5pEmurA4nlYRBU38EvYlLZ3tLfl4NuX5V0Zb3a/fzZC4B/6ffuQ/DbMwJ9WEO4cg/
 klIMXuh9Mc2JIwLYeIfqhcXlzmt9Gquat1Q97Y5ISfPXV4xJ9xPr1s6Ag+Jz2mQQmjD1
 +8zg==
X-Gm-Message-State: AO0yUKX7oOq2MkLZpjGYL0O7dDXHO5rDZiZ3Qpqq+LmYxQWGCBUafcAt
 7wwmr8qCKKf+XqEf6cnam2NsNTAEHV0=
X-Google-Smtp-Source: AK7set9Vz7mtOGkd5Wif5aYTWEs7DCc4jqJFGtzS+Hv28TVYjnJ79cNS4Z/yVCecC86dWMhKt07vFA==
X-Received: by 2002:a92:7101:0:b0:314:1aec:c7a9 with SMTP id
 m1-20020a927101000000b003141aecc7a9mr5018957ilc.23.1676141029216; 
 Sat, 11 Feb 2023 10:43:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q22-20020a02a316000000b003c4840bfd6fsm2366401jai.75.2023.02.11.10.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 10:43:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 11:43:46 -0700
Message-Id: <20230211184346.1192333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIi9LpQ7Wwg4gp4wDEA+lNsnd3DtkWAtu7iyw/QoI+g=;
 b=S+xmHq+IMYn/MzknZWbZZGcSIX7vP8RikR6dGEnxDB50PvOZSELBkVvfdip9qp/9i0
 1/QZ0cI/fYxDU3/pPbzng+2UCgrPe2SEtQ16PVDhXn+1XtC+oHAChin4C5gXK2PM1F60
 V7OwQIvHUiwFnZoKV7E/h4EN1FXRg5ZhW0ayRYzrUY15PCbJPrE6Fg1QPjWHZlQd5a2T
 eK6dytv8HYT+OaUkBrIOcKRtVLeiMSEzQZ2qwAN0t7r6AgcJJgOHq5jNfamLn3qwvypv
 q4NsM95SAIIi5dAS+sGUzsAqGUm/kr2shTJHNZ6VnnGsRqWsLgQWuy5YsC5bBKKuzmms
 mmsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S+xmHq+I
Subject: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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

This command relies on the clean/prepare operations being in a
specific order.

Currently the execution ordering of the clean/prepare operations may
change, for example if --shuffle=reversed is set.

To ensure the evaluation order is always correct use double colon
rules to make the evaluation order explicit as per make docs:

The double-colon rules for a target are executed in the order they
appear in the makefile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4880b426b5..09575a5e3c 100644
--- a/Makefile
+++ b/Makefile
@@ -839,7 +839,9 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 .PHONY: legal-info
-legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
+legal-info:: legal-info-clean
+legal-info:: legal-info-prepare
+legal-info:: $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
