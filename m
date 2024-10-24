Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAE4D0BB4A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7F24029C;
	Thu, 24 Oct 2024 00:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r73mm67TludM; Thu, 24 Oct 2024 00:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55811402DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55811402DE;
	Thu, 24 Oct 2024 00:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 555E22073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4330340282
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcxZwyUVnWHE for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28E5F40188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E5F40188
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28E5F40188
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:07:12 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so13283939f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729728431; x=1730333231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/tYpQuzVG8FMRotRc7aTo1ywtqBfrI0ZN1jl/L7HNQ=;
 b=GgT4f6NUk+9sstTsR0vmX3Kxep9WkP8Z+QoMeP78tneweiZBXUVvF9NswhgtdgRyGs
 vCUWW3QK3xgVkparhm8rM2XOsxw5wWweeO2gb4TOq/oFMHNq0OWH8Mr4s1+FiKElwacg
 UmXawO1zq2oo2vJqdbSw/mhxRBpdq4hWFhCvna8Y5CiFGv5UwYODXfkleOjHoegX78Iv
 h9jvhmJcHsNMX1fcw/kOQ54ylThDJl858sOX/PET7ZQ5ySPRxDIexZBwljHziJjStqxt
 3dKz0Mu1W7cVIk4KVGMeeV9J/LaHRFbvxqYnlcO4dKSw6iiaLWRxIGv5ZScxlq6xnwV/
 OU8A==
X-Gm-Message-State: AOJu0YxHG4PaXAh4JT6T++i+5hwV2wVuMbhs4ZqCyBCOPFhvVvwzjXwl
 lMFql7ZrfDBP5gnB80Cl745J/LH9D6kcb14ztVh35K+OHBkZDLjs40PkvQ==
X-Google-Smtp-Source: AGHT+IEk5NhVy0U5JpPZSOUdSU9Wb/C0fmYscE3K5V+Bs903bElI1jKpiS02yOHbEWTh0QcXgoyX2A==
X-Received: by 2002:a05:6602:3c2:b0:83a:cc2b:c9ce with SMTP id
 ca18e2360f4ac-83b04032a0emr32846639f.5.1729728430843; 
 Wed, 23 Oct 2024 17:07:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a661b27sm2430739173.177.2024.10.23.17.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:07:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 18:07:08 -0600
Message-Id: <20241024000708.3356276-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729728431; x=1730333231; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0/tYpQuzVG8FMRotRc7aTo1ywtqBfrI0ZN1jl/L7HNQ=;
 b=VsCTWD3cE1u5iSFmjMaZXvvribM1Bs7AfWbo/ujCUhtn/5XP0zcfV66HOu7Q2t4Z0+
 v26r/4QN0nWBagicRE/DygQPnDZiYutU76PHgr7PSe3saoMj1K5+FOjDHJ6MRrMcjtdC
 HQpHRPYLshBz0MabK0tGOuI1uxWbIknWRcRy0bIzhS9kFTzqKZU90p38xu1TVBJzxeDM
 oyOY/6OSlw4J/9XBYoi4+gTvgQAvAyQDYOZ1Yjo64a9vLmaJqDNzaSzKYeNiuFfY5BcD
 JtFFUJfBUFw3XYTheueJKJ0xrJb7YhcH3JqnVr1ucNksJVNGi49N2mp7B00wkrOGCCJo
 qrTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VsCTWD3c
Subject: [Buildroot] [PATCH 1/1] package/python-fastui: use hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastui/python-fastui.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index 7ed2eb39a9..898bc26eb9 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -7,9 +7,8 @@
 PYTHON_FASTUI_VERSION = 0.7.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
 PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/87/97/3f001410200256026ff98a4588ec8cb4f3b48bc74a28325e32bfb3b08ffd
-PYTHON_FASTUI_SETUP_TYPE = pep517
+PYTHON_FASTUI_SETUP_TYPE = hatch
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
-PYTHON_FASTUI_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
