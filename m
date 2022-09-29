Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D84C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 23:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E9341C6E;
	Thu, 29 Sep 2022 23:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E9341C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WK0zBEAxOFQw; Thu, 29 Sep 2022 23:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C7441C4F;
	Thu, 29 Sep 2022 23:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C7441C4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4226B1BF289
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 23:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A2C78402A
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 23:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2C78402A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vukwQLNQ2Jw for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 23:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A328401F
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01A328401F
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 23:44:09 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id y9so1473607ily.11
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 16:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=6jh7iJGD4obsDWSRJIVIROmb/9Ls+E7HE2urqXLC/tw=;
 b=6u7cgw/lO0bTULVNqMdOK/GDMMqCsQvmHDPwIb1ZwZCpq/hL3B1hUTrap6nfkH1UIi
 pxozTJJ0JkW+eNKGpS5BYKYhv9YlMyA1pjgMLA1cK3AGmVZ/QUzEt+qq6DdOTDDjNDfA
 Uuvet0MAk4c+Huu3bUjZ5ZGuG/H5yDRp8mvxuU9t1iy81rMZYMDvnosUlbAwZY9hJECJ
 qRkC/1ZKkaj/MuEv8sCDgP5ezyfa/EGcr2qdVAaAg1/+qGlbxwTZpZAjunie3Ntj1rAB
 bcR0XEWTOrr+oLOsu8fc5rNLJPBa54tnQE4AywJGtW8Ys2Ba2aUIi/8fu0wUDOXTfv49
 htnw==
X-Gm-Message-State: ACrzQf0zWI6CvZiPmceTTSPCVtZjsPLWyB3CbItbT3/alnA1D/7tAXLO
 uJvGRwNbEznQKkINt3hJ5B09OLhxOdIfbA==
X-Google-Smtp-Source: AMsMyM4Co/jIrOW2TSBB+VbVSKC5XaOUyuvc13BVOqxVHgYyW0tiJvWKni5wQImL8F6591BEM8mgZg==
X-Received: by 2002:a05:6e02:1605:b0:2f8:3e2:aae3 with SMTP id
 t5-20020a056e02160500b002f803e2aae3mr2838857ilu.235.1664495048717; 
 Thu, 29 Sep 2022 16:44:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d16-20020a92d5d0000000b002e85e8b8d1dsm421108ilq.5.2022.09.29.16.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 16:44:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 17:44:06 -0600
Message-Id: <20220929234406.374167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=6jh7iJGD4obsDWSRJIVIROmb/9Ls+E7HE2urqXLC/tw=;
 b=kpiOKMlsITsfVDtNOEH8zqOXlVqwSCmEFLB9+DdNT3VHDGDbDGwA3uOLMEDaM5D9TY
 Qs9UyNaEHo35TzXzTV8UVq6Or7wlqnM5DziN+UvquEc63RYYxYNShn9cjMdY9q1bqWqB
 avzOsjxbEqo8YDm85YkAGaZEGTBAtR+IRD8f6iqZsSfwMTdZU+EIoYDUgFDLybc9CUV+
 F3pbLtdUs3Oj8CsTqcRKqAX3htYY9XjabYlP860yR6xWAhucTMHCSfJTXvCfj1yDeGXC
 xWjaRIJIrYKeD1O2R/p6UsWFEDaZ53+Yx6ef+iveYRcpXmqcnKeaYDhSFN0iG+EEJzeV
 Wlnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kpiOKMls
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...strapping-during-a-cross-compilation.patch | 96 -------------------
 package/bpftool/bpftool.hash                  |  2 +-
 package/bpftool/bpftool.mk                    |  2 +-
 3 files changed, 2 insertions(+), 98 deletions(-)
 delete mode 100644 package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch

diff --git a/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch b/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch
deleted file mode 100644
index fc192681e3..0000000000
--- a/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 189f777ea4829bede0bf92f572c22fe1f2c37522 Mon Sep 17 00:00:00 2001
-From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
-Date: Wed, 8 Jun 2022 14:29:28 +0000
-Subject: [PATCH] bpftool: Fix bootstrapping during a cross compilation
-
-This change adjusts the Makefile to use "HOSTAR" as the archive tool
-to keep the sanity of the build process for the bootstrap part in
-check. For the rationale, please continue reading.
-
-When cross compiling bpftool with buildroot, it leads to an invocation
-like:
-
-$ AR="/path/to/buildroot/host/bin/arc-linux-gcc-ar" \
-  CC="/path/to/buildroot/host/bin/arc-linux-gcc"    \
-  ...
-  make
-
-Which in return fails while building the bootstrap section:
-
-----------------------------------8<----------------------------------
-
-  make: Entering directory '/src/bpftool-v6.7.0/src'
-  ...                        libbfd: [ on  ]
-  ...        disassembler-four-args: [ on  ]
-  ...                          zlib: [ on  ]
-  ...                        libcap: [ OFF ]
-  ...               clang-bpf-co-re: [ on  ] <-- triggers bootstrap
-
-  .
-  .
-  .
-
-    LINK     /src/bpftool-v6.7.0/src/bootstrap/bpftool
-  /usr/bin/ld: /src/bpftool-v6.7.0/src/bootstrap/libbpf/libbpf.a:
-               error adding symbols: archive has no index; run ranlib
-               to add one
-  collect2: error: ld returned 1 exit status
-  make: *** [Makefile:211: /src/bpftool-v6.7.0/src/bootstrap/bpftool]
-            Error 1
-  make: *** Waiting for unfinished jobs....
-    AR       /src/bpftool-v6.7.0/src/libbpf/libbpf.a
-    make[1]: Leaving directory '/src/bpftool-v6.7.0/libbpf/src'
-    make: Leaving directory '/src/bpftool-v6.7.0/src'
-
----------------------------------->8----------------------------------
-
-This occurs because setting "AR" confuses the build process for the
-bootstrap section and it calls "arc-linux-gcc-ar" to create and index
-"libbpf.a" instead of the host "ar".
-
-Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
-Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
-Reviewed-by: Quentin Monnet <quentin@isovalent.com>
-Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
-Link: https://lore.kernel.org/bpf/8d297f0c-cfd0-ef6f-3970-6dddb3d9a87a@synopsys.com
-Upstream: https://github.com/libbpf/bpftool/commit/189f777ea4829bede0bf92f572c22fe1f2c37522
-
-This is an adapted version, else it won't be possible to cross compile
-bpftool if "clang-bpf-co-re" feature is enabled.
----
- src/Makefile | 2 +-
- src/Makefile.include       | 2 ++
- 2 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index b657502..b8b0808 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -51,7 +51,7 @@ $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_
- $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
- 	$(Q)$(MAKE) -C $(BPF_DIR) OBJDIR=$(patsubst %/,%,$(LIBBPF_BOOTSTRAP_OUTPUT)) \
- 		PREFIX=$(LIBBPF_BOOTSTRAP_DESTDIR:/=) \
--		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
-+		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) AR=$(HOSTAR) $@ install_headers
- 
- $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
- 	$(call QUIET_INSTALL, $@)
---- a/src/Makefile.include
-+++ b/src/Makefile.include
-@@ -12,11 +12,13 @@
- ifneq ($(LLVM),)
-   $(if $(findstring default,$(origin CC)),$(eval CC := clang$(LLVM_VERSION)))
-   $(if $(findstring default,$(origin LD)),$(eval LD := ld.lld$(LLVM_VERSION)))
-+  HOSTAR ?= llvm-ar
-   HOSTCC ?= clang
-   HOSTLD ?= ld.lld
- else
-   $(if $(findstring default,$(origin CC)),$(eval CC = $(CROSS_COMPILE)$(CC)))
-   $(if $(findstring default,$(origin LD)),$(eval LD = $(CROSS_COMPILE)$(LD)))
-+  HOSTAR ?= ar
-   HOSTCC ?= gcc
-   HOSTLD ?= ld
- endif
---
-2.35.3
-
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 5fbc25adb7..92b9359fe3 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f8f8cabc001823d270898ea3a635d1eb88e067bc24eed06f74e58d2650b32312  bpftool-v6.8.0-br1.tar.gz
+sha256  465a50fea4afbacd326f2209d81ae0dcff637fbb2c9d1a315e94f79a788ce960  bpftool-v7.0.0-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index bb1e4ccdff..3b27698130 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v6.8.0
+BPFTOOL_VERSION = v7.0.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
