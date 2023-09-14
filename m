Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84833EEAA6E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED4F600CA;
	Thu, 14 Sep 2023 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED4F600CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RwasXLouWWL; Thu, 14 Sep 2023 20:14:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C1B8612B3;
	Thu, 14 Sep 2023 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C1B8612B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70B111BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49E854185E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E854185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7eoe2kdtegs for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:14:28 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C67C403A2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C67C403A2
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-404573e6c8fso11614395e9.1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694722466; x=1695327266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJ1a4pRXw7ADowLHoZHZPoJjIueabUm+BXgrXywbgtU=;
 b=LiCca1U19hGWFHKAobYLeyGg60bCnlwG+9wfFOgD8v+Hf0JHV/C6Y5u7OxiIsaTS8P
 VRej+kuh5/9wvUssstJY2MkRpICY8140N1qAskiDRtFGBHVuae5XkyN4PueRjaLdl8G2
 gbFHRqwFGgeSWcHMyg8aj8to80I6PO0Y/40dPpMByPAHnyLryETqy707C97omM06/xUU
 MlUwYOvyqdfj4FSh4kfEwaoW4ZG8BJg8j47KGWUmk2KNP+AJZMP4EM1usIuGeMRe4TZF
 XI2raKtI5Bs0CEEN+Q6HxIbIPLdyYLl+dpZoBHQ8wh0Vp/TyurlbwLDzQS90AOifuC1g
 O9dg==
X-Gm-Message-State: AOJu0Yz+fV5HuZUcmzOaSvfivwdLTAbEr0Vdr9aofukTEMhL3l0IqRxS
 STOlwX7AiS7JZnJCc6Axr0M+qqSrfvA=
X-Google-Smtp-Source: AGHT+IFn1mXHzsucDrW/mY77FmwxTPu4BJAplaWxB7wtMu9D/aCgTi899Z4klmU6Z0KDmraJdUDIZQ==
X-Received: by 2002:a7b:c414:0:b0:3fe:22a9:907 with SMTP id
 k20-20020a7bc414000000b003fe22a90907mr5938099wmi.20.1694722465735; 
 Thu, 14 Sep 2023 13:14:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b00401dc20a070sm5676944wml.43.2023.09.14.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 13:14:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:14:19 +0200
Message-Id: <20230914201419.392136-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694722466; x=1695327266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iJ1a4pRXw7ADowLHoZHZPoJjIueabUm+BXgrXywbgtU=;
 b=BZUWAXnLOGmNqw7huGVpSTzeWvCkR1siKuP3lChnWwH28QQVYCd7RfGwpEiLrDvrno
 zAvpLnkrYDT+HQgpjEAA6KDp722fwrCOy67Ln+Th+ypYL4Bs83ARfWpsanONlD6lH5Y6
 R9ar2WlbDUEOcV5pBTwcpxJwCG+LRRkQ7jfiBV9D+6f5huucF87avCD39bubijiXpYWt
 pMvF2FwqV5IALFQ4s5tag1kgm99RLG+cLPyxScompcSs3sbh+EilHUkeYzWPFjX/rXZC
 vwNApsw3gHPNknZhbffTsVCkprMu2PWIRZbSDXGsSkAwDDlpCDLW40rXe9QGqjjTnypk
 boOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BZUWAXnL
Subject: [Buildroot] [PATCH 1/1] package/firewalld: add
 FIREWALLD_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:firewalld:firewalld is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afirewalld%3Afirewalld

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/firewalld/firewalld.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 4a13579fca..13edba6d24 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -8,6 +8,7 @@ FIREWALLD_VERSION = 1.3.2
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
+FIREWALLD_CPE_ID_VENDOR = firewalld
 FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
