Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF9E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 22:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941EC413AC;
	Thu, 19 Dec 2024 22:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlvkJOWH4kS7; Thu, 19 Dec 2024 22:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D5EF410F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5EF410F7;
	Thu, 19 Dec 2024 22:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D95C920
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75A284023A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_t9lrrlWhZU for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 22:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9796140207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9796140207
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9796140207
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:09:13 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a813899384so4452445ab.1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 14:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646152; x=1735250952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7jWtitYMV4yoDcUtGkIcg1ecGIpdSeeqLeOBAiU4dk=;
 b=f4USBiBoN0hDFpJUCFyHxS+2hOGc3qeN4liZmPBIRyY+fuPWjQ78ZfMlRu9wZ+j4rt
 JXiMZuNUaDygNT2GiZClX40bxAAhFjLVUbKTyZzhx1FUx7dag/OyJcCgTaxNS9yrO+AH
 uib9nMHlMBluzGpm7uZ+v9T3myjl+KU1HdTiZmB07X9Tf4iLCyVnDNkW61fD0Npgv3Jp
 Zra3/zVZGcj0/l6+csBTzZSS5AN0CGoAxRVGx8cTErF4YLYBoRK6GpxODERvhpeACQHf
 5cAv3prX6ufrM20QEupyA/o3RWcApZSJiyOLTP5lgB2IebX82Ev6XMhlkwnNpnt+2sFL
 EOSg==
X-Gm-Message-State: AOJu0Yx7MHhnCC1N8Uu/4Dn3hFNu7TXWxW1xd/ssoIi/i71/P4ur7ukX
 0bKByoav9iL88K/hfPEsz9Lhhn3TT1mvnVoPwdGb205GecixB0p0SLrwA3obxhw=
X-Gm-Gg: ASbGnctHtrDF4sVnZySAB8KP3BWWz+TVXRo52pfkbRy+xkqoQ4eGgOYgQliyQ0XL0+T
 Ub6I7sCxYvLyqDdsLYwLWHzmC3Vf9L1mA5cEf2k8ieQGxK+S5qsh04yVk4yVS838kYBrU4N4Avo
 F4RhGK2XCZ+k7Dzwgk2V1JNHag0Rvi+85p8sqhxqqQM04j65b54ynAe6MrJQeVzQNsHOPdFWxgg
 Cht1C1/HW0EdpX7vu2LHhqQsEhCR8jkHgcFnHI//me+02X9ThCN1zeuni5DI2TGqn0yI20X1aHg
 quTggC5r0MHgOOa/sax/8LdYzphkE9eSEQ==
X-Google-Smtp-Source: AGHT+IFbnADeg2yqMReozqf7rnpo1ZUaoGqXHFdU3E52nvmFYqy0/xd5LCnoAwJlKop4p+jX8/GUQg==
X-Received: by 2002:a05:6e02:2683:b0:3a7:e8df:3fde with SMTP id
 e9e14a558f8ab-3c2d25770eemr7648625ab.9.1734646152249; 
 Thu, 19 Dec 2024 14:09:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c21952csm492751173.144.2024.12.19.14.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:09:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Dec 2024 15:09:10 -0700
Message-Id: <20241219220910.402990-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734646152; x=1735250952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7jWtitYMV4yoDcUtGkIcg1ecGIpdSeeqLeOBAiU4dk=;
 b=WYPWijIw+4eWekPObzmEKosnnl5fVbPU5TWQhrYp9xhca0FsV4rCcoUxJQ3VPvrK7M
 BftXuest3X9bTS64WahfSyy1/C+ZzbXjVJMe4O40jxS86W37hLpWlRAWGc5enDkDjxKU
 DcU/URMk8G+OPsxlh7XGsITGCH2+6JRTQYP2duGqdMo14IEb5FgHCGxujKYugkOox3RU
 Gr+SJ99j5R64KtlFI7mYZamamKvrrhse7tp8aOyC9WJZuDlIq68s4Tdly6FzYFagkSEJ
 2FFVcY/dBZJAnnA8tDVx0+UrjCGhijsMl75w9BuvGisEbs6o+VrAk1Rb73TgolliSL9b
 BiHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WYPWijIw
Subject: [Buildroot] [PATCH 1/1] package/tailscale: bump to version 1.78.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index a5492684a1..e2d600f03e 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  46b68067a8b91f0e32ea8c23c292b9eb6675fac4c7bba5471a1f787bc3ad7412  tailscale-1.76.1-go2.tar.gz
+sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 91290ba4a3..55f8ac4ab9 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.76.1
+TAILSCALE_VERSION = 1.78.1
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
