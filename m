Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B6C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28701409F7;
	Wed, 27 Jul 2022 12:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28701409F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gQK50suUboO; Wed, 27 Jul 2022 12:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43344094E;
	Wed, 27 Jul 2022 12:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43344094E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B73341BF372
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A085D80B72
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A085D80B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CucJP7g4DB9z for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 12:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A3D780B6B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A3D780B6B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:28:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so1121385wmb.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ey699JGM6O8kAPJMTabwd+tp3KuO6wqsMOryvc5JTXQ=;
 b=oqfUKl9HccYnt53rc8zSoPagH2Mj9dkzxXlWTGNvk38OOjODICli8I0t7cpIn6TUsn
 LrLPW7yOFQXldlDDZEi5KfrL3wzFM1gqj8Bnm2OGvNBoZ9UNRMkq0E/NSiD5rCkls1X4
 ArDcgTXV4i19PfKhBSgjNtMukpPI/4af73z1949S0Gi4yHLGReGC0WX7Y3HOdTcqvZN3
 31M2/EntTqb/tToAQ76qWKtk/2RH2T5l8FxZRHMFHKcPASIF1MT+isq/4P7jVQR6hBug
 lyyjwrrEK91rtVRDfd/QlUiAXm+zLN9IxQXXuE5Z+OoHXsli8ZgCbZd7G7uY80dOoegb
 +7UQ==
X-Gm-Message-State: AJIora/J6+dnKFAEvZ9mf9Pgj76GcLvJ832ZM4fcv/ZKkHBzvsAI89mt
 1EKqf/Wx/ioITiVAq5HjPAppNywoIfg=
X-Google-Smtp-Source: AGRyM1sc64JOl/w5t3qDqX9eWa1rUO6h14it7IPBuTWUPhKdDiY1p7jm0lZpwe/3rNDLfw1LocamIw==
X-Received: by 2002:a05:600c:19cf:b0:3a3:1df6:af0c with SMTP id
 u15-20020a05600c19cf00b003a31df6af0cmr2940587wmq.37.1658924912301; 
 Wed, 27 Jul 2022 05:28:32 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 az13-20020a05600c600d00b003a32490c95dsm2234441wmb.35.2022.07.27.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 05:28:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 14:28:29 +0200
Message-Id: <20220727122829.1180226-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ey699JGM6O8kAPJMTabwd+tp3KuO6wqsMOryvc5JTXQ=;
 b=leVB0b1ihlCdVvG9vfHzfoGqOJb25XHxvOs1e4KcnXuNKzHTBfd+66u60x1+Jq4Jyv
 ls4nQ24CS8CTVzVQWanYUavcuzlq6l0SpahBUxgFOSUQxl48ZAaDBCROAGaS5htia2L8
 vIJHVcUXSNToegUTeRwBwd6byZuDy6oDc/jcaG3zmsTkhgImFsxS1c0DcWPPwJkxMMQ1
 lg7/XY+6505blqEO8wpptjIpv85nlt77ZhystD82qW+bBeNvv6T3bS+jqhJZ04zwT3RD
 I4fLSYNL8GXc8s+u1I7BV4PyJymamHFtXhSm3LjCHwK7bjyqKouURkNaf8w1xrOLto0Q
 8WoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=leVB0b1i
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.1.0
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
Cc: Julien Viard de Galbert <julien@vdg.name>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of gpl-2.0.txt (new line removed)

https://github.com/OpenVPN/easy-rsa/releases/tag/v3.1.0
https://github.com/OpenVPN/easy-rsa/blob/v3.1.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easy-rsa/easy-rsa.hash | 4 ++--
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index e363e570df..e304c367fa 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,6 +1,6 @@
 # Locally computed: (after verifying gpg sig)
-sha512  fd2cde4725cffd60c6af1b6aeaff0dbf15f31f0f322c9df75c22838e2297ba9dc3bba610d956464c8227bd74b3e63840e2a3da41fbc5ee1c79c1e7f5350adc94  EasyRSA-3.0.8.tgz
+sha512  be2dedde19eaf923622da61db34ecb2e926b3f15a60a0c3d9858d3126dbe3b4af9c0f6674f964516572b50611ffd1d254952f27dc5de867bd7a67474c89be5f0  EasyRSA-3.1.0.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
-sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  gpl-2.0.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 4ec011e179..7c32c1d83d 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.0.8
+EASY_RSA_VERSION = 3.1.0
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
