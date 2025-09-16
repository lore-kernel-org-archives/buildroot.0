Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723E7CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 12:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DF680C7D;
	Tue, 16 Sep 2025 12:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SY6L21ouWkPA; Tue, 16 Sep 2025 12:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B9E80C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B9E80C38;
	Tue, 16 Sep 2025 12:20:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 177BD199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18CF40819
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 12:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLozc0Hm-Xax for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 12:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0174B40145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0174B40145
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0174B40145
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 12:20:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45de1084868so29606085e9.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 05:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758025209; x=1758630009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06CEK3s0K5asOzm+ICqoDcbG0LBFDmIlsUVU+NxkOfs=;
 b=d1gLkNgLQjkJYjS2AYmJP5hZVJ1h+KblPOD4T1STieNJiaJwDjt3FSuGm6JQwnyKQW
 CnmD2dlSq3LWaB0h7l/zOBiikTffrkahiCmjYFvEbKCxC4ClfbMZ8r0UhiBj1JdWtLVD
 DAEoJfwmyS0NZ3H4gy2v9PnCHqpj3qMne/CGTxZOwEPWZzAlT7hp8DGdI3jAoZVX93EM
 PT7C0+y8TqWstnjdzmXNL5vXw09ogoKqtG7RympUlzV7jWSJP6KZi7gitZ3NrqFCrbWo
 /WivbSkhRCJ9RCiSJbWRbVZlJMmH3Qrv1/sk1SlYlSqNp4uSz224t3GeaZzb2XCK3dEA
 g+5A==
X-Gm-Message-State: AOJu0YzQgPRrPtlq95Y6imZn+L+vQj0NBmFUNK6NzlfsPkZJpd3yUvW8
 mpkvl2K6nzC74PjRdvE9dVNJdKYfqFjA+itciYIyC8LA9rdDjxeqpkhJPmvZYAs7
X-Gm-Gg: ASbGnct5Dszzu7+Ko3UIjveXBvZackoP/Dy7aJl2RptXE7s2VRmmH2HCFtemUxWrnU1
 PWEufrZ73e1CHY+pw0HRzv6ChvXae/yzvQCf5JvajR/FqrrRnregj+KrG8hT0jzwPZnTk15Za+y
 xmUYxiSNawCO2UwnIbXTrWrybxqr/eqvQ5W+sV2SbdbCVpBiamGMVnhBn4eGWgVbU9KGH5UX4NW
 zlS83TSpgxvFbgJTLzjjK2aKPtIcX20jQHbewTpuZbg07b+Q57oYfYuYhak5/46dAfjuQ2QeJ1F
 LSfv5dYXUpVRynDZTEczyzuXVsEovfmM+1/awejC7kBfd3ZK4u678e+r6bhqMVu9veItXKmZVo5
 FnM3b08HAaZkkszKynPye7PpndlTKPqVjzvaX5d2O6GNYGJW6WE7ksJOC2+Gn+XV9SA3WyH3Ghc
 blC7dPjaAG1UfUaKHHmsw9nnx5CrjQ6EHWAZPpiFHEH0gxqTs=
X-Google-Smtp-Source: AGHT+IG24+vEi9hH1MoBv0G198nGmMuMzLhMbC52a8AfkNTaEb+XSaX1wokx/ZfkSZ/RlUOF2VuDiQ==
X-Received: by 2002:a05:600c:3515:b0:45f:28ed:6e1e with SMTP id
 5b1f17b1804b1-45f28ed71c9mr123859785e9.16.1758025209368; 
 Tue, 16 Sep 2025 05:20:09 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-45e0156abecsm219797195e9.4.2025.09.16.05.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 05:20:08 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 16 Sep 2025 14:20:05 +0200
Message-ID: <20250916122005.30652-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
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

Fixes a number of crashes. Release notes:

 - https://webkitgtk.org/2025/07/30/webkitgtk2.48.4-released.html
 - https://webkitgtk.org/2025/08/01/webkitgtk2.48.5-released.html
 - https://webkitgtk.org/2025/09/03/webkitgtk2.48.6-released.html

And brings some security fixes. Security advisory:

 - https://webkitgtk.org/security/WSA-2025-0005.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 6c2beb7d1d..fde2439dd5 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz.sums
-sha1  36faf2c30967db57175caf88cefd3d25781ae6d7  webkitgtk-2.48.3.tar.xz
-sha256  d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3  webkitgtk-2.48.3.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.6.tar.xz.sums
+sha1  8f8e27722b29be5aba84322cf7252fe14afcec60  webkitgtk-2.48.6.tar.xz
+sha256  d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24  webkitgtk-2.48.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 419bef9d8e..cb66641e3d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.48.3
+WEBKITGTK_VERSION = 2.48.6
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
