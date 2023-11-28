Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E9C07E97
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EE681EA8;
	Tue, 28 Nov 2023 20:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90EE681EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xONtv3ekMHwO; Tue, 28 Nov 2023 20:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB8581E8B;
	Tue, 28 Nov 2023 20:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB8581E8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6595A1BF38E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4904840482
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4904840482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOLs5Yak4kNj for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:31:05 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0118A400DA
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0118A400DA
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b479ec4a3so19280065e9.2
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 12:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701203462; x=1701808262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qurlUwo78bC+6dGY2wgwvnFUjp/Cg69jnh7/BYFCvcs=;
 b=M7HK1Co8QOgmOsIPnpZupqwZKAShHRn0vL3ukU7PtY01CxNC+aJzqj9RgI8Zcz8mxf
 M2EP6Dx5nb5AuM0iLuU0k2R88ONh3ttjYHWZWAspAOCGnfLBaRf+1CMlFGY6Ep393ktl
 MJgCedC0nHhoulG9Njonj8WrmBTfNQip6TKBmbwLQJordF31v3bQ4pVQby3xUBsjO1hI
 ulOktOUXKI+m6DVQ9Pq490AMM6RJCfxCyi7pfB1EK7FaC0CqxWz72PHcOe4AduI/Vw9k
 T59mnaDuUaMmag6I+9L7LN2jXcIIdSXCHZZYJSniZjkiPBFnUYfDGRVgH5/fubNoqD0C
 VPFw==
X-Gm-Message-State: AOJu0YzMYrGHSmQBc2Gtb6pFAgep3d9fUAMglLwVRidbAiKWZn36kMzo
 N+k5F4rgTaheK2B+gnsguaLAXXFlhNw=
X-Google-Smtp-Source: AGHT+IH3jlPPDpliI3qSZZlLfRi0vmc/Y0rlh49UPLFdX33hWKzNhVCBz5s2+TTET5CAXOjiCcLQKQ==
X-Received: by 2002:a05:600c:3550:b0:40b:415e:c044 with SMTP id
 i16-20020a05600c355000b0040b415ec044mr8502125wmq.37.1701203461651; 
 Tue, 28 Nov 2023 12:31:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0040b360cc65csm18615105wmq.0.2023.11.28.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 12:31:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 21:30:59 +0100
Message-ID: <20231128203059.511458-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701203462; x=1701808262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qurlUwo78bC+6dGY2wgwvnFUjp/Cg69jnh7/BYFCvcs=;
 b=DCEHNOkXdoWaZgnf3PRoBnz8ZoIj4WsFZ/UvJK9ut5A5DAk14cdb+AAYXcxa2Q+gU+
 9wGBpFXdrZYOAOwNC3ydBTMUUDthw5PW/MtjUlY2Gcpvt87UTZ83YBV9YS99/ZZ2ic2r
 uWAmBFQVLJnqvIf9rKkkBRSEfZi5EwCYw3WIZSgj2e9OsjEgM0crsmv8LvXI/JlyRO6c
 6N+WJcsWMMeeIkcXfbYLqllcFM0CVEeVw2P8Gbnp0c+ynFv0Vf519/YzBAE0yUzxf8Is
 EKKwUROcz61rspk34SlZWKrO+8isMlarDxRi2jO7miTZg+zKbwkn4PxuNBKdRQ6ygpaQ
 c4/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DCEHNOkX
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump to version
 2.11.6
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-45322: libxml2 through 2.11.5 has a use-after-free that can
only occur after a certain memory allocation fails. This occurs in
xmlUnlinkNode in tree.c. NOTE: the vendor's position is "I don't think
these issues are critical enough to warrant a CVE ID ... because an
attacker typically can't control when memory allocations fail."

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.11.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index cad19f930f..78c1ddc6a2 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.5.sha256sum
-sha256  3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6  libxml2-2.11.5.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.6.sha256sum
+sha256  c90eee7506764abbe07bb616b82da452529609815aefef423d66ef080eb0c300  libxml2-2.11.6.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index fb7767297b..c93a4aacc5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
