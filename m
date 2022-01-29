Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 14:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1ADE60D73;
	Sat, 29 Jan 2022 14:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bJCwSVP9aBX; Sat, 29 Jan 2022 14:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3887E60BC6;
	Sat, 29 Jan 2022 14:24:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA4E1BF681
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B54040337
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnkBsrKsSCw5 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 14:23:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B700040238
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:23:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s18so16400187wrv.7
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GunBrIs4iR/oKlliHBM8rSJwB0TwkTaL0vlHi/SLZ4=;
 b=eJqty6ClZjZd77eC9GsiXY38LMeQNiQk97o0VptBAheOq3EKtzBEfrrcxqGLWIBKHh
 bmQQfElHC5Q9M3D2n0tz2Ica8289x+j3Xsj/Qsp34KHKg0BRX39qub1Kml/9jNiYQ9+y
 vP/2fMMDpjz0PCe/LIoPFjPNYj/7Jlba9o0CSHazKoZ2UVqQzL40ZwmBFup/QuYpOIwM
 ORjWZcW/XFMkgS6mV9jtAz7jwVJfzsp4csGH0iVAv9sRQXY4QVyYLlLlSBQNkVq5FZS+
 +w4DI70sOzPq3pLTw+WQGpSJF30LQzChjvCaziTCxXorvj/VTQjf2Oe3pH4LEK4MgTKx
 56MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GunBrIs4iR/oKlliHBM8rSJwB0TwkTaL0vlHi/SLZ4=;
 b=RCtN8Nz/s6+hlwBsybUzkBa3+p6KUsGJ5hDRC9FS4CVBS0v58DTgyb1yJHdLClLsVS
 9Bmkb7zaHqTGWykiQNNCjD0P9cR1aY/DVyQfVt/mEey3c1HVy2TI2yAUdswphCx0ApFn
 tHBc+JbFyziqa2HaDiMswOkvy4Dm1aW4sDNRc0+FykhJAY41ndEpf0stZu5/GzQKByKY
 RC174QEInGZnqj3cK6TvrvDkJHKNqKWGRAHeXS5lY+v6mgG5qWGsu4fIMKtDJl2Ms6Wj
 m/57ll14CH/M6L8DQPHvHpxO4o3ABtzPjOmoRN8ZMuyun9O7AJF3sfmcO2dBl47UjCYM
 Ei9Q==
X-Gm-Message-State: AOAM532o/HudYI8WT1TBEO1eqo12Jx+Nj0TcuUOkCuV8DYdBt+6afM11
 hVxKXlt+xTViqmSwlM9AIDtL81lODCU=
X-Google-Smtp-Source: ABdhPJwAUXnGIsLCAUz7YURdaOb6gfDcI3tgTnOTdYEugLVnFKm5f7a/fC4ShmSRRIcw9P1Fdv+X4Q==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr11173484wrr.253.1643466235872; 
 Sat, 29 Jan 2022 06:23:55 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id m11sm4101052wmi.16.2022.01.29.06.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 06:23:55 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 15:23:50 +0100
Message-Id: <20220129142352.1197168-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/poke: install libpoke.so to staging
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Poke generate a library libpoke.so, so install it to staging.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/poke/poke.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index fed023e954..ddd03ae3b0 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -13,6 +13,7 @@ POKE_LICENSE_FILES = COPYING jitter/COPYING
 # 0001-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
 POKE_AUTORECONF = YES
 
+POKE_INSTALL_STAGING = YES
 POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
 
 # poke bundle gnulib that doesn't support the case where
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
