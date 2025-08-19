Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B56CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AA640CB1;
	Tue, 19 Aug 2025 18:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOLqmatuCS9a; Tue, 19 Aug 2025 18:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF67140CB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF67140CB5;
	Tue, 19 Aug 2025 18:40:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 504D7E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4232140CB1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkhvUtq2iGZx for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9134340CA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9134340CA1
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9134340CA1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:40:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so847999666b.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755628822; x=1756233622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nco9gahoVOCsHRMWkdG+0h2vEZWEAGzVbfbK0/C26vQ=;
 b=RE+p8keBtuEja4ClYjjnyQStsfGG9VgIHVu6hl2jInIppIz9NuwUnqMB/aWV8M19ya
 sjeRXa2o1w6GOrqdFrXb+KZ9zPXIOHcvI7RFHUONkZV0u4HvwMQ0oJBgja9Y8VwzQt1o
 GnrrrQwzUh892tKopmbnruYzDKkIKeXNwQ83xcM19VSaq+KtwntD1xIFIXaivvmUa4MV
 yCYirvLi6UkQioVv6Xnvep19noXWDjP8xz8fxaK1wohgpv04BR/XK9Dh2BkUcxBPuz71
 wcOs8pFoNOA8z/zpcYgz7IwihRTahtgAvGe0Ngc1xIQQsEjiU/Yj91EmnyuPy7EGbnAa
 Q+lw==
X-Gm-Message-State: AOJu0YxN6eYRTyCx0pc3hyxk26K44BkSq3jyoe1joUWuj0hH1h78nlAG
 yD9/Th+pCFRr+q68bmCmsTpaF48z+YD5dxC3i7NcTXtSQb/M4vBkDFLb/s0ciNSI4OIGppOa3u3
 YQXAd
X-Gm-Gg: ASbGncuN74lMHysVHfgMaFP/ej4DdWY6CgALWkpqjGwPoEYm9thkAnm85Nc2V7f6/0K
 SsKAhwZL4qnS5JvAJtlgJaJIckABQZcIRjIrc4D7Uuvav/Kd3PYuOX+8qwwre81URA1gLkefyKJ
 4kycgiESZGOvdkQlI388/RQ+5Y0BZPeE5Jn+8PfYbNn8yTKycgS59quGBgPiuGbpSArB/QeE70V
 W78pccVRxqd2qZVxvzU853fTxMkJDcAnDmUwNjP1K5Ou2dA2MQ8eEsMjN3SkIANe+sGpUjqyO1+
 GgLX81+Uo9rCM+S6aMlxGhacR21GPndMcYT32uDm/eAkvWng784yRtNTCn2Fc4siiJmeN/H0Ih/
 SWM4XDvw9Offw8xhP18MCq3spwVuQEwYtLcX7jJqT/PuvOJEIrA0TsIxVNgHgw3M45RZfXjY=
X-Google-Smtp-Source: AGHT+IFTv+iuS1my4YE1+0lZqtduHQbv8b/CdQdvoIag9ayfy1v/VuKAFLfghrHAgUB+XN30l7jYLA==
X-Received: by 2002:a17:907:c08:b0:af6:3194:f024 with SMTP id
 a640c23a62f3a-afdf003dd9amr1245866b.13.1755628822248; 
 Tue, 19 Aug 2025 11:40:22 -0700 (PDT)
Received: from panicking.. (mob-31-158-159-104.net.vodafone.it.
 [31.158.159.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4c9befsm27893166b.97.2025.08.19.11.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:40:21 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:40:16 +0200
Message-ID: <20250819184017.3018959-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755628822; x=1756233622;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nco9gahoVOCsHRMWkdG+0h2vEZWEAGzVbfbK0/C26vQ=;
 b=qryT/9utRsUXsQMRTQfrWEAcFjbURL/98ptrg/QjX9Aa3AGwdoLgPQeNIKK1fPcEhZ
 ATSYud9WR76UfEkFL7pisDEW/JhDonQ2NZfkiWAHaz8vSwp6qcso2VJVf2vahLjxrIdr
 xcZby3iAhiFdOvWNKr5XXxrQsNiTJgdv6o25U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qryT/9ut
Subject: [Buildroot] [PATCH] configs/imx6ulz_bsh_smm_m2_defconfig: Fix
 processor VFP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imx6ull is compatible with VFPV4. Update it from VFPV3

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 configs/imx6ulz_bsh_smm_m2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 22d6c6263c..5aa41b6438 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV3=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/imx6ulz-bsh-smm-m2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
