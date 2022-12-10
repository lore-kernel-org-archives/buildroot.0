Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E16BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B2A410E9;
	Sat, 10 Dec 2022 17:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B2A410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xaPa8KzkO8Yj; Sat, 10 Dec 2022 17:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3C0410E6;
	Sat, 10 Dec 2022 17:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3C0410E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71D3A1BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D57E40436
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D57E40436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8BnynRO5Eut for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:49:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F5040376
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F5040376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:49:14 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p6so3709701iod.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNSM9g/jJ0ETNOSOQ8mcqySRT1K52c+vKAXknKzt0zA=;
 b=sEFGPRSB7iQmUXRbKk2R9cFDIL/D7GpKsF/V/WrphaCr+znqpWN9BgUO8JE+6NCmW2
 RdU0X6W9w5Qpm5FqFivtjeUKCZalw5Qj2zBAHZNcOFgePCsrZ8dDuJeUp2IQWarg62Cr
 O/Habm2hC7mLMtEgBLi21JNwE2eaPZNHClqLcs8osVsvYH3qeL4NZUlCYndTEjLXNhdy
 yHcIQvEgI2KxwA5ntLYEWq2+7+6jIS91Czhil6v9A/Vbz8PSWefOYSeMZzkt8iB7Ysdk
 XI6olDksNTjPuu+TcYBc4HuxEMhRKLzX0cPW57WnkPZyG7Ij7DYbltW9oF6fYMtdwpNE
 1oJw==
X-Gm-Message-State: ANoB5plM0Hg5VSqjyteBG4Y7TLZ+GfFJ1CCQkyps7tlkKrqJMcyRBVnO
 ++ZQjOCxAv2gj61hG2uvK2d8I69INAnwOg==
X-Google-Smtp-Source: AA0mqf5Zaao7CXTQfzUHE/aQWrSTu3XXevhhXmdafNvq1IsXGo1cpKES3u/TBxfdF056+ZY6jkhkxQ==
X-Received: by 2002:a05:6602:12:b0:6e0:2427:ed2a with SMTP id
 b18-20020a056602001200b006e02427ed2amr6533198ioa.7.1670694553290; 
 Sat, 10 Dec 2022 09:49:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e77-20020a6bb550000000b006dfbfec899esm2007642iof.28.2022.12.10.09.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:49:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:49:11 -0700
Message-Id: <20221210174911.2690413-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNSM9g/jJ0ETNOSOQ8mcqySRT1K52c+vKAXknKzt0zA=;
 b=H8JBL3bUnDWUOK1P/lI8N6EUGl42D04QCG7UUJ27RCJKSPwWv6EKB5Zz+EYXZTps+S
 xluCatoQDvw/pGGb3CDj3nAnRXTWfT97tZsTQf0a5nknXVUSeU5jvVSyaURRfkYW7mUR
 g7INTqsIL0SX6wpAinA//mMRJbzS3OEEMaVJY4gJGkzMJ6VdMaYC8CzpdSYX1Ub3Xt1v
 mEiYkWCNOqjUjXbpAm1Lg7oq6ZYTfDZWTsRLtEQ+PkKG9/7osHIFh96jzPzPjKt337UB
 d5xyI9ujRqA63VDaJ3XNplBAL2W01+/yY1TIluhqB+T769WwKXsFL2kHd6a1KOvskv5d
 WPtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H8JBL3bU
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.8.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index e4dd67de07..f9e6bc03e8 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  9bd8d33d5d7dc95012981ccbfb2d2a0f  filelock-3.8.0.tar.gz
-sha256  55447caa666f2198c5b6b13a26d2084d26fa5b115c00d065664b2124680c4edc  filelock-3.8.0.tar.gz
+md5  d66099b8823ebbdd980cde0dae8f7341  filelock-3.8.2.tar.gz
+sha256  7565f628ea56bfcd8e54e42bdc55da899c85c1abfe1b5bcfd147e9188cebb3b2  filelock-3.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 8d5308ddca..86f1220b54 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.8.0
+PYTHON_FILELOCK_VERSION = 3.8.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/95/55/b897882bffb8213456363e646bf9e9fa704ffda5a7d140edf935a9e02c7b
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/73/292d9ea2370840a163e6dd2d2816a571244e9335e2f6ad957bf0527c492f
 PYTHON_FILELOCK_SETUP_TYPE = setuptools
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
