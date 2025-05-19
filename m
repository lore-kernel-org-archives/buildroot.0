Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB8C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 06:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B6380FD7;
	Mon, 19 May 2025 06:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAfOuVG0Jc8u; Mon, 19 May 2025 06:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623A480F8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623A480F8E;
	Mon, 19 May 2025 06:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC3A193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4DB580F89
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dZjSwVtM85X for <buildroot@buildroot.org>;
 Mon, 19 May 2025 06:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B539A80EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B539A80EB5
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B539A80EB5
 for <buildroot@busybox.net>; Mon, 19 May 2025 06:26:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a36e950e41so433463f8f.0
 for <buildroot@busybox.net>; Sun, 18 May 2025 23:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747636014; x=1748240814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5kTo6lLfsV85zBwfxltEL/inDm9D5mYKBprHwaVgxKs=;
 b=YCgIHO0jJ0+6Lx8jsMYRRv8iL7zPxmA+AQOS7sdrk/sq0Bfu4bEsrcFezviee7CVfa
 oKpqHG9sevvc9+e9VNHPS+bEy5xsdFgtOu3odAl9yvYs1r0J11Tvv4AYvjElNqzNTdnI
 Sv/F4VOwgnoDVxWHvG4SBQkpEWkzg17K5Dq7mzFyvTHVkl3DZixrEuSrVJG1lu2kXnij
 irYO9Fs9w853wuXbAC5/tkaOhxXQ9Fo6KBMnIHYlRRd2falTVe4D/bIBJ2bwXCCOinGP
 7aUI55+hqzdOnktAMIzWxwhaXNhIlP8dRtfjkNX0y5aZHODTQ/P77s8xmBLvdZ9HcW9U
 eLlg==
X-Gm-Message-State: AOJu0YzfwzwQKxVKvIW3pGdCnOeA4Oa6O+N7mVQAYsujBB8gwRJVnhoG
 j2WcpT0c3JTaviZFYskBYOCIQlZ+GB3pAbunxFAdmX04oUij5SCUXo6+AFaf6hBaIU0LJbAtlH6
 h7FWJgg==
X-Gm-Gg: ASbGncs3JXUdKWK032cQNcBRTs9viHnBmOdWC6KYbnyl7PKmD8z7Akr56W6tR2eUK7y
 WELE880Ps2qrbmJ1sWmRQFj5NSJUVZvbDhcGbsLCOsKHKz442Ivfxwxhkp2RW2oKYn/OnW+eIuA
 xM90xRzTrawc/voN2aLE1P+rdfJiZityOs/knsOAX5C/jvdq0KbXOkl/wC54ST4ijKBrotOw/cD
 Ol1SDLHiCvcwc9lheZqZ/SEHV6AYCzhuIvogElLVyzijcSk6a8t78ZgythUMzyvMbXNFpcUox3Q
 PyPZbdx+1C0pcQ1xLB2fKQbOpYezjW388prhFAo8XMVqWXg1wC2zm56Bgpn3sLTxPwlUybC0idS
 Cf2jXEpOnVw==
X-Google-Smtp-Source: AGHT+IFFgP6XkmR7uxBL8Cm3v0bEQ76ilRUe7dl7J8ngA+TCW+ejuQdasHiE7p8sA1DWrJaTwQW6KQ==
X-Received: by 2002:a05:6000:4382:b0:3a3:7096:a210 with SMTP id
 ffacd0b85a97d-3a37096a2bbmr1350452f8f.42.1747636013637; 
 Sun, 18 May 2025 23:26:53 -0700 (PDT)
Received: from vm-2404.. (52.186.66.37.rev.sfr.net. [37.66.186.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62b1bsm11765574f8f.53.2025.05.18.23.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 23:26:53 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 19 May 2025 08:26:41 +0200
Message-ID: <20250519062642.2054597-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1747636014; x=1748240814; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5kTo6lLfsV85zBwfxltEL/inDm9D5mYKBprHwaVgxKs=;
 b=q3buE2sYE2XZmvP0EDgNUVlHMM95bZRM/VcjFEcCAdOuB9uTngxkeb1G4p0fQbnKTO
 aMJiHiAz0hWtMuXukLk3oKE8BI6NWpl7JK09546erky0fLh3V7f8jZVuOqqow8qC9sfq
 MZ0dGpno7JXgjTkE2iU2UPY5Erizvf844R6qbcc0jOwWh9dFekREF25gz39XnE3bkL6V
 JNNyXdiL3ABCgqInRoIo2L7cLEvqz2YyAPv+xJK5wWJSUX+Y9d45NSLOiLQbVW5FFrza
 h2SldYIYcUq20R7jBIU/V485zS3PLikdHpUjGJWolbpEjeuZIq+CZcZyO0VEQjqY3ATw
 xBbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=q3buE2sY
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 36.3
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
    -Copyright (C) 2006-2023 luaposix authors
    +Copyright (C) 2006-2025 luaposix authors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.hash | 4 ++--
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index d54395c29..fbcc0dd6f 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44e5087cd3c47058f9934b90c0017e4cf870b71619f99707dd433074622debb1  luaposix-36.2.1.tar.gz
-sha256  ea0fdaae50b0d31a81c2c99f4354264783c71043fd40522feaa40eecc069599b  LICENSE
+sha256  82cd9a96c41a4a3205c050206f0564ff4456f773a8f9ffc9235ff8f1907ca5e6  luaposix-36.3.tar.gz
+sha256  0aaf3d6797693f3ea0ef4df2cb4d43627b00eb08213ead4fb037a8c4a04f8631  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index c5d98fbbd..46be3b42a 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 36.2.1
+LUAPOSIX_VERSION = 36.3
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
