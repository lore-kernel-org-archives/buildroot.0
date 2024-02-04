Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B96EC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 329C281975;
	Sun,  4 Feb 2024 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 329C281975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEnuUddCC7NG; Sun,  4 Feb 2024 18:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E17C81970;
	Sun,  4 Feb 2024 18:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E17C81970
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9078D1BF368
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7636660AA8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 18:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7636660AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrsLhOF2bgxb for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 18:25:21 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59AA860A9C
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 18:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59AA860A9C
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fd446d4cfso8421375e9.3
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 10:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707071119; x=1707675919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHhp0hmAkfryIDeN/KSCfYKEGX43NUdLnrShHkRTZus=;
 b=NU8v/+2/kztNjtx+LDb/PNVck6UVGYKCzHG2EhzLMz//Oycz3jP8UVm5SnMbCdkDtm
 mE/K+h13m5k/VHboUJ4uUasAwKUky2Dtqz2k1sdjzbqsA21jKhc7Du+dUNWlhUqVOfGv
 3ujrnaClsUZiNcK6nl5DmFk3mkgaNUOsI79PcpAMnTyYGSsGN4RslsGaOVyauPPJp0UW
 /Qw90vpTi5DTQyeG53tt0GVAAm/QhrVU1cMm13C+JbEfCAf72g6FyUo8+QPlzO+feoHv
 OvNl6WNBnExnNBh7XebxWfHPphbssPHghcn0LahmpFYTAFg0shvi+vmQqD6PG55+HCse
 cVdw==
X-Gm-Message-State: AOJu0YxUhW63Om8nBKwzHNozteBvklxZYyGglyXcxRu6zT96gebzYpVt
 9f8tSPx2tAMZNWMxGsI7cGyGdk/UVIes8C94cjIHjhZXlLoxdui/cgx5qaib3Mc=
X-Google-Smtp-Source: AGHT+IFRKMF0TKTmCzyanL4kkrlTas1rcl0OuleO8cjrcA70WRxLNhskt5KbD2TeDN9TwHJrHT4gRg==
X-Received: by 2002:a05:600c:3514:b0:40f:b770:fa42 with SMTP id
 h20-20020a05600c351400b0040fb770fa42mr3183460wmq.33.1707071118427; 
 Sun, 04 Feb 2024 10:25:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b0040fc76ed923sm6383565wmq.6.2024.02.04.10.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 10:25:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 19:25:14 +0100
Message-ID: <20240204182514.1663508-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707071119; x=1707675919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vHhp0hmAkfryIDeN/KSCfYKEGX43NUdLnrShHkRTZus=;
 b=TzkJRnvETAO9861JVsMDF9Lshc/KWB2ExBcTiyG8+CN2Z2NeLVkxz/QNSxO50pcTgh
 HWnjCPwBlNRP/frlRjYJPwJM+CSfCaHWk7KkIiB8NyFwSIDZ8z2zftC3qw0sBFquNRmJ
 E5+RIcHLnZOqFGsi1Guj+JtueaEzXoE1P2BnMX4LquUU+sm0YSYneXZNU0plbEm1M+zO
 gbJjrUuK/B1CJZlXWBmx7AVBTdMF9Sej6yrJ2aaswxP1j2Lct11o8tc7et0y7A5b7OIP
 Azk5AOBZncYIqGJEakGb/Qwl8pl5UBFiBbg7YtjEq6ThcnpAdAsaxUjZlslSjjCpK0h1
 nMrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TzkJRnvE
Subject: [Buildroot] [PATCH 1/1] package/yasm: add YASM_CPE_ID_VENDOR
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

cpe:2.3:a:tortall:yasm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/2E6C9C2F-A057-4083-BC90-095403EF138E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/yasm/yasm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index b294bd3aee..cdb8e15bee 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -8,6 +8,7 @@ YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
 YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
+YASM_CPE_ID_VENDOR = tortall
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
