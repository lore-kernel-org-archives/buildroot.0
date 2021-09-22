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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D0FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1FA61215
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F1FA61215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D104049D;
	Wed, 22 Sep 2021 08:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ega_fLsOAfPe; Wed, 22 Sep 2021 08:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC7C4048D;
	Wed, 22 Sep 2021 08:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD811BF30E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54C524036F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgH3AAptR9Gn for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A24840161
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:31:27 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id m21so1857213pgu.13
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIlUFdTgIaEZad4zovA0z+9U26Ntv3AK6o7hpUtPlqE=;
 b=iD8Gd2UWjR3GNS5E2WNjI+1Ecm8VM9eP+AnMsXqfiti22Tr4RmEw+Y6oTVnTFsK0nT
 NElVeeK+ymCaOC+2PLhm4tpHftnPu5iFWPlB01Pz4axb1iljxCzfHnFTnTOjvFPs8+wM
 cF+E75M76cq+1WwSa+WjGVg/TmMngGtyP/I12+vv+dgW4pxCZWc8POPPO3Gkh7sT6G0i
 G4qTxNnivDAMKydNcfLxIhRlMZ0PW4l/uLnQ/XtiJGvP0BKE6WnHeMuzfh2QDdDwcmD5
 zfLjcTlsSMeTXkPY8X2eThRehIGhDeprzxLhQ4x7eVYV7/ypRybFq3aphPaatFyUIa00
 Sh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIlUFdTgIaEZad4zovA0z+9U26Ntv3AK6o7hpUtPlqE=;
 b=QGk67LjmmG+NIQpJQzzvlY79ftgGCx5/qJYf3iwQJMvyMogHv448DjaYNh+53stKxy
 +DricTVqnoFB/ocJPMz7v0qD0RLJ0Lpru3kvdAC8SYNDVE4xzHCAWddpzX7Py2Js5L4u
 LI7wVZ28GEfECDIYpBMEoBHfDvxsncj6oX2Mx3XALN4P8Oplqy8T+4STzETlD2bzeH7e
 9gjpfets5r2EaXNn+EIXRD48n1nncDAm3XXsOioz2tXA+z0plT9laDFTd9MEEJdaw422
 E9aS6TL0h9v0kvb9y6QoDrSuLYDZdIg9XBMY2Cz6B64i2OBqJlWIwWoEpfF6NswpMH3K
 Q93w==
X-Gm-Message-State: AOAM531laUTDoVtwXae1ly9fYxVMr//0+YfU8/294JxYdbjO9/1Cmn42
 4MwQ4HrYH71eUeUwLkCtAP55Tr/Z6YkDXQ==
X-Google-Smtp-Source: ABdhPJwO7O8FAdfi18Ns5G45xhBJQ1V7h+7wi3PSt7ce6/e/ZyvZZBpjEviDTHjww0TI41ELfjWFQA==
X-Received: by 2002:a63:841:: with SMTP id 62mr31648110pgi.354.1632299486534; 
 Wed, 22 Sep 2021 01:31:26 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:45c1:823f:9f7c:20d])
 by smtp.gmail.com with ESMTPSA id g3sm1631656pfk.178.2021.09.22.01.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:31:25 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 20:31:13 +1200
Message-Id: <20210922083114.545106-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/micropython: Update LICENSE info
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The various micropython ports may include code licensed under different
licenses compared to the core micropython. List these in MICROPYTHON_LICENSE.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index fa28da9be3..7a752efd69 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -6,7 +6,10 @@
 
 MICROPYTHON_VERSION = 1.14
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
-MICROPYTHON_LICENSE = MIT
+MICROPYTHON_LICENSE = MIT, Apache-2.0, BSD-1-clause, BSD-3-clause, BSD-4-clause, \
+		      GPL-2.0 with FreeRTOS exception, GPL-2.0+, GPL-2.0, LGPL-3.0-only, \
+		      MCD-ST Liberty SW License Agreement V2, MIT + BSD-3-clause, OFL-1.1, \
+		      PJRC.COM, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
