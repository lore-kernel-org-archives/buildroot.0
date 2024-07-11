Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C4C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2A8402E7;
	Thu, 11 Jul 2024 17:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMTlGmpGCUuY; Thu, 11 Jul 2024 17:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB17540543
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB17540543;
	Thu, 11 Jul 2024 17:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 339261BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F71241583
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGamm5CU_k_F for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E29CB414C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29CB414C9
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E29CB414C9
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:51:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so2008273a12.3
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720720287; x=1721325087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fkhaHHHSKOvxsgIzQCylCcdVyUAxgRAlK0/qzxyfTAw=;
 b=cb9R2xbhMMjMNGa+8exHrkAIzDrUE/xHSdw35VbC5jpGijn1XCbts5nIl/3bsB0P31
 qvshtDW9id2iPKLrJI9TO8qKSGwNE0DB8b9ew5eaDDf6m7etn8c06kmGzmkZFJqZ3bVc
 FjjK4AtahJC5AG95sGA7zotmFKhkZcbZiBYOBfMM4UdVHvZfGkp8uf1F8uOa06yA5RDK
 JO6et7GvHwLoImT9i6sYB4O80AJdg8tq3Iq2kOXV9xLpnYNVINMFwObmpLh+zKrJ6dx8
 7v+MVD4DYx5CBjjVsnm47sxgBKGkNrlrfQMqNgF/R5tFSrapcZkhtzSbtaRis0XIuXc6
 n7gQ==
X-Gm-Message-State: AOJu0YwlkKQ2Eo0rVaVRr5uWMq6se/32bg8AzsZHMZhZ9BSx2ZGCM45m
 1iGd2Td3vknUyGrHanIJPdjr+T/EGZ2EKQgngcJubG+ivnCTlPF5JVfBkV+NxWQmWerm6EO54ED
 dRSM=
X-Google-Smtp-Source: AGHT+IE9di2eHBkyMHfFxqzANDzwFSQ6rMMrAM/0coARriuByxl+21mnCY8H8i550uoIHcJBkKDU7A==
X-Received: by 2002:a17:906:1782:b0:a77:f2c5:84c4 with SMTP id
 a640c23a62f3a-a780b68a1d4mr600659466b.12.1720720286720; 
 Thu, 11 Jul 2024 10:51:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e0633sm269905066b.81.2024.07.11.10.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 10:51:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 19:51:04 +0200
Message-ID: <20240711175104.2989194-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711175104.2989194-1-dario.binacchi@amarulasolutions.com>
References: <20240711175104.2989194-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720720287; x=1721325087;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkhaHHHSKOvxsgIzQCylCcdVyUAxgRAlK0/qzxyfTAw=;
 b=Xn06R9g74kAaZ8XIz0FStRlmxDs/t9s+zAgTRlvEWAmKIABK1PrgwyNEQPvGWQIvuU
 Sn9R97dODXcUMkS9LmSfX8pabGENzgMrrqgyeNepBa9y/tMy4mn2N0EM0xyqyfyaHSbV
 zIg6tnKjc+ig/BeeKISzxNuhWkjhN5bPMlTqY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Xn06R9g7
Subject: [Buildroot] [PATCH v2 2/2] package/snappy: bump to version 1.2.1
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
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/google/snappy/releases/tag/1.2.1
https://github.com/google/snappy/releases/tag/1.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Swap position with the other patch. So first apply the fixing
   compilation error patch and then bump to version 1.2.1.

 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 729d696d7e62..0439ca8a7ef2 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90  snappy-1.1.10.tar.gz
+sha256  736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86  snappy-1.2.1.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index c96dff35fa01..21c76cd50da2 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.10
+SNAPPY_VERSION = 1.2.1
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
