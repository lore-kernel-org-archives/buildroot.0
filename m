Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C63E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 05:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30CF2600B6;
	Mon,  6 Jan 2025 05:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yxx3tfSkOHDT; Mon,  6 Jan 2025 05:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 324CD605A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 324CD605A0;
	Mon,  6 Jan 2025 05:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF1B6B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 05:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B81DB40132
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 05:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owTFxHR61e5p for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 05:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D56F0400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D56F0400CE
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D56F0400CE
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 05:52:32 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so20470298a91.3
 for <buildroot@buildroot.org>; Sun, 05 Jan 2025 21:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736142752; x=1736747552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aKgMt70P5Tzsx9BDZOYnHyKalvvNE0zWieNJ1gDNK8=;
 b=E2hzEraZ11Y1zAxPQ65oGC/RbXbObXsQ6CjrzML/YXOHzSX1RR7v9vkVwBkkR5Qz6N
 se+OLpM1ORCZfggYtEWGrc/phBIcGQ9G8wOnlO2OX+KFFTDfRvBRpq2mRd0FANc+tNr5
 MJX52u2wxYiX7X0nN3QY6r3WiomZ05fU/X7rH7L7P5YepqERAN1jyxD04S+6AOSj5tpl
 W+Qv2tr6todPZDOt3YcurSj2QGpme52Pi3YMsgLKuP2CBBAWD793y0lQ8g1N9XJSMF6R
 njE+5E1XpeECyv76wO76nBeajmLQg9tiGMovzd9xfxCJDK45xJETk++6zPTLp42ECxXL
 gE9Q==
X-Gm-Message-State: AOJu0Yw7a+8/J9fwn2o+LMRNozorVxk+dDrWkRSr9HMT2Q/ssWrwKlkA
 6XxFSI5LhcxKEPnCeG5BtvzZhuxiWjTCm0E821+c9uKtFV06uWUzZK8+og==
X-Gm-Gg: ASbGnctoVK1GMxVl6oKot+dl4D9elnFaJFiRTpDXmgY0hezH/kbnJhofEIoiUePIykJ
 29IPP0HRrJVa+nksvM84FhZfFVXRqOLJR4dio6PfDtzR+V6m44xGoQ9UB0UqsM4n/TahSrrFO+o
 wyHHJjOL2Ym3b+3SGPE3v3+eg9p5MMforl0tJh+mEEHCZMrt5j+Wh/TdprwtaydJpmTaM7wOofh
 QyOmDAoDlJsAp/6eTuGSYwOXJ0/PS0fgCjsytjkfnjhAiqi/xgvCwXNm4YI76syxYi8e7EBiHEh
 jeFomrdgZTW9PFlICgomMlguNipgk3XpTrgCupn5
X-Google-Smtp-Source: AGHT+IGLXvxFCez4Bd/kLfV+yk0UQCiioRwgLKqdrV5rU3SIVRA/zPVwQ1NDJmrXM9RpC3nFhdBpZA==
X-Received: by 2002:a05:6a00:430d:b0:725:df1a:27c with SMTP id
 d2e1a72fcca58-72abde0d185mr75770157b3a.14.1736142751778; 
 Sun, 05 Jan 2025 21:52:31 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8dbad9sm31575368b3a.103.2025.01.05.21.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 21:52:31 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  5 Jan 2025 21:52:27 -0800
Message-Id: <20250106055227.157140-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736142752; x=1736747552; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+aKgMt70P5Tzsx9BDZOYnHyKalvvNE0zWieNJ1gDNK8=;
 b=LSJaCq4UTTFDAtrcOPrGUL2XF+uN+7I8tI/RyWu6Qi8Cos+TBt6RaHsl0K3mr/oVX1
 qU9egVa6+N00/2Vi2Yfeb0d3+X1znSbxRjdecqTOBBre/Jx7nvMcU9YNPq02jDFiNkwx
 mqay9a1/bCDVP1CMNIIh8NXspbz5/S+FD/Mq5BjJ7ZKuY0Xz3AkXKaZuwDWP+pAxFE/Y
 OoSoMjxEg5chxctmRp4EsIBtHlBzhHQMvK/gqNOXN0vwzKddtqVoGhQuAlQyzalmyldD
 jKyAhM3yckzxltL5241kXyD8nfHk3lCA/ApnSChaXGVAsiQ4Ns07J749roUwTbxJYT2C
 OiOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LSJaCq4U
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/pikvm/ustreamer/compare/v6.16...v6.21

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 7a03b21b86..cafdeadc87 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88ac5e99c56729fecba2cf7f63b690a126dcaef420e2cce9c25c66c55c097f64  ustreamer-6.16.tar.gz
+sha256  405c8bef000525153e6b0afc8a23fe03ca0efb444a87a6c6262e3da06bc0b5af  ustreamer-6.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 2944827083..9226f4a2be 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.16
+USTREAMER_VERSION = 6.21
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
