Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D288C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCB1040353;
	Sun, 13 Feb 2022 15:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrnW4VUp5rFc; Sun, 13 Feb 2022 15:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066B64034D;
	Sun, 13 Feb 2022 15:52:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDC9D1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBED940360
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f17Lzf5uUDNy for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9E28400AF
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:52:13 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id k10so16052637ljq.2
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdyFDgZEv8o9Xozk+3gKRJrqLLuAVp3WhWSwDJJOqBI=;
 b=M9CRA18BrfvvgOauAb+r/zSZkI5vIAicBvRN5fhX0eBcbOcyhEh67pZIXGMEnICC5F
 mARZCqSuyxnD7PNEDzH+6dpE9RGtY7O4UTiEiA+D1x6DOV+YYMizxDLaKKpRFcQ/FUOO
 fw3na1I/EQ2QIKbL2ZGz+7QI7CV1f0UcB2Qq64pm8ZHOtRRNPsBLnrc70VkgXlXiIZa2
 veR2tBheKb3yXDvU6VnZbhISvPgSdv6e+uYJ20Nq3dWA0jnvuQmvyf+olaNnta3Jkaxs
 XKPYcLPIjMyRTWylCdlaVZamCSQHBjwJZ8LE7+8AQk7WGMjMACayy+lvG4o4mge3+ZId
 cDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdyFDgZEv8o9Xozk+3gKRJrqLLuAVp3WhWSwDJJOqBI=;
 b=PFTk55F5xJ80sl0jcI384K4WOM63OWWX+S04126xdHl+sRbItyr65UnAIOWG7HE/Uc
 pZ1ucICZQ6URCHW3MaDq284fpBahZG5hOHvdI0ote+OylGk4gPvOFcQW67AKL8FNfFPU
 VAxeH8ADkTh/GbPlsUEpfMK66VF/59aiiWuoLNK/Lhxsto/Pfy9pL8xOZ3mlspAmt/+X
 +KL/p7ujXVNxPtKlMHnbAVYTqUiQQzSlGlYsTHAUoswgaxHQty/xhjyz4zVWhE2FnQdT
 Y2LCaGEFN0GoDyTQSYK8dHWmgS2Lslb/AuveRlhXNR9vy8Ih5oiTjE7taFVVSZ5Kmjve
 rrrQ==
X-Gm-Message-State: AOAM530HXF8501NctXLmDCtiiN6HXiMeswaVzwo4D7bXwFTmRs6GXhQm
 WwQNJDQhPh8DRPSGElLWarD3RpQTqFI=
X-Google-Smtp-Source: ABdhPJwtBNpwpiz/OnBoHKZaEGJ1xjAhPBP8+xKNZ4m7oEHxC5jL2q4KVVXfsm3/95tILsHPRun/Mg==
X-Received: by 2002:a05:651c:d2:: with SMTP id
 18mr6342661ljr.399.1644767531453; 
 Sun, 13 Feb 2022 07:52:11 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id k18sm1935723lfg.217.2022.02.13.07.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 07:52:11 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 18:52:07 +0300
Message-Id: <20220213155208.560001-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220213155208.560001-1-geomatsi@gmail.com>
References: <20220213155208.560001-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/hostapd: update DPP option handling
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Makefile hostapd.mk defines different macros for different defconfig
options. Options that are not listed in defconfig, can be set using
HOSTAPD_CONFIG_SET. Options that are listed in defconfig, can be
enabled/disabled using HOSTAPD_CONFIG_ENABLE/HOSTAPD_CONFIG_DISABLE.

Starting from hostapd v2.10, option CONFIG_DPP is explicitly listed
in defconfig. So it is time to switch to enable/disable macros for
this option.

Fixes:
- http://autobuild.buildroot.net/results/3f8058ee6f3913fda795578f206db895731ba1e6/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/hostapd/hostapd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 075cb2a8d0..2ea6e0312f 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -84,12 +84,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
 HOSTAPD_CONFIG_SET += \
-	CONFIG_DPP \
 	CONFIG_SAE
 HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_DPP \
 	CONFIG_OWE
 else
 HOSTAPD_CONFIG_DISABLE += \
+	CONFIG_DPP \
 	CONFIG_OWE
 endif
 
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
