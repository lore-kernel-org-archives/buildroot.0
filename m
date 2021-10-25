Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F84BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:32:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AA660FBF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8AA660FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8668F403BB;
	Mon, 25 Oct 2021 07:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAAVm6e_ItbF; Mon, 25 Oct 2021 07:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3789403B7;
	Mon, 25 Oct 2021 07:32:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 003541BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E38E180DD6
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fcbrLdAFoNwS for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:32:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FA7480DD2
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:32:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r134so14141968iod.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LXO5IizN1+pMC09Ah4mjcW8tRA9iNuXP3n337SprCME=;
 b=mNNCQljeII2GyMkTBxmYJgEkbhMyJnphloQJ1wsXSxZxP+qNgF8lIawnM28XpoeBzf
 b+Le4X5u8gVdi3UR8+oEIRcgvivBKst1tuFS+VSRRZYC5AmA2ULkZJjJZOSVuKL2jI4T
 KcrCJvex2+FhLS1X2oRBJU1RJDbC0JCwZWtHbhqwUPCZ8NMiD+YHTCZI5QREEWAGZ0oh
 Ps94wVeFBccIg40sEvkdDrAzq5eqTkgXYOTRmmM8+G0dCbLV1eaqvL1mrm+o/O9CpfH4
 q+tM/66L4el+YI/tHJ26Gkm+XGA1blreft0OCUcCBJj16SlmVweSl5mVzFgwM9Kv4V+H
 nCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LXO5IizN1+pMC09Ah4mjcW8tRA9iNuXP3n337SprCME=;
 b=XBAA/HWPnOjnk+JiR0n/leqYLEezcGEdnHJT+RXAQht2X/Kwk+lIHBuZQ1O37GFnmf
 fdCcMqDZKJA+qc8Ntj3D7NkLDLM9t9SCByclOmABAj3Z9s2KWn1SjCWN2LzNoRvEPvcc
 0UO2Kjspcj32UUR0Qjf1PAyGU+0gFZ0jkYnSzxVrUQE9c1C5lv4x574QpVNhV7vzc9Dg
 eT+zaFVg9akudnzSC96HqVcVkbQ7J6NKxdwSe7V8hX688cCxCUHn/l57I1bBnewusfkP
 IfBnNP0FAE5ZoPa4qoDj41dONs3+nD1bn9HIgk3ywm9xq626PniGEpRBEKs9ZtBCRw+g
 Xq1g==
X-Gm-Message-State: AOAM531HjlLEBcZPEFuNEIP2LC5iMBq2+BSPJc3YzXqFsZn3028FkASQ
 ThAPnaEIK++IhIRL1okUl0Av9PY34GQ=
X-Google-Smtp-Source: ABdhPJx5ohch9ZUBVti4EceCAq5adPxJYeS7IHE8OdXDPKrkvEIKl4KdffEnOxn+rzkGVwHJ8wQLGA==
X-Received: by 2002:a05:6638:348b:: with SMTP id
 t11mr9437308jal.70.1635147167833; 
 Mon, 25 Oct 2021 00:32:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id a14sm3443144ilv.86.2021.10.25.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:32:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 01:32:45 -0600
Message-Id: <20211025073245.3148426-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 249.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove efi-ldsdir meson config option which is no longer used.

Meson config variable systemd-analyze is renamed to analyze.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index baab5304e6..a83ff7d989 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
+sha256  773ee546ad6df0921ea6f9e12294eb102bf68c1ac9eb3dcaca1764f8306d6e13  systemd-249.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c403896759..8c187d2ec3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249.4
+SYSTEMD_VERSION = 249.5
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -507,7 +507,6 @@ SYSTEMD_CONF_OPTS += \
 	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=$(TARGET_LD) \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
-	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
@@ -728,7 +727,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dsystemd-analyze=false \
+	-Danalyze=false \
 	-Dlibcryptsetup=false \
 	-Daudit=false \
 	-Dzstd=false
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
