Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D02FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5AF2407E2;
	Sun,  7 Apr 2024 13:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puAKdqMYK8j1; Sun,  7 Apr 2024 13:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CB61407E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB61407E5;
	Sun,  7 Apr 2024 13:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 768D01BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6399B608A5
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNrwdADu40R0 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E6BC60705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6BC60705
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E6BC60705
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:16:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343e096965bso1642895f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712495811; x=1713100611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhRo+NXrJenf1+/SY2NfTWzxl5RwC2jakCz48C3w69w=;
 b=AFnyE019P2RAaq9NL3JXtWs7z4tTOqay4ckcCRQNMZRiFgq+UjEalp3Z6jA2aRHjEu
 eQ7hc6Kh7GVm8ecTuBbgl1aaFlcEy0MBaqoxQqKAu98XdPC5+R4OjiW7PL24X9GAsLeg
 2dvqNLk7I9Rgs1Ua061jhBmukYNXdd+ewrJeJPG4nvpRWUKmCU0ouB+/uEqWSvZdrWQS
 Z2X3Lq70UWcTr+1milPsUQ++TEOV2GGyhAJKvoEUpvxU9+3PNzewa+08VbIMFjBpfF/V
 20eBaATR8sU3rLJSDORA32C8HMIdchPcr1l0WDwHh4ljaKxGnMWtnZrmLKbxI3gNQBLc
 cfKQ==
X-Gm-Message-State: AOJu0Yw8zT/mXXW2jV5sP7uu1vDodwojoUA9whGlOJPttuPv3jXSm0DM
 nZatQiNQMealUAdgzxrzwgcNFXbsVaOlF7+RsxCFMctIrnknIspHH0eQ+oe0
X-Google-Smtp-Source: AGHT+IEyVXoQOEed8t7D9riU0YcQ9qM7zvgX75vHW1E0/2izGBaVX+p1sMr69EI/2CMCiYNECkIGeA==
X-Received: by 2002:a5d:588b:0:b0:343:d03b:cfe7 with SMTP id
 n11-20020a5d588b000000b00343d03bcfe7mr7221375wrf.7.1712495810845; 
 Sun, 07 Apr 2024 06:16:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d6546000000b00343e9f52903sm6018625wrv.57.2024.04.07.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:16:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:16:49 +0200
Message-ID: <20240407131649.1416942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712495811; x=1713100611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DhRo+NXrJenf1+/SY2NfTWzxl5RwC2jakCz48C3w69w=;
 b=iIoibMznSFa4HJF/vt+60Qc1iiuGgCA8oDRcsLU5KdtgihNlbbi0rHS5A1WO1rtkX0
 TtcInJ7SlsGQyLP87xhtIiGmKgoQWWVrKX5vLJ1Zh6SByBEathQ8MB5wlp+/NVDGVG1G
 y5L4iRteo+076HPnTivz/2GBOfQkdf5V98l+VDYvD52etmg9S2cdLp06v4tMiu2NxMjv
 yAA5rRUfBXx3xBApMymqbViVQMwA06vVbagzKj6xfQEg1P1pTPfS7wvgZbYIxYZ0Cjf5
 sJC8WQ7s94SX0/2NSYcN5gT/eFWbaENKRz96Xap+J8vzmd9lRocuA/gE7VBUIUYy1bAG
 gU7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iIoibMzn
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 58
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

This bump will fix the following build failure with gcc 5 raised since
bump to version 57 in commit 65c8a9b6626de83365865dea6fff1749466a36aa
thanks to
https://github.com/benhoyt/inih/commit/4e618f77d4bae216865c5abd972d99b1ba5031e2:

In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/cstdint:35:0,
                 from ../cpp/INIReader.h:17,
                 from ../cpp/INIReader.cpp:16:
/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^

https://github.com/benhoyt/inih/releases/tag/r58

Fixes: 65c8a9b6626de83365865dea6fff1749466a36aa
 - http://autobuild.buildroot.org/results/7a5ba516cde536e103669a0422d336dd8a3b1dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 476b544ce6..f20d7ac0b6 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3  inih-57.tar.gz
+sha256  e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7  inih-58.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 93032f1ed5..80cde0942b 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 57
+INIH_VERSION = 58
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
