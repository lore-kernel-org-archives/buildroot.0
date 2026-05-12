Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D71CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE1A821CD;
	Tue, 12 May 2026 09:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQQb-bQWHdR0; Tue, 12 May 2026 09:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3539821C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778579212;
	bh=ZhoZvCo8209U+CQXHIhxeUInJ03PUoP+z5uEokwn4bo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=oFpBeuVWacourmIOSZPsAn9J+jDrfxRg9TNOVSJBHaPBMS9uRZ15SisnAc2ZBmoBq
	 7hQgmaiLnkE/hGnz7ZY/sAzbCz0lYZUtwXDNUy74uvPBecDd4Tw331H/DgOnHtmqKe
	 HduNbJY0h/VHFglR7Icr09po04UPC/Uc0suarnSggU82MKd80weI6zUsWyxAliI/nA
	 2ASEk92iD1Ze7g1npQ7/6sxnErx0jxnf6AkrMPzpOP0WvNqDrXwiquh/jT+ChYAhWd
	 4vEd8kmRJ9ALsnuB7kj+KX10FTnsZ76x3PZwHDL1a87StH2VOwWy1WXhymicxYNJRJ
	 2mxdlkrV/EzXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3539821C6;
	Tue, 12 May 2026 09:46:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E864C398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA38C40E6F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YW2tpnShgJHF for <buildroot@buildroot.org>;
 Tue, 12 May 2026 09:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02CD440E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02CD440E6D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02CD440E6D
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:46:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso60214735e9.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778579207; x=1779184007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27hHIOIpmL+gY/qPMPP/IvFRQ5n5U8l1ws2BvDHxqOw=;
 b=VE1M5jUSBQ14XjZ57gRbQV0nbx6unnz8fyQedLolOmE9rRv1G1bTh9T4jlAyV9QXaL
 mshMA4S2gupYHowkyxXv1SiyMS8kbcmTxlZVlnw4JvfxebOhPR5vvYU7SxPkaAHtpORl
 MWy8HCyr9LY+akw/wceGLy+vND00VLOzyvEW6s5yh8CQOMavj6pG33SF/RD8eXEhzeCM
 Clw+hIs3+n4/lZqk9pX2yeh4rsfQtN70I6QfN641vY5V7/WwKBJcysLc4ZW40iRAUl0f
 j77uwV3TompHwjprz6DNRPbvzHkms7j89UoSFMzFJ2jLIvpAM/5NZT1PPOZN4UZCDcM0
 Wq4w==
X-Gm-Message-State: AOJu0YydLrO3lERhCcljxrd15xcz21JU3X3m/NGNAM3bvf1OX0Xp69lG
 IXlZ8dxL/RdWK+mUCZnnz+u9mHfAanIeBkAFbau1/I4nQFpSjd5yfOAOVvWkndJmN0xJ/j9ni1a
 Th96H
X-Gm-Gg: Acq92OGYuzQRYJhhiTwlAYFXcJzvKtL7zax8getXuV03MtI4IrbAxH88pX51TCrepa7
 U7EI5tTMrNWuK1oF7P0u+CQ+Ij8uXQri3Zd1GrEcr+/IH8ZPxWJIIUbQYYSmLhPHp9JJag0m5lz
 QZ6zVyfwBLgLREC2IwopFFm5Aaj2kMDP5GlbUaL6kpxrYmnbDeDPMVt+v1s806Qs3K+t7K8boHn
 F6Lde19XypIZqOvBXy4y85cF1IYAMRvyWy+6tf62RWfZxlIloyjE1G0lJ9ABzTvUP6auiKaEzkf
 MU4j/dMjYnaZgxzQp5HYLkJ8FiluBUGyyUloLv6E/APavhonyBk97QOxn+arKt3PLjELSJJSOWx
 MNomvLNeSXlDPB6fjl8DOetz2Ql3FAxcfnOpbUqJCIpQgfnGfLGk0LG7S6pj+RUlftwoKrl5pWo
 /BYqx8pHvpWUN+18Q7oQrJzkb6dHhVufTsU2XncjKzqxRK
X-Received: by 2002:a05:600c:c118:b0:489:1abb:5559 with SMTP id
 5b1f17b1804b1-48e8e1f906cmr35100125e9.5.1778579207314; 
 Tue, 12 May 2026 02:46:47 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f3cf0cdsm23584855e9.2.2026.05.12.02.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 02:46:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 May 2026 11:46:46 +0200
Message-ID: <20260512094646.161784-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778579207; x=1779184007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27hHIOIpmL+gY/qPMPP/IvFRQ5n5U8l1ws2BvDHxqOw=;
 b=BPvs9NLiPQXjq8TtMZ/wbZ2YiicZrsvzH61W7Zu9Olgr9Akk8r40SsogoJV7NlCUgJ
 uAZ4Kuptg5l3ued5WRtXO9VkIyISzwjYLVxfyzyrVIPfHmVg7y8r2BJ9M2yNcHu5WN/Q
 rXFQHmoodJ1g2CUgRd50xJyFxvmkmgly1y/EjC+h+e0zxqrpjNBhkI5O6cuaiJczS4Zj
 8WKBfABVObsDBp/IAscpk3ynSwjRQMh4+0bfEokn+oMeYWAh0z1RhIAsZLG6ixp5hNJ+
 3vzm5v1wDhwzkrz3aFmWdBFMORiM3xggNzR9aQZa/XLZ11sGXSAOGYrMhVFCm/9s1bJe
 78QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BPvs9NLi
Subject: [Buildroot] [PATCH 2025.02.x] package/cmake: bump to v3.31.12
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:

- https://cmake.org/cmake/help/latest/release/3.31.html#id2
- https://cmake.org/cmake/help/latest/release/3.31.html#id3

This notably include fix for host w/ host-gcc16 [1].

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/ea04e19daf7010781d0df980b9683a642093e381

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index cbca2fc355..058b900199 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
-sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.12-SHA-256.txt
+sha256  5f3fd5a54dfa65602bdbed64f981a72673cc19f2d304cc2955cf0dfa0cfd8272  cmake-3.31.12.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 304dc3755a..249e65700d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
