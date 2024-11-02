Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3956DE67802
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F5E82101;
	Sat,  2 Nov 2024 15:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j10cb1mBTsb3; Sat,  2 Nov 2024 15:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C7582105
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C7582105;
	Sat,  2 Nov 2024 15:21:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E89979
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F3266154B
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX56366kYnB4 for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDE676151D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE676151D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDE676151D
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a19bf0a1dso57487866b.1
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560894; x=1731165694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7xzgg3EiXxgFkd5wEVyvTuShlFv+Eh3YkCkeOBSgRU=;
 b=rwtC7Hx/UwQKuS80GXZz2CBaRaWFJqUfSLdziUmhpJJzZ2ND0rDq1BQWy+J0hxBCRf
 Beex6h5R2RmhgEMS7IyqhZ1Uqj5P/hX74ujndmSqfBWmTe4Eu7O8a+xeZsf+mqR3RlbX
 aGtaJKUx8o2wWLiLXCoJeSgnpwmlD8J500DAemmirBbatoLJ7eYvZj1vRdkewRkUnnkC
 kZyLQtIUvWVagObtD92cDFFrbV8BSq6HUenpHCMRV93iQ3tkAn3eA76Svr57vRrXcHeK
 P4ermFemrOcy/yC5D/T5Y1K8AtVBKPbgS2ayvPQnBkJ4LwXJ5EpRlmwD3MLrWclcH60B
 o+5g==
X-Gm-Message-State: AOJu0YyU9SlVYZpxREWrxwzzvAZQ033JWa98DXqusak9edL/PLB8GMoh
 3zIzR51nOZQlM1xS1rJWs08SHVU5Ml4F1C6N8hiuOiKkFYPosS/alkkDX4xB
X-Google-Smtp-Source: AGHT+IGcZ+rMiIfSItv/PoCrd472P/AQh5bcfPtnkuy+AtiVt+fo11EJroT8RGHsUR3GuOAxcY2clw==
X-Received: by 2002:a05:6402:3586:b0:5c9:11d9:f9a8 with SMTP id
 4fb4d7f45d1cf-5cbbf875191mr9274037a12.2.1730560894135; 
 Sat, 02 Nov 2024 08:21:34 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:32 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:21:06 +0200
Message-ID: <20241102152106.2153747-8-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102152106.2153747-1-olteanv@gmail.com>
References: <20241102152106.2153747-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560894; x=1731165694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7xzgg3EiXxgFkd5wEVyvTuShlFv+Eh3YkCkeOBSgRU=;
 b=J3iejvQbpUTFNNtmNxFBjbcQnRX7pJo9c+BzFBH2qpce2wXKn+h/00Ph4OemRRTIBr
 1/JyeiqVwmmO8wfNX4zZlQA4fntydDI2jECUdaKEbslF7FMqIlmifqrALCG4zjwueXU/
 G3t0WyeMRsKmehomDkumW9tEhjyXCkThCvwpLlJNeWcSNSkAEQ4UCDtZSwZYlQE9UlPw
 GQEAlk4/LU5yphvFkT3krw/DS3LOuqeW76hqjo+vTya7ufBQ1fFtR+av6W+Q03obYxWK
 kPRI559/jvqv0OkFkK49GKfRsgweix0qErYmUl/JQg6pcJfDnwuTgdez94QZyEHz28BZ
 CXtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J3iejvQb
Subject: [Buildroot] [PATCH 7/7] board/freescale: get rid of common patch
 folder
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

Since commit 7cbc240ac2c3 ("configs/ls1028ardb: update to Linux 6.6"),
no config file references this through BR2_GLOBAL_PATCH_DIR.

Special case [PATCH] feat(build): add support for new binutils versions,
which is symlinked by board/solidrun/lx2160acex7. Instead of removing
this, just move it there and delete the symlink.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 ...dd-support-for-new-binutils-versions.patch | 61 ------------------
 ...Makefile-Suppress-array-bounds-error.patch | 51 ---------------
 ...dd-support-for-new-binutils-versions.patch | 62 ++++++++++++++++++-
 3 files changed, 61 insertions(+), 113 deletions(-)
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
 mode change 120000 => 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 100644
index 335c18553ac3..000000000000
--- a/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
-From: Marco Felsch <m.felsch@pengutronix.de>
-Date: Wed, 9 Nov 2022 12:59:09 +0100
-Subject: [PATCH] feat(build): add support for new binutils versions
-
-Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
-of a new warning when linking the bl*.elf in the form:
-
-  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
-  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
-  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
-  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
-
-These new warnings are enbaled by default to secure elf binaries:
- - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
- - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
-
-Fix it in a similar way to what the Linux kernel does, see:
-https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
-
-Following the reasoning there, we set "-z noexecstack" for all linkers
-(although LLVM's LLD defaults to it) and optional add
---no-warn-rwx-segments since this a ld.bfd related.
-
-Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
-Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
-Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
----
- Makefile | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 1ddb7b844..470956b19 100644
---- a/Makefile
-+++ b/Makefile
-@@ -416,6 +416,8 @@ endif
- 
- GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
- 
-+TF_LDFLAGS		+=	-z noexecstack
-+
- # LD = armlink
- ifneq ($(findstring armlink,$(notdir $(LD))),)
- TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
-@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
- 
- # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
- else
--TF_LDFLAGS		+=	--fatal-warnings -O1
-+# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
-+# are not loaded by a elf loader.
-+TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
-+TF_LDFLAGS		+=	-O1
- TF_LDFLAGS		+=	--gc-sections
- # ld.lld doesn't recognize the errata flags,
- # therefore don't add those in that case
--- 
-2.30.2
-
diff --git a/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch b/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
deleted file mode 100644
index 7a7a7bbc2851..000000000000
--- a/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b2a94de52ae4a940a87d569815b19d3fa92dd32a Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Mon, 16 May 2022 13:45:16 -0500
-Subject: [PATCH] LF-7968-01 fix(Makefile): Suppress array-bounds error
-
-The array-bounds error is triggered now in cases where it was silent
-before, causing errors like:
-
-```
-plat/imx/imx8m/hab.c: In function 'imx_hab_handler':
-plat/imx/imx8m/hab.c:64:57: error: array subscript 0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'} [-Werror=array-bounds]
-   64 | #define HAB_RVT_CHECK_TARGET_ARM64      ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
-      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-```
-
-The error is a false-positive and is entered as a bug [1]. The problem
-is fixed partially in GCC 12 and fully in GCC 13 [2].
-
-The partial fix does not work here because the constant addresses used
-are less than the 4kB boundary chosen for the partial fix, so suppress
-the error until GCC is upgraded to 13.
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578#c39
-
-Upstream-Status: Inappropriate [other]
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
-Signed-off-by: Jacky Bai <ping.bai@nxp.com>
-Reviewed-by: Ye Li <ye.li@nxp.com>
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
-Upstream: https://github.com/nxp-imx/imx-atf/commit/058bf0f104115037d03e277f079825ef3659c5b9
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index c87c3ae08..2d6b90f47 100644
---- a/Makefile
-+++ b/Makefile
-@@ -346,7 +346,7 @@ WARNINGS	+=		-Wshift-overflow -Wshift-sign-overflow \
- endif
- 
- ifneq (${E},0)
--ERRORS := -Werror
-+ERRORS := -Werror -Wno-error=array-bounds
- endif
- 
- CPPFLAGS		=	${DEFINES} ${INCLUDES} ${MBEDTLS_INC} -nostdinc	\
--- 
-2.41.0
-
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 120000
index 5ef794304fba..000000000000
--- a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 000000000000..335c18553ac3
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,61 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
