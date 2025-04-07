Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3293AC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 23:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48D840D4F;
	Mon,  7 Apr 2025 23:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-z7pkVt23ec; Mon,  7 Apr 2025 23:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED3E40D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED3E40D51;
	Mon,  7 Apr 2025 23:28:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B79631F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 23:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A14E040D4F
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 23:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02nzP7wR7JPQ for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 23:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7498840D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7498840D6C
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7498840D6C
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 23:28:05 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso3451162a91.1
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 16:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744068485; x=1744673285;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/lX9slMR374RyOB4OJJN2MjDOqDrBtYpjPHvqFOjXU=;
 b=rwuVxgSvGP0kiEuAxYyEnFnm3OoDCLEIUJAcw3YUlhdylKBskJh23riH8LMkFpEZoX
 nWBsC2YXstv8N+e4/b+vXzhZ2jAuPZlTUJTbj6NgyQMXTeKJwF0PvwnpcE0UqdQFUeqq
 McefB9XK9hbZs2adUOSBBkfuTB6bvT6aGEGgjrmJtXmfWv9q2U3erHlA5zOTDKRGxWl0
 iFBdDBG4Yiuy4zLHxgyp9/CW6IiP3osijcLaK4zRiI+NIeKxzUelIGesHSkXovyUcEX0
 tSsYl1iO7HTchZ9qBKvSaGnKPhJ7CGSIto0ce0qJhYRIsbZZ+EOJBzXdfCht6aaIDdpB
 exzA==
X-Gm-Message-State: AOJu0YxyUB8AuR9VGZN6nCqsDvViM2zc5mA5nMeWDRu+KRQc+zF2Yd2Q
 hUWb4MT3iDDdMzQLxDYE6a8amaMBAdRaQblMgl3mvMIWbBzmiYaRWRijTFraDms=
X-Gm-Gg: ASbGncsmXvnH19rAZK34jEoTsHJlFj5rgzVPVqimDjMxBs8421ZVJZwVXeEVajlSUd6
 7eVp4CKMPcchGJT4/+LLqBhxG+y80TH0Afm9bJgalGHPMogagedraDdd0f4GjyHPl4O/++WfxtD
 2gBjekbxYHQdXyZ1al+utzwF8g+bYb7bNQscWVz/H9PDvHTnZm4XWUFBj8ZmJNFt6E3SV4mb97D
 bAVozaL5JF7yxTe1KTUCQU7031ih68KTUXK1cgq59Bq1R1h6DeBD9rUi3R7Fyn0NvO7oXDwgCJI
 V8+1BDPbvAAw/E1YlKfAT5eFZddZf9faPnBARar8KjX+epdu8417N+zfMX1v
X-Google-Smtp-Source: AGHT+IHPxXFwIL27rdWrbwyp6Mej4AhZU9IhfrggSQgSRQg5OOAEuEewH51KeR3pTQ2rOssyAf8TJQ==
X-Received: by 2002:a17:90b:5385:b0:2f2:ab09:c256 with SMTP id
 98e67ed59e1d1-306a621086amr21812146a91.33.1744068484623; 
 Mon, 07 Apr 2025 16:28:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3057ca47f57sm10848631a91.11.2025.04.07.16.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 16:28:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 07 Apr 2025 16:27:54 -0700
MIME-Version: 1.0
Message-Id: <20250407-fixup_bzip2-v1-1-12442cbc4b03@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHpf9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNz3bTMitKC+KSqzAIjXeO0pDSz1KSUVPPUVCWgjoKiVKA02LTo2Np
 aALfxry9dAAAA
X-Change-ID: 20250407-fixup_bzip2-3fbf6ebde7ee
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=ZjuHQmKA4JxMeDn2zja6W1rfAemASYNnVLtkiygrRVs=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qX+Fqbtytn5M4LM2wRkgw6oD2dzaykdcHfzPqq4Loma
 6tJ4V86SlkYxLgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmMjvQEaGOUlK03Ku6hS2SVwV
 7hdb86xh2bu9M72ExdQbJ4o/2RVtwshw9p2GbE+lG6fbl0nHDoYnvNghsLTiaqHPxEkRdy9pvVz
 EDwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744068485; x=1744673285;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T/lX9slMR374RyOB4OJJN2MjDOqDrBtYpjPHvqFOjXU=;
 b=Wb+NkO3QYDYdEk1q327hd2rp27A1AExeaerV11YQIyVX0qPZJRCx+7HLue4jTNSaMD
 Cd8lBmSK5iBffRSaHMvcIkdE1HVapotz8GuHOzcTh7pDsJ6LKqBm+yjWJlfWRJJTJUvQ
 obfsx5DBmpU0+quhouQjJoJWv6HgCRNA0znadIR9jZbJY1ZtANmpRLnhVOQXiGhae0Pc
 J3wHh9GM+u+5sis3G0WEpy3+aolt0JpjZqOdKYeh22DgIpMSfErekRRkzD+Wia9KJqC5
 gu0rP/Q5wniTqpbiRed5vZYAcvXefCccq/c94OFRhSjCNMTXg+t1dHj3fuaCS5PShrNX
 RAlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Wb+NkO3Q
Subject: [Buildroot] [PATCH] package/bzip2: Remove stale patch file
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

Since bzip2 has been bumped to 1.0.8, the patch file that only affects
1.06 hasn't been relevant so remove it.

Fixes: 7ae14d201e14 ("package/bzip2: security bump version to 1.0.8")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 package/bzip2/0001-build-objects-twice.patch       | 58 ----------------------
 ...ystem.patch => 0001-improve-build-system.patch} |  0
 2 files changed, 58 deletions(-)

diff --git a/package/bzip2/0001-build-objects-twice.patch b/package/bzip2/0001-build-objects-twice.patch
deleted file mode 100644
index 52b234f65a8eb1a9aa3c907e9a4718b577401eb1..0000000000000000000000000000000000000000
--- a/package/bzip2/0001-build-objects-twice.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Build objects twice for shared and static libraries
-
-The existing Makefile causes problems on MIPS because the same object
-files (not compiled with -fPIC) are used in static and shared libraries.
-MIPS will refuce to link non-pic objects in shared libraries.
-We fix this problems by creating a new rule for the shared library
-and build the shared objects as *.sho instead of *.o.
-Then, we use these objects to create the shared library.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-Index: bzip2-1.0.6/Makefile-libbz2_so
-===================================================================
---- bzip2-1.0.6.orig/Makefile-libbz2_so
-+++ bzip2-1.0.6/Makefile-libbz2_so
-@@ -26,13 +26,13 @@ CC=gcc
- BIGFILES=-D_FILE_OFFSET_BITS=64
- CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
- 
--OBJS= blocksort.o  \
--      huffman.o    \
--      crctable.o   \
--      randtable.o  \
--      compress.o   \
--      decompress.o \
--      bzlib.o
-+OBJS= blocksort.sho  \
-+      huffman.sho    \
-+      crctable.sho   \
-+      randtable.sho  \
-+      compress.sho   \
-+      decompress.sho \
-+      bzlib.sho
- 
- all: $(OBJS)
- 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
-@@ -43,17 +43,5 @@ all: $(OBJS)
- clean: 
- 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.8 libbz2.so.1.0 bzip2-shared
- 
--blocksort.o: blocksort.c
--	$(CC) $(CFLAGS) -c blocksort.c
--huffman.o: huffman.c
--	$(CC) $(CFLAGS) -c huffman.c
--crctable.o: crctable.c
--	$(CC) $(CFLAGS) -c crctable.c
--randtable.o: randtable.c
--	$(CC) $(CFLAGS) -c randtable.c
--compress.o: compress.c
--	$(CC) $(CFLAGS) -c compress.c
--decompress.o: decompress.c
--	$(CC) $(CFLAGS) -c decompress.c
--bzlib.o: bzlib.c
--	$(CC) $(CFLAGS) -c bzlib.c
-+%.sho: %.c
-+	$(CC) $(CFLAGS) -o $@ -c $<
diff --git a/package/bzip2/0002-improve-build-system.patch b/package/bzip2/0001-improve-build-system.patch
similarity index 100%
rename from package/bzip2/0002-improve-build-system.patch
rename to package/bzip2/0001-improve-build-system.patch

---
base-commit: af094ed137d6967afb6270b69c516a22eb9d8091
change-id: 20250407-fixup_bzip2-3fbf6ebde7ee
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
