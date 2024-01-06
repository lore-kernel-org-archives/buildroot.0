Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CE1C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7ED060BAD;
	Sat,  6 Jan 2024 14:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ED060BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAq-7swh9Wh7; Sat,  6 Jan 2024 14:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A87660B90;
	Sat,  6 Jan 2024 14:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A87660B90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E80CA1BF362
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE63D60B90
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE63D60B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5W6YxJdQJJDN for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:23:04 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5C2160B4E
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C2160B4E
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so4035075e9.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 06:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704550981; x=1705155781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/a6XFXiBjdeaCC2++7KEaz0oO6efjhAVP4HoYVoBUIk=;
 b=uRtOVf95VntL41HwS5XMsvz3Eb2Gj9Jb3F/hxlfvrrCUkX9mvmxtNWnBXJv1Xedbw5
 CXrKfSqjWJOBU2MmiNnhppJOhyQSSlfrucG5O05zmlGtxu5ikdQBLgRl+ErZI8JR52sh
 BxzA/fmIqCmm/dWZsGIzQI2KslomeqQE2R2C9MScpZtrTRw/9hjwPot/39neC0Ikqpfi
 MSfaztVUsXLFT8d4yS9pPKK9TYG9gdhXHkT1vv8jxM3bxqxPZYsaQF8pIbckEuZW8lcF
 rioJMYxEuDlYK5gpTwQOMEMBaDkvaXzdjkuZ/KaJKaHXEoh/HzXnmHksw5aFLXqCNFS5
 DN7w==
X-Gm-Message-State: AOJu0YxBdlsYnCQbYXW5hLr3tCmMEAbq3RGEWBJ3nSDrziLgxQ1f0IZs
 psaB8BiI2f6kLhbVe+FS/9Tzitebk78=
X-Google-Smtp-Source: AGHT+IFrFxhdRReFg2gi87kcZDfOL96qnZ35Tu+PeBlOtkjmzul5glRqF+V7HsTVfDkn6phMHYOJ7A==
X-Received: by 2002:a05:600c:a019:b0:40e:347e:b4d with SMTP id
 jg25-20020a05600ca01900b0040e347e0b4dmr680357wmb.89.1704550980691; 
 Sat, 06 Jan 2024 06:23:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c138700b0040d8d11bf63sm4832209wmf.41.2024.01.06.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 06:23:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 15:22:58 +0100
Message-ID: <20240106142258.1880402-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704550981; x=1705155781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/a6XFXiBjdeaCC2++7KEaz0oO6efjhAVP4HoYVoBUIk=;
 b=GSnTaZsCKAajS/A38pgtKdYBHWvJV9FeoWI3mB078CvNE5Ipply5KKXdMepwQZikDX
 XEt3YKay03FkRKz07aUdSd0fj3kS4NPmBk1JEpqznTX25gz00ak1Xheboz28X7JuRKHs
 1bW+5v6l21QBOO/gIxPYQKk8qT4vXGvsKlsDBgrc2fn81gCTWzASFIG+bwyZ9QjQsbrf
 jc9fp9GevVUNiokpqxJ4ZRBEk4rWXFG08TwD8mlGHrU854V3ov4j1u6Hg1455ELyg2/u
 kYqV5U1dmCmbU0V/dCK31mZp55yHxLj+KkPRGTjwda5bniF5LJA+P+o+L9jKxgE2SLDY
 drCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GSnTaZsC
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump to version
 0.10.1-rc
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
Cc: Alex Michel <alex.michel@wiedemann-group.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.10.1-rc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 564ecc9a57..98f804508f 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  752acec56236fca41dcc438307f4a76e69900383b06803d47f32c480643dc794  libzenoh-pico-0.10.0-rc.tar.gz
+sha256  7b615515ac844470ec7806921e8106b2923f6c43e242b34f062954de7560b799  libzenoh-pico-0.10.1-rc.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 72b956fddc..90dfda6c98 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 0.10.0-rc
+LIBZENOH_PICO_VERSION = 0.10.1-rc
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
