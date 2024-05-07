Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEADC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 17:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7494440158;
	Tue,  7 May 2024 17:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMIi1FS3Ap0H; Tue,  7 May 2024 17:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 851C1408EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 851C1408EA;
	Tue,  7 May 2024 17:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C99A01BF389
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 17:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5809401BF
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 17:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGXgruTz0nC2 for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 17:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9555040167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9555040167
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9555040167
 for <buildroot@buildroot.org>; Tue,  7 May 2024 17:28:36 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-36c5d9d8fd5so10133575ab.2
 for <buildroot@buildroot.org>; Tue, 07 May 2024 10:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715102915; x=1715707715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZk47++C2lG80TID6xrNscdBNFBECwsIv9N2fvkAdek=;
 b=VR1F+9W52GRXhdV1U7v0gCiveEvFzyZTs9gs92arHtd3cqtYzEF/3eR4YkojZAxo6/
 X4krUN4eEkv7bz/qD91GlljTt7v0CP9AbfFkL6VAYIXGgbqBfcf3zi//SbVZ/rNPmLdi
 DqDf6u1Cd+8SZbhJn204vQoNbwsvm/wlyLfaxUhcvs7eUBs38qhBWKs2POziWk4uTb7V
 wjdk69YUBgu0cS39AKITDJ3koupawaatcBF09kl21g1UgRheH1iD876Iu47MvsLsyen4
 o+Q7/t3jjLiQ8FZVOwRugbwCig5z8hsgF4iKKxNEsQRe6yrJ1Isv/lNzCggtHRTFw7um
 aH0g==
X-Gm-Message-State: AOJu0Yw6qBNJkKqcmGZqfVpRxyvrTgIugdHld/o1VH3USFO+sZaoVatU
 krJXgRLUUYQ/MbWI778CzzIDulOZPpoCtlSpA/zWcMBYfU+YfTwO64BhNw==
X-Google-Smtp-Source: AGHT+IHXrmRrpPNwYoGBZEkXzg0+jhXffAmlnshP4T1DxuHyJsgNAkEKwdHLAQI6CZxX6GX05qEFUg==
X-Received: by 2002:a05:6e02:19c7:b0:36c:4cc4:59db with SMTP id
 e9e14a558f8ab-36caeb9bacamr1846655ab.5.1715102915167; 
 Tue, 07 May 2024 10:28:35 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-151.hlrn.qwest.net.
 [71.33.133.151]) by smtp.gmail.com with ESMTPSA id
 k10-20020a92c24a000000b0036c6ebd0455sm2753680ilo.88.2024.05.07.10.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:28:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 11:28:32 -0600
Message-Id: <20240507172832.3546905-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715102915; x=1715707715; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CZk47++C2lG80TID6xrNscdBNFBECwsIv9N2fvkAdek=;
 b=BnGoXjUeJP7SrGV2qqfPscIOfsVdjozD3xs2SQ+mSrM3c4K9cQcO/BP8pcEMSND+be
 6QLpVsYCCHdIkDg0dC3wQqMike3jF8paZ1Mg6FSxXwdwcG0Y5BKFY8hwsTtZYh09+X8H
 6FXgGIER7uK/g6KUgqjnR6MLEqt0YkrTZJ7ra0EJ5h0K0kNgdNRHKivpDPeOU3pexExI
 QvXtTQKkl48HyihW6EXLBKwx9erutgYJeU1JzKwRoo8e60UaLOICvSKlh5Q6RKT+dmON
 EsbiUd5ymUEBXf5oIMK0fh7Ul9SYD+ZINs7EN8JZn7SKN88XDrEKO+TIjrbBDhGqcUlq
 R/hQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BnGoXjUe
Subject: [Buildroot] [PATCH 1/1] package/network-manager: drop
 CONTRIBUTING.md from license files
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is irrelevant as of 402ad9fe5407 (package/network-manager: bump
to version 1.22.10).

Details: https://lore.kernel.org/all/ZgXKrtfSjahxswtP@landeda/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.hash | 1 -
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 8a3c3895fe..952b0cea93 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,3 @@ sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  9f7f0d40116e5a0f1566b9da71e9c95738c99364e4b5437d8115aa614490372b  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 09bc6aed02..cbd2ba8839 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
-NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
+NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
 NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
