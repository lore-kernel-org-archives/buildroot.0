Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACDCA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 16:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 016CD81EC0;
	Sat,  6 Sep 2025 16:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uh1VtydsbzcR; Sat,  6 Sep 2025 16:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA00821D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA00821D3;
	Sat,  6 Sep 2025 16:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CAF5E0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8054760E0C
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y6WvAcYX1J7 for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 16:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4359160DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4359160DEC
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4359160DEC
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:25:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45dd7b15a64so15441155e9.0
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 09:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757175956; x=1757780756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UGv5MQyxz7pCWLeRa6k9uILDAkmb6iiFvqVlus4z8AA=;
 b=W6dtWJXsgaOH6tzYKnU9PPYxF/tSDDRJqUz56VFxvKBbi9JJF3irpRb0S4WGESntWy
 /OAj321F254xWBQqnxOFL8t9noBsnLnhybyYunT2nllNLkyH2cv04HTR3398iAUf82xV
 XWz7n4ksCJi1MWNlIr918gDvjVlKhdzMJpVHEvcm1YgaLk5zBZgrpClpbjxfBzIXBh6P
 892YJTnY1fqx+btF1cbbJpCybjVWbZttBmCIVGbcqcdrzOjclrnvofZhiCo3JAHvwUkm
 jPLEFBssF1gj7xa1er+GHlio72AXoe49ReQorGat0RrBsk05uA8cRgu7Bkvj7n0mdgB7
 P86Q==
X-Gm-Message-State: AOJu0Yzoa966zpryFQ24WkYwSKMIoZWWfM1/a4U1/4d+zWkfWMR7i87M
 amYoKo28jAVqiw46GVh6MFUlQgWoQGiWJBy2W/DefPKHmkLvsF32aEMVo1DuR4OQUrAXr7mVJey
 uJU4ZXCOfIw==
X-Gm-Gg: ASbGncvaAEm1ph7zuTCE1XAuB9hkvDVVuHqCdey3AazHf4RMnUpz3PEu1+Moana8Aze
 ftQhGIqkH1gt5Vfv4Kyt62Tv1Fl+ehQfwBL84PY4ncaaTAkjg+f8ANxljOGo3gAJDggrJWomn41
 McDb4JTE+cAfImTwWnRYD3148BqPelB02xR3hFhCqYaua/Xze3mg6s61eM5V6nueb0ra91oYZix
 uU7bq5mqNz5XyvzHPYlo/u+GFUVjZN+DPmzdaEb/B3nb2IIpbyrfxpNXeSkGwime0fZgJvk1XTq
 dIZ4+sOe9s3h0vA6p7UGyZf9f/UMQkbd6rfL/jy/+TFrS7KsdOhncg6UWuaCDgvDPp48vxVKOyN
 FKcx/SZoF4OnzBaAn4d3YuzV40xXlzgMcwPBmNfqOBVhGHWWd5U773xuhmVeJEAxfqTnAjOnsVm
 xsr80ff9XgIJ8FuUJeutb4fubLRKOuDHY=
X-Google-Smtp-Source: AGHT+IGXOAEZmDud92hNyX9w9Xet7jyyM7McAlS2BIrgz4DxWDEGXrp8IdbI+h2LI/dR5oQE3AnK3w==
X-Received: by 2002:a05:600c:1993:b0:45b:8ad2:76c8 with SMTP id
 5b1f17b1804b1-45dde1a835bmr20480825e9.2.1757175955912; 
 Sat, 06 Sep 2025 09:25:55 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd2304e16sm116467295e9.7.2025.09.06.09.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 09:25:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  6 Sep 2025 18:25:51 +0200
Message-ID: <20250906162551.3715975-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250906162551.3715975-1-romain.naour@smile.fr>
References: <20250906162551.3715975-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757175956; x=1757780756; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UGv5MQyxz7pCWLeRa6k9uILDAkmb6iiFvqVlus4z8AA=;
 b=kHG7qS1BLKll4IfUa0nkdHGmTQZurzzluO8o1Ba4h1uwD9czYvGg9JwO9mb7Xyq0fG
 TZi69SkhELyItJG+4zUcGkNtSkCVYEZO3iLcoqRZRg/HqcgvttMyGZL1ANPXYyy85AhN
 WdBp+TScgSZx6MtWMwhR6hevQSJcbrq3jivzI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kHG7qS1B
Subject: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build problem
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Apply a patch from meta-openembedded fixing a cross-build issue [1].

[1] https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405 (TestIozone)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...ve-libasync.o-and-libbif.o-from-deps.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch

diff --git a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
new file mode 100644
index 0000000000..ea4c9c97b3
--- /dev/null
+++ b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
@@ -0,0 +1,114 @@
+From 34c25d67c33050f42f0f243c0fb6674c28ff44b5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 6 Sep 2025 00:31:48 +0200
+Subject: [PATCH] remove libasync.o and libbif.o from deps
+
+there are no implicit rules to build them and they get wrong CFLAGS
+when compiled with implicit rule.
+
+They are built as part of iozone_linux.o target anyway
+
+Only fixed linux targets for now
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: Pending
+[Romain:
+  rebase on 3.508
+  convert to git format
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+Patch from Yocto:
+https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
+---
+ src/current/makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/current/makefile b/src/current/makefile
+index bd66a4e..ba5759f 100755
+--- a/src/current/makefile
++++ b/src/current/makefile
+@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
++linux:	iozone_linux.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+@@ -198,7 +198,7 @@ linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pit_server.o
++linux-powerpc: iozone_linux-powerpc.o fileop_linux-ppc.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
+ 		libbif.o -lpthread  -lrt -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
+@@ -206,7 +206,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
+ #
+ # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
+ #
+-linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server.o
++linux-sparc: iozone_linux-sparc.o fileop_linux.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
+@@ -215,7 +215,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_server.o
++linux-ia64:	iozone_linux-ia64.o fileop_linux-ia64.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
+@@ -224,7 +224,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
++linux-powerpc64: iozone_linux-powerpc64.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
+ 	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
+ 		-D_LARGEFILE64_SOURCE -Dlinux \
+ 		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
+@@ -235,7 +235,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O
+ #
+-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o pit_server.o
++linux-arm:	iozone_linux-arm.o fileop_linux-arm.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
+@@ -267,7 +267,7 @@ endif
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_server.o
++linux-AMD64:	iozone_linux-AMD64.o fileop_linux-AMD64.o pit_server.o
+ 	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
+@@ -276,7 +276,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_server.o
++linux-S390:	iozone_linux-s390.o fileop_linux-s390.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
+@@ -285,7 +285,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390X:	iozone_linux-s390x.o libbif.o libasync.o fileop_linux-s390x.o pit_server.o
++linux-S390X:	iozone_linux-s390x.o fileop_linux-s390x.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
