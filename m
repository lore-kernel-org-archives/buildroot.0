Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50780C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA79860B55;
	Tue, 25 Jan 2022 16:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSNFYJAy1NCy; Tue, 25 Jan 2022 16:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38BCC608A6;
	Tue, 25 Jan 2022 16:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4888A1BF34E
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 16:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 443CF40121
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 16:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDRfzRYuqyip for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 16:39:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CB42400E6
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 16:39:51 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id u130so16031325pfc.2
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 08:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ds06EIG6SCKBnjtJEKWhNnKF+6Nvo0ri9sOMEb06/ZY=;
 b=Cg25jQiuZGgXUKUedX0yV3qM49HBe0bJsHP7HraDYp+0sqOr2CqG+W8MVUgasl3YIZ
 D+kPuAlmkBjge1R0N+nCdh/42FyDJALLGxuI+Lk9PfxE3GFsIoBE2aV1qrlEj9rFAhHc
 ARY0xHzaJXM4g/PaMu/ynkeCXVBL3PkvWrdNo1bErT7HhZpOlyc+ORnsZZba5eRo4WAD
 XJaKKGBCHJqw7vfbl2RFveYKdKBqnJqsIoKjaEyPsZXxo8AOlSIq6oWf40Zd4PKBXYYZ
 CrAAMNWedQB/J9soAouixkHqgoodXWtkOhKGeikJQWWqBF4uYEHj0kI+mLERNiKnm9TI
 7BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ds06EIG6SCKBnjtJEKWhNnKF+6Nvo0ri9sOMEb06/ZY=;
 b=kwhSHj2+VydrpEkCs39nNeSamehoxjmtW6Xwv1GLkONjv0M1j2mBbdUG2S8RcxCuAm
 QGUopD7AMOS6WBS3Q1epoLffJ9DkqH8pNc6ZsYqJ/n24i/DzQvS82GjQiQklbBje8xD9
 5KuZWGWElR8Apg9X78bmyhM/WvYG82Yjxpww645cJgGVL5hn+KshwpZrdW2wOGrpzGuM
 IwX5CyhnEcRuqEq6XjoGpzR39QGPvP6TLetgeTpluDQd0fRKGik+/1rMVadQabuF5tAO
 j52GPMvLI/rTPXFgkOycPzk9oHLvwKH2uuS9Lea3qoh54+Zx9ZU7aFkfpbl7dANH/yjn
 sOcw==
X-Gm-Message-State: AOAM533Yo0cTNiPufC99nuY2sClWA9x3DfTmlQrCSKU2IHpTMcRufnVN
 DyF0cUQOgubScdjvzWa6WrRYNpmW7TA=
X-Google-Smtp-Source: ABdhPJzS2chmxEhyMkuZ88uCX65Tdx33YdGQPAcjQwb8/9tI0cCsVPDCTawzeVZf1ZL8vF0IlUG7CQ==
X-Received: by 2002:a63:5b1d:: with SMTP id p29mr16036186pgb.266.1643128790837; 
 Tue, 25 Jan 2022 08:39:50 -0800 (PST)
Received: from localhost.localdomain.com ([12.231.12.194])
 by smtp.gmail.com with ESMTPSA id a3sm17256179pfk.73.2022.01.25.08.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:39:50 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:38:59 -0800
Message-Id: <20220125163900.269015-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125163900.269015-1-aduskett@gmail.com>
References: <20220125163900.269015-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/mender/mender.mk: add
 bootloader-integration inventory script
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This script is installed in the official meta-mender yocto recipe. Install it
here as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 61f872220c..2a601d2b1d 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -61,7 +61,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,hostinfo network os rootfs-type, \
+	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
