Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14259C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F9E60E68;
	Wed,  3 Jan 2024 18:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F9E60E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tydZPLiD8G9; Wed,  3 Jan 2024 18:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D3A60ACE;
	Wed,  3 Jan 2024 18:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D3A60ACE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1326A1BF4E6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD3C6419DA
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3C6419DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5RzHPXaYaDg for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 18:20:33 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAD5F419C2
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 18:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD5F419C2
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso65953425e9.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 10:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704306030; x=1704910830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7FH4Suuku91FLxm5daQaiJc7jjm3hC3anJ2EuqabD4=;
 b=DoeWZaaSAybwgZSYFLeNZmSyEZrPuErYcr8C5E+WECbbVYV7CkoeOOW7fduIgfIdOV
 X253PncqDDczUjI2bC7r5JaKYtwl0cD5bUNgGqwZFXQLtEJfW06Huc5vtl9AiHD3LY3n
 KoyXJ9aTo/HrQJEY81W20y4Gv2xt+7pNY4yivbgKQf9dhN5/XhoPQ2PuIYOA1YhsOC/1
 8yki1VobohNIy6w0DzdAKscnuehx5vt2QwLs8CnAa8r/9QKrMD42rlhC8SeYxhb8Ddvz
 LM67Uuzq4qyKr/PCBY0bYePPkl4VuGMI3xr6kfFbMZtnwgPgDn2VX4xjw78x2OkyIp3J
 jpRA==
X-Gm-Message-State: AOJu0YzvGT6+GCxcq7jyomrCtf+qB0gsnQ+KprFWipZ4MqUgTAtPRpoD
 cY7Kz53m6zrLg3mv7cKVlKDkQfhHJB0=
X-Google-Smtp-Source: AGHT+IH0Bcvt0oktiAlKKs153dOIQeWgt8wxoa5wGFUjvlscheJL/E4H4vAwI+OU1O9piJIozi5rEA==
X-Received: by 2002:a05:600c:3b9c:b0:40d:5ab6:3757 with SMTP id
 n28-20020a05600c3b9c00b0040d5ab63757mr6214198wms.123.1704306030360; 
 Wed, 03 Jan 2024 10:20:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c3b8400b0040d8a21f274sm3054303wms.22.2024.01.03.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:20:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 19:20:26 +0100
Message-ID: <20240103182026.877736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704306030; x=1704910830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7FH4Suuku91FLxm5daQaiJc7jjm3hC3anJ2EuqabD4=;
 b=CBSlbGLuYku1kf4ht+rvG3fHfrxWt0AKo/2vr4rFawOaDdXaCA4rGUo+s4Q1k0Bows
 0O3zTYQUz4IyZjYPiQJh4s/yFdrNfTm7aibcVsN7XJnRX30dW3uPWSyGOFKoNGu0ZgxW
 oR7xU30wAv1gXONc1E9TKlBQJnB06daKkB45amsXa4VvDbjfGEMyDomcuaOjcTgkWPTT
 5ByJlNO8FEbdsvKInamGXz9F9wAZPN9u+5bJOtvCC5U86CoYeoLo1tbS9zWHxTC45Wtm
 Ix/YV612yP2Nr8SV1GiFp5OFzjIu6wLhu6PZgO03QAtVg83hqa9bKKaoEKBSstXEydx4
 Amxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CBSlbGLu
Subject: [Buildroot] [PATCH 1/1] package/usbutils: bump to version 017
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

https://github.com/gregkh/usbutils/blob/v017/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbutils/usbutils.hash | 2 +-
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index caedf5fd80..2c863543f6 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256  c3b451bb1f4ff9f6356cac5a6956a9ac8e85d81651af56a29e689f94fa6fda6e  usbutils-015.tar.xz
+sha256  a6a25ffdcf9103e38d7a44732aca17073f4e602b92e4ae55625231a82702e05b  usbutils-017.tar.xz
 # Locally calculated
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 84a6a625cf..c2073df3b3 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 015
+USBUTILS_VERSION = 017
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
