Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F51C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:21:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F106A61131
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F106A61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCB282FE4;
	Wed,  8 Sep 2021 08:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wUGqvh3VX9s; Wed,  8 Sep 2021 08:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DADC82FCE;
	Wed,  8 Sep 2021 08:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35F6D1BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25B4182FCE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GxqJUJv_3wj for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A63782F87
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:21:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso854702wmc.1
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiICXERN+ZWK6dOmArYNGKYbvLL9+3sx0NmEOkTHLDs=;
 b=hhAzWk+V/vHjXnvFDx13A9IB1/O5nmUoT2gLTW5a6c1s+gxoEpK5BODYVKipeICP0r
 Jqrrv9CS389QdbdSsFzz7OQdfZD2CUJxT3Y8m6rST1ch850tbdj+EGdy7XQjLqFCEDig
 6jBrZUhBRNlujSI8+UZU+ZJGPtvJ7VNmJGnH9pTrdlRCjK0Fk/hn+ZcydLMt1qrCR60+
 bWMEkc/Vu3r6TQSUkZpTUSgEZ7RbTCWZ6nqWPxRAtqNRgwCguvf/i4Pw0Duj6MQre3m0
 /DdmaXYZkJV0cOeCww5hqXbOdJw9Bi6hZwl1wUeWm4OlmxkfULL4yEQdzG9JFHNiS41c
 3mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiICXERN+ZWK6dOmArYNGKYbvLL9+3sx0NmEOkTHLDs=;
 b=X2n1mx7Ygkm4ypzy4dZAi4KaFKbET46hCD5kHBQf15iCunzjloXl1pHW+YD2G7LAdo
 SRyCN9rU/zsye952lIIpYq3MVDs/6qG+UEj/xv8pcIOrIE5OXuLsd1sbDvQS5m4qCKb0
 12PtFPvkm+asVriZQN3eBv2vifo5HeOY+75nhSPlM3X+v99g/NVb+ve8bvShmSuefIL1
 tu6sqPwXtE+q98Y9jWLGPOcO7TPJQKMt0o2HzeUw4RcT+gQlB/odEln1QREOwFdVF7sH
 TvU8tnoDcJpVlvzvGzyf2BnA7y2j3Q+q8qUvSsloKzRSdZd0EKUhAy+RZ5W/3VZPpQvu
 yJaw==
X-Gm-Message-State: AOAM531RJJRxcDAARkDZmg0SAfEUgIooWQqBtvaEF7cQMfqqp4MYaYIH
 FF5Wo7T7+tyLf4cjNbDt0ICBaxF4hObrHQ==
X-Google-Smtp-Source: ABdhPJzdlz4N5lBtSjDMXG9zEMH//abjUwc6f3hBynbEqSgw/njYyIc+FjigbRdI0ZT9/lW67PcAnQ==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr2312748wmk.162.1631089278521; 
 Wed, 08 Sep 2021 01:21:18 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id d129sm531776wmd.23.2021.09.08.01.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:21:18 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:21:10 +0300
Message-Id: <20210908082110.694376-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908082110.694376-1-asafka7@gmail.com>
References: <20210908082110.694376-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uftrace: bump to version 0.10
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/uftrace/uftrace.hash | 2 +-
 package/uftrace/uftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index fb1e116be6..43831d72a7 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	418d30c959d3b6d0dcafd55e588a5d414a9984b30f2522a5af004a268824a5a2  uftrace-0.9.4.tar.gz
+sha256	b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index 7c9b9b1992..b487b30695 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.9.4
+UFTRACE_VERSION = 0.10
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
