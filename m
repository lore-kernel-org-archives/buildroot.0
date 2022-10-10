Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 09:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C307416BC;
	Mon, 10 Oct 2022 09:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C307416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viybQICa4EA6; Mon, 10 Oct 2022 09:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E971C416AF;
	Mon, 10 Oct 2022 09:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E971C416AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6208A1BF3AF
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 09:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BAEB40241
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 09:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BAEB40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_Wxvqh4u27e for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 09:04:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EB24016D
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22EB24016D
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 09:04:22 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id y17so5360503ilq.8
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 02:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RCx/aXWC/YzIcJZTnzkTOGijxe0rX+sDVXnjDo0RS0w=;
 b=fb5RNAYiLtaithac4m0kSzb4QApHfLQOJ2K6FHu/mm9cwDBEXaeAmZNyN5wGULYYUU
 lSenHpUDDpNCD9ZrZnDi/ez/5pfNLK5HJ72G4s43njra4CbYy+fvz6UQjR6sR7C7323m
 l97Z2rnOIaKFgISlGNrRLn9ZKZmDjKY1DmwlviM99E/NrOY4F1ChMzZai14m1DJMi1gy
 iYQ/L6FhG7VQBPRYjo1UpYnDHHsFgwR8siHoNoBHAQV7Wx7L2gKLxFHUW8384smdNmZg
 Au9L1k7M3+E5kzmZumMKy0AfDAMP1fkD5bB7y/5UIq7REvAClpemRHU8M570J9Y2Txt3
 nhEg==
X-Gm-Message-State: ACrzQf0fuT8MGd+gxov5Z1zEe3VMB4yLTAqIAXKZ3eNb9WNAVTHA1xJC
 58jUwEJO6Y6lpeRenEr2f/NK/oJbfWg1Bg==
X-Google-Smtp-Source: AMsMyM5npAeryjJfhCIBbFZHp3GSinj1IRaiIWGb0W2twmsnNxKg8pVSry9VqbAmedD7VL+COcephw==
X-Received: by 2002:a92:c564:0:b0:2f9:e0e:c542 with SMTP id
 b4-20020a92c564000000b002f90e0ec542mr8430981ilj.255.1665392660733; 
 Mon, 10 Oct 2022 02:04:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d68-20020a6bcd47000000b006a11760aebbsm4154882iog.36.2022.10.10.02.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 02:04:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 03:04:18 -0600
Message-Id: <20221010090418.1604258-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RCx/aXWC/YzIcJZTnzkTOGijxe0rX+sDVXnjDo0RS0w=;
 b=qvcDFaIpg+pfkC0Zs0n34SBP9dSKJN/x1HZwyB9ZV9NBxiNlhbF/yKNZvhyotfAbdg
 4aUOrijZtUx+zRFBh6/db6KlRlP9o6x6VkifANNplbeBv4aUqO1MB8+bgGlnPKfh8fcc
 QfJbAdmRRw7Ipj3u6F2qK3m6EVCPKMaF0No0SkwCYRhEgKwdCmEUruon78XGw9Q9qHrb
 i5Z/ARsqKUNgaOxarRRP+dKyDF2T/bkI/D24o3snqJ3KeLvt8TPtaUZIOdbvL0yxZBPx
 HPAk0iMEknXpTCI53inca0HRJFEOnbCUhpWmRm5A6emCPT0O/A5df7pTz2P/X3AqZp4n
 VQeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qvcDFaIp
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index e2de1123ac..f69bbf7fb8 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  c3c80ea7c10817c5fa1862c15ffae85c00db96d33b2b9f8088abe0024b983d84  maturin-0.13.5.tar.gz
+sha256  ed3aa1e217ade804e76651fe8e7803becc0b7831c42d6f31b8636f07f9b2260b  maturin-0.13.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index f67f0ef562..8204a8354f 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.5
+PYTHON_MATURIN_VERSION = 0.13.6
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/02/02/0bc5e44bc6f0a1ec21bd1b32d7d0ff6035a72858823ef394a95ac66327b7
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/78/25/c418cf59a7735a065405d9ab63423603c38bd55712ce0f5e11f2ae248cf9
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
