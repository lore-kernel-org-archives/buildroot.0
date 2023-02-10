Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B9C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E876101A;
	Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E876101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzd55dy3yAgi; Fri, 10 Feb 2023 22:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFD760C1C;
	Fri, 10 Feb 2023 22:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCFD760C1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6021BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 738A560C1C
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 738A560C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxbegEOL9Ibc for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66348606FF
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66348606FF
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j23so6583613wra.0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sE1SZjAjv0XToUymQqaCNOEBTwAqcyN5ADbKgkvoOwY=;
 b=rPaLQnSeNaywbmHZ2BNaz3DA7IBZeGfI+Hf7JPBNrWHO64ttJXmsOBHEceG3XSRD92
 NU0ibBuRZmHcowRQTUg77EnbzvvVQmjrRPQ9O6fH/ByTga6V8TdS18vpBh7Ta0oTS9+J
 4C2ZXeHb9uP3vivpomSXHmrLKF88cRP0J/lQyEVYWfR3BTrRXb0WYDjUSn8zaROp/fJa
 K53JQjfJVGS5PM9TZS02vX99XJsLvmyzK2BRmpywlS61/EEUOxIh9/X4nDpwJZK16Axt
 MkKZOTJzNaBW42DWiP4SO0eTDiXJdzQUN05uRBtUY/uNxfiA29IjDeL48nmouVFUkp5J
 j97Q==
X-Gm-Message-State: AO0yUKX+KYAEVaehNq+BMItDjHIWLS3KHc2SnvJgFNyDgrC9n4d6DbmV
 GCFfGtwXNmg0IMOydc8T9WMqrtJp2tl3XEI1
X-Google-Smtp-Source: AK7set+1GdmWr8/ZtEQ2ydRYMAJUES6nnt357xvXn4hvwSEYi/NSK8nCVXJvR3aPq3sa9GHQO5L/zQ==
X-Received: by 2002:adf:f78d:0:b0:2bf:ac2c:4489 with SMTP id
 q13-20020adff78d000000b002bfac2c4489mr18678368wrp.54.1676069245626; 
 Fri, 10 Feb 2023 14:47:25 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:08 +0100
Message-Id: <20230210224717.3293906-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sE1SZjAjv0XToUymQqaCNOEBTwAqcyN5ADbKgkvoOwY=;
 b=l4QI2OK7yF/udj4cHEn75GDeeKupL5z3w+TJRYAqXeKcmXHtQve6hvTIR2rDRxcfgh
 n4x8Yp61rm9yIrJLkU9yfih9Q6BonhdkY10HeaHUPvNsYoMO+riG3UxqaxBTEC5UlLXO
 SWfY4ctdqjlUfJMSKPxS6loote/TXiOMoMvr/mEA0nlwmGx6taiw8u4E2otmE+e/7ZV2
 qZPmIpI7DpdhrM8VlSslyEVzLdAppZ7R9VqIpFVQX3NbMp41IBVNAgDL3DTNDdvacwbF
 IyPCFI8f7kUOcvxK/oNoT1FuRuws9MU1M498iBsgaZ1TIcFE2EQle8is7LlVdFjgE7Vz
 vONA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=l4QI2OK7
Subject: [Buildroot] [PATCH v3 01/10] package/llvm-project: new group for
 llvm packages
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make updating easier in the future, group all llvm projects in
one subfolder and define some variables for all of them.

Introduce LLVM_PROJECT_VERSION_MAJOR to be used by the clang package
in a followup change.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: Add LLVM_PROJECT_VERSION_MAJOR
---
 package/llvm-project/llvm-project.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/llvm-project/llvm-project.mk

diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
new file mode 100644
index 0000000000..747a6f5647
--- /dev/null
+++ b/package/llvm-project/llvm-project.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# llvm-project
+#
+################################################################################
+
+LLVM_PROJECT_VERSION_MAJOR = 11
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+
+include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
