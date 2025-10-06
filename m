Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C751DCCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 16:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B3C40DBD;
	Mon,  6 Oct 2025 16:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOw8moTX_Sdz; Mon,  6 Oct 2025 16:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C6340EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C6340EC7;
	Mon,  6 Oct 2025 16:47:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEA3272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0084641047
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYgrX3fTmfd5 for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 16:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E56ED4103F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E56ED4103F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E56ED4103F
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:47:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so961587466b.0
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 09:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759769237; x=1760374037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsJeNQ0V/KSvP11yvVNRxByU/Wj+dNSi+laE6I43Dk0=;
 b=vo8TqOFEpBHnW8KCtaljXv7WLdxmVNEsDiLeMt+5xAGWVXYw8oz66A38+c4u9i2gmf
 LZUT+gUfkmRWCFFDp7dBA1O3rb+md0zKhXM/+5kDLAEoC8GjEQE7vT6yXOekQnY3/0WI
 7+b8UcO6/mE6hapMPH7DbQYa3qhvKmdqS2gXNdO/ys9skfvcE+JIA//JCxWPHTUBzS15
 /1sABMB+F63VGTvArBpaJSQPXRDnMuKEYBSFKXJk9X4yHnl8wkU5kTOt1ZUldnLYkLix
 P6AjOEjV5VLEgoCnJYvCFemVg9gfmHDBsy24uC0Bvbkfe31/GeonKOvsQyyh0tFmULiH
 Bncw==
X-Gm-Message-State: AOJu0YyiNND0PxTJARpWTSy2tciPRy6ymGAs4H9g72C5QNHdcpOMsEnE
 lRIpQtRMI5D9LEFyM2wgRBMZS1jPB+4IDjdyY86TH4mj2BJN4JN4z8M2VWqVdDcFV8gy5JKmU8c
 lKeWpyQ8=
X-Gm-Gg: ASbGncvmAc1XjhwcPEPV1izBNpL8AjDmqdtR3NZ2r2QxI65mxtCu4sdacx/xAS2+gPS
 KZY6fLG+vU7RYETX4AcGTKSn4L0XOmnuEqHaxnEy4wyMUVsmEs/URZrV2BpvPLmnhwdc9YRmavs
 egUEeys2gICkbE/1nnoaB5OmMqS+cZr974iTF/gdyOzRRL4Q6HmVPK0UIDhEXbQDGb/upI392fN
 4cfH2+l6tAklEyBHYH7G879PDc1P5NhXkgWU6CGVPPlI/B2I54cu2edT+3G6oIE0Tn1hXbpoGxk
 jhVPMgyar3xgfs05aGoZp+GxWrVCQ764ag3YpPslj6Tgq6irlwlZ1t52sQqGMtjNxTpXXEgVSRl
 3Ge61E298+acg0+hyzmyNkymXPbJyVhwkkhFCojm8N8KQYNq3Eph+4a9Xi+6kN+yO9APBr8N0FL
 zBCmFsxbzZhyLouYZ6I2e/nDCOMtaRpUz0UJU8Haqw8Ly99huBnM8nn+SVUtMS762SMWaACyVqX
 zHwcnWALNaugIlUDnQt/icNBA==
X-Google-Smtp-Source: AGHT+IGpjFZ0tXuZvlhzjXKEyx3SjB1NLbx4b4k24SQVuA1cLM9KUhi2eX172zvuFrvEbK5I2EKuiA==
X-Received: by 2002:a17:907:2d22:b0:b40:e267:93dc with SMTP id
 a640c23a62f3a-b49c2958624mr1641733966b.24.1759769236551; 
 Mon, 06 Oct 2025 09:47:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b408sm1171100266b.58.2025.10.06.09.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:47:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  6 Oct 2025 18:47:02 +0200
Message-ID: <20251006164702.1885888-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759769237; x=1760374037;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsJeNQ0V/KSvP11yvVNRxByU/Wj+dNSi+laE6I43Dk0=;
 b=N1DB8SinvamRaI9YcXcIzeBwVmfqKeveaf55zxXQS2fYbnuezr3jdN7Zf7nNUpGrj+
 j3vukC9wBq4e7Tv115Ul6TKHfsE9H63W5wpW4+u2F340H9IusbBnJhF++tMAHd7ZXeeH
 uddc1WiKBn6zlShOeRFlovIAM5noo/853ThWE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=N1DB8Sin
Subject: [Buildroot] [PATCH 1/1] package/foot: bump to version 1.24.0
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

Release notes:
https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-24-0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index a48fe74b2284..fe058c05befd 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ae0f56a375342a88e94ee540b87dc77147737b24a21f77c92c84fed788e2942  foot-1.22.3-git4.tar.gz
+sha256  6fb18d482e2ac6a1d8ec293bbdd144e4f7f3bbd0302e9a8b60141cdb02b1aa6f  foot-1.24.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index a09b61d71718..055adf8bceaa 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.22.3
+FOOT_VERSION = 1.24.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
