Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F41EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 08:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D7540517;
	Mon, 10 Jul 2023 08:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D7540517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6BOl1gnNczk; Mon, 10 Jul 2023 08:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60FDB40519;
	Mon, 10 Jul 2023 08:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60FDB40519
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 819791BF429
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 08:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 584EA40519
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 08:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584EA40519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUKPtcjAxZ-e for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 08:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248E540126
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 248E540126
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 08:56:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82de7so30706205e9.1
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 01:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979413; x=1691571413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P5RJm+wo+029JweHRq9sV55G43vDCFOFw3LrJ/IsdJg=;
 b=e+4RTuIpEyMnPuvn/9tybWFelf3I5TvKOJ8dH3YUdaPnN4Wn1vgLNzxFithfygzfwI
 eQV5cw13qMxH69Ug7vGp/K18iYo7rMyUubjrrNhKOKmWCBBiSIU6y43QHGh/P0ZGSoOL
 rsHISJADCkoXA5K77ARBM0UJgYCW1+CmbZHdVO1tFL3N6xmIu1BIazM7K2K/dlABZ6+9
 S1JsIs7uA4l3Q58pKAnkeQj14LtsVyKYEsLmOHbDkUGJiGvcU4GYL6uSs7PW41F/blLt
 NqcAe5EnpK1m64FXgdHS+A2WHM4erGqYVaQy9jmzdhZC9LsMkqtfq0TSAJnd+OUEYCGq
 V0Jg==
X-Gm-Message-State: ABy/qLaa4DUvx9GIfup4lChKqpjmdwjOGIiqwUnPo+pvkaLehvIJy5u+
 ZzXgqgY4wRYmPGF3jqvHCLqQfivOnU8=
X-Google-Smtp-Source: APBJJlF4uMO26ItMxbkSsv5a5MRHn56iD4dbElGyisfyJMSQ3XhvxY7v1uE81pflWghUYceIA9i7WA==
X-Received: by 2002:a1c:7919:0:b0:3fa:9741:5b73 with SMTP id
 l25-20020a1c7919000000b003fa97415b73mr10664734wme.10.1688979412289; 
 Mon, 10 Jul 2023 01:56:52 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003fc01189b0dsm8190281wmc.42.2023.07.10.01.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:56:51 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 10:56:29 +0200
Message-Id: <20230710085629.305236-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688979413; x=1691571413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P5RJm+wo+029JweHRq9sV55G43vDCFOFw3LrJ/IsdJg=;
 b=d+q72v+y+CuSevZR7dyCTQU0/bTjP8SarFDTaMSlfhDKHkju/Mm41Rq/NwdrPr90V0
 1VDNJkGFuzFg2fiQ6ZGjPzn7J2TTlx5y3vNY9q3qe4UskiU05cNwSY6a1JvUGemBYlDU
 GrQEifrNpQHsd7x0kVMrL1PQUfgUaTchJaE03d6pHn6zOn+FK363Ljmbj0zXbxlGbUlI
 Ard3ztgHBUt/XA3/e4RhOVdss6bBHK4PMrvdIPH0kbzzlozFG5Tkyhn18zrkHTV4KV8j
 1yq6oao9ySJzwUcWR1FqyEz2fQeB7nsxotCzvsfRbEu06VBAj9mXSZJz8MSvTT7M2I2U
 bEaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d+q72v+y
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix build issue with
 binutils 2.39+
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@smile.fr>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new version of binutils introduces a new warning when linking. The
new warninng is enabled by default. To fix the issue this warning is
disabled by adding the patches to the arm-trusted-firmware package
v{2.2..2.8}. This is a backport of an upstream commit [1]

[1] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996186
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996189

Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...-add-support-for-new-binutils-versio.patch | 58 +++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 7 files changed, 430 insertions(+)
 create mode 100644 boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
 create mode 100644 boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
new file mode 100644
index 0000000000..2375de0eef
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
@@ -0,0 +1,58 @@
+From 5e1beb793c06352e87c46eca1144ff1fe8555103 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Mon, 10 Jul 2023 10:43:03 +0200
+Subject: [PATCH] [PATCH] feat(build): add support for new binutils versions
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
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 721246d51..5893cf422 100644
+--- a/Makefile
++++ b/Makefile
+@@ -297,11 +297,16 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS              +=      -z noexecstack
++
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+ TF_LDFLAGS		+=	--remove --info=unused,unusedsymbols
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS              +=      $(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS              +=      -O1
+ TF_LDFLAGS		+=	--gc-sections
+ endif
+ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
diff --git a/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
diff --git a/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
diff --git a/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
diff --git a/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
diff --git a/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
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
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
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
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
