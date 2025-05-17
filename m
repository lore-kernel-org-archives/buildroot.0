Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F37C3ABD8
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 02:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3548E40BC1;
	Sat, 17 May 2025 02:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phFUTzMUSG4M; Sat, 17 May 2025 02:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7438840DF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7438840DF6;
	Sat, 17 May 2025 02:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FFD71DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 02:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CD583D7F
 for <buildroot@buildroot.org>; Sat, 17 May 2025 02:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEzrJZo_Vncq for <buildroot@buildroot.org>;
 Sat, 17 May 2025 02:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC45F83D7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC45F83D7A
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC45F83D7A
 for <buildroot@buildroot.org>; Sat, 17 May 2025 02:41:11 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-70cb3121db3so8646127b3.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747449670; x=1748054470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTVdLD1+CnUCgD1/VPy90DxKP+RRb2MYwPMb0lvLGnY=;
 b=ifyq1Zu2GyTPXxcEQTaV6R1TiBnPIbprPDEjUhV2N8RJBUE4lG4gswBd9sgrjQ/qvU
 L4Q8gYKNzq36V0e+DgA8heHq+ZS1U2S3Oy6wj/qyrD2D/LdwBgeYS/prrZQ3CSmxWUg9
 JddXyDniLBrmUA4n5h2CjczXvMtWSKEDmj/wlHhypm1AJ4lZ/jT3zvL/WczFCr4LCsy8
 WseDdWvOin8NzAK2B7U0x5UxlUGPsO4qrbjcJflS7GRdXv4hBCXaBwagiCPmByGThbRx
 awSjD5qW22TlFZaNGTbGdWQ2FM0s2CsgOBJ1fbjq1bkwm+rFhYlh4yTqwhNf3gnubWdq
 PwzA==
X-Gm-Message-State: AOJu0Yz5zmh92EUKFHZLt2PPZQ3aTZ7si6nJaYo8ovGa3HKCIy7VhOL1
 Vd7TWHSm0xoTCU8QqjIoAltJfxurZUn9mL5gzcYkqs2XRQx0XlDPQA1bh6Ixmw==
X-Gm-Gg: ASbGncsTSH+M+0D5VgcGPqlRZo+CyxNqm0OANytQBBfjHpVBidgKja+MOMdw/uit/sv
 WPdDQqSMD861JObPx6Xt0JunWbRHMGZt5WRlftIj8ijSOFEuy2vknRMIW10mZVslDbsjtBK2Lfr
 fTouHGR5jVpnFtr7WZowsY/ej9s/L4SPXE8wSE5QGkW4lwbX7SaAeERGayG9lG5aET5QH4OBB49
 DxSTg76ady4PRlWUimkMLzA5lslgUlae80kAL7+Du+ahyC9VVDsGmvUwvCG9m6VWT13366hD4a0
 7zuz/JrkoiQD6yWvEGBDbX05hdKtPIjqOf2tXNQigtMmhZhZmjjLSTfjK22iGzpnVK2gIcc+Ti/
 VRrZYmFE8m1jJxzd/HtYpSPaq
X-Google-Smtp-Source: AGHT+IHHUgINtgsX+XMz9jzJM7k7RWfGLsREyVn4AeF9J/WVTpQ3wj7WoYMkgl0Wa/sZ+pI+m56YEQ==
X-Received: by 2002:a05:690c:f82:b0:6f9:7a3c:1fe with SMTP id
 00721157ae682-70ca7a57ea9mr88064577b3.23.1747449670219; 
 Fri, 16 May 2025 19:41:10 -0700 (PDT)
Received: from localhost.localdomain (syn-131-093-209-211.res.spectrum.com.
 [131.93.209.211]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70ca8508764sm7256147b3.86.2025.05.16.19.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 19:41:09 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 16 May 2025 21:40:45 -0500
Message-ID: <20250517024045.625622-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747449670; x=1748054470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTVdLD1+CnUCgD1/VPy90DxKP+RRb2MYwPMb0lvLGnY=;
 b=JbCBxN78aOCNd7qQMaJqVT0ISwxyZAwlG0u1gweduJziSf4WK3KHfUUcaSWQxzZq9V
 7MT5PziiXDtAnKBd5Ng1ufGB4gizCNC4OmwEdoEJCdUgyF2oYdO8yirRgFaTbLEPZAcj
 dvqgGm3vMnIrKUM+we7e/6pN5u7L26WaJqNovk9dgtBIim0mLt13B1IBc82xWNKOYZaX
 k2VkKJppOLORUpZdEq6n7ybhBXp3GWSz3Am/kSbzq681CjGw7qLGTrLaCsn3N4lDsPaa
 tRnqsdjrQb1GZH7qkmGwyrYaODc/aWJJsNIyLO6Am55Wur7vVETuldFjM51dB72WmnyD
 AhtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JbCBxN78
Subject: [Buildroot] [PATCH] package/m4: bump to 1.4.20
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

The new version bundles an updated gnulib that includes support for
-std=c23 which is the default for gcc 15.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/m4/m4.hash |  2 +-
 package/m4/m4.mk   | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index a81f4fab9c..a5b8456cc2 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96  m4-1.4.19.tar.xz
+sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index f5e1e27ad8..396c2bbee2 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,20 +4,10 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.19
+M4_VERSION = 1.4.20
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 
-# gcc-15 defaults to -std=gnu23 which is incorrectly detected and
-# generates build failures in the gnulib copy included in
-# m4-1.4.19. We workaround this by forcing the previous gcc default
-# standard, which is -std=gnu17 only when host gcc is >= 15. This
-# workaround can be removed when m4 will be updated to a version
-# including a fix for gcc-15.
-ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
-HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
-endif
-
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
