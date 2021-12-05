Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55847C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BA95400E9;
	Sun,  5 Dec 2021 00:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJkaMLOJWl8A; Sun,  5 Dec 2021 00:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27C640261;
	Sun,  5 Dec 2021 00:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1661BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 229EE60659
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXpw3w6jzegx for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57070605C1
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:19 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y16so8596943ioc.8
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5aEv7L6i202ER2K9dBGIWFjVAvyRwVanPS8nvv/jAgY=;
 b=O2bF4UX+XCir02oSBrDenIpII22echNQxhI2rzzMGbyWwwJMzIhZIaZYn4rFyYVgwW
 C+xB9MxdwbwWVaPdkDTS1nDv+5Ad9E2qNk1Bs7XJZ4t7RloklicYUhZSdZtW9dtE9FN4
 fUfILLAw98bz80viGhfLq1QtkvpwdADUt5UoQl2+JCm3D/YvFFECZvNijDXfkbr+fDAe
 hy0imtN+FKMTeG4mvX0rVJEq6+SOGrnEcGkSW01TkaFR8cjxOY9HGX1lTkIes1UU33CE
 QbIe7jZPzvugk6XTkAt0mI3XX8RcsFBdJhlqabSF5HqpVDPkgwAnHC7Dbw9Jv7BFWTnL
 34FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5aEv7L6i202ER2K9dBGIWFjVAvyRwVanPS8nvv/jAgY=;
 b=QwdVs4W8Ckkam2nC+w9Nu6o39jb2cw9l5cbaRkZ2woeEUkkBwQzkpdm3/co68q0Vow
 Akk61bVNCrJDYpA9XvjqCZUooMGUuZAEqarJ27U07CTacF4KDO1NCRXMxqqA1vox5u/a
 5XL0UkhG8apz72LPw2G6zcjgboL+fknm8nXa1B62jqmrzaQH+QWVe/KabKyNnG/L1yA4
 HLuk9C7lRZRBbW+m6N66syvMB8iUUHzR7qF5s4HpVjkf0xC8dn/JCeqY6zGD9hH/O1hD
 KEB4wtboHqZ9dgtW87UkfADrrvc5ewJQzLnqqT4TN7jBtodFP0C5YoCZA3NTWFQC7jxa
 KYNg==
X-Gm-Message-State: AOAM532rRkX/XyNnAZ2YHkbipLjo7CbX1xQrPWS/v9Sd1vlyZrz+UDn/
 sPqG7YAMKBwcpZjDgIzFl5dTcWrIGrw=
X-Google-Smtp-Source: ABdhPJxwnlxd1ApmivBFS0wRUWerNOm1X+fgLnlFxb1K42h/LWlaOc8JYbmOTYMLLPNUNUvcFTKy8A==
X-Received: by 2002:a05:6602:1550:: with SMTP id
 h16mr26540608iow.125.1638665658808; 
 Sat, 04 Dec 2021 16:54:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:06 -0700
Message-Id: <20211205005412.2888068-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/7] package/network-manager: bump to version
 1.32.12
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index c9d4826a0b..b007a6e88e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.2.sha256sum
-sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  NetworkManager-1.32.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.12.sha256sum
+sha256  a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b  NetworkManager-1.32.12.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 453d1fc617..ea47e0797e 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.32
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
