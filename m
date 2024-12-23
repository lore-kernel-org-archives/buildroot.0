Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB04E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C5678125E;
	Mon, 23 Dec 2024 16:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k22M_Bh7XTwq; Mon, 23 Dec 2024 16:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 544B781341
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 544B781341;
	Mon, 23 Dec 2024 16:03:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45570D3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24EFB40134
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcWc8JvCsgXf for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 080E340120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080E340120
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 080E340120
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:03:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844ee166150so156654939f.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734969813; x=1735574613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gskfIA9XVFbP6jGBQ7lAArO+AdvZc9VHZ8hAm4ZQX04=;
 b=LEkQUuPQCQtY9oWw2YYUi1SdmlJ6vmRDeRtPclBYkXqT49DIdXfD9IZZFraN99a3hS
 +3jxBkdbhUUs0yL1sF5xImB1nlNVR+g3eftSv8CSkx7Nz6lyI6FUJKwvfV9EgDrFfvWZ
 l2me3p5hv3NjPHyHgAbpg+uOYHaGSHheFqek+W7ILw7LxiWA8fnJ34Pt1brZr7BJAgVe
 +1zSCW+qUh/Y0nCMooaipV7KWmzj8xHVX0F1rOJryAvmu3XP7ovHmj9nD3XJKAlQ7yZD
 jMQhKSPlRN7m/vORSGNi5Bm1AEgjS03XPg4I7MD/ATmmZyAJOixgF9RqNVuCQKNSvo4w
 mEtQ==
X-Gm-Message-State: AOJu0YxNCKy2sXyyFCswNzu0x1YTMRil2eDmhcQTygGnTfZ/GGQmaLIV
 w+RFXNeBc8K17q8i/22FLwKHubYBTOBhPh8huz7MX7RcD63QqWMsZMr8QvvlAf0=
X-Gm-Gg: ASbGncvHB3sIJEFi3oqMZybTtGZ5vaIk1BiWZ2vBSxVUWdlx05EhVCWyV/S7NMMf3Cc
 gfPc7LoVJ7OvXJnaTfeO/ffcBzB6Oe/qFxA2EN/X8nx8fYXy1c4c4+n4paz7FAneKZZIBCFpx99
 UKQsKYMzM1WbdQ34Su97EK1idSKpUcnBNauayQ6Y0+zs/uqktHc7NkAGJUwhw78Fza+Go23001M
 3TFQsJo6uzurP61fVIlZn5RsDNziJVLa8GbNAL3LsNObcs+YJOdykQdLw4tXMKmlkwIl3jiLKFO
 L2SqNvQFlftJzalRmkDWJVqVW8BsqLa3hQ==
X-Google-Smtp-Source: AGHT+IHkyQkEF2MLfwbcoSw4WKSIYs4kY/4gUjEXpb6WXHQUbrGkkEXi6KPjg7CfhHvr0jXIW4IXoA==
X-Received: by 2002:a05:6e02:1e08:b0:3a7:8720:9deb with SMTP id
 e9e14a558f8ab-3c2d2d50993mr79808015ab.11.1734969813477; 
 Mon, 23 Dec 2024 08:03:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e6b83c9faasm860909173.59.2024.12.23.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:03:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:03:31 -0700
Message-Id: <20241223160331.1853338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734969813; x=1735574613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gskfIA9XVFbP6jGBQ7lAArO+AdvZc9VHZ8hAm4ZQX04=;
 b=Ww9adC+O46X/vs8LOaxehHnBq+NTybhByUby2BI5aguSk89LDrKs49MuXeS29Qp2+B
 8EvnAYcSXrBupwq1Nutf2RiETHhsnBAd9ddhb/Rz6uSNRW0keJjH1lN9QxNd2SC2XAQn
 fPWKnU1hfRgqMhG1oeq8mCB3r+IK8EmeWxRMlrZ879vqJoKXAuDE2+Jtcdl/fAtrqrVN
 y6BamEW8QOsQJo1j0+kxpqAjrAen5aaE/LR5rmmulrDQSJkuLWB8k0Uxz9hxwdltPFR2
 YPohzMgXmDTnfkwaQCSJowLQFfc2VVsFwf6U90ZmehKdL1dll4bxiUCDfOJxr+Yzma7k
 GsuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ww9adC+O
Subject: [Buildroot] [PATCH 1/1] package/python-can: bump to version 4.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 479935b2f0..d343a4a6b9 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  20133a1b73b58c976bba6b0af8581f32  python_can-4.4.2.tar.gz
-sha256  1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5  python_can-4.4.2.tar.gz
+md5  e22638e3e5d102e428614715dd04910f  python_can-4.5.0.tar.gz
+sha256  d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7  python_can-4.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index bc67be4f8c..1517777753 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.4.2
+PYTHON_CAN_VERSION = 4.5.0
 PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/a3/17/57c38abbf00993ac5ec306de0c00271685d1372ef3d907b107eb63ab13a8
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/6a/4b/b6fd103c3f2eb0ae942e0704642d396ebbaf87f4d82d0102560cc738fdf1
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
+PYTHON_CAN_DEPENDENCIES = host-python-setuptools-scm
 
 ifneq ($(BR2_PACKAGE_PYTHON_CAN_VIEWER),y)
 define PYTHON_CAN_REMOVE_VIEWER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
