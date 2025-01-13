Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FACC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 15:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FCF83542;
	Mon, 13 Jan 2025 15:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9qsCNesuDvH; Mon, 13 Jan 2025 15:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56181834FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56181834FC;
	Mon, 13 Jan 2025 15:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5249295D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 15:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F89C610A9
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 15:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eesP-HtrO2le for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 15:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09C6061022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C6061022
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C6061022
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 15:00:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa680fafb3eso56253366b.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 07:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736780409; x=1737385209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JfQsdlgoEnFC4jo/fbsypcuE3kf7aJa8+JbYD1l94mI=;
 b=V2V5WiLuLOs0N3w1AM5py9cEqZpK76Xhre4bNTy6ekEizogw5ISe3pakKUPpWMipJT
 +gis87WVsiA7C1quU7k9O/zPGkJByf88sztmLWzgMZcJi60nssKMshf7k2a3YlpWN4Ky
 o8Etlq08RJxnxbIPhESWUt6n1id01CDqtfj4XJwuJ8Wmp9qvdg61+JtlFlPtLp/jqHmU
 Mb43lr/cmyhm5668rVTkglDSCsa3uPvEIk4K4eMJk0yGX03grUj/Hkp8oqFtn6+R9GEM
 +zQqm9cFg3YqQ+1wzdhy9f51Dl5afKG+Qt17itqYm5UO9TwvQh41vMgfOajQJ80M6dDR
 OVPQ==
X-Gm-Message-State: AOJu0Yxj0ytBDOIy7qj0bkoxxnC6Ac+CRlYijU1gzAQZgCS1oICT26Bx
 X0e5vsDCW+5QHNHFTrxJHd2jEe1T7eZmeXlWBODUzo5Zum1QqrWJfkQXY1NmxIT1KtKCWrX2vew
 W
X-Gm-Gg: ASbGncvUyaAQXOQb6LO+kJGELrgn1clpwaef8hEt7g9KanjN0vwZQge0QauZZ5Etyfo
 mdsq5aRDEKPFLdsqQ4vkrUxg6jq7aa0uvBGAQu/T5W/fCvBY5PftBoZjZxYfhCY78bXiRY9prWD
 8ea2/Q15sIhpOum765GtVg9l5SG9R8L76rP2NayoN+PnA+7sLhmjOmGLkuW0Z6LU1rbzOyXs5Ic
 ZWFeKODaFslufjpj2xcdPQmkI2vJvnrE0EMfiDmxpz+u475RsF415obJ1WFSUvs+3O+gDqKq6Ar
 XZ68KBA1tbi7EU/gxV0CgOsktWQULy+emXf/LlnxDd143xId6LrqsJDIeLpYqw2MBwzdruLnuCR
 +5KJ4W1U/9SLd4Z8NZPTsmWDQ6Wk=
X-Google-Smtp-Source: AGHT+IGEHc6k2kG55Dht4ZGa4HJMZ5oGb04QiWLPkB3R1wso12maCy32ipoASgmdT6Xf0MApbHbtZQ==
X-Received: by 2002:a17:907:1c1b:b0:aa5:163c:69cb with SMTP id
 a640c23a62f3a-ab2ab71efccmr796787866b.12.1736780408760; 
 Mon, 13 Jan 2025 07:00:08 -0800 (PST)
Received: from fedora.amarulasolutions.com
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060c36sm509334666b.39.2025.01.13.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 07:00:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 13 Jan 2025 16:00:06 +0100
Message-ID: <20250113150006.1337276-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736780409; x=1737385209;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfQsdlgoEnFC4jo/fbsypcuE3kf7aJa8+JbYD1l94mI=;
 b=UaeDatkJxLpQ2JZ+Vpk+b33n0E6GQ3cbxA/YvwgbAP8UgNBYGeKJlDzsYuoKxVn5Og
 SBB4b+NkwkmGtrTZk5sdgJwPOl/EK1fktDo/t5BtLShIGHAmzySTuI/Qj2al0vSqeg8o
 F0mFweAB2JNdLmn9qqn+sPmPMdUEtk526IL8c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UaeDatkJ
Subject: [Buildroot] [PATCH 1/1] package/sysvinit: bump to version 3.13
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

  - Move URL to slicer69. This is where any releases past 3.04 are.
  - Continue to use the tar.xz archives.

See doc/Changelog for details.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index 67b0ab38f0..e806ad3786 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5  sysvinit-3.04.tar.xz
+sha256  cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86  sysvinit-3.13.tar.xz
 
 # Hash for license files:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index e05a6dee38..e0eabc933c 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 3.04
+SYSVINIT_VERSION = 3.13
 SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
-SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
+SYSVINIT_SITE = https://github.com/slicer69/sysvinit/releases/download/$(SYSVINIT_VERSION)
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 SYSVINIT_CPE_ID_VALID = YES
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
