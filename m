Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F571C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4DF40260;
	Thu,  2 Feb 2023 13:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF4DF40260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXpC-ZHzxISZ; Thu,  2 Feb 2023 13:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC1AF4028B;
	Thu,  2 Feb 2023 13:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1AF4028B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50BA71BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31CD161106
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CD161106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpaWfvszQT99 for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6FE60B50
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F6FE60B50
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:46:26 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id mi9so1934498pjb.4
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3P30c/q4xMhJ1EG/cq39seJj6VT3aoHUxNSnn4K3h4=;
 b=brGoX60TXKRTUNsxxMNqz+O3hI0rImh2xibGyWbw9eM/TAEMBRPkO19GmIfLBSCm7f
 sS8waK099R6x0zWH79DFnDZIJ79nknaq2XAIbs44C9F/h25Asgq9rw2zyGUD2PTGX4SH
 4MpFIWi+wqdzRRwf1mfeZmf05dQ7Ffzwh/PXJs6X0D9Yjo7RArSMrtFnmlYuEyaxGI1O
 /G6hyDKilerdd9zqbXoNDf2PZfHwdPJ9ZDGPlL1yY6LFWKvdGmA8EBKBlx8PEbI7G4tU
 KEFKj1D9MDo0O0bAPAguWdCzfeZhkJuVHW3wW/moNR5AwcZQpGUZh7wwPaw1D9RoUGwu
 cKmQ==
X-Gm-Message-State: AO0yUKVzjTWd0yNzuWcxLEA0g+VHlreqvvuCT+hRwqupoukSMp2xJ8eY
 i60ApDgo0+hO2uAxl3pP/9WdymGGNdC2Pw==
X-Google-Smtp-Source: AK7set8XfHYwSRwjcJQfloj13SK2JFe5am3vAFgu2mM3s/U58mVCUbYg9PRtKzWf18cR+Bbv6L1TwQ==
X-Received: by 2002:a17:902:e54d:b0:194:a602:13c8 with SMTP id
 n13-20020a170902e54d00b00194a60213c8mr8939860plf.52.1675345586059; 
 Thu, 02 Feb 2023 05:46:26 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o9-20020a170902778900b00186b69157ecsm13673834pll.202.2023.02.02.05.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:46:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:46:23 -0800
Message-Id: <20230202134623.1912767-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/moby-buildkit: bump to version
 0.11.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/buildkit/releases/tag/v0.11.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index 43ee1b12c9..ef927636d9 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ffe5a2d11736719649dae962461f66df394ae4cc1e58294e5f2bd4d4632d9d0  moby-buildkit-0.10.6.tar.gz
+sha256  b1746575f37715a8a2f2df5bab77ea081ba8436854e241792702109fc9e3653d  moby-buildkit-0.11.2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 59d68a7dca..a25f676710 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.10.6
+MOBY_BUILDKIT_VERSION = 0.11.2
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
