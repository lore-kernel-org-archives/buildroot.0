Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB0DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924D6611B0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 924D6611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39051403E8;
	Wed, 22 Sep 2021 05:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9OnYx7Y8j8w; Wed, 22 Sep 2021 05:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414F7400F5;
	Wed, 22 Sep 2021 05:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DAA11BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BC5C40017
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_-V827TnA3T for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 05:00:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 166FF400F5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 05:00:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g16so3043913wrb.3
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 22:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfQvES03pTTlG/pMDdomK7J7W5w1vPirh9pkEO+ZiRY=;
 b=hp+L48CGy3mbokxdx7yIfsE8LW6h+nHbivvlod8BprUpMKtBnH4wkD7nqS+I02dQj/
 np2wSQH7WB5KPgPj0nH5I79lWv3oO5uG4QYMgUGsj84whDfb9GzDKI1SfF2E5NMu7hw/
 AuXQrBDNQdWIbgxdOduzF0MJiTEwXbYohR6UkP5+ZQjG2friYA3Gdbg2ub0lwaLy/XNy
 RMvctCIR8IQEUCSJ3bYUoczBJ5k/cUl/nT4kjM9bCV5n9ZXBTwmazvNhefV3GuW+2CFx
 7wepTb5T26JfrvCcU+AN25cByQ2eJnJhLrRM3FWRHaxyV7mLASPN+1qLs/tqmQxpAi7I
 yuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfQvES03pTTlG/pMDdomK7J7W5w1vPirh9pkEO+ZiRY=;
 b=7wJZ32Hc9MX+cwmKugSUsbgyktzqA9wj0CDnHveuo8DqOaMHe14MFn4yg0xQx2dJ3L
 50O2aXqqks5xkrI8jihVjLptd9MBrg7C1VCymNKb5YrX1uKGbv+Gy8pBysH3eIkrTqtT
 r5D/kfldhzbztif0aVaqQ200ILASdn/nyflPCpFZGAYB9cb/IjPJIe86o4bCVM8XZyhJ
 9unsIUhqVhf+K94Jn0WLBD9wNMcBkRpg1fO9Nt1ZLZy7GqQLhMEdB8CPVz0hUj2xIK+B
 4p0lOJY1UHhcs3vCbqPw41CtfS7ckcaBjP+nCm7iAprBLZtv2dGigoxyGqIUH5nl2rDw
 lzCg==
X-Gm-Message-State: AOAM531Ta4ZwSM7BfjCOuTkNckE69TO7ptZvQOOQUHQg9F9Rqx5hvwl9
 0W0194H0osUPDgo0rpzNu8Be+Qv9jM4=
X-Google-Smtp-Source: ABdhPJxq39Ul5onxJCeO9T4d3Hb3nen655V9bwFGPVQ4Ou5SwM9uDcjlx8W5r5FRoYDP0dGsuvkUUA==
X-Received: by 2002:a05:600c:3203:: with SMTP id
 r3mr8141276wmp.175.1632286803210; 
 Tue, 21 Sep 2021 22:00:03 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id i1sm959350wrb.93.2021.09.21.22.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:00:02 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 06:59:55 +0200
Message-Id: <20210922045955.13130-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/debianutils: bump version to 5.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

New archive contains ".orig" in the name, thus update
DEBIANUTILS_SOURCE.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Fix redundant slash at the end.

 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 16a45d4ea1..0b28ac705b 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
-sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
+# From https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils/debianutils_5.5-1.dsc
+sha256 2b0fad5c00eb2b8461523b2950e6f06e6ddbb0ac3384c5a3377867d51098d102 debianutils_5.5.orig.tar.xz
 # Locally calculated
 sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index d2c41130fb..0817f81cdb 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.11
-DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
+DEBIANUTILS_VERSION = 5.5
+DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).orig.tar.xz
+DEBIANUTILS_SITE = https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
