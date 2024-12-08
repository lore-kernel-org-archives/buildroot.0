Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1431E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC8E407AF;
	Sun,  8 Dec 2024 14:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8X8nqfUb1QcP; Sun,  8 Dec 2024 14:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CE24076A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23CE24076A;
	Sun,  8 Dec 2024 14:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A82979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6669E81C11
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBdMRyWzHXbv for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB77F81BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB77F81BF5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB77F81BF5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa551d5dd72so64046966b.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668722; x=1734273522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Hew2heIHjHl6a4CGhhq+YkUOXQpwZLRi4KVpIbnDO0=;
 b=qBheKhHod2lzr57WtRlwGEKNGsgbHLqAauWpg2aVpeNiLqthaqEBu9yh1QXZ7eqMTX
 ufPYFxPE8MZ8wTx4recbTcKE/3xyPOiZ03d8ckz6zLuuo6Rj4E/QqydKaTplyZibccuK
 iqQFIMOrN0fHQeNQA60RFwzzUyT27UvVCB/Kqkh7m3YhOOtGcdVykwtjg2jG8EZos6qm
 6wyQrVIgVX47HEWS6FantvsHE5jJ6PaL2/66baEvJoCjnSnm3kfN8AV9qjSS6Av2/eYr
 +MB/43nwKE5acGMewsqyyL8HEoTRkVxQvLRKK8aiE860SQya2ZeJ8CJwtrijykv5SzT5
 Lp+A==
X-Gm-Message-State: AOJu0YyTr8unHr6aSkUiMjCITRTC8D9KpPPpIq9pIqJsVRFpZCd/fbem
 0dv/2e8assTGJiBqCl4iFeYJRfkStSzDixzGnPK9psyaHmsDiNVKFWH2pA==
X-Gm-Gg: ASbGncvhlLRyKei72QTR8Kg/m4YV5Ljf9KM+UbDLnivtPQb6pSVl2Exk8oKkNwsSure
 YeX/wtFIbmXlscBHbe4EqaS4XxmzWRCoQPdNzArLdZFdPfpEgJM/YMDDp9hRETVVolYjm1hWHqp
 Db0/1FHCE6NIFgOgGRC2LZtZr3IT0Lv6qnSr2sJeCrYEwEIxhahwyWpFR0M6+ywkIonvabwcHdr
 optUyHT99zINaADb/sQs+Z3fTdbEpq8qR7Dy+8kEng=
X-Google-Smtp-Source: AGHT+IH6hYkYeyB6PkNnHkG/laFP/i/Ie8LjKG2HYwJFb+MFOz576TV8W8qZB1wz75XiDm57G3UPJA==
X-Received: by 2002:a17:906:9c92:b0:aa4:8186:5a58 with SMTP id
 a640c23a62f3a-aa63a088cf8mr363681266b.8.1733668721757; 
 Sun, 08 Dec 2024 06:38:41 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:41 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:38:02 +0200
Message-ID: <20241208143802.1048266-12-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668722; x=1734273522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Hew2heIHjHl6a4CGhhq+YkUOXQpwZLRi4KVpIbnDO0=;
 b=YwmIdvHF+cnG9x0rEuJ4xLOmM2N0KY3y/SjNvIpqhrwqw/DTLcTijtnolpJuEixERu
 K/pvMawWnSCubeMZ8hdN+ADHNlbfYvone42amFJF4HTACDJzhC7Zf/FvKHzjEkI5Tcli
 o+4zu9bUjEMr0DA2IknYM9DpykdG5s6Em1Wbhj25SQLKhBtE3bdxTmbYNYk9kv4UkOUn
 yHQX3eTJL7PV6RXBEWrP/1lVO2DAI2tZtcFceBFiOx70RX+6keA+x7lrnUPscjdP1/RB
 LYSq6UUq8aaLIs3bDVt+GD+N8q82OkJK3by1J/z/uRsRfhcl1ZTGcmyB84h+TuXcSKXE
 L7qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YwmIdvHF
Subject: [Buildroot] [PATCH v2 11/11] board/freescale: get rid of common
 patch folder
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
v1->v2: none

 ...dd-support-for-new-binutils-versions.patch | 61 ------------------
 ...Makefile-Suppress-array-bounds-error.patch | 51 ---------------
 ...dd-support-for-new-binutils-versions.patch | 62 ++++++++++++++++++-
 3 files changed, 61 insertions(+), 113 deletions(-)
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
 mode change 120000 => 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch

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
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 120000
index 5ef794304fba..000000000000
--- a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 000000000000..335c18553ac3
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
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
