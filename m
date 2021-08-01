Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85684C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B7860F39
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26B7860F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA651400BD;
	Sun,  1 Aug 2021 22:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqw204_xeGuR; Sun,  1 Aug 2021 22:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0046F400CF;
	Sun,  1 Aug 2021 22:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B154C1BF36B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FA73838AF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBScdZ_Wf-Nj for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:00:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4F5383837
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:00:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j2so19068296wrx.9
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDlLkvre1xETpQudaEJMV8Y6PZD5q06BJ2vBe7vlcSM=;
 b=m4EZEM/O5y+ZJsw2s5yXcTSP99gTPEsBLyC9m0Ii0mndXOR9hpPV8LO2RcLXgZVch2
 HxE0gA5qlxuGtPm95RWQzTKTQSVJPy3eeeq2zE3H8CCklbvB8Ik5U2FqT0CIyfBZQKi3
 n/03Eto5hCZTliDgafLbVFGKcNHHiXmODc4HIbuxA/T89KKqSfhmOZzOf3RFoc1WSIvA
 a0nLtHiM8g/Fe+PKZ1HLXy3KdUcb4oFNU1myLFdSUm91D34/C5thl13uSAyUB9fqRIT9
 3kUeTHrlH4md9Y7SoswlgWgroT/Y1sRwnfkvqa54qv7Gckb25w24ziV3E9xEYETYKkcE
 KC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDlLkvre1xETpQudaEJMV8Y6PZD5q06BJ2vBe7vlcSM=;
 b=dHIo3iyVsZS0Fw9iGy0XqWXoUs6tBVzFMEvVubGHg4Eo38WGMM84s+m85MDmhmgTfU
 FnE0PcxzgUdZwwwV2fQlF1m8wZfwTjvmWofJL//bRJjE6Z7i6+AhInTzVzfePouU5YIe
 H14rgUVNZLRpUF4Mv/f8EmN2tdM5KhhAXOJSqmewW0MtXQc+2Ot1NF9rxeXfv5ijLary
 FA0gQX38hUwb+hAVOEgcVn+X0bTZfTRjvGvIgrff/0sFz864OrzJYcL4N/auVGHdIW+r
 4Fpr6B4OP6Q698wLEVfrZYvJZcCP9wJuD+BWiDYPIebQK5cjX8PURHiY3axMbyYVenXE
 15dg==
X-Gm-Message-State: AOAM532+ySVde+Dd0zeT0DNJ6XjuXBbFJ4p+WES8JzxIwBkic+iqth9K
 HPTd6n2iXysecgBJScPMs+eAQIdvyMe3tA==
X-Google-Smtp-Source: ABdhPJyIFxW4qHuEEw1SpUpdYSjs2lZC+VJMuU/M4PBDSJ9FA2Z5vYs4LNana8K5TH6JRqHxjUnKDg==
X-Received: by 2002:adf:e652:: with SMTP id b18mr14584934wrn.349.1627855232512; 
 Sun, 01 Aug 2021 15:00:32 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id w13sm8981873wrq.91.2021.08.01.15.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:00:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:00:24 +0200
Message-Id: <20210801220024.806915-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libjson: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from _internal/Source/JSONDefs.h:12,
                 from _internal/Source/JSONDebug.h:4,
                 from _internal/Source/JSONNode.h:4,
                 from _internal/Source/JSONNode.cpp:1:
_internal/Source/JSONDefs/GNU_C.h:58:28: error: ISO C++17 does not allow dynamic exception specifications
   58 |     #define json_throws(x) throw(x)
      |                            ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1e66dff705bbb38e7e0f0e5864ce794b4345dcc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjson/libjson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index d04ddc40f3..73268c9ccf 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -11,7 +11,7 @@ LIBJSON_INSTALL_STAGING = YES
 LIBJSON_LICENSE = BSD-2-Clause
 LIBJSON_LICENSE_FILES = License.txt
 
-LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
+LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG -std=c++11
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBJSON_MAKE_OPTS += SHARED=0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
