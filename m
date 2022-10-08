Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B094C4332F
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 22:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C5C40386;
	Sat,  8 Oct 2022 22:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C5C40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OziuqsNc97zX; Sat,  8 Oct 2022 22:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6ED4033B;
	Sat,  8 Oct 2022 22:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6ED4033B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 185F21BF4D7
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E801060AF1
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E801060AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeIKCyNkfoFI for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 22:19:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA2BB60593
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA2BB60593
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 22:19:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bu30so11965783wrb.8
 for <buildroot@buildroot.org>; Sat, 08 Oct 2022 15:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G15fNJvtszX1QzG8apU666GhZlfPK/Ki7hHxAhJ8YCM=;
 b=qGVCRMKMap+sWHPSh2futAnm/bsKcPJOPUdQUl4j85fA5OVGP+a9G0qvNWdAgwHga+
 zSYCXvSvoyBVcH6SrO3A/sOFDCC6SRU6j1wZNR12s7eyQ/4imLD+9/O8EIFFP4SgLSwy
 uhxoF6PL26HpOTN6dvIAZJSfNJVAg9Wk+kI2KfQ8Q43sBCf3XV44GLB8XIXztPKlsh+r
 +c8GWacofd/imKNkzxy3ye2tnc30ZQ2Zm6J1evalHQTUdnaKQ/SslM7LKOssOv1NaUhQ
 N0R3qIaA5PSfz44cTkGoLGHFnyPoR0xtczZO8h+iqF6M9MsA/fLyWRNRLqDDitmQm9es
 r7Tg==
X-Gm-Message-State: ACrzQf1Fwd13LWr/XkyibRK/y6oEVO1e4lsycUQ9Q4DuhTox3XwVYov1
 oPclgdywK+ZQwXq0DIoL+NZLHQRiyI8=
X-Google-Smtp-Source: AMsMyM52NY/UOx5SYy7cofQgOhxB+a2g3cpxYSuRydJGXr/4LvpVl3wkkSKebaLrR0/8NIBUzQCGrg==
X-Received: by 2002:adf:f0c5:0:b0:22f:fef4:7746 with SMTP id
 x5-20020adff0c5000000b0022ffef47746mr581727wro.610.1665267554788; 
 Sat, 08 Oct 2022 15:19:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003b483000583sm5963026wmr.48.2022.10.08.15.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 15:19:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 00:19:08 +0200
Message-Id: <20221008221908.156459-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G15fNJvtszX1QzG8apU666GhZlfPK/Ki7hHxAhJ8YCM=;
 b=OQxQ99A2UOJtvjq0HjUz0SoTHJS30V/oc5RjXzcTDN0IAC177KhBeXN5SkQhrzqdCf
 5rkRPsgKoD4LZu2iby59Yx9R4IAU5PRs+2rvhb3C2n3HhCVP8O6LP3TBYEbAHXXwr/bO
 ylr4cwMcsJ1SysWYLVG3AiZSA5xoM0gfTIuvzHCeMce9uDfCoSBz6ZoTPtqm22XnGGxz
 RP5c0sevfwT7AGs0mPEqQfxWJNU8vgAlZwPLR1wLw68jcactF9r7j6F33NsTZp54Y7as
 cXhl0GHO3iPwkswXiSlity5ILlGKfKFHA/F03JnJErrJWdcyfnhaPo4ka0S7y3QrLVah
 40xA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OQxQ99A2
Subject: [Buildroot] [PATCH 1/1] package/lrzip: add CPE variables
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
Cc: Sam Lancia <sam@gpsm.co.uk>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:long_range_zip_project:long_range_zip is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Along_range_zip_project%3Along_range_zip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzip/lrzip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 409d9912d8..27d9fde204 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -9,6 +9,8 @@ LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
+LRZIP_CPE_ID_VENDOR = long_range_zip_project
+LRZIP_CPE_ID_PRODUCT = long_range_zip
 LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
