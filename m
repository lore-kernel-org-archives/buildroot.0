Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F441C5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 12:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F2660757;
	Thu, 20 Aug 2026 12:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XibMQzIUNRZV; Thu, 20 Aug 2026 12:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787227385;
	bh=QIEZK5msx7DkfIA89oKGXamWAIUxjtK3Uf1X5dPnrrM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rz4yov0CAON6pgPNhZ8+b//+3PHX4hnFdVo8r8lT93ol2tWfGLDkWG0QnmdEMJBBw
	 l/CnE1gzO235b/1ZyYlqqGPXK6DeZh/wnI3Ai9mtRsCATQOLJBBpSCbQL/TGwmMAMs
	 n7lZG+FE/m46Iujpc+jMW8n4RJejiDOggeMckd9a1JQduufFsxhczNPED4QgNIloND
	 hLH7Yeo/GdhHjCJ7bWQD8aV1QzhEI0jhER0SMjDVhunPkQxsZOO47Uro/DiSiribCZ
	 b62n3yAn/zzd37W1UE0Q/lM2GyFbG1DK4GVffR1Ms3xCsIgvQO3Zypc7RnkTE7q3zK
	 D7chDWP3X3O7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA8760769;
	Thu, 20 Aug 2026 12:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDC6829D
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3DB80CC5
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpCOUd2ldI9d for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 12:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7B8C80CC4
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:03:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6a0de062db5so3872944a12.1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 05:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787227381; x=1787832181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fDpPahW8Bu5cOVgFMz3RvKdrE52WFBE81WH+8AqaSKg=;
 b=JaCpY8rQct9gPyLo+cGnRB+pniVGTeNQ2b2O9uAygjeNbXoBvxgpwuS1yGtYksJJ6I
 r28yI8q6c7OiZJTT1TmfMu+xLPYIBZSaWaQe6mSGR3YqVBSjYTT/30EFCIgJteMyg080
 LoMMIJ+XVWroOi0hioBDbXHvpR2A4PlpPjX6Wl6wbcegaZRPscA64Z+Tu98iaVdUkK96
 ipOPjarB2iI/cFkUTcIZK7dX7qKUT8L8nCtNiYS1XGCaWouQOJQIR1LVtPRLk9mazpL6
 H4I2lR3Pq6pp6Mxy4CDcRh21/X6vJ/4SMTLrZYuTdERxsTG438h2gKr8nbWLDyP0vSS5
 ELyA==
X-Gm-Message-State: AFuF++mr2la6mN3ZKiuAEZiUUd+3S7k6HHZfLP5hu4824gHKvcfen1MC
 NhfUVVkqcWBJxoB0pzzfQpRnJbVD0LQa+/bukDd10o8LPSSIJIZCe3z7n1xigg==
X-Gm-Gg: AR+sD1084UgOCOZ+MH2L/6fCQFN2ghuPG3zL3gYlCzixuPxnna+q4E6HfU1BWLOT5Ua
 PC9zLP9NcEHiLQ0h5cJhEDoT2nMHF7/K6P+lGZuKyEckvoz8JfFjAlfoHpBQLEkHuL2WrsnIzdC
 Wk2Nd0ET0HF27UdhE5ujTcoa+VLDNDE3ieDZZJWnRYnyzCYg4SrnG8Spi4AZg7uO1sWPoeJmXM8
 rcQKSPewobx6ZHP847fXh4AMwC0wAHzs+y0Y0pX3Sb4wt+hZg5RykcKPh4jY7RHRXfFd/8Yw8I7
 E55l39sVMqdiqeePE88QaBNx9FgSxVlrB5Z3b/uOiR+CNLmodmkabhAagf4ZhITFJ2RwQbf+o9Y
 2KAdqq/rXwjTaKloTe58bY9pkxtNOaXmq5WmHm4OES5RjyhLkvJ+QDSrQ2KETkcZGhfntbkyVxv
 krepbX2nHLBnEdJHoYYToeMdAkB9Ak+x53fnw+rAx3JyW5qVcfp3YgeRTKPKYCAPfeNp0B0X7pd
 LVNJjbIKnkB1pmYm2Z0KJy+PIaM9Gqa53qS4FE+Wf1q3cSgEhsOAg==
X-Received: by 2002:a05:6402:5411:b0:6a1:44c8:edc4 with SMTP id
 4fb4d7f45d1cf-6a4032fe283mr8844744a12.12.1787227380956; 
 Thu, 20 Aug 2026 05:03:00 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff0c3491sm2084747a12.10.2026.08.20.05.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 05:02:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:02:53 +0200
Message-Id: <20260820120253.901607-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cannelloni: bump to version 2.1.2
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 625e43d157..6b45d497e4 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
+sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 7978cfccf5..2e6a61545e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 2.0.0
+CANNELLONI_VERSION = 2.1.2
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
