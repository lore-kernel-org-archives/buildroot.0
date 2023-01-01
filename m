Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AABBC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EED3D40616;
	Sun,  1 Jan 2023 23:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED3D40616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kh5VKU4XgUff; Sun,  1 Jan 2023 23:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37A8B40613;
	Sun,  1 Jan 2023 23:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A8B40613
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 074081BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56F2405D4
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D56F2405D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TncZFFN9JK-9 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F820404C0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F820404C0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:07 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id s187so23797876oie.10
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLcFw68wRKETexNKSCIRGGxHoOKTuukL9RkqdauCszs=;
 b=JL+VmRqGv7iiRaTkaFj/qCOPcMJkJzEfAbixY8wtUVOnYYGjsB99EXKV7JynZ4D5ZS
 LBYvU8h9z/yLOUMB7qeONjMZdYYvr77CvhJwQCYeXMqYe0YMXm4otc9PhMxq49if80h+
 dhx848bOzHzISHiOiDdiz/1tDySg1OSM2F/886hoz5lbJi8YllZ2blNS8pPLjbI6L6n+
 e/dsyVATTgGHS5NcNMWGBBQG6h+v/N33KWCK33/5C1QaJT9kzXrGUqRALZCp5uOidSfE
 F9vBNOePG3MXrtaWtiw0YozucUYScTaHNp+wA5YX4Xv2QjmvyLlYuss5d0gV62GTYkSU
 XudQ==
X-Gm-Message-State: AFqh2konEmg1T9UJYm3Wi/n6FcF32wACBIm7Pu+UgBwxwGiQNeHopROp
 UKcO5Own5E0hZZvrZt8bV3Pdo9rmPLw=
X-Google-Smtp-Source: AMrXdXsLrMC0N7qr8M+zp32pA39ganaEHRY9QYsqEZf2zlM0RmnnY1vl2jGeOFyh/AUs1dD1B/6FnQ==
X-Received: by 2002:a05:6808:1a0e:b0:363:996:54c0 with SMTP id
 bk14-20020a0568081a0e00b00363099654c0mr22870382oib.48.1672616406293; 
 Sun, 01 Jan 2023 15:40:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:05 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:48 -0300
Message-Id: <20230101233653.487175-25-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLcFw68wRKETexNKSCIRGGxHoOKTuukL9RkqdauCszs=;
 b=d+5DK+eUusLFRk32unyHDSEZTj/taJnr0dv6KxlNQ5+ddaV2eeuaw7Gsr0q8qOamqs
 J+ySfvoJ2dJzCCTwktrpSV+wNpunJ/YUTmnmuhp7zYDZyE39ujyDak3yOQKXNtOeHgib
 3sQ7xMv4IRa61zzwfKtaUINZ6FFTz9Tc9uPQhsru/uysFxkcPvOUAoXcFq5oT5Glc9Gz
 o8Ex1LNgcEyEr0sjskPvQbBT4DuuzfGwNwxoH48RsEXKLQprCIFiKN2ntgSHohIT9q5L
 Suc4RkXReWAA4jGc5PmdkfAmTlJuDsaKamDZbLn13DOzYVgZhVZkKBfYMwuFaQ1LRuN4
 /Ymw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d+5DK+eU
Subject: [Buildroot] [PATCH 24/29] package/wpa_supplicant: drop dangling
 WPA_SUPPLICANT_{LDFLAGS, MAKE_ENV}
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "0340b45da0 wpa_supplicant: bump to version 1.0" from 2012
converted the package to use the generic infra, but added a bogus
WPA_SUPPLICANT_LDFLAGS end left a dangling WPA_SUPPLICANT_MAKE_ENV.

Drop the symbols that are not used since 2012.

Cc: Matt Weber <matthew.weber@collins.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e5e3938be1..42c6f772ac 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,7 +13,6 @@ WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_DBUS_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 
 # install the wpa_client library
@@ -157,9 +156,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
-WPA_SUPPLICANT_MAKE_ENV = \
-	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -m 0644 -D \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
