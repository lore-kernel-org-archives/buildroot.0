Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DC9E6FE4D
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 07:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6DC408BD;
	Sat,  7 Sep 2024 07:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lXKjAoymTcC; Sat,  7 Sep 2024 07:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A94408CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A94408CF;
	Sat,  7 Sep 2024 07:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCA551BF863
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA984840F3
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT87Tl6zHorf for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 07:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D45D81EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D45D81EB6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D45D81EB6
 for <buildroot@busybox.net>; Sat,  7 Sep 2024 07:23:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so292351266b.3
 for <buildroot@busybox.net>; Sat, 07 Sep 2024 00:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725693791; x=1726298591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dIbA1e/mO7GzEv+hh12HFJRKw619GuLweEtznBGZJ0=;
 b=jmOYQZJxBh3l36mwP46fj7KljlH7b8nZxuUNrzn7hDgEWQDN0tEYd6M6fwwc2Ob8Fs
 3nyod0c20hNDSNe0kjRjA4gqtD/RQKhRsZ5tqVAq4SC6mXkEm/o+fCxQLokNPsPC58vP
 975u+JGM2ONfzaleB6KFIfHzS248e1TaoYBJ5db76Vdr36tl9Yl5NG27lINiziqv1TKk
 inVGOMKKiRps5C/mvOPu/ufKnlOLT/T4g5C1/0FLTvCarkxIoYKFP0dooeagMTrsnjYH
 WWe+cBdVn/ZN07RmEv7TjvtB1/C1yDHTycoqN8dpd/Qm0g9WQKOj0Ottg6c0EjM8KSQk
 fiNg==
X-Gm-Message-State: AOJu0Yxwo6PSogyTWwtZ1s59GB4YixU2eS6CHFZt2qZ74unYTLW2T223
 L1eBEQLYHRCiNEbv6RqR9m6BsYtA9pQSET61WgfbdVtHtCNm0GEjrRbJZjEkuyq3DXcz5bAre9E
 +Wg==
X-Google-Smtp-Source: AGHT+IHQprAxlzIHgwU8h+FtGi7VbcSspaaw74CtV9s2Tlb/IoMaRKpGt3AjIHhCgH3G/1/4zyuJMw==
X-Received: by 2002:a17:907:1311:b0:a8c:d6a3:d025 with SMTP id
 a640c23a62f3a-a8cd6a3d18cmr177854466b.32.1725693790567; 
 Sat, 07 Sep 2024 00:23:10 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72757sm39060366b.103.2024.09.07.00.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 00:23:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Sep 2024 09:23:02 +0200
Message-ID: <20240907072303.3248398-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725693791; x=1726298591; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3dIbA1e/mO7GzEv+hh12HFJRKw619GuLweEtznBGZJ0=;
 b=DFZJwo+2tvo2BGJbX8IMpo00jV8hR6zwbQloFDRDdvVUYzh48DXe6y0a+aF1JhQeTk
 SKo3sdc1jPROnQgI9Sk9cci0L2ti0u6BTPZ3vZXAihoNsmiIJ9RkMDheENkQ6LnjFMhT
 6XIHwdVwYUUwr/GkcXCPheXcHWphEUjdGqwBZe3StL8di7lbFnQsRKnxv5+LBtDLVogJ
 ZVJQk6Mnnb3E9jaX67/rTSD9mLGjRgwIAhqwMc2NfzbmKvl2LPEinA3f+VI70ZPceDHB
 Rf8wkL/x5+tTPqCg4z752R/cvy0+doqjbZvN6dn0+7361aMjSm0i0lfh0IC0PkNs+gFM
 GrHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=DFZJwo+2
Subject: [Buildroot] [PATCH v2] package/lz4: bump to version 1.10.0
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

programs/COPYING: update gpl license to 2.0-or-later
    see https://github.com/lz4/lz4/commit/aafb56ee2ed40fb6b994f87af4e8560865df7c85

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .checkpackageignore                           |  1 -
 .../0001-build-Support-BUILD_SHARED-no.patch  | 42 -------------------
 package/lz4/lz4.hash                          |  4 +-
 package/lz4/lz4.mk                            |  2 +-
 4 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/lz4/0001-build-Support-BUILD_SHARED-no.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a824a50c4..411c5609c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -859,7 +859,6 @@ package/lugaru/0001-ImageIO-fix-invalid-conversion.patch lib_patch.Upstream
 package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch lib_patch.Upstream
 package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
 package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
-package/lz4/0001-build-Support-BUILD_SHARED-no.patch lib_patch.Upstream
 package/lzma/0001-Remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/lzop/0001-allow-overriding-modification-time.patch lib_patch.Upstream
 package/macchanger/0001-Fix-missing-include-for-caddr_t.patch lib_patch.Upstream
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
