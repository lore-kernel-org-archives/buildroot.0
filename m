Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CEEC3ABAA
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 13:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE9760A45;
	Mon,  5 May 2025 13:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjpppi3mdodS; Mon,  5 May 2025 13:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B200960758
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B200960758;
	Mon,  5 May 2025 13:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0EDEA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 13:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0244065B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 13:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsQQ_G798GZ9 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 13:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81C53404CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C53404CD
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81C53404CD
 for <buildroot@buildroot.org>; Mon,  5 May 2025 13:49:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac25520a289so748501366b.3
 for <buildroot@buildroot.org>; Mon, 05 May 2025 06:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746452974; x=1747057774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aaEeUD8axDcmUwM1fDKuJCZAXW2w4Qiuiv6O9z3Bsng=;
 b=JUeGBxx9K5Eogjd5N8E2OslwEOvGmjKIWmvINLVH6xSjYSvkiPkRk9bhy7EzMTna7o
 EXWGVq45qUOVHEx/cyj9X328/wy3xHkX6VHq5GFuC7chR+ghF7K3jOZIRELD8CjkbTxw
 JC/HWdz1O2cER4VUMK9hCfZ6Re+XehTXSUTT945HH9G77389M6BZrTD3YxzWBxhS3yg1
 rmTvrQV8C4Kd4KCGqKaiciU5Gc8WzvG3Lzn0wjWwwxHjYOZZaZyrQEDMjDtblPQ5LcyW
 750gUX3HGCGoj3REnE3mOTbIiNrywS6Inq5ZoVniRHmZWggiwpd8yn2rPC+afmpho8WG
 019w==
X-Gm-Message-State: AOJu0YzU/x2cBOIDPhg6LpCJ+23UZ6RiT5AbyQlK9oiTAOf8fXev3HBQ
 DyQ1bWydps5r8m+Lp42OnYemVCrgddeJ33N3nvRi1ta8uEfJt9UYp+MCJw==
X-Gm-Gg: ASbGncv5KbCSlqAFKzEwmqKLHlgw9fcKDe4TUfvcUlWlDwt0u+J+VoPglr9MSPLWHzz
 NS1qzU87Ob/n7VRtAWp0gzILp3ulISKaLdTMNeGO1Fmrz0M4R9xVyXR5RIEktjox5cueBApmhyy
 flU64ouFBxsTkYQGIuRW/uEUbIf8cW5nY4XeboGqjFuUg3kxaxmna1GkN1Jsl4i9LibmQUbSSb8
 IKi4QmQ8eocFWdodK+eUumK5jj9eEOLAkRuGF32CI5SZZhUyz7Wy1eKHbD0o3kGTs2FJ17OMh5D
 707V3ULfHoVDIyNFZgnYjN4togQYJzr7hfQ5u64jtFkee+s62f317L+Typo57MdZs778QbkQ0tX
 N8cZzvkRYchn1NBbBO1xFiw==
X-Google-Smtp-Source: AGHT+IEyElv9P6idVooQJAl7SNU61qlZSZzbmaRZtPcfqYk0M3iiIKZtuEQbp2PZjl9AkXl/smMGUg==
X-Received: by 2002:a17:907:3e09:b0:ace:c43a:63e9 with SMTP id
 a640c23a62f3a-ad1a4a8d7dfmr619196666b.42.1746452974088; 
 Mon, 05 May 2025 06:49:34 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189147329sm494520566b.1.2025.05.05.06.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 06:49:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  5 May 2025 15:49:29 +0200
Message-Id: <20250505134929.541115-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1746452974; x=1747057774; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aaEeUD8axDcmUwM1fDKuJCZAXW2w4Qiuiv6O9z3Bsng=;
 b=GJYRKpsSur2sZbsoK5OsrKLdftTKTYtCAFZU/I/VSxYTBNFigXasc6QVj4lBzd2hvO
 21ZWHL9H1P3A2GUwWLWscHZHkp669kvLEDBogowR7vMowL6F8OFFAYVK7ei6cXS1cS7l
 nwC4JqyN7BVx5MjkdV5f3aG0C20TWzUzst1bCEzrhs4V0leD7iXAjShHI6Eg5HTktDMY
 1YOnQCv8WLfdbapODqycDqzWxcVd/dXbRiwzV/Q7DHSrGQJKyP7j2jLtulusOcEDILLM
 GUPE+DETn7hvhoQq5iHn+oEZmKBKvOhwaSNTT496sUEIC+0zCeoBZ/x8umJx3TOPOXGu
 cvqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GJYRKpsS
Subject: [Buildroot] [PATCH] libical: bump to version 3.0.20
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:
https://github.com/libical/libical/blob/master/ReleaseNotes.txt

Update license info: the source code is now licensed under MPL-2.0
instead of MPL-1.0.

Remove upstreamed patches.

Add a build-time dependency to host-perl.

Disable unneeded options.

Use ON/OFF instead of true/false for CMake options.

Fixes:
https://autobuild.buildroot.org/results/dc2a6d9e50759e948a5f9952eaa1a866d52400fe/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libical/0001-no-tests.patch           | 19 -------------
 ...ype_from_string-copy-the-reqstattype.patch | 27 -------------------
 package/libical/libical.hash                  |  5 ++--
 package/libical/libical.mk                    | 21 +++++++++------
 4 files changed, 16 insertions(+), 56 deletions(-)
 delete mode 100644 package/libical/0001-no-tests.patch
 delete mode 100644 package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch

diff --git a/package/libical/0001-no-tests.patch b/package/libical/0001-no-tests.patch
deleted file mode 100644
index 324c04f643..0000000000
--- a/package/libical/0001-no-tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Disable tests to avoid MMU dependency due to fork.
-
-Fixes
-CMakeFiles/regression.dir/regression.c.o: In function `_test_file_locks':
-/home/br/br4/output/build/libical-v1.0.1/src/test/regression.c:(.text+0x96d8): undefined reference to `_fork'
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libical-1.0.1.org/src/CMakeLists.txt libical-1.0.1/src/CMakeLists.txt
---- libical-1.0.1.org/src/CMakeLists.txt	2014-10-09 17:07:05.000000000 +0200
-+++ libical-1.0.1/src/CMakeLists.txt	2015-04-25 17:41:22.657345548 +0200
-@@ -1,7 +1,6 @@
- add_subdirectory(libical)
- add_subdirectory(libicalss)
- add_subdirectory(libicalvcal)
--add_subdirectory(test)
- 
- if(MSVC)
-   install(FILES
diff --git a/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch b/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
deleted file mode 100644
index 0d74835e44..0000000000
--- a/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6b9438d746cec6e4e632d78c5244f4be6314d1c9 Mon Sep 17 00:00:00 2001
-From: Allen Winter <allen.winter@kdab.com>
-Date: Sun, 28 May 2017 12:51:10 -0400
-Subject: [PATCH] icaltypes.c - icalreqstattype_from_string(), copy the
- reqstattype's debug string into its own memory in the ring buffer.
-
-Issue#253
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/libical/libical/commit/6b9438d746cec6e4e632d78c5244f4be6314d1c9]
----
- src/libical/icaltypes.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libical/icaltypes.c b/src/libical/icaltypes.c
-index 70c50d29..85c33545 100644
---- a/src/libical/icaltypes.c
-+++ b/src/libical/icaltypes.c
-@@ -140,7 +140,7 @@ struct icalreqstattype icalreqstattype_from_string(const char *str)
- 
-   p2 = strchr(p1+1,';');
-   if (p2 != 0 && *p2 != 0){
--    stat.debug = p2+1;
-+    stat.debug = icalmemory_tmp_copy(p2+1);
-   } 
- 
-   return stat;
diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 52046bd843..4c47c9347b 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592  libical-1.0.1.tar.gz
-sha256  c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2  LICENSE
+sha256  e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2  libical-3.0.20.tar.gz
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE.MPL2.txt
+sha256  051753f11d7bb731d178eb3a972560f65a1dbc8f207b166a1c7c090e5d85f582  LICENSE.LGPL21.txt
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 992ef51375..36d281be50 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -4,20 +4,25 @@
 #
 ################################################################################
 
-LIBICAL_VERSION = 1.0.1
+LIBICAL_VERSION = 3.0.20
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
-LIBICAL_LICENSE_FILES = LICENSE
+LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1
+LIBICAL_LICENSE_FILES = LICENSE.MPL2.txt LICENSE.LGPL21.txt
 LIBICAL_CPE_ID_VALID = YES
+LIBICAL_DEPENDENCIES = host-perl
 
-# 0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
-LIBICAL_IGNORE_CVES += CVE-2016-9584
-
+LIBICAL_CONF_OPTS = \
+	-DGOBJECT_INTROSPECTION=OFF \
+	-DLIBICAL_BUILD_EXAMPLES=OFF \
+	-DICAL_BUILD_DOCS=OFF \
+	-DICAL_GLIB=OFF \
+	-DWITH_CXX_BINDINGS=OFF \
+	-DLIBICAL_BUILD_TESTING=OFF
 # building without this option is broken, it is used by
 # Gentoo/alpinelinux as well
-LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
+LIBICAL_CONF_OPTS += -DSHARED_ONLY=ON
 # never build time zone info, always use system's tzinfo
-LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=false
+LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=OFF
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
