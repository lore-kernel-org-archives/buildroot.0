Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9BFC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E017342039;
	Mon,  8 Jan 2024 22:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E017342039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzNmlBNhTLrj; Mon,  8 Jan 2024 22:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179F841F11;
	Mon,  8 Jan 2024 22:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179F841F11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53C2C1BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A915419B6
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A915419B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-IrezgKtvUW for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:00:35 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C9E841953
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9E841953
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3367601a301so2223046f8f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 14:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704751231; x=1705356031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N9Cnv7qIQtnk8gBEBBr/lXFy9sw1TVC4Sb7dbLSFB5s=;
 b=DK5RqPtZqedGQ/OUb9BZobhssuGFavo+V40bnCoFqh5AO/zJdKcOOzB7NkPZhOmyQe
 smwqvUeiXfhNKVkrH704YejvJvB/h8G20W+EgYJtIyow/tb1eROVI/QTrF/LjBVhUMCL
 yHjiIuOYmTWE7IYnavqdtSAwal0BXIBAmlVoF7d0soUqfXPaPXvkonI/680af4uqdUEo
 8kXatPPYdlA3QdG4exXaO7hx9njNcB9ek8VmUxkR3Hb1sWwlXZB/VtEakctb7NHBmPtK
 4PSt5agYlMDnTdbeVZy0oc7TM+IDXTJlXUWb2zIPKao6ObleFC8w0Je1wXtYViskpixg
 pa5g==
X-Gm-Message-State: AOJu0Yw1yieehPNqwUCuYLWwgNOLGuUXsgAqzVfjRi+PT3HxeZJiTxpE
 IZbmwXXFDwd7jYJMtiZxoWYoYyLwt30=
X-Google-Smtp-Source: AGHT+IHJJ+7qYmQHr4AsOm/0RDVp3qn4T6wUkH8XYt4ZQB6LsEhlfW7ygQ646/QjvSiHerPu6NM8zw==
X-Received: by 2002:a05:600c:a018:b0:40e:409a:612f with SMTP id
 jg24-20020a05600ca01800b0040e409a612fmr1459114wmb.130.1704751231052; 
 Mon, 08 Jan 2024 14:00:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b0040d802a7619sm12365789wmo.38.2024.01.08.14.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 14:00:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:00:26 +0100
Message-ID: <20240108220026.435160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704751231; x=1705356031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N9Cnv7qIQtnk8gBEBBr/lXFy9sw1TVC4Sb7dbLSFB5s=;
 b=kH2rOw20f+UO2gz6lZZoTd4I7mbc0Ix70YizLdO3ZvT4rGTIcqnVUkkVyvAZwbMoeX
 /iklr/+JjkBD4FgzxeQuU3wBU5OpUQuUZj51AZPlu9qHxrs0iMb1gOp79GI5NIkttIbM
 F+d8lX28+B8Bq/OqZjcikoXvX2DsLVqCbkyZxWy0ed2dSq1RFJuVtYTEZjJ8hWlGpFBV
 4VnePUieGIAA+6yGDe4ZpNXMOGcXpV6WY0pkvKVmbuNIUukNS5oFPELzOvOk2hABnDfZ
 5hogAg+/S+J7ZP0IpQhn8ZOm2vYWtAm3j82lI0+xIMAX9xFQ9J438orHtWKfa0pNeJQ0
 areg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kH2rOw20
Subject: [Buildroot] [PATCH 1/1] package/micropython: security bump to
 version 1.22.0
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball
- Update hash of license file (some packages have been added or removed
  but the list of licenses is the same)
- Fix CVE-2023-7158: A vulnerability was found in MicroPython up to
  1.21.0. It has been classified as critical. Affected is the function
  slice_indices of the file objslice.c. The manipulation leads to
  heap-based buffer overflow. It is possible to launch the attack
  remotely. The exploit has been disclosed to the public and may be
  used. Upgrading to version 1.22.0 is able to address this issue. It is
  recommended to upgrade the affected component. The identifier of this
  vulnerability is VDB-249180.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 7bff7de4e2..43551866b9 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  c980ad7e742491df0dc10db2958137dbbf9aa7a8009e102fc75f4c0cac2d6b5e  micropython-1.19.1.tar.gz
-sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
+sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
+sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index d73cdb28db..7dbca0f1c2 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.19.1
-MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
+MICROPYTHON_VERSION = 1.22.0
+MICROPYTHON_SITE = https://micropython.org/resources/source
+MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
 # and most of the copied code is not used in the unix build.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
