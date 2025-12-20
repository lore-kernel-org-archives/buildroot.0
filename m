Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02629D78797
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1176980D28;
	Sat, 20 Dec 2025 14:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaCxBk1vsaW8; Sat, 20 Dec 2025 14:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B19780A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766242561;
	bh=yW0SQFi3DrHoNqND9ChdJOtKgurbAcbmyLR0/u5D1Fk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uev1N8lv/wigygpuRhndSSqM1uZPQLLc9Rx8SO+x6i2gDR1iXTEcGXMTWgL/3QgzQ
	 QWu1Qe0RYwUQ2hDknUT49KK86qkBOh3LeF4oRVA0MLoi8+NdNZ+3qOBMgp+N3ZlSBC
	 Cld5NZexNT5f70hqeINA93pYfLqOKm/+vnvOs0ln/wXbeigelfIlDhSgTyS49ogXYx
	 V7SNK89tfhOW+eE0T5DDbRSBA/SwrasenydfRRi+TsNihih3afSkzsuwyM8Goq2Y1G
	 npj9gp6bIufieF1e/RrkizQ/ghpSymRaQkkgg0jhtanNvtfJJHdi+CuzvJrqSRBNg8
	 ey6zr0jo/AJ9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B19780A9A;
	Sat, 20 Dec 2025 14:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1CE119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 14:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF8D080A92
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 14:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKiouqAFG1fG for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 14:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A97680A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A97680A79
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A97680A79
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 14:55:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso22834525e9.2
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 06:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766242556; x=1766847356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6si5Xpl1U+uOG+dz1hWjFNV8WbzW6bwfrD2+sUs0V74=;
 b=mk1aCbJHmEVZGTMxrhz3h6N30kKXxXrWB+/obaxhKzAiX2DASjBM2vNz8DFXQqMsxA
 pyy13eP2i15cLzXRy8M+ypXlCabM9T97LCQKQxxurYBLWokCk1osC3yFLNmiTayIvxX7
 UfcZrc/1webBEaO6/eGWTi4t7XChe3JpCE4wxwVFZWpEmKutbiCqn3rrJVv/DcjsXZEe
 oSKw1ARPCNC8ejPrKKjVhhL3AozgBruH4yS76UljrEeedSLKeTD+lsh2Nqke0WaFOeLR
 80VOXy2+bF1VYiOigjoDy5oTIay4alqZYZG+tWUw2n/q212sMzYx/0YoNo5IeTIqfnvN
 ArVg==
X-Gm-Message-State: AOJu0YyK0yoS0KmBhZfh9XHngE+vkYcdPvt7twgFLWZNeOOx60VEH84g
 bYTItUWHXD9IVCBrszFTjcmoVBD1WXJ9sPdeFopqZszdT6WAfIM+cdYQil4QVvjVXsd65OxxKtA
 bAI47Wg==
X-Gm-Gg: AY/fxX7vYCN4hykJxPHRUg35siBlPB9P8yJSgIJd32AaVsBqbLlsKXfrk+CBGwnIpxE
 oMTl0eo2rzUVQzd1cbX70FqyyP8BXLGVfHLkXJXhjDxgq9x+lIIhn7CSi1nnE76jO9jtk98RaAS
 5fsmt/u1MrwKFfYiWcJvsQvSMwep8qwj6EqeUdfiq+EufMj1jEhczPfFkLwHLTvZk3fZqvAwtuh
 Ckw/4QXYiS6LAGF84d711Du2kSgU5MEWoDmWnQz/WnpmV66bVogPswqSZQbW810hQMjXMBkLh4x
 VlZe4mE9F07vvwXxl0HU3Uwe5vEzKe/y68ga78HBvqjUhr8uzIhAgKojskQA29Wt3HBwn6Y2pA5
 cJfn4HCznv7M80vy6OxQ7sSlkLeLUDMFZgha2Z4a5PTN2O9rbeQMpk6NfE7myKPBHxfsoIAYw9k
 QOTQUkKO8ajVbBsXJcu8CD7eq6PvVJErs7Y6s=
X-Google-Smtp-Source: AGHT+IEw0sQEcp2vzhrWqGT4y1ULzkHIeFYo9gnYIDlH6bPoQ3B7xQsmwAcAc8fQOG4aZnLl4THcSg==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id
 5b1f17b1804b1-47d19569c23mr69543105e9.16.1766242556043; 
 Sat, 20 Dec 2025 06:55:56 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b0d5asm149870005e9.13.2025.12.20.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 06:55:55 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 15:55:42 +0100
Message-ID: <20251220145542.433349-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766242556; x=1766847356; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6si5Xpl1U+uOG+dz1hWjFNV8WbzW6bwfrD2+sUs0V74=;
 b=qtGf/djpTeBhGawu5iKZMKfT2soEjs1g8EnXoU1PW0c4GuH8s6DSD8hQpCItWgLCjY
 4sAPKxu9LBcF1bepT6afoAbSymF25F7Yhz8okdqCf0ViQT8svDupQTnfxWJsutbMKwvq
 xFjuN3YbRWrpYJ5asOxUwQJSUflbbahqndEvyyyxm4bu3aXVC5gbayq3pNmDAJ7IKkch
 5dNE0cNrXdjU/muOjr8ep/aRFy0e+yfcxmevLE99+nZOFJrDaa24vuNACH8WEBQrHgCU
 N5RtGgLGCggY1w72hrW5mK7lDl0adMcACEgzeWc3E6Si1+qhOW6W3xo6rj1HEvNV+VUk
 ntxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=qtGf/djp
Subject: [Buildroot] [PATCH v2] package/lzlib: switch to another fork
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

LuaDist and their subprojects are died

LuaDist was based on CMake, so back to luarocks infrastructure

different tag scheme, but same source (ie. lzlib.c)

this obviously fixes CMake 4 compatibility.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lzlib/Config.in  |  3 +--
 package/lzlib/lzlib.hash |  6 ++++--
 package/lzlib/lzlib.mk   | 12 +++++-------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index 59a2e6d5c..16dd2c314 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
-	depends on BR2_PACKAGE_LUA
 	select BR2_PACKAGE_ZLIB
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
 	  interface similar to the base io package.
 
-	  https://github.com/LuaDist/lzlib
+	  https://github.com/hishamhm/lzlib
diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
index 4bb4c52c8..61b094f10 100644
--- a/package/lzlib/lzlib.hash
+++ b/package/lzlib/lzlib.hash
@@ -1,3 +1,5 @@
+# computed by luarocks/buildroot
+sha256  860c893fc53d0a7830a54fa64f22a2b89260ca39c9a7dcb0890f6d3029f00ca5  lzlib-0.4.1.53-4.src.rock
+
 # Locally calculated
-sha256  cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb  lzlib-0.4.3.tar.gz
-sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib.c
+sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib/lzlib.c
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index 74624d501..4b869872b 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-LZLIB_VERSION = 0.4.3
-LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
-LZLIB_DEPENDENCIES = lua zlib
+LZLIB_VERSION = 0.4.1.53-4
+LZLIB_SUBDIR = lzlib
 LZLIB_LICENSE = MIT
-LZLIB_LICENSE_FILES = lzlib.c
-LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
-	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
+LZLIB_LICENSE_FILES = $(LZLIB_SUBDIR)/lzlib.c
+LZLIB_DEPENDENCIES = zlib
 
-$(eval $(cmake-package))
+$(eval $(luarocks-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
