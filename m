Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA7C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEC8600B9;
	Wed, 17 Apr 2024 18:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDhbOAEdgycn; Wed, 17 Apr 2024 18:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F1860603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F1860603;
	Wed, 17 Apr 2024 18:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5FE1BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5921E400D0
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqZF1F1XPrgc for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B0D4400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0D4400D1
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0D4400D1
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:13:29 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f00f24f761so63855b3a.3
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 11:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713377608; x=1713982408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X83/GZRD65ZEcl3dj2uWxazqTxDDKzylIbiVUF6RhqA=;
 b=wEsWXGuWVs7fqThZPQ3dJN/CTpxFaUipYTks7fZ1PF3WtbDLrAWbrX8K4NTLjdkirh
 iC+HXiOPBitjQxGknqzwpOHrDOqr6J1PTW+S91IttaIJ1b7I/HGq4QEJFNvLnHwRjXQW
 /msiG7PwrnGQso2YamDd/dNa1TN9Ph9HrM7Lw3GxFcORD61Lh1jEaQfYEOOAFWtPFkDH
 pBEXIxHEXRXOdjMVBH3vhRnnGAXcDxaFM3xf0fLa0d6tC1CgbQ+NMNwcKTEqUrY1OoDc
 N2NSxxZKCEzpgyCsp6H8CiGbbYU5Dnip/qJRGbtN2I/ITfW0stcjXMhcoNm8QLA076cA
 YJTw==
X-Gm-Message-State: AOJu0Yzn+VgdwqsU6FlG2MQe7PNCsHsnhjMjkKDOzMGEwZrATbXWIP+g
 ObHwUA3o+zUkcaHMQbB9toBFkC2rReYngWA9riEMqXZMK/I06XytO17E6Q==
X-Google-Smtp-Source: AGHT+IHL4eFaITcsYJ/Ujeg5y+kUtRpAe+fjt+VDiqw/jsng6vo7jFfLyLxz0sK/ZGkV6JH2GiMphw==
X-Received: by 2002:a05:6a20:9151:b0:1a9:8861:9e77 with SMTP id
 x17-20020a056a20915100b001a988619e77mr605494pzc.28.1713377608191; 
 Wed, 17 Apr 2024 11:13:28 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:24dc:50a6:a50b:d782])
 by smtp.gmail.com with ESMTPSA id
 6-20020a056a00070600b006eab6f3d8a9sm10961867pfl.207.2024.04.17.11.13.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Apr 2024 11:13:27 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 11:13:21 -0700
Message-Id: <20240417181322.36344-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713377608; x=1713982408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X83/GZRD65ZEcl3dj2uWxazqTxDDKzylIbiVUF6RhqA=;
 b=BfI8BIdm2pXxSi4/lnkgkx9IcHyWyHmHTrOBjECWWN4pKkeyU3Nb0MIBmug6ht1CZX
 JcNxsAQ2SpRoVC7JDWrav8Lfv2Wse4Gri1HDRdbzZbj4uuYgN/6X+dp7wtF3QIuUKjYf
 vmnfX8WLG0WX3G4/wTHKimMe/c6TYEbzU9+Tgk7JZElQ+2yQiiATUcXaq2BQ3N+rTlTq
 ohYJU5VAi3KcvsZcxzZ3fhg4xYZYXND4u/qzRbkTEkMhXIV7ritsWvaoI9TQzTEqyQ4a
 m1JacKQYAHpfew/t+UkkU0TpLlBvyVw0A+ihED0OoDeAl247L6PZ27MbbCwjVQ15FpF/
 Pr0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BfI8BIdm
Subject: [Buildroot] [PATCH 1/1] package/batctl: update to 2023.1 to match
 batman-adv
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Jens Zettelmeyer <zettelmeyerj@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Although the kernel interface has not changed, it is convenient to
have the batctl match the batman-adv version. So, bump the package
to match 01ec4a39f5ceb83c62b0040067ba53197a0a6843 batman-adv bump.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 56bea3c5da..7bc6fee67f 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,6 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.0/batctl-2021.0.tar.gz.sha1
-sha1  87d0bb34950cb70578a0ca5ce706513a8279a01c  batctl-2021.0.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2023.1/batctl-2023.1.tar.gz.sha1
+sha1  8d899c6323e228b9b370caf28e6d67621cb7d35d  batctl-2023.1.tar.gz
 # Locally calculated
-sha256  9cec8bf1952f885192749a9dc0318a54633b717aaf05c438d504efd83f5201e4  batctl-2021.0.tar.gz
+sha256  e5bf47305d955abb199244bd0e5fffab96108b1affabd0d9705533f8059395f1  batctl-2023.1.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 8ff591844d..197e4beb72 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2021.0
+BATCTL_VERSION = 2023.1
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.39.3 (Apple Git-146)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
