Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E8CAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 16:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A0C8144A;
	Thu, 18 Sep 2025 16:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGqzUJK_dEAu; Thu, 18 Sep 2025 16:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37998144D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37998144D;
	Thu, 18 Sep 2025 16:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A931E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B4F940078
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkhaGPWmytnU for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 16:13:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57B2540063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B2540063
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57B2540063
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:13:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62105d21297so2222712a12.0
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758211990; x=1758816790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t70jqwXPrJHpKmrEcOcbMBjb8L0sKYMXeXQtO5jizd0=;
 b=MYQ8IvDm5+IVfGBIy0cnXqkRhvonVhVGepsGsxBdILu8iJ+cdt1JFmdyUfW00M/eW3
 1UvcT4eSi4YNzlNsROoIieamkTncz8zTdfwHWgCWsp9b5Bty8l6vu8+NLyVgmzWs2fFJ
 nWL9hJt77ozrFYBef8Fcu9rSTSeMrwTRtJ0+L38ztd2SUVvVe1F7dGeyN5hIguB4mCIM
 UFEkGNmZXEeIgg8+QtRVg1RWl72IvSSeK6zmnlzpRXglbEUXQbwrl1ROEE1HcGz5WzTv
 BRQwH28vVTppsoJpZPkMit2NjwDe9gGfZlPLm6YY8xDjark9dXtgF1RduIndnkrYKWjz
 1pVA==
X-Gm-Message-State: AOJu0Yx0TxIojbTorbe0dS+66546uG55p/Zn6xCnyT0PkDnBnP/3t5Xt
 PBQqRNEIAj1GNxq2Kwj8LJ0D2icqrBySIX2TsmD4vSxkFThUnhi+lDsh7r7Gy0gYbu0r3tFjvSX
 ZJB2E
X-Gm-Gg: ASbGncuJ/N6EcgarR3BLR04KtXt+Ul19uvI2finYVduKZdIRBYc5LHFFqQKhKlNPcpP
 15tJVRXsoPJMBaKI/3orbBvU6umkorcgTLkxLACFXtjx3nf2RxPoMqGMDIhg0dpYe+hwnHZ1+h5
 XkgqTxJ3Hktk2N6Zxlmr5plhRhJZjqhIN18Cn1N5+uR73UAgbjzUPlLrA42w46uv2sQiqFc9vTg
 Jj4lP4aG5OzP9KrqGmwfvZETN5egKAQIAXBqWIEpbkDhtouxSPRlZfiu3qoCpdp8aefu8t4f3dR
 fPxfsbGaYmPupUXUZW+uAgyjR7OnYTl0iB8oKiOuFRlsyWXyayLfhZHUuCkhCEAJpvFEW09vTZk
 eX2zdP7qwZl4ny1pGNy0jNc52rXnXG2c6+6lF9DoOWWe8lvBY4DMfbNoiiVrq0cswZ7GEXttgrW
 xe/WEZUMG1Fgsj+ZHxDqxOEBukFWzjD3AWp0steG9zUmJlMOHYqW4ougllKQ3FdQoQQxSKBIOOa
 2X7oZII4a8=
X-Google-Smtp-Source: AGHT+IHDr9RkcTwn8wbq31KnNBmrgBHDpwP7oRDPmfPTLh0J+2lUgyNCcwvQ6tmesAZ+7TLd2Okznw==
X-Received: by 2002:a05:6402:52ca:b0:62f:65f5:a8d5 with SMTP id
 4fb4d7f45d1cf-62f84222889mr5872267a12.11.1758211989702; 
 Thu, 18 Sep 2025 09:13:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d0f397sm1675688a12.12.2025.09.18.09.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 09:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 18 Sep 2025 18:13:06 +0200
Message-ID: <20250918161306.2539341-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758211990; x=1758816790;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t70jqwXPrJHpKmrEcOcbMBjb8L0sKYMXeXQtO5jizd0=;
 b=KbyaYtioYQofUPJrfIRCTnHCMCfCRc68r4oYSz3OApxvzTUtR+9pqpNgkhv2z/KG+o
 VIGq1nqTCoc6LG+8CWqQbrwm/DZUg2RFBPAt10mlKaSwKO219qW7ZMvvw63xyt+TIfSN
 Mnt96Uu1AJ8a6tkKRqGZUEbnNAihpUFTzXvFM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KbyaYtio
Subject: [Buildroot] [PATCH 1/1] package/aespipe: bump to version 2.4j
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

aespipe-v2.4i     April 29 2025
    - Added AES Crypto Extension opcodes for 64-bit arm64 on Linux.
    - aes-armv8sca.S aes-armv8ce.S : add PAC/BTI branch protection
      support. Patch from Emanuele Rocca <emanuele.rocca@arm.com>

aespipe-v2.4j     September 2 2025
    - Added configure script autodetection for 32-bit ARM -marm compile
      flag. This option is needed with some compilers that default to
      generating code in Thumb mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/aespipe/aespipe.hash | 8 ++++----
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index cb60e7dc1ed6..f9a45b6e0cc2 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
-sha1  f1148f4aa82979755b13130b74643b449de55f6e  aespipe-v2.4h.tar.bz2
-md5  6c4552f10771eda471c964b34b1fae4a  aespipe-v2.4h.tar.bz2
+# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4j/
+sha1  ba4d7cbaa0adbe924fa8d006d7f4e69c63f567a2  aespipe-v2.4j.tar.bz2
+md5  d0feebaa55a4a3aa5815492b8f096b09  aespipe-v2.4j.tar.bz2
 # Locally computed:
-sha256  eab311fc26ea43289bc3adf660d6270492494960725d2026ec4917294a1aba49  aespipe-v2.4h.tar.bz2
+sha256  448fe1e58612c184951645ddd926fc5bdb64fc4f2f828c766c82aa1127e9a3e2  aespipe-v2.4j.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 054849a14779..d23acbfc0a13 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4h
+AESPIPE_VERSION = 2.4j
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
