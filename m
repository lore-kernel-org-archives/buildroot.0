Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB956C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 17:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935406116B;
	Wed,  8 Feb 2023 17:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 935406116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9WyuP9WY2y6; Wed,  8 Feb 2023 17:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF5061166;
	Wed,  8 Feb 2023 17:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF5061166
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0F761BF275
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8A9982023
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8A9982023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqTI6OpoCnCe for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 17:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC89182028
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC89182028
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 17:50:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e3so822021wrs.10
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 09:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYI3V0LPBDIk4QEjduFTYhwGSRG1jmx1AUQGE145A50=;
 b=cNp6t5DwyU4lx+h1cORB2x9jRuD8bDud2HF7fOilr/KWfBTwMUtAZG/Ae39vwhUa12
 9Ckckd8DSgwNFtcPK1veC20/fPJ3TBxHjMwY50xUQmTgQEczK/LztLoEAK7Et/JxMqPo
 4D0m1P/a6GSfqmKg4yXfoQbbBDlbZCuYs37wFEv/ahULcnQMQdZ0i/V2xSZ7OOboUyup
 Pw3MqF1+DAx7vZQQ3BrBcXLbSM0W+xitAVE0yemyIUglTKji43Tk0tVrK4ir/dh55L2y
 MmK9FKTPaY4a/uDNAUTXYTPP7Hvprci0B+HiHdJOfuYIu2vmqpGa4Up7oDr57/SlJE5o
 b/hA==
X-Gm-Message-State: AO0yUKWVflTsTsRENFHhYM6+pofWZX3vpdyvqZTUwy270eVRM6m9cuBf
 GZe/0IOZXaHSbHp6uqog8cSTNJF8YkA=
X-Google-Smtp-Source: AK7set819OwfplO9yoJ94u5evjBZk9igGXraKtLWKHWv3kB8y8FmaDO9wRPmuNQiI9yWTe5v/8v6vw==
X-Received: by 2002:adf:dd44:0:b0:242:1b0d:9c58 with SMTP id
 u4-20020adfdd44000000b002421b0d9c58mr8079492wrm.69.1675878611864; 
 Wed, 08 Feb 2023 09:50:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c12-20020adffb4c000000b002b6bcc0b64dsm14081532wrs.4.2023.02.08.09.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:50:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 18:50:08 +0100
Message-Id: <20230208175008.88846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYI3V0LPBDIk4QEjduFTYhwGSRG1jmx1AUQGE145A50=;
 b=H/Zqx/JG1tWpz1JaIZJJ5VzusvN/OXZcto9Dy2RfnGNUFumTJe/36NhpV3Dtl8M4la
 858CrwOqlYQzmiIaj8Kd95/YAlLXVwPaPImtBs8Xy+e2JiPBNs15jCcmjmicU7vh1Vmp
 u6TniKRbqnvB9M3gkBkfqZFkZy5eAH9r8yvqIlKv53j2Y/vOjkafOW0/4dvQ0TsT46aq
 KLypoUOiuUUznonAmqfJ2DUu6uANutSFqXtaXwsKVQxZ0vbqd26ptgNeXypH6C1FEwRn
 A/RvGLCikVpCRkqdbxSBAWcu0ByZsqPEPSQGEJOYTz86NPfG2RwRkqdxnF+TC4didD+0
 GuYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H/Zqx/JG
Subject: [Buildroot] [PATCH 1/1] package/libsolv: add LIBSOLV_CPE_ID_VENDOR
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:opensuse:libsolv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensuse%3Alibsolv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsolv/libsolv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 144ce68a83..29f8a6a3d2 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -8,6 +8,7 @@ LIBSOLV_VERSION = 0.7.22
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
+LIBSOLV_CPE_ID_VENDOR = opensuse
 LIBSOLV_INSTALL_STAGING = YES
 LIBSOLV_DEPENDENCIES = zlib
 LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
