Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B7FC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 08:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F088B42EA8;
	Wed, 24 Jan 2024 08:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F088B42EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiuEv0U0jmw1; Wed, 24 Jan 2024 08:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D3542E9C;
	Wed, 24 Jan 2024 08:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D3542E9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52D801BF339
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC0084EF5
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC0084EF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmHFgTtVe8mB for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 08:39:57 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FDD3844B7
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 08:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FDD3844B7
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so61832025e9.0
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 00:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706085595; x=1706690395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Gte4Ylw4aoE5dbNdPQ/YeSP97qJIcbtomU3bgGwMOk=;
 b=VKQo//5I0PduTfwBm2RlbEIwAf37N1dqCUvfAc2BfmWcvMKhij+PJ6VY3Q1QV0koQu
 e4NyNuDnKpLpA1cjdv3DZqhhN3QkxCGuZL8P1X1PxCiBqL7fY51LbazmnDTpDa1P+N2w
 HZGgOrzYZf1b0ZYkgRmJwOqo1CWX1U0u3QOxZiw0bya9axSlRASDDDABuqbTikCAmZln
 uuMN5BFcDvbAhWYg416xvgslfpadKna0fZBJ620Xw9nmLXgU9jzl8KzYNT4WzFw39q5q
 s+WxViJMbxCkZ/oQOQWxsW8NT85mgomQMe+P+M4oQ0HFZm+inlRFn+GPtYGhoAEUZQHg
 T1eA==
X-Gm-Message-State: AOJu0YzWkCGQ8rnIbrPU9qA0/VPThB9RqBc8fJO0C2mmEbfuFPDDuygy
 auhFioopB6xNztg7VYpsX1YBH4vQyoWhrv245gonfNM/yVi98B0VSehlPTSJ
X-Google-Smtp-Source: AGHT+IEv+C/UpAWwEXuzyZRsIFVaf7ViOB7OjG1aF0EH/Qr85c9w0GEJQqXLqDbQprmAkhJx++D4hw==
X-Received: by 2002:a05:600c:3799:b0:40e:4a78:bc5f with SMTP id
 o25-20020a05600c379900b0040e4a78bc5fmr604025wmr.97.1706085594864; 
 Wed, 24 Jan 2024 00:39:54 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0040e54f15d3dsm48730038wms.31.2024.01.24.00.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 00:39:54 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 09:39:51 +0100
Message-Id: <20240124083951.484031-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706085595; x=1706690395; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Gte4Ylw4aoE5dbNdPQ/YeSP97qJIcbtomU3bgGwMOk=;
 b=Jfn8sYnES3UpvusPQqp0daYqJ+8l9iZPVo1skjxbde3LdFYPuiJtgsUJsErbvlqUit
 1e8xYNigLlfr9rkIRzOZQOGdl/P/kPWSffJTv8N/oc4UjehDaN65cWyVANm7NZV/jovv
 c7MFZJumZ05eKlJv6I7l7p8v+Ut2s9/95BR8zcWnRBQ2xBe6kJ8vajYbmPKWYMiXkQ4a
 JqPbPt670f6HzEDk6ukgme7avFQVbifxkQRzFHk3Ug071AdzW7Py/mdo9OK4Dw/qkIgQ
 ZzQDbwysMv629UuKfNdAejnvyyrY4ulBLIMbYJYH6KJvq8zZ9eZJB2pg2vkjn1b8u1Io
 vt1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jfn8sYnE
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2023.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index f988f9b15..ed10fad96 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa79d77896c312ba23e01074a53ef3d060becae2ed70b066f902f332da65a499  MoarVM-2023.10.tar.gz
+sha256  08095605dd2b6a0ebb01394395a725ae561d655700835fa2eff90122a9b1d22a  MoarVM-2023.12.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index dc833181a..bd1938d88 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2023.10
+MOARVM_VERSION = 2023.12
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
