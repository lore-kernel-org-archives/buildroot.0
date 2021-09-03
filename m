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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885DCC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C6260E77
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25C6260E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044D361542;
	Fri,  3 Sep 2021 16:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIROrgQuu31t; Fri,  3 Sep 2021 16:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABE06070C;
	Fri,  3 Sep 2021 16:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA8B1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A512080DAA
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYGHzV9xYUUn for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33FD380D88
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:39 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id w7so5983491pgk.13
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=op4V2cIud4vxDZYwjxkdI3wWu0mwsvsjQhpYuAKxXAE=;
 b=o07GSj11159R4y41GHo4cjxAsAD5XWpCKg7B/Y0R1jkOTiYt9Hadl4YEx5SSi/ifdG
 /+mEVUQ7f+JkeO5Zpea0ye8J+627GdRkw7INRog8gARASL9dMoPzCm4vAdRQ08q9FxJ2
 ghC0uKym9iVtPE01CSxv71KNxo9v0aZ5oNI0pqWHfQbYWme9CKcpku4s+cW17TkHhd1I
 wx8nyjDyNkbBFXJOOpL54IcP2bYz7LoHWcrYsYFhKl9nMr9R0PlicyijN8S3TElRC1Zl
 U7f9lauqQe7elvrHxmOmc5h3YRnN1rVBJFrwe3xnHFSpZ13+edXl38dTFeTj0X771Ziv
 wFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=op4V2cIud4vxDZYwjxkdI3wWu0mwsvsjQhpYuAKxXAE=;
 b=BRG9tc2lDL9JjB5ZjnGMJxseHkm+v/1irok5nNyjNS/bqHhcEZR69/lAXgUUEZ99cg
 i37hmBCKdYB7av6hbquboyXAwlrvqvZ8DzcG9xZnEhODldXZwAWFZ2ANnLrZsAA87D4N
 T1U/Iuxk9TDpkCACEjGyXzLYt5kU+ihP+uN64BEEoeCCfFy51ClDXpMgNPbIcLNrQih7
 iKW/0JKmDHmKbtH/VReZv3yJSA68Gi4JpxqQUr4JzL7gS7qL19wKz2p6Gk2IsSqIv0rb
 X1u7hv8pxApCAHkseVG2429LC+7NNSU1pH2GTVugy8SJYSO8AX+kovrKjDJnz7FbdhCI
 kOZw==
X-Gm-Message-State: AOAM533YrcfMAba2H9JTeDGB2gffB/ZGQa8LOW5fQuLUPuxiHCLrukpZ
 ShHh/sYZCSQTcVWQvMxEVX7iGj8yDSe73g==
X-Google-Smtp-Source: ABdhPJzQUXLIOnFlwUnmkPayrJDmpIQkRjlD/K/NURGdaaG/3+P/e8qK1Kc6z9EF/IdpkcPopUcOKQ==
X-Received: by 2002:a63:cc01:: with SMTP id x1mr4311100pgf.304.1630686038528; 
 Fri, 03 Sep 2021 09:20:38 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:38 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:24 -0700
Message-Id: <20210903162027.1935040-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 4/7] g-ir-scanner-lddwrapper.in: Fix
 shellcheck warnings, switch to sh
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
 package/gobject-introspection/g-ir-scanner-lddwrapper.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
index c19314566a..2f09bca77a 100644
--- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -1,3 +1,3 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
-${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../../ "$@"
+"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
