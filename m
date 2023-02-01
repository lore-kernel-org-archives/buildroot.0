Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E0C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 02:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E8F560E32;
	Wed,  1 Feb 2023 02:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8F560E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHocP7xviboL; Wed,  1 Feb 2023 02:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE96A60E25;
	Wed,  1 Feb 2023 02:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE96A60E25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECF0D1BF2A5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 02:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF41760E25
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 02:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF41760E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYzJZyHDBwJW for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 02:38:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C637960DB7
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C637960DB7
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 02:37:59 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id z2so6803761ilq.2
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 18:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sVESWzoMOttvGnq2m548xi/5s1LXgoXWp+a34+SW1Wo=;
 b=eeIPeScgjcR4pp0tEXbabQd6vUZZel3hLVC88TixyugZVhpbD2UKlwt/rsnj8BHP5+
 Vyw1dGAA86Xo11sn05CwmAjnZ7Fyr1Gh57YqPkzayAjDblwpd9/nnNxiTGSYlBW9AvN0
 vy4Af6UK97cyRFJwWwlDqs62lQ0dt1k/HTjPPTV96ywnHCjyG1ay72qx40pAfvL6JCtq
 PBV4Hs3jQRWM1soZo7PTr3XTmm6McL2vO0wJBqN+6dx0P4glXi4CgErYzFQwMtwpYUdI
 erUN6Q00TUXr0956ioGvV2FGUFKhI7ifaBdrl8OZ4FI16PGLTBG5LDUKnXj4VJg4gS/M
 qSMg==
X-Gm-Message-State: AO0yUKUfWARvsEyyzP3IZL5Ky+R4Iw8Td/dxTs0IalLDQVEg6Qh0XcLG
 1QWrIoJiY9a67xgHunDFhTIG4GkFfqdrQA==
X-Google-Smtp-Source: AK7set/5J35cf41TZsjgO6nIl7oqjEy7//Q9wX+2hE1CSXEMn4BJ/5mCWLr3QKOBqF/VsSniULPTOA==
X-Received: by 2002:a92:cd8e:0:b0:310:b003:14b6 with SMTP id
 r14-20020a92cd8e000000b00310b00314b6mr486479ilb.1.1675219078477; 
 Tue, 31 Jan 2023 18:37:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 p18-20020a92c112000000b0030392271239sm5376028ile.8.2023.01.31.18.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 18:37:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 19:37:55 -0700
Message-Id: <20230201023756.1418443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sVESWzoMOttvGnq2m548xi/5s1LXgoXWp+a34+SW1Wo=;
 b=hdR+ulISUZQp3u14C9jFu1ApMBnupluE58dBSUWVfDAMXdFBHd01+82ntKsYhxQoG8
 49YS8HnA5r755xVFKVS/MlYuGKXyoisPDLx59v0SzhS8+rNPD7N++yrnMiaBGbDNq7wM
 7G1U6d2dGhQ9nZ20NeTuPh/kmJ297idpZEQfj9SUeuOAI2L5VPZ1gzYJTbeQl4Vy3luz
 8bXfgyrvMZrW7VDeEbbjAIxsJkYHFlfb9KjjUQSCsfEvNhjzRg3Lf4GoiWZ58wvXeT8+
 YThSwS2HpMF7t6JwRdef1Vq8P8IXt7DZJXADuVLmGzviDjjKmC9TswSGeskZCRJkNmEl
 3owQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hdR+ulIS
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.56
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 68832c3201..c0f1731676 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  a7d0df846af839bbea1b80f292166371070328854b3fa785b5c607fe600552ad  ell-0.53.tar.xz
+sha256  58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63  ell-0.56.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index b27d6feb65..994b0e19f0 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.53
+ELL_VERSION = 0.56
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
