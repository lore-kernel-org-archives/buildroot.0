Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BC6D0BB5B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D933A81250;
	Thu, 24 Oct 2024 04:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMLimkqZXLbQ; Thu, 24 Oct 2024 04:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C12281251
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C12281251;
	Thu, 24 Oct 2024 04:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72718972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 536994063A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_DY6uwyKs6u for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DED640633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DED640633
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DED640633
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:58:53 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a3a5cd2a3bso2157715ab.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745932; x=1730350732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GriAgbCTNvBGkMW4Tq4IeoeYiruH+VuJO2iXrlzpxJU=;
 b=Jo1TVeEDKdMqTuyKGErG3AgyvjvIIA+/xmMpY6M+Q31Vahlj9RWwWYXRLl8yLBOss3
 u30s2VBxcfIWHHisFSRBMXXV9kzf4of4P7T9E+xSEqiynzKPyxhGWvNPuoi4TH+Fvsp7
 H5ui27/cKJYCMcFsc6ApGlyNw3dq1NzyRtVidT6ZOBGXJso8tMF4SI4RrL05Ma3N0eqh
 9RSidpOLCQO1GNvJFtS2vWLueHxl2HP0DD58TmXFiozm9QjVcjU1tcAHLX6JJE74z5Go
 QRFGmaVZ7fWmLpoO+P+EK6AkCjPzvUFM2mkPOXYhr4chEvQXSbJ30/63nnepekoCeJcy
 Quaw==
X-Gm-Message-State: AOJu0YzVnyUKFIg++hX2YLqEJrBo7VRVzlO/TId7balLjYb6aCzkqhTv
 lrlMFfIVV9YUvCvgyNjVFyWURd02RzvN6yGK59DRruAamykawm5tcIW7cg==
X-Google-Smtp-Source: AGHT+IH87GLQrXPMUXKSHe5zRCFtPCcQiFbBteEC1HBmNjmrvw/Rh9gFr28lo7UQk1KCrXdEYRX6Tg==
X-Received: by 2002:a92:c544:0:b0:3a3:f860:9c79 with SMTP id
 e9e14a558f8ab-3a4de80c6a3mr9838625ab.18.1729745931927; 
 Wed, 23 Oct 2024 21:58:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400b7c8ebsm28854385ab.73.2024.10.23.21.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:58:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:58:49 -0600
Message-Id: <20241024045849.3382730-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745932; x=1730350732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GriAgbCTNvBGkMW4Tq4IeoeYiruH+VuJO2iXrlzpxJU=;
 b=Qme807KuhwCggKD1KCK7oPVk6XTe5vVgcK8QzGMqJF3fVwUPCzIrl5Co7iO77ZMZnV
 oMRi7dw+u96KJYkhJrmJV+aRRmKWFzBp+6ig43+Mb7BJ4OmqWI16MHOVriZkqvlWNCEI
 JMks16GfWdr58oGv/x044gr7HEedEjGuvUfE4B+oF8ObsJXeT9xzxwwKxaGJdRjjGq6N
 P9s0ZzUKaSGuamcyYkfWh9aH4HNqzxygS/3HOFbD43Q2gOiOfUnv7rTyfws5Lzw3N2Ln
 cfrhoym+93vXCPp8YgrcZSJZmls1oBm90XZKcOzfAzvN978cKMuIj1EwWlwYZUYdgxdv
 J7+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qme807Ku
Subject: [Buildroot] [PATCH 1/1] package/python-psygnal: use hatch setup type
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
 package/python-psygnal/python-psygnal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index 57ba442e6c..5bfa1e6742 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -7,9 +7,9 @@
 PYTHON_PSYGNAL_VERSION = 0.11.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
 PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/bc/b0/194cfbcb76dbf9c4a1c4271ccc825b38406d20fb7f95fd18320c28708800
-PYTHON_PSYGNAL_SETUP_TYPE = pep517
+PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
-PYTHON_PSYGNAL_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_PSYGNAL_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
