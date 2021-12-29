Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382DFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D189E60B78;
	Wed, 29 Dec 2021 08:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uh6wt0hjGr9j; Wed, 29 Dec 2021 08:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4728E60B37;
	Wed, 29 Dec 2021 08:43:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70AB81BF9BA
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D9B88130B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztHQIF4XVGOw for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF2D1812B7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id y16so16046143ilq.8
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=l4Swb1cCrHgaxrpSY1cwqlHldCG9lbXNPKMIR9/tPiqClWe/KQp+OKx3ygEEsqYJFQ
 Stk6gPrOrBtwbNEpLObarlEZ8zGiT9te0FnybEluVC4nXW3IjcsKGMjZ7uJUxh+ab4ID
 zvLB0m9T15m7EPxLLZfdeJ9oddgCb4jG4KKapGYbpcYNhzpMZbQk7Kvrkm13RQMGPVcO
 TfMzvq22euWaaQfmQnfjsx1ObXdMuKGJI8qWqH7cU39K9QjPHq3wq7GmSge1/Ph//LcH
 kpgVFQPzwNr3cc0Y8dnEexDHXqeCVPzSdPXbg/yFLtUXdypNMIn/4FfgIfhttu1rgIpT
 kDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=zn+EGaahdHsSzZmYgZipREwHhaHrWRC7efnpG7L59ci6l8T9snaovhDVMAiAoBWVnA
 X5hEZPPrUk5oM7wR89cfeaIxXdiljOe9CU+ifg8W2Ef1BNvqpGEoOXdlb6FxC64fKZZe
 zT5Jof27IyVMzobv+b8HlpAs1a7sOUGyUjjoQ4CEMQp3QPLBg2PmkM88cNB4TVslApAt
 mx/E9oC7AcWtJejtmm8Fe/pCZpgJKOFLSIt9V0sXL4MpQmysiFAva2NipyI8Hc2eqDdb
 Pfv9V75bGjD3rh0hKqmzFHPDX8JoNYmerIKSM1s3TRD/ZQT/mlA1HccHrGGAMhW2Z4bs
 b1GQ==
X-Gm-Message-State: AOAM533fgtaTFmBEtRlFiohdrYvR1N0zF5/rpqaRhI9k3suYRwsDOdAY
 GERDjfeU2lGGRQbISYaBES9UiAe7kSpeVw==
X-Google-Smtp-Source: ABdhPJzC5jbYgumxrBZOZLrKkl2Ps5J7hljjYs4J/BmLujBfv0OerTfGvFjlXwSGi4rA43d06Q45zQ==
X-Received: by 2002:a92:8747:: with SMTP id d7mr11129792ilm.203.1640767352748; 
 Wed, 29 Dec 2021 00:42:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:20 -0700
Message-Id: <20211229084223.521362-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] package/python-pyparsing: enable host
 build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required by host-python-packaging.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 0dacf2371d..5741458d65 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -10,5 +10,7 @@ PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPARSING_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
