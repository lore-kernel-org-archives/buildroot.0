Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DC6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 13:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1448361076
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 13:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1448361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D196B404DB;
	Sun, 12 Sep 2021 13:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sly7v-a4W_FU; Sun, 12 Sep 2021 13:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C9240526;
	Sun, 12 Sep 2021 13:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 702F11BF473
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 13:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6C240235
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 13:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smJtVsmkpwzL for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 13:16:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6667540119
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:16:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso4926182wme.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttXGSGTOGoBI6y1NBF5kSQG/xCvUmfCJL6+MmERs4Mk=;
 b=gSZOlaL7O2kph6haQG1dq2MrJ4StycS7VkjCvRBkZkfmNpX8JQKQQjNUZ0IZ14iF/q
 cK+ObDCuV5xayvDWuMsvu39Y36PSLQlSNU3FYDFxvQQ67KIQn9XW4A+oaVrG/Hgs8aMj
 31QVWof91/u2FahXNRn8hSwyFveb5+3KQyBIVCNsGJj1mML5TbufmjMthxcXUdsRgpuU
 oV32JeA1p3BrSOEyBIUeX37ybK/FNHH3RJ3CChAVzhFIV8dHeBXZGKYVPpWhqNila9AF
 BEJYXOZ07q55Qls1PME3fqlZVEhCKo1NMF+DQ5eE881I+Nj7vVIUNz0TQCgx4uRv66qe
 pbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttXGSGTOGoBI6y1NBF5kSQG/xCvUmfCJL6+MmERs4Mk=;
 b=GMh9Ib0JKbU/98Z4iKxpqNynkwSCBnGcZtLwJlFQR8ffIRBNvr+x6FEiAgis7G5z1x
 Wb5Z8ghjNDjskuXgGnHHc+k9rpRgrY6QudcYAjECT16hxT7Z+AwuFUTBvwPJlY0DH7IE
 Cw9QMsf6MU5Ya6IaG9fSQeaTr0PQCwn+wusmYRQmiZEoHqAv1iH2fRVZ5kEqos4rKUDq
 cxCbMHm41tv9zW14B8RHsvE2ARfWAMiQb99WR3PpIveACfpnrlwzJf9N8OFUa9JAozXv
 Cs2EisQvEpoDFGRyOLH91bq0biJ/Uztw8Zfzz5tMCUiUuuG1xYJTIVouwHbhHnT/84sY
 udZA==
X-Gm-Message-State: AOAM533F80+UZSxwyk9zo/CYazrgAAwPchaFdyigqGUhdu3lVIrSXqct
 HLxXV6uUa27HRSDaXCgtnZTLE3bvdAg=
X-Google-Smtp-Source: ABdhPJyPPLOjwwCmQg+yOZ5XfvJh4b7Ul4Knbwz1619+UXvZtlxqUqGdAEqvEKo1HlFNtn0uMAGShQ==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr6700997wmq.2.1631452562435; 
 Sun, 12 Sep 2021 06:16:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o12sm3807928wms.15.2021.09.12.06.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:16:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 15:15:59 +0200
Message-Id: <20210912131559.2155322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fio: bump to version 3.28
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This will fix the following build failure with kernel >= 5.14 thanks to
https://github.com/axboe/fio/commit/382975557e632efb506836bc1709789e615c9094:

In file included from crc/../os/os.h:39,
                 from crc/crc32c-arm64.c:2:
crc/../os/os-linux.h:17:10: fatal error: linux/raw.h: No such file or directory
   17 | #include <linux/raw.h>
      |          ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d85c044263c76ff7ef0fe47921d893a472954da9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 88319e4cc0..87045af119 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.27.tar.gz
+sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.28.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 12e2b2ab7c..13818b60fd 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.27
+FIO_VERSION = 3.28
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
