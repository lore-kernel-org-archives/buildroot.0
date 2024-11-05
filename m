Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934E7D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC08401C0;
	Tue,  5 Nov 2024 17:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV_Na4mOs-Nu; Tue,  5 Nov 2024 17:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE5D4035F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE5D4035F;
	Tue,  5 Nov 2024 17:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B42723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 853D680E01
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyD9iJrI8FJm for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 914F580D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914F580D9A
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 914F580D9A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:38:37 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso328989839f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828316; x=1731433116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WAgE51iLvYNf3/VREJs3BkG6Q7CCtUMYOicOSw6QtE=;
 b=AJtcmgVWEMrxKIj8jlOweONSU4zRG3NqRqBhI8oPGWfWq1aYZ9JwMbSSiK+aZGF5Zo
 pU7ozsB77AacGNH2+/MIV84QbqNrMr2nt1jY+lrNDaDQMlCzbsVfR4FicDbnTY5Tnhvr
 qPYND47RF4mOACSturtj3rPw2P+zeRaox85YD3vKOwcBH8mEt+zQCOYK/nMwpvwhvW8Z
 x78i7AEswDdY0bnpplRiEczXgPNpjREjXnNiqaNyFOVDyOKofpunQKFpYwxsalnHaZUW
 qrI21Q/PDEmJbpOfFbH1gLAg1rRWgWn9ms/sGzevj6fyVq0zbAmwRzdbvf72TYEcBzLK
 v7eg==
X-Gm-Message-State: AOJu0YyjCWB3XyM+onAiqw+a/IV/XTz2V9LhBW2xjJSJ0NBpVfPFjHxT
 Ytkw/KjPSY6+AByMKTIlZ/xDMIatxe9yFG9e7OCO9uuThGMTZcwyUtNnDg==
X-Google-Smtp-Source: AGHT+IEu7q4QpzHoW9GPl7qSXtOyKEwnF8OYo2XJq0sv/+jT5mR5StNyjiuCUWWD5+HohAS9naklbQ==
X-Received: by 2002:a05:6602:2d87:b0:832:13ce:1fa3 with SMTP id
 ca18e2360f4ac-83b64faa3f4mr2242794839f.8.1730828314906; 
 Tue, 05 Nov 2024 09:38:34 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67bbe8ddsm276637539f.32.2024.11.05.09.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:38:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:38:32 -0700
Message-Id: <20241105173832.1395878-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828316; x=1731433116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WAgE51iLvYNf3/VREJs3BkG6Q7CCtUMYOicOSw6QtE=;
 b=WeWx0Y+8XIkJbcT8nsFLPIUWVFBT4efx9nRkEWggg2g1qLPt5kGCc22Ln4dDuCfeqG
 GPtHHsnJB1UX0ZxEAVTsNc2sc4j4KXQ0/PyTEDssPj9WLXa8B1AD5DGotL0WIGrYvHpp
 dyI0h46Takf3Uh29BW2+KnoGZBMUlTJsasERuZOGwIjCa3LURz13+q3vrHQq1HfXFOLK
 webO03xg2SFyP0dxFPyOYnk7WtLlKhobnEMKIRcsao0TvlI8YUDMtmZHHK7/30LbOmKq
 D+dJ6LcxkHuqZ/+3IEdIJ28AnZaTo8dg2MHC0GpWMeLxL28orgKLot/lbQ/IS0HWxwel
 UGLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WeWx0Y+8
Subject: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: use poetry
 setup type
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

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index a531c4585f..2a2c10fb37 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -7,9 +7,8 @@
 PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
 PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
-PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
+PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
-PYTHON_AIOHAPPYEYEBALLS_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
