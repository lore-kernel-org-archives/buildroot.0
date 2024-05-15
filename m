Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28679C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F43582139;
	Wed, 15 May 2024 21:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlzhDq_9hZ-H; Wed, 15 May 2024 21:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59BD8213B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59BD8213B;
	Wed, 15 May 2024 21:07:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42E5D1BF57F
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 21:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DAAF8213B
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 21:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D922iNgkyV3W for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 21:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 207E482139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 207E482139
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 207E482139
 for <buildroot@buildroot.org>; Wed, 15 May 2024 21:07:37 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so48981e87.0
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807256; x=1716412056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fijYlKYlfWnUFnS/8CAk6LWaDPJk7wGbm4BZWwYD8L4=;
 b=w2QTeuXtcHlxvWn9etDAmjBgxtFtgMNmZnR6qGndz8E6INmpGWJLI/PJerhzZcgSIU
 eZxmRCiB+ouaNkrSvuv9b6mIDnHhOa8Ul3cOusCKrQkpWv+8drq5CKM17aQzqOR5bt2R
 cHA6qbJnNzHfKpyKIL2TofiILTasWYlaM5ufilf6Uuf156o1bO9+6cdEEGD55tHphTn7
 9StwB6T8vcwzhxOX+1vo2JfRRHA7pQqfJVS5PIfe9csNUuBMPEfG4EOj40GsyEio6Xl+
 VswO/ukSTHHHJwzZxLoU1/oSsC9YLJ2S/1T+w7epzLY298oHk/OCFivPzxXufH6zFYqN
 m2mA==
X-Gm-Message-State: AOJu0YwlwwkCSkX8fZ3ocrgqxDmgFT8ibIUG7TsSj3qP3y35kZCtG1rC
 oFVJrelFXnWAWD+CvoVdQqJL0eMMz7zh5RqE+PV4VhJIS2jwBI6eDvySn6p4ZOpyCDbY6SHavmy
 BnDM=
X-Google-Smtp-Source: AGHT+IFBmsgSgiTHIOvGQv1THm3ZVKWjQvXgMpc6TAiPvztXhFd9vXogz83bL1iUXnGEZ7Zf4K+q5g==
X-Received: by 2002:a05:6512:2209:b0:51b:180a:7b7c with SMTP id
 2adb3069b0e04-5220fb76cebmr14057133e87.3.1715807255550; 
 Wed, 15 May 2024 14:07:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01399sm921038466b.172.2024.05.15.14.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 14:07:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 23:07:15 +0200
Message-ID: <20240515210715.643355-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715807256; x=1716412056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fijYlKYlfWnUFnS/8CAk6LWaDPJk7wGbm4BZWwYD8L4=;
 b=gsZ24lMihg7GHcGb6Tkem9fYqiCqQvlFVMvBkKY8Ummzv57ke2IYgzwHDp80Imf7pQ
 uAopQxZKM/n9BS5rFzgFhuxqybZgpQrUrlspPtuvZscj7UK3+e4fiXRgrBDGrNwnVFmB
 zupETvqA2VEQda/xJpIl+F9xHsXU/MN0xaVdE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gsZ24lMi
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.181
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a hot fix for version 1.5.179.

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.181

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index cc78f6785b83..787bf7d48705 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  6742a0c3b1e5b3b892963473f65e2770462f3bf2871424b800ffa0ed159feb84  uuu_source-uuu_1.5.179.tar.gz
+sha256  5e3bab017cf1b7a6a85d0cd46c0de6660de9b93fb24b0a21d8ecc4fb9f663e2c  uuu_source-uuu_1.5.181.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index b633bd70dbea..056b2a8c52db 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.179
+UUU_VERSION = 1.5.181
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
