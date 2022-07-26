Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E0C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 323B56077D;
	Tue, 26 Jul 2022 20:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 323B56077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fealL5xMtxuk; Tue, 26 Jul 2022 20:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A366072A;
	Tue, 26 Jul 2022 20:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A366072A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220891BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078E660608
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 078E660608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpPJZr1ZmjmC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:00:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCDBD606A9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCDBD606A9
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:00:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u5so21573975wrm.4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBv+VJZXy9eIFInTYRb6PBHYpF8UNbINbv1E7emX3Fk=;
 b=hAfMoKV2YA5y+yS/H47vihu0YHbxABzKhuRaGAUnpeow8LXytQtPyhQ1Vwjfa4da7r
 G4UOgGd0N6YqhHhzgwSie4tbiX6+J903USlXwK/y4OhuzzbxP6NO4RyUvfRWF3fBx+1+
 Sa0Khrsv/ZTeDxAvV3RkSnjLj5SdQaSDJ59rr+TRPDIdhByYIYSKcBeTmP2Rde7G+DRu
 Z91j4zRgo2rBQpKwGcIgjRaoHd79UWbWva//2OgEaslSpPLjHXTSx89HaE7fJi7fBW7c
 xW0dxfIeRlnfONu7DwkyZ+N0C0qi8p7IRr08XdOnCp9Xy//3nTsVV8K3/54O0I0LrID1
 v2/A==
X-Gm-Message-State: AJIora8imRd3xgvBzjubOW8TixEHMGdTfE1o4qggqr27/9o+HbmGGmy3
 OJ5GbY6xKoPJcb8WwRvwDo/KB5iCycg=
X-Google-Smtp-Source: AGRyM1sWWOa+dBV81p0bNu/yt6WmHT+UNh2kNAYpvQi7kdtwA/U+NnzFBonZ1IyEAdX16FxWOPOzpw==
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr11469381wrf.659.1658865633659; 
 Tue, 26 Jul 2022 13:00:33 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5301000000b0021e5b5a68f8sm16903083wrv.45.2022.07.26.13.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 13:00:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:00:29 +0200
Message-Id: <20220726200029.45380-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBv+VJZXy9eIFInTYRb6PBHYpF8UNbINbv1E7emX3Fk=;
 b=k/lI8uMccQXBbta7KrFa9mKx+X5r4JgclwETKP0leC98+1l2D8M3hHwpXgAnUVAEno
 UC6H+hAADXPOx77n4W7cEwxtQPJVL12RkhuaiViu5plYpiT/GbvoS+TKC95SQkkSGcOV
 g4G0JveajcIVSsWeZ1gk/8GpEqofDWVbtw58g7gNL0aL6WSZEFgLXPWUSwUkNzvp0FRs
 P21gV05XkC48UBRUXiVxQ+JWduvg5ZMfdXc9tYpRigoAHLIHs+KyY/YfQ8InMdYxSvwA
 JQUKN7x/6mHVy4rXXjq1yF83OjdZ5VrnDvBLW+uugnzIgCgySksbp69DR+S7HnkaKODt
 0kZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k/lI8uMc
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: add CPE variables
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:freeradius:freeradius is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeradius%3Afreeradius

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 04d8685813..4c526d2342 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -8,6 +8,8 @@ FREERADIUS_SERVER_VERSION = 3.0.25
 FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
 FREERADIUS_SERVER_LICENSE = GPL-2.0
 FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
+FREERADIUS_SERVER_CPE_ID_VENDOR = freeradius
+FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
 FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
