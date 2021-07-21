Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8216BC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352EE61241
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352EE61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 088A582505;
	Wed, 21 Jul 2021 17:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yizuz_9pq3KX; Wed, 21 Jul 2021 17:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F4B4823AB;
	Wed, 21 Jul 2021 17:18:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 642321C1135
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614E5808A2
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lq1FcO98OxVR for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46959823AB
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:18:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i94so2991955wri.4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8NgA6Rlq8MRX777aXPwqIYX9IVX+5AxMXqO3DlLzL8=;
 b=Nkyj8O7ujcSl8AAZGNCEwJFc6nU89ZdMp1OV0yFY74hMnAKLq9zqFSBWKErkAabmO+
 9pEzLH9rJ/bwT/B/xnIaSYZ0kPdYA9CmH68w3UhWKQwI/axvYpTmeRf06BtYt2XylSLG
 D5nrG8phsxBb/6VApnAE3o4IRIlm9JEZUvYJNC5q5vXGY7zGCxyItkccsT7M8lc1t2Tf
 +QKWQ66JUUb+OudgnFxu0DTpB2vDIYnrd5WB6hHeglvfU4GyG/VpZr2ztsbmvprqN2yZ
 41JN3EfsDWEt9QB5C4QNIQg4MFKbZPhELn1xiBtYMZXDEFG7lvzB3LzQkymUNCJ0Q6Qd
 C+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8NgA6Rlq8MRX777aXPwqIYX9IVX+5AxMXqO3DlLzL8=;
 b=LiFREgnxCTXEufmO8iziz1cM+zS/dGcTKO9lQauImGzaDYSKGVfTaZIvPw243n9bs8
 I6R9TNzoA/ERiyxLvtejsuS+tPLhvQRDW7XnwK0VTf6KmWp+2uRi4wwD1miCiwycHz7p
 Yrm/ub7okm0hY8ERj6d+afGGYjMTjahFPIqaMYw9lAO+mzMJ3DqPS/cv37SlH+6CS6Jq
 7R3uSdiGcyb7eaW7m5oyXM+o8rIIRSKrvYchMljZbbFxBiY5XzatLdYL8FsonnSZBYsl
 rfRHjBeDcovNjytYwe/FG4MJ1ubfOfBZE6BTgF2gOhT/dE+cI6KYotCYcOhrjC0ZCjJs
 tG2Q==
X-Gm-Message-State: AOAM531kUWi7Wq2v6ODm6D6WCs/ry61KFxd639L7H5ElOGFZSEH/9afO
 aR86nCRj5Rh+rbDOJ0Jygfzs5dj2gVYjmg==
X-Google-Smtp-Source: ABdhPJyONmbZm7PP9/ISm8/bIvnyLRLiMe/dLJjCI7I2aBvuB+3Td7FxShCPzR3VNyeCAsJrvQU17g==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr42925718wri.188.1626887928352; 
 Wed, 21 Jul 2021 10:18:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h9sm22609104wmb.35.2021.07.21.10.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:18:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:18:39 +0200
Message-Id: <20210721171839.496782-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/proxychains-ng: bump to version 4.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/rofl0r/proxychains-ng/blob/v4.14/README

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proxychains-ng/proxychains-ng.hash | 6 ++----
 package/proxychains-ng/proxychains-ng.mk   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
index 9781b77af1..779f6b626d 100644
--- a/package/proxychains-ng/proxychains-ng.hash
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -1,6 +1,4 @@
-# From https://sourceforge.net/projects/proxychains-ng/files/
-md5 34d840eb184e96bff418201c28a935c5  proxychains-ng-4.11.tar.bz2
-sha1 00bc3dc18f2b638c79112c99f082a7a2878beaad  proxychains-ng-4.11.tar.bz2
+# From https://github.com/rofl0r/proxychains-ng/releases/tag/v4.14
+sha512  75a1a4629d2b7ebac9b909a694b395339cf669fa4e23bfcc57938e46377b5619f31c9651d2bc457d1ad10ec1be7747981106392bf8bf65999cb7bb9c748d7e95  proxychains-ng-4.14.tar.xz
 # Locally computed:
-sha256  dcc4149808cd1fb5d9663cc09791f478805816b1f017381f424414c47f6376b6  proxychains-ng-4.11.tar.bz2
 sha256  86728623caeff60e9bcc37e03b432fd191de927eed48a72a3bb4ac4e53fe20df  COPYING
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 0437f7d911..bb7c9ff687 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.11
-PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.bz2
+PROXYCHAINS_NG_VERSION = 4.14
+PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.xz
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
