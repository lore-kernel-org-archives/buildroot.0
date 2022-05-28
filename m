Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2233C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF4C60F89;
	Sat, 28 May 2022 20:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlKfSCLpb261; Sat, 28 May 2022 20:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8098160F3D;
	Sat, 28 May 2022 20:29:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11E1B1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0002160F56
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqNWFbf1RUm5 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:28:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A29260EDE
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:28:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso4499086wmp.0
 for <buildroot@buildroot.org>; Sat, 28 May 2022 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjJXsH9z5UyOUDMYB3HsqWh2Oa0uzMexjI8AkolPZlo=;
 b=SmZbaprP8vRiLg4jhhi81jyD1Rhar4wJG5sBwMmRmNDx0D8URaGEbqS+L8W3f5plDN
 HMXyDZ/3iT8FujM7g9uKHqMzEmRlIt54QoqLWs9i2GhbIl+xVrPs8s2EaBp0In9kKG2r
 l6MKH9jj1SMqEcFd4oMxFKUYoWfrrO1fKNKDVZfet30wiJidKd2Q/w5bhP7WaNh3sDaT
 Wa4w6lON7dJXyungrW7JmAFWUn+hLOxwCzNvvZJ94IprpiZOgPVbXsuJLbWcSyDap+1d
 PdsKCZem6Tspn9B27ZkF2+dgMby54rw47rEKNvhCFpq8qyeD1Q0Jem8Wu8ObcQackQaf
 2QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjJXsH9z5UyOUDMYB3HsqWh2Oa0uzMexjI8AkolPZlo=;
 b=0XTj97quyLVLWP8ZAOBq7Hx8yFkWZZ3zLnVBap2Ih99KJOqhSxjrS7VjnEz25R+IzM
 GnycNO8crXJwGxYnF5EoD6bAyg/DxXR9UOlddJe3sSuVMJPk6R5c2AM0zH7mckKdvonS
 QFkQajRQR9XRKGmS8uVrI6I3aVcUzm/FjOdChjrnRJvf9E3K58hW90vdWeOFzUO1zG7r
 L4uha5h83F43jGflqjTrzPbwgFPigQTtBnRj8egLsZ88ZFvZSqrudIU+10u6LFO9NvXI
 Qtk/R8X2VEH6Nyurmmbw/zeTUJJ6HDfp84ZGzJHjhKbxBH/LncfVqbR8ZyPnQDRwH2RA
 1iGw==
X-Gm-Message-State: AOAM530HPBBRuWNNW4MzONtQXjklzvSU64YBMFAIxpyNVws2R/ydteaY
 nFEKHiKJGTQoZN4qRnBKV9HN+7+2GTU=
X-Google-Smtp-Source: ABdhPJy8HTiSa1qyKRjGapyUsXMNHlPSDmJrnO3GgNJeOrBc7YXnvsM+/yt5cd1WIZ0ztLDNJxWxFg==
X-Received: by 2002:a05:600c:5127:b0:397:4862:e474 with SMTP id
 o39-20020a05600c512700b003974862e474mr12426939wms.68.1653769737063; 
 Sat, 28 May 2022 13:28:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a7bc8d3000000b003942a244f51sm5680668wml.42.2022.05.28.13.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 13:28:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:26:27 +0200
Message-Id: <20220528202627.2082719-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/dhcp: fix build without atomic
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

Fix the following build failure without atomic raised since commit
fde21979427ffeb4fe9c0068310be195f2dec5ec:

/nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Move BR2_TOOLCHAIN_HAS_LIBATOMIC block inside 
   BR2_TOOLCHAIN_HAS_ATOMIC block

 package/dhcp/dhcp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index cbc95cb152..183c8322d6 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -62,9 +62,14 @@ else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
+DHCP_BIND_EXTRA_CONFIG += --enable-atomic
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DHCP_CONF_ENV += LIBS=-latomic
 endif
+else
+DHCP_BIND_EXTRA_CONFIG += --disable-atomic
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_CONF_OPTS += --disable-libtool
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
