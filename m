Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D41CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2600041F23;
	Sat,  4 Nov 2023 07:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2600041F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RY71aRYvFMW6; Sat,  4 Nov 2023 07:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4874150C;
	Sat,  4 Nov 2023 07:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4874150C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380BB1BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DC8F4010F
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DC8F4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAeVobuMpf3m for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:09 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F262E400C1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F262E400C1
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32dc918d454so1633898f8f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082706; x=1699687506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BD00wohrS134kareyAj24Pwhjx+Y93tWEi0gryHLw4Y=;
 b=HdBh++kwvdEDRK/AaESH1s/gPUItcrEeoSNJvci29d/ggN2NWC9+eP+cX8e2/cE0GV
 3mgjO34qtPSKrNdGGj4aXoiN+FC65svCEp7ltfM5hmsN7eXyG53Ib01saLop5lzSi6gx
 H6ZQl5BoacAPEroncRTEYN/41LkzwWYiQYO+T376qeJLoB/X6lAzJuA8GMmdVVPiRoNZ
 0R2QLpC4WmMFUC3gJCaIcvCixr8ZSCggsTkukp+bUL51ZEuKhpMNoAwfU6SvCLXLufaO
 TcJqjFKuFlGrMDK8/hFS8odL8+QrWgSyemMRRMvPwNNakDZqygMV+X4eA4LTCQjsGDxP
 ZW4g==
X-Gm-Message-State: AOJu0YyxkqSraevTMn/vB0C00tGCM6Hj2ILaj9krQaOy6qoD78fPCxhR
 qhdrmfwfwDDBJtP1fpcFR/2+z8r4oINwIhoJ3ff++g==
X-Google-Smtp-Source: AGHT+IGBy2xGbAZejwwjN8bUwyH++ZdlQFCPjlXlioXPsBj4o7ckmyBSw3MYyoCEom7JWTVpHxF05A==
X-Received: by 2002:a05:6000:1ace:b0:32f:908e:c7de with SMTP id
 i14-20020a0560001ace00b0032f908ec7demr11961115wry.57.1699082706122; 
 Sat, 04 Nov 2023 00:25:06 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:05 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:53 +0330
Message-Id: <20231104072458.7369-2-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082706; x=1699687506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BD00wohrS134kareyAj24Pwhjx+Y93tWEi0gryHLw4Y=;
 b=FaEO+L5waKixK/KFofXUvumL8XF2IjHuwJeX9Thx2mnJMkH/7TdmqDBPS6MXSqYIBM
 ka4nos5nPOXZcd0ZEjod+l140KhRfxF74iQ9YtVr3tZD+TEhvmoMjQqEQpxIw8aZz/T6
 VorUe+zP1gNznlRTf6PiKabdh/kkYH9Dr0cB1DTlbhB8jm+5+AXV+PR/eIO5iBKzTsji
 TPr9LxC2GB9WIpVEb5w3Jli7jDxc29VWG9+oOoiITn4dkdzld9UZHHEPYN6WXNp0Rcqr
 k8GEmELsgClf9BwKXgDFrvB/1hyZDvBFwcm2hoT78GmcJQxnPafi0mVxvKIo57WXno8G
 WRcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FaEO+L5w
Subject: [Buildroot] [PATCH 2/7] configs/pine64_defconfig: bump ATF version
 to v2.9
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 configs/pine64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index e2549628ee..8d2324260c 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -8,7 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
