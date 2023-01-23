Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B939C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 18:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8939360F9C;
	Mon, 23 Jan 2023 18:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8939360F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjFiLvm4KPly; Mon, 23 Jan 2023 18:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D371D60F99;
	Mon, 23 Jan 2023 18:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D371D60F99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22FD51BF373
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 18:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B40381AF6
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 18:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B40381AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLqhVZYRINiU for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 18:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1541381AF5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1541381AF5
 for <buildroot@busybox.net>; Mon, 23 Jan 2023 18:58:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso9336636wms.3
 for <buildroot@busybox.net>; Mon, 23 Jan 2023 10:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W3WY+MajZDk+DgJUpD0gNA6jA1vbklPW82vTj1ZsGMo=;
 b=lJ9+ssPRpr6kYZxnSkJThxrMvOWryUQotxFfjLcUjlJsZACsY06OZC3WtkRhViGMqZ
 CusMWzlmTTA3kQ/ii70G+RZ0jvlan1PLll+nKdS5R4W8pfePvgmRvl8U1/HnvUqajBYx
 W5vPaVSlQcI9AYDF1prm96qmHaqEDY8elSTmzp9oLVLlFTMXY/BN4adYLMcQAYMh/sbM
 SYhrN2QhEKy4dJU5kdd1w3s5rKWjEtsx1OzHtcT87b7zmR2JSOm5oqMK64ufhl9Ci46Y
 EQOViuUab+6s/if6EU9Z+yAbL7mlKAJVSkOH0UkufxMDMtyG2MSUG3wCUu5p9dHUyk+W
 VTOA==
X-Gm-Message-State: AFqh2kqxlolAHtmzQk/ELp38iOaXps2fizWUt/huc/sP3aM3xulbv7Fm
 1xyxSCNmQyu/IFgT3GAIEp9SXYvhNug=
X-Google-Smtp-Source: AMrXdXtaYdWF0hBz/VRhc5f3twM0DrsOgYtCw31A/eX/HZJiJApu2gLWCmT9umVvmfbdA290uujMKA==
X-Received: by 2002:a05:600c:4b16:b0:3d2:2830:b8bb with SMTP id
 i22-20020a05600c4b1600b003d22830b8bbmr32877625wmp.34.1674500332163; 
 Mon, 23 Jan 2023 10:58:52 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c26d500b003d9b87296a9sm10756307wmv.25.2023.01.23.10.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:58:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 23 Jan 2023 19:58:47 +0100
Message-Id: <20230123185847.159349-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W3WY+MajZDk+DgJUpD0gNA6jA1vbklPW82vTj1ZsGMo=;
 b=B/CEMT7VIpF6l0F6Go/QNjYDIYthllKDkPcHYQzAsKsUxN/3vqN2nB8UJFKQUZTVFM
 +VUOtPa+0UhQEoQGD2AgSA8ZSv080Vrbj1MX9HiTE1CC5x0+R7b9rgVaEby8u1oR1lJV
 tIsD99MhCTKcfbrHBVRiGjnrZiypwBwhkXHXkJNTYBNH55+bel1LGg/ppVpPIsUJPAqa
 s2L43pK3QxnEEHUvfs8ucrAGRn+KWBi25AiTGWFPpFNcW8rGBsuRat0Yz5zji7oIz2fl
 FTo7spE4CA4kJ0dA4LzmKfhjtD6mU9vhDfNOHBnn9SPPrRyV3n5zlCAujoDk1TDWFJuU
 AzrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B/CEMT7V
Subject: [Buildroot] [PATCH] package/nano: bump to version 7.2
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
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index f49b71209..3ca37c633 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v7/nano-7.1.tar.xz.asc
+# https://www.nano-editor.org/dist/v7/nano-7.2.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  57ba751e9b7519f0f6ddee505202e387c75dde440c1f7aa1b9310cc381406836  nano-7.1.tar.xz
+sha256  86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526  nano-7.2.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 203c417f0..8a2003b92 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 7
-NANO_VERSION = $(NANO_VERSION_MAJOR).1
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
