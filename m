Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C6DC43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 13:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121568417B;
	Sun, 10 Jul 2022 13:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 121568417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_UtK0Ox640o; Sun, 10 Jul 2022 13:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18FB383E7D;
	Sun, 10 Jul 2022 13:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18FB383E7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 812531BF429
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 13:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CAE4032A
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 13:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68CAE4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbx9fyehHD6U for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 13:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9914030A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C9914030A
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 13:43:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r14so3975933wrg.1
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 06:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfHUQKp8RCInv2W44KyBbXGjyPfZ0EGPoYSDNuFe7s8=;
 b=h0O3omx/LCqRXGtco8+KOpb/oSsDd6znif12YEund1lledZi2R2gldi7LO+6rYdSLl
 VHrkRKNmNvs9E6pLMJOnz+6ANAshMSTUcPn7yjw0qxjl8pDeCDPyQqjWdt6TSSqtV7x/
 ACFOXzrR4/Ad1ChMWNqdGLe8AFjB4xNnGBWlrH8iq+vjLlumsVUwT7RnlCfir/ttiMrK
 v5ITb8AAgWtT9te4v+vuZQJrwK3PoLcqoUdch73lJ3IIEGXhzut9afSABioyfR1GcX4s
 FYXP45Yk0Sdvx2GjtpYpVOjETEoBHdnnHxXqRSBDdLsuda6tyW31B69ugXOMIU894JwO
 zhJg==
X-Gm-Message-State: AJIora+uxY9yNw6eDXN28WM/FTDFlvX/0H8IgjDWyYbN2rSJcthXWi90
 cXpvfiXjMzST6qKI25pOTFR3BJK9yMU=
X-Google-Smtp-Source: AGRyM1u/UxnwFCIHpUNHhHNaI9jUs2q882OjLW8f53V7fcP9kybK9TumgBqvUr0CXvz/8rE0qB3ZLg==
X-Received: by 2002:adf:eb48:0:b0:21d:7ffc:4919 with SMTP id
 u8-20020adfeb48000000b0021d7ffc4919mr12799470wrn.537.1657460582926; 
 Sun, 10 Jul 2022 06:43:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 187-20020a1c19c4000000b003a044fe7fe7sm4061955wmz.9.2022.07.10.06.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 06:43:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 15:39:17 +0200
Message-Id: <20220710133917.359553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfHUQKp8RCInv2W44KyBbXGjyPfZ0EGPoYSDNuFe7s8=;
 b=mML13F5HqaA2WlwbAcrvUivhreSrEXSNfUXQMj4RZkdOkvXDyh2UUhLTztOAvo5yNF
 0GZxttxMV5K5TUo9rO/enTd6ff7YUCGU4T2L089Cl7un03aOQy4b5yaP93cWacD41SO6
 ylYr3GIn2zVR3R9GVCA6FlQ0VRIUFZ2sNvcwAytyjXexuvfLEtbbgI4bSlvzj7r2e596
 X82I62VpIAX9EygbTZtM2+TUIiSDvQIl9Yatb+UfeiSoh549N+khdiWuvPQWTvP/Pg8C
 2MB43bR52H9ISLtaKBqGognwXQkrJwBBhACzsJE7Lc4qQ5v2QupHSJPdSa3Ix+gpfXnZ
 36Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mML13F5H
Subject: [Buildroot] [PATCH 1/1] package/log4cplus: bump to version 2.0.8
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index a668eca37a..c4540c9d56 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8f74a0a5920ba044b24e2ebeb0f1e5e36d85d5c23ed48d9fe328882b16130db8  log4cplus-2.0.7.tar.xz
+sha256  f5949e713cf8635fc554384ab99b04716e3430f28eed6dd7d71ad03d959b91a0  log4cplus-2.0.8.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 56a85025cb..b2e9ac3ed1 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.7
+LOG4CPLUS_VERSION = 2.0.8
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
