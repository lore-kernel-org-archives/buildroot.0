Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18251C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7C5415A9;
	Sun,  5 Feb 2023 12:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7C5415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uqRbqY-v90h; Sun,  5 Feb 2023 12:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866A3415AB;
	Sun,  5 Feb 2023 12:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866A3415AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3132E1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B7F84010C
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B7F84010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt9JZxhO8SVV for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:40:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E809640106
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E809640106
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:40:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a2so7903798wrd.6
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 04:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNRIUVf7u5cNFT5XjY0xgTQt3DcM+0AtRuOk8Fsxi2I=;
 b=mufi0CsBETOYFM0NZXegjaxeqcufASR0WfrYmEy2Eks5Hwj7osudmSkcWVa7C0pS3r
 vsGkkuuoAt0K2M99dfrT1LsCdlljky2/LTiNt43in7oTQ3KBN0er4R1IRcYp95JmLb24
 uDCAvnrYYw3G5FXYZZIGc4ftf5gNUtBH1I1jKE1irwOR4To2gyJ8iOMBIsiO5+uckifd
 XNrucZ14Qwo+RRhV6ClFPqOI+huWWvKV0i8AekerJ0KALcDk5ObXJ1w44iRI0OBQ5cDP
 Ia4UMnDL4HYWxz/XFnz/0mcBG9GxTYJI9F4Qz7LaBCvqKV/kYUO7LkkJA72VeOP53wnO
 AmfA==
X-Gm-Message-State: AO0yUKV4S2gp4uTfOJjrI51lhqi6ox9dWHtMMP7gOKDjC/uqtPH3+fKH
 2d5h4tXyZ78dYaj0kxFF4upbDieM7IA=
X-Google-Smtp-Source: AK7set83yz1wchLWI36NYnCRCwFNS7Phf5mnZIEdCvvCnDnsLX3+1Ln8Q8ziSYk/qGs1Zp9SnljWkw==
X-Received: by 2002:adf:f946:0:b0:2bf:b281:1bbb with SMTP id
 q6-20020adff946000000b002bfb2811bbbmr13242730wrr.36.1675600852780; 
 Sun, 05 Feb 2023 04:40:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o5-20020a5d62c5000000b002c3e1e1dcd7sm2938068wrv.104.2023.02.05.04.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 04:40:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 13:40:49 +0100
Message-Id: <20230205124049.5139-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jNRIUVf7u5cNFT5XjY0xgTQt3DcM+0AtRuOk8Fsxi2I=;
 b=iHRaEmzxgv4T70rJmaF23gN1TQ2FY3VbRkswpv0FA9+Z0FBK5wqHOZZcRVex3Fw13A
 pIkhnz50d2pau0zPS748cr/5aya+AFoeVYwbqFCR88Yas7k3D9STKU5sjBoIJozPY9AY
 E9uXM35vJPDgKwfE1fLWmGvXOstQ01sA2Fnd5VSDNDobP/dprPuPvmVGu8JB0sVqffvk
 NfKHWrsVVepoqHjFLs/goyfSUvDuBqAqcJJLYAyzAVzXl2gtdLYO9WWJA2ztarmE2c60
 8SBh2AaAcWdGS6wJivfdUNIHEBudXT+SF5tXps03qZU/dmPW8LWP5/Dsw/93sdPGmLAb
 sJ6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iHRaEmzx
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: add CPE variables
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:treasuredata:fluent_bit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atreasuredata%3Afluent_bit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluent-bit/fluent-bit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 6e9a33e02e..879437e5f4 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -8,6 +8,8 @@ FLUENT_BIT_VERSION = 2.0.8
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
+FLUENT_BIT_CPE_ID_VENDOR = treasuredata
+FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
 
 FLUENT_BIT_CONF_OPTS += \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
