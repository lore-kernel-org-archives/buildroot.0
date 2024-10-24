Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E9D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65FA4068E;
	Thu, 24 Oct 2024 05:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlpBeEaLNaXj; Thu, 24 Oct 2024 05:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB6F406A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB6F406A2;
	Thu, 24 Oct 2024 05:26:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2607F27ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B34E4068E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpEWZgpThdKM for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E1844068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1844068D
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E1844068D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:26:42 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab94452a7so21709939f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747601; x=1730352401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IesR0Xv3HqzVSQE2RRkQJR14BFqRYiJvUia71UlweY=;
 b=e618rLHGATMNDRMcr7+IZjcszhGZtVFLHOvyIU2jewWDwKYBe10l4EMHsTO3XOAjv5
 YsAenapyQj7uPgtQymXhJ5ppE81ZXSEZshGcaqZ6wWMbL7IgcKDWbg1O8jDKbyCC47af
 xgtlOIe0x+JY5pMB4yr+hpBc/nAjL895My4nSNuu3YyqByW7z5p7NfTpjAiK53NlYgYt
 jfkEesX62ExAiUPmjvr/1lZEk9vtu+pbShkzxER9+eQy1aVgNi4Ma6wJKPIYbEjzVpBh
 DaRsE7uH4OTEJzFHanGXuayNoA5a2twWpxCX7xlWXQVUfX9/aQRyrjzFrZTAtHcNVYi7
 dpbg==
X-Gm-Message-State: AOJu0YzQE41M5PndNNEnKOIhirzOYqpkuGECbmqHvhBiIQsyXQETR0HH
 JgfDaDnp/qjZlOmOO+gX4/Dg67L4f/14O7BuxbIWOsHT+Lz9Y4eYlTTHOA==
X-Google-Smtp-Source: AGHT+IEclj35uSK3wTpDtr447hqJKB1vtH82MaHuBq0OdQYJa1RAxRwBoHHQthztVZo86DFlrU7egA==
X-Received: by 2002:a05:6602:1603:b0:83a:a25a:cfaf with SMTP id
 ca18e2360f4ac-83af6155756mr460422839f.3.1729747600855; 
 Wed, 23 Oct 2024 22:26:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a530890sm2522575173.28.2024.10.23.22.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:26:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:26:36 -0600
Message-Id: <20241024052636.3399821-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747601; x=1730352401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3IesR0Xv3HqzVSQE2RRkQJR14BFqRYiJvUia71UlweY=;
 b=dek0QTCLwTUTV3X5Vo/A7fCPEHNPd7vPkDEWWuV7fUXxVsNa4h72K8j7dbv93LU21H
 l+aIdlWMBaLmSV1XjFX6GYE2ycCslYUs74Vk83x/HQh3cHv0tzw+gvoQkCbrBDvXOGMq
 eHJg1C95QwDJzg8ioLbDPil3vkWzlBRvR9WGHes58l4ApmMR938a4kxQtdJeMUeu84PW
 cAgSLkAfRtypHSlxYhfqyyFTdY+Cdh49D/5PINgiqTZvE6CKhdwcWxR1eNymME5lJkjw
 xCksYZusSAE2vYAPTMWuKXDPonSWB0uiqQ6S0bVP0ajK+a+n4bZKZgt0+VHgNbaea9b3
 sHnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dek0QTCL
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: use hatch setup type
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
 package/python-urllib3/python-urllib3.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index dfbcbc608c..fdd75317d4 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -11,9 +11,9 @@ PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
-PYTHON_URLLIB3_SETUP_TYPE = pep517
-PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
-HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_URLLIB3_SETUP_TYPE = hatch
+PYTHON_URLLIB3_DEPENDENCIES = host-python-hatch-vcs
+HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
