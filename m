Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF07CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D672A40294;
	Mon,  2 Sep 2024 20:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENKQBnTqxHpW; Mon,  2 Sep 2024 20:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663DD40298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 663DD40298;
	Mon,  2 Sep 2024 20:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19D4B1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 065D280DF6
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2zLmyCIk8Zo for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2FF780D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FF780D6C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2FF780D6C
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:37:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42bbdf7f860so29461685e9.3
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309437; x=1725914237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ig3TVfax1yDOdni5J5ORZBCi0LtAsA7pk6/s4TSC24=;
 b=D+OM8rTjgr4DOMP23TnpxxhGm/p7dRVsqqPEqcAzgnMVEaIVTuRf5AY+bVWadGsLyq
 tMDKgcgHd4JjXW3qbVyhV/PTxBhxE10Z4vkgSo/j7xXixJurV9aGBdB5iRxmj6rw9ten
 su3yCWqXPLAZkMp2Idj6zeIIROHiOYy9X/j9fqjwsrzm1zqDdcKKbdNm7MtRggCYSy7n
 bFbI5H4dFMnFF+Rh89lnPhmjZkqh5V5IbHPUrb/yGvW8qE4K8Bw+qXpBQfpQHmJ1bU04
 uW2H60qjeDRawa7sNlkyq/u7ae06MHVYU6FfEPo0sNJ7F4kIzSGXFzrMbXBnGI1SLX9i
 1wMQ==
X-Gm-Message-State: AOJu0Yz5oAybBdCWpQc/v44xRoH5FDU5I4XbX79NWV8+1/72aN6nx/JL
 5Q2io/jlDnoKagZfMKBSUIEk+DNrQA35UhYX7WfV9+4YItzWI8J4aLVlClinDQvYjsA4PfmT0zd
 sDQ==
X-Google-Smtp-Source: AGHT+IF1JUh93Dbs+4RhID6a2Lcwl08hrdab4hRiaF0CmYSCQ8L1VHAYto7MfADdkJ5UgARRD7x9fg==
X-Received: by 2002:adf:a351:0:b0:374:baeb:2fb with SMTP id
 ffacd0b85a97d-374baeb0c2amr5830031f8f.35.1725309436959; 
 Mon, 02 Sep 2024 13:37:16 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374baae211bsm8400854f8f.66.2024.09.02.13.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:37:16 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:37:13 +0200
Message-ID: <20240902203714.2650246-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309437; x=1725914237; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ig3TVfax1yDOdni5J5ORZBCi0LtAsA7pk6/s4TSC24=;
 b=osRzCCW+vM5+OgjOsNPEzz0VOVDyqFiWF6Jx40q11IFBEG0Yq/yoDfetL2tg0h/k0K
 LeG/hDhJ/4XjeEnocxBy49vS4PpMu0DhDm9UmMk+G1ZPHnAU9XC/j9rLg/XDWk/2g6Io
 XVDWJRvNJ3lATdcF6BlGAsb7tlE4h/80ipJwY28yEX4M6I8l+Qf4TkkE3mbmNAHQpl54
 J5NiaKlpKLHtpbPDENfMUUSnftdIMlPv4ASu3luoFYhotCInYtQdhPCsbEBNofCFtlSx
 JFODYezEx35z+Ryl1/ZWCtEudxN+1wNE/eLpQqf0KYh6MwF0gHKqKV2R8ev368t3ADEe
 TCqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=osRzCCW+
Subject: [Buildroot] [PATCH] package/lz4: bump to version 1.10.0
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

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-build-Support-BUILD_SHARED-no.patch  | 42 -------------------
 package/lz4/lz4.hash                          |  4 +-
 package/lz4/lz4.mk                            |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/lz4/0001-build-Support-BUILD_SHARED-no.patch

diff --git a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
deleted file mode 100644
index d2d8639a3..000000000
--- a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5ccbd38277989ae6a728171d59ae03bad6f2f4d5 Mon Sep 17 00:00:00 2001
-From: Fotis Xenakis <foxen@windowslive.com>
-Date: Tue, 13 Sep 2022 20:09:36 +0300
-Subject: [PATCH] build: Support BUILD_SHARED=no
-
-Since e585a438c714652e866a59371b287f52aa4d2dc3, the BUILD_SHARED
-Makefile variable only takes effect for the install target (i.e. the
-shared libraries always built). This restores the original behaviour.
-
-[Retrieved from:
-https://github.com/lz4/lz4/commit/5ccbd38277989ae6a728171d59ae03bad6f2f4d5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 06503cb2a..ee262c0df 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -112,17 +112,21 @@ liblz4-dll.o: liblz4-dll.rc
- 	$(WINDRES) -i liblz4-dll.rc -o liblz4-dll.o
- 
- $(LIBLZ4): $(SRCFILES) liblz4-dll.o
-+ifeq ($(BUILD_SHARED),yes)
- 	@echo compiling dynamic library $(LIBVER)
- 	$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll/$@.dll -Wl,--out-implib,dll/$(LIBLZ4_EXP)
-+endif
- 
- else   # not windows
- 
- $(LIBLZ4): $(SRCFILES)
-+ifeq ($(BUILD_SHARED),yes)
- 	@echo compiling dynamic library $(LIBVER)
- 	$(CC) $(FLAGS) -shared $^ -fPIC -fvisibility=hidden $(SONAME_FLAGS) -o $@
- 	@echo creating versioned links
- 	$(LN_SF) $@ liblz4.$(SHARED_EXT_MAJOR)
- 	$(LN_SF) $@ liblz4.$(SHARED_EXT)
-+endif
- 
- endif
- 
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 04bd118cf..548bb21e6 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256  0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b  lz4-1.9.4.tar.gz
+sha256  537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b  lz4-1.10.0.tar.gz
 sha256  8b58c446121a109ccf32edc094bba3010a3d85e4ee3702950db55e4d3e87736c  lib/LICENSE
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
+sha256  609b910ef05c9c855ecc1da155a36ed0f57514eac452cf93446530b5ea4b3bc3  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 202dc172f..60d321bab 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.9.4
+LZ4_VERSION = 1.10.0
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
