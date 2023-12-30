Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C9C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B24460ECF;
	Sat, 30 Dec 2023 18:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B24460ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8N8q4_k-h1Q; Sat, 30 Dec 2023 18:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F42D60BE0;
	Sat, 30 Dec 2023 18:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F42D60BE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1F571BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9399E415E2
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9399E415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-S6vzoHQ_Sx for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:35:34 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A9B9415DD
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9B9415DD
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d3ae326f6so85354655e9.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703961332; x=1704566132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M11mMWJbe8Mn/Ug14TZO0+qBzQgwpZmAFagXjU4L1Xc=;
 b=pX7JE5B/ApDS5eWEV04CiiCzhzXTG/6KPes+paNEEOWN9EwxaBpoNufEoZmaUX8/ZC
 6r5sOugX0Rjksjur1/+dJ5vRnCI+UfGU675c1Dc4yT54acNDaYfgOZMkKD4CJ5+4rYU3
 6sYX1GpHRkAIvaaNDOJll4atA/Aj+I4s0KocfrNHGS5sHuJ2fECtiVHNA11nshk/cvtl
 BwHdVVLuNnjVUpjaiLCZ8tmva0ikNrFiOTgHGdV0OKWLxF+fU8QXugw3Mv5M96aSHOZp
 IMkhm/SR9O0f0luTeypDQeu6u8SHTuXW6Indx0adOI59DyO2D+MxjxB6LwGi02NxR34c
 gLhg==
X-Gm-Message-State: AOJu0YwQQNrDMXxI2Lgu2OgcgtTmBS/QREiCvWlAA0zapPjeQ8WlybC0
 RApQiRv3HCRGZlFrEadPa+NOIKdxOOY=
X-Google-Smtp-Source: AGHT+IFo1zW41LiK8iS6uy8YvZqaCcuKWYWk5O3frpD6tsaAlFpnua8Am79drdp9TclVy+4fw3VxXg==
X-Received: by 2002:a05:600c:a084:b0:40d:8396:d311 with SMTP id
 jh4-20020a05600ca08400b0040d8396d311mr571574wmb.75.1703961331677; 
 Sat, 30 Dec 2023 10:35:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg10-20020a05600c538a00b0040d7c3d5454sm5613292wmb.3.2023.12.30.10.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:35:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:35:25 +0100
Message-ID: <20231230183525.1110378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703961332; x=1704566132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M11mMWJbe8Mn/Ug14TZO0+qBzQgwpZmAFagXjU4L1Xc=;
 b=JrkbdFoK758yH07drC4CI46QGOed9tEG/ZGmQlEt337MJ6FFHqVrKauBUpUOlkN4GK
 CtFQMH1rh6edn8m+4ElGlJTgGH139jXKDeksV0OO2pJKbS1+l/AN03mVxIsFBOkG7G9c
 qvFE2cvP9uNcOY/2PDWt58vwmuBl0MjzcwWKmqK4mGMjEM/DY97BCGXIx17H4odV6dYi
 x6ih2a/9UouGHjq2ef21WEvqHxAX8nu/aOEpwPrJ+mFdz/MmDP8BsMKzd9mSGgDVf/x2
 Q5osVhbpViLbGr/2Fbeha4ZV2hSm0xMRE63r/JuYX1Rh+C6XRhyGQDR08kUx8R5gZ+no
 mFSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JrkbdFoK
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump to version 2.12.3
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

This bump will fix the following build failure with libmodsecurity (and
a lot of other packages) raised since bump of libxml2 to version 2.12.1
in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

modsecurity.cc: In constructor 'modsecurity::ModSecurity::ModSecurity()':
modsecurity.cc:89:5: error: 'xmlInitParser' was not declared in this scope
   89 |     xmlInitParser();
      |     ^~~~~~~~~~~~~

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.3/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/d6749bacf6c7c04a74e136585d36bc731716f6fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index a3b2230b8a..670ff80a41 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.1.sha256sum
-sha256  8982b9ccdf7f456e30d8f7012d50858c6623e495333b6191def455c7e95427eb  libxml2-2.12.1.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.3.sha256sum
+sha256  8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa  libxml2-2.12.3.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5606532b62..1893206ccb 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
