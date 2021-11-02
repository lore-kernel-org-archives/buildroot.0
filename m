Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB69EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 21:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B716109F
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 21:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59B716109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7224022F;
	Tue,  2 Nov 2021 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyXWt9LZOhlQ; Tue,  2 Nov 2021 21:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 548AA40224;
	Tue,  2 Nov 2021 21:28:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD02D1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB6934020C
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pojOthUJv-4l for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 21:28:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D0FB4019B
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 21:28:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id b71so420710wmd.2
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQf5c+qKqXouNXiBTWb1YNQX4ODaIrdX7CwMvbZF7mY=;
 b=OHjfl+lUtR8FhJcCk9ZUX4BjO52rqhuzJTKMdrIcLAh1wEjK0IzM0paXHCB72aj5p7
 7fbsdIrfnPA3zPnA3hEtZB/BGRLmwHZsOLlK34GwzLqjRVfgoGOL8T6aoC7A8J6LnmD5
 LCQ3WOPJpUwuxnMS46Ui2itE5O42P0lb7ajbxQq6j1Bhxw6Iy/K68nQQo5ayx/UaArb2
 fdmETbwTkRy5TbBgGDxB0pxLPF+WKH8W/Cn/SKY3WyQsfOd1XOOpQx7PBRQoj0FliCnm
 1+P4sJKF9qPCIAtVQg0xkxFRtu3WspPPlR6dBcmFzS+l4EbI2ITZe6fbEsO2l7OQ08NU
 8oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQf5c+qKqXouNXiBTWb1YNQX4ODaIrdX7CwMvbZF7mY=;
 b=Z7Hk0KE6ki8tAu9ap8mWxoscWs64J5x1FkaBCBi0zy410BWnzXcW0UGAY4soGa88gj
 iYHZsELydhI1I+luZZIRA7B/KSuPqgxPHSPziDY+xr4ybvMqTDE3I8Y6bylUI8skCCWe
 R3x+6LClsvmP20NJ2Jl1fTwjlv/7/xuYrBfoSr47nB91T81pOeq9HtnblDf6M2e8FZML
 jGCRhvgEChQH3FKij+UHo4R+uUh26gxd9uZQO20KcbnqbzZK2yGQN5G3yOGExCQSf7TR
 gSTL4fN3JK67bi5fkJs9kaxL8P6Cftrb8BzahlmIDGW72LUMlQSXlfi7LIG5tKOmcUL4
 m5TA==
X-Gm-Message-State: AOAM530qTUhbB7Bvw5EdrdGt6hvQIa1Afz/po6DF1xf/d/dqZvRLLAix
 x14f1x/6KEMUvBgy8hG8fn6T4/R19kQKVw==
X-Google-Smtp-Source: ABdhPJw4KkPPC3gYEd6ebmF/Lifebu68xfiO9YeKpdkZVlp0g/2Ov0ysN1D/+37BWbbuh1wciRPpfw==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr9978494wmi.182.1635888487251; 
 Tue, 02 Nov 2021 14:28:07 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:4170:6ed1:6ffa:e159])
 by smtp.gmail.com with ESMTPSA id m36sm151503wms.25.2021.11.02.14.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 14:28:06 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 22:28:01 +0100
Message-Id: <20211102212801.174162-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 7dbfffa
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This includes the following changes:

7dbfffa Fix parsing multiple .flags variables
de31f3d Add REUSE badge
6390c1c Make libubootenv REUSE compliant
0573071 doxygen: fix libuboot_open/close return value description
0d12468 Add documentation for the configuration file
b1178c1 Add configuration for disabling MTD lock
5dadcb3 main: Remove duplicated code about '=' in variable name.
e085e37 libubootenv: Forbid to give empty variable name to fw_setenv.
42f919e main: Check libuboot_set_env() result.
1bc91d1 CI: add gitlab config

License update details: see commit 6390c1c ("Make libubootenv REUSE
compliant") in [0]

[0] - https://github.com/sbabic/libubootenv/commit/6390c1c26a816a96c9a72588679df3b9445dc192

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/libubootenv/libubootenv.hash |  6 ++++--
 package/libubootenv/libubootenv.mk   | 11 +++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index d6de614612..5ff7450806 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256  662ef1efe058e2d5a07498f7b63aff7b2a521c0f6f199c499fb3ae84b54121bd  libubootenv-0.3.2.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
+sha256  760fe53ca20ced93a09dea0f123eb429c820b565c103920afa738873e8cd16b7  libubootenv-7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7.tar.gz
+sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 295226b9aa..51ea02e678 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.2
-LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
-LIBUBOOTENV_LICENSE = LGPL-2.1
-LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
+LIBUBOOTENV_VERSION = 7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
+LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt
+
 LIBUBOOTENV_INSTALL_STAGING = YES
 LIBUBOOTENV_DEPENDENCIES = zlib
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
