Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B77C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 16:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F02D410EF;
	Thu, 20 Oct 2022 16:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F02D410EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRedvVobMUsj; Thu, 20 Oct 2022 16:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A78694112D;
	Thu, 20 Oct 2022 16:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78694112D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 720451BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B30A42263
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 16:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B30A42263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEiR0VwDEqNP for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 16:29:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388FE4224C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 388FE4224C
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 16:29:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b4so35395625wrs.1
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 09:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVApL42XzYw4fEkky4214EhiYEwtypGdGED3PNvfpDk=;
 b=BBzoWWI0ecJZxg13Fh/OB/cC/luziL95eEfkeiMLZKMh6FN6KHwrF+3a1pp1aP7rk/
 cCM14HNhQxLniupg9tdKF5dd+vEiwTxAtkRSbCPEhkzomZPsVkkeanS2+n6n3sisZRty
 W+QnfEByBHU9wi3fcpB+I8fJ6eTfhjeYsKF8votdbPteewdw2RtTru1aexkBOG8HE9LG
 jz0EiWlUqzA3m+jIU156YGVRp7FDorngxm9l/P7hPoMolwj9o+m4Sdn94GNOmfhpXtpj
 qv0vQTUk7eeuyY6+d0C8iPVPfh0V17dA7OkBIAr3hSgMGrnWajb6YQjIxIkVc5jp3vyd
 OfcQ==
X-Gm-Message-State: ACrzQf3nUvMYkTdf+mD8ZjAcQCJ+QSmZp3BnUKZujUNg+evN7KNDoc/q
 evSTCusE8Zrgz1ggSBc/SL2VjFvvLFI=
X-Google-Smtp-Source: AMsMyM6vTrgEkotOTwfCSfioDNlGmk+ecT5p4C4bP7J274D77QZ40dxjuUIlbtd8jGg/NZiFgWGFVQ==
X-Received: by 2002:a5d:5410:0:b0:236:fe1:bb74 with SMTP id
 g16-20020a5d5410000000b002360fe1bb74mr2456247wrv.512.1666283340930; 
 Thu, 20 Oct 2022 09:29:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003c5571c27a1sm63464wmq.32.2022.10.20.09.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:29:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 18:28:56 +0200
Message-Id: <20221020162856.201351-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVApL42XzYw4fEkky4214EhiYEwtypGdGED3PNvfpDk=;
 b=jVRjRnRylsHKa+yH6/4yGowVdjcg1rRKbhoexK1nu+isDaP+yUY+ErNtWGH49LT8px
 mBlK94p+KIDovAAWnb7pjHXdtvTP22+pE2qCmPn1/ZwGD9i0BmvIWV80QZqjCeSUZ8R6
 YbyccyEQ7SLp2Fkz4tRdy7MFIzYnoMWNrcCreKKLgB6xSwZHmMfm/3fsPtMz++O7S4JD
 kttBAfZHNYhnyQNTPIJZiUEmBQ8J6La/95vPY8BuIY++a1nkhL560pTYvIbHD5j9I16I
 4YlzNCaJqzhI6ONlJ/Gp0NxmV8viZKxuJHWRPJWp5Xw+LG1mVUqz62AcBRZRhFncLWuo
 TcXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jVRjRnRy
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: add RTL_433_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:rtl_433_project:rtl_433 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Artl_433_project%3Artl_433

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl_433/rtl_433.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 8326caedb2..74a0b54a3d 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -8,6 +8,7 @@ RTL_433_VERSION = 21.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
+RTL_433_CPE_ID_VENDOR = rtl_433_project
 
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
