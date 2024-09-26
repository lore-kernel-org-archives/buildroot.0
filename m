Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B01CDE03E
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75B9140182;
	Thu, 26 Sep 2024 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmZWozt3vJ5s; Thu, 26 Sep 2024 21:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C4840462
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46C4840462;
	Thu, 26 Sep 2024 21:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB1D1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 21:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB1D84645
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 21:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsYxY7E6gpbg for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 21:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0F6484644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F6484644
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F6484644
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 21:56:05 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a345142c25so1505715ab.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 14:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727387763; x=1727992563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZWV1N2h7o16RJSD8wW1IzZrSGIaE6iyuHHydr+95Oo=;
 b=OxnJQRNfry9xArVB49MSUE0g8LbA83YEBGQLNeqWJyV3cN1jALjEXG/PMuKDIALecC
 TUaK4S07H3GdylrF2QDXBrOmT+U3F1em1X+Px1PTkWmb6OVz8PJL4NywikT96otwgDQB
 cpqC5sDS3VinODAlo3p6eJlr4IiSaWYEarPODEEs6NveIPfQTcEjiCdjUettBDhaUwPi
 KyWI9Zd3bvZoTc1K1XMVYiMvJppxYx6kgiabfzm8Zj/vGo1hE5UjzafXkR2Zwqiy+vcO
 jT91GpWuWx87IOtPOe6mt4eYobKkcSidnwm+ZeVBkWwohN2wo3i9OhPXIPTvMbP8ls5h
 OvYQ==
X-Gm-Message-State: AOJu0YwtQW7uj09AzD+uIcNQp9hPr8JW6gACw3b2CpdbdJUxbvGeT+Eo
 mL5qQFSxHisLySospVynIlgZo+J+PyWSMI9RMukzryoQeXdhZdpOJnvL/Q==
X-Google-Smtp-Source: AGHT+IEIvH8Bvlqoqds18SUblKe8qISOYzIxkB8KKwKXM1xbqxS899hpxvyfJh6x5icNbWDMhCmACA==
X-Received: by 2002:a05:6e02:219d:b0:39b:640e:c5e6 with SMTP id
 e9e14a558f8ab-3a3451b0742mr8350605ab.17.1727387763375; 
 Thu, 26 Sep 2024 14:56:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d6059bsm1615845ab.6.2024.09.26.14.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:56:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 15:56:00 -0600
Message-Id: <20240926215600.203167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727387763; x=1727992563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fZWV1N2h7o16RJSD8wW1IzZrSGIaE6iyuHHydr+95Oo=;
 b=i3Ffg0HSKdD8aUISiNxGmMeLpJ460EkSUohmfESpcZb4U+OBaXIisdnOLnOCUIoMKZ
 bsefe1R7PJI1RnrwDUM5Z+gCO3EMYVDTKHml/LdPY7wx3NJVaUVf/vw66DNEKVsnrnRP
 RhhWmhTj42iyo2tNq46k+0zyHoTeSSbvKZZwoBmikqs41Yu0tAzwIivd+4emAkkMBHs1
 Hrb8X8QElSZQidGSmAQPBS6qMah5EfnGlBC7g80zFLsv4rOeKLKVrZ0c1HjwrWqR2Uod
 k5X2Vndswsx4YSmK7J8nhsJ1D9Ou/AW6x++g6g4pdHm0Y29tEyCejuP7eIKvXT20P0uk
 yR6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i3Ffg0HS
Subject: [Buildroot] [PATCH 1/1] package/python-slob: bump to version
 c21d695707db7d2fe4ec7ec27a018bb7b0fcc209
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-slob/python-slob.hash | 2 +-
 package/python-slob/python-slob.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-slob/python-slob.hash b/package/python-slob/python-slob.hash
index 5bce1f1326..4eb6a52180 100644
--- a/package/python-slob/python-slob.hash
+++ b/package/python-slob/python-slob.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  18eb4f45d09d49b1f776cac52ea70ab951566c60cd30bbec39e88f10908fd8ff  python-slob-31ad0e769360a5b10a4893f686587bb8e48c3895.tar.gz
+sha256  adb265b94a76257e64ee9d71437afa4226e4e87a13d5b964ecfc4236c5f28ae6  python-slob-c21d695707db7d2fe4ec7ec27a018bb7b0fcc209.tar.gz
 sha256  db09bc6733ab28dc59bfbcd01819feb9d05241cbef3ca3f5f58ec739b341d56f  LICENSE
diff --git a/package/python-slob/python-slob.mk b/package/python-slob/python-slob.mk
index 4a0d1a7e1c..552cbc6e66 100644
--- a/package/python-slob/python-slob.mk
+++ b/package/python-slob/python-slob.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SLOB_VERSION = 31ad0e769360a5b10a4893f686587bb8e48c3895
+PYTHON_SLOB_VERSION = c21d695707db7d2fe4ec7ec27a018bb7b0fcc209
 PYTHON_SLOB_SITE = $(call github,itkach,slob,$(PYTHON_SLOB_VERSION))
 PYTHON_SLOB_LICENSE = GPL-3.0
 PYTHON_SLOB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
