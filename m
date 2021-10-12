Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFC5C433FE
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A33960D42
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A33960D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3FB81007;
	Tue, 12 Oct 2021 16:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiR5KsgxIfQu; Tue, 12 Oct 2021 16:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C084580F83;
	Tue, 12 Oct 2021 16:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19CD81BF9B6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09F6480F83
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hEzTBV53har for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 16:48:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F99E80F81
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 16:48:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y3so35747385wrl.1
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 09:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rxdVQ16TPIovOlWUIDHoxzl+67A+QX53G35/fHLXCaQ=;
 b=Nd2ITJTg2+e1mcyzRPDcxw66VrBqob7sMlaV86Rmkwrnt2qn5Z0zBvFs5H2tnRjrUi
 P277RQPXSsupjUmQEnYznjLAnJCgKUC57/kWNO7EHGKi0CgThUzK0qfueUNxbZo6nSfw
 QhAJPIb2/1dLxorJ2SPtjxS1TIQCskLUgq8aYWZhJ7zXPO9McsMbjr3d7BT7HGtERMmI
 E9f16mJujWuO3F/Tg7fi1u3nekL5Vk1JHIWZjwMKbe7AtAL327SpVLWikY2zjs7mUmwa
 keM04W+SCKqlE9fbYXAtGcqYSnLMZWXqtuI9CP1xJ7Lf7snmTwMQ3inUVOAnzNgtLovA
 w7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rxdVQ16TPIovOlWUIDHoxzl+67A+QX53G35/fHLXCaQ=;
 b=08c0h3N5PhXolZXq+GWEGZNgx2UdWaf5DDrRAmtgoVl8tb56aBXwa6St7vWgqM1WvJ
 JQ/s0CRWqOmdH/KBXmY/T4jX8j8N5Ra7lSUdUyZC9z44Gp26DXsCn5HDwjHcJh+qA2q4
 fEbv5KYuydFPjHCbAcWo8P1yE9pnu15e9EhkpjxJYCw9rZWnHjnD0SteWE37zK+yBp/g
 qMO4UiRZqY542pomLqR+L/X7Qj9YuLoLQDutTtJ+0x5tDOR8Ah9Pl9l5TyQRebK5Ji+C
 R7x0XFU0M8U07bgCsFwkyKSwmxxKcHu6wjxi8mbDZjEa21faudoLTQDAs6EoaJazFoKb
 xDfQ==
X-Gm-Message-State: AOAM530Q854To1VPvyijQAFAlpkCQmZDCAAbRO05MTtdkZsUyru1m/Yo
 gLvG7+jEjKSY/YjdkU8s9iV3ixI7M+g=
X-Google-Smtp-Source: ABdhPJxYD/JWewhUdxRq71eQJQR0aLOA+JEdvVxKmZAhUH1yd2fFRynbXuz+V8NCfkBGZpcaN3SSXA==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr34260053wrc.147.1634057319448; 
 Tue, 12 Oct 2021 09:48:39 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p25sm2913107wma.2.2021.10.12.09.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:48:39 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Oct 2021 18:48:33 +0200
Message-Id: <20211012164833.234016-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/liberation: bump to version 2.1.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/liberation/liberation.hash | 2 +-
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index 1f673228e..70b44e487 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef  liberation-fonts-ttf-2.1.4.tar.gz
+sha256  7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0  liberation-fonts-ttf-2.1.5.tar.gz
 sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index c08ca378e..35f06dc27 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.1.4
-LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/6418984
+LIBERATION_VERSION = 2.1.5
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/7261482
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
