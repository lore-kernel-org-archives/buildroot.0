Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365BAC5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 11:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D23408AD;
	Tue, 10 Jun 2025 11:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 432iM8FIup5A; Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94A640981
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94A640981;
	Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 190041F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15EA3407B0
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFpOV8pA6dvs for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 11:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D10BE406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10BE406C9
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D10BE406C9
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-607ea238c37so4904495a12.2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 04:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749556505; x=1750161305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOnTq5jo4XBticOFXqldLUBpU+eZ3rMJa00wUSnMRuI=;
 b=Qxo/dDA+qIlqAXcxgg6qkb5bOMH9QUV36uEDYLikt/dmWFM814DKYbOzZAE+1nZALp
 ByF1QVTZ2DCcDqx0HipL+aI4Ohz42nqsaaf1bbRXM+v43sdiKixfOgDCN3+GfcLxmAwH
 gfLLHhJ2IvwEJ09EF0QrNaxntnsNEQ2GHuMF3lliaNIWG9a4FYXXCquEw8+O705tGNOa
 c8m70cqZ1rZmUdO1nQGuCfPQo++SfD6Rl9GsrXHiLqucXYmgr5+UbcXFNmAliCZAhKs8
 VWRp9ZZyvbPeJgoEumxqkxFtG2wo1FfESC941fLh/YUWWejM+ctdAcGJhLBhvs0YZL43
 XLSQ==
X-Gm-Message-State: AOJu0Yx+ArDfKMMpGBJkQzrnCWPbKsPtLorycghM0b/njiYvldOqsQp3
 cLtvZWBz/Z2sTdWnCSfS5RlYUlp/5zaDHDAJtU5vYHt8pfhorLNn1bYyXf5ZMXJfIFKO7UVaRb1
 /c+7O
X-Gm-Gg: ASbGncuht1a8Q3dJmB2BnALDmZNO9/TP3m4uHE43bOrQn+G2fRW/lsh/fdqWUuBPelE
 2qsN1qPvv91DSEk8f3kNJHJauFpnC/I/ST4uBNi0SwTAM6CKZMl+oapM8kOX+uKwOfFDb9E09Pw
 7atEL47gPZzj1IjsewpVU00941/g6cSpqVo0756yFcZb7+rkNtB7jlMQBskOhToLoaJwjeuASZO
 mozTZL35/pVII9JOnfwEMEerVyzurmdM9jwvZoNcj1OnUv6YQGeZoeXxGQ0w9AhdpIH1OBeMii1
 mnXv9Kd4J/QfwwLwvYarOw6cuzy/5gUYsec1O2Apc1cKK0GQI3CvWLU+vcCvUf1Wt40Ec7jg/Me
 6rR0c5EH7PE/sgrpY4Z05a58nyUY=
X-Google-Smtp-Source: AGHT+IFZXZncZCB379sCHyL1TF8FU04wD6/J1JV2u1Oxl6l92h6IWjCoMNhgM/2jCBy/7L//yJof4w==
X-Received: by 2002:a17:906:f5a9:b0:ad8:8529:4f86 with SMTP id
 a640c23a62f3a-ade1ab5ebe0mr1592275966b.58.1749556505292; 
 Tue, 10 Jun 2025 04:55:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc1c788sm718374266b.101.2025.06.10.04.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 04:55:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 10 Jun 2025 13:55:01 +0200
Message-ID: <20250610115502.2483804-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749556505; x=1750161305;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOnTq5jo4XBticOFXqldLUBpU+eZ3rMJa00wUSnMRuI=;
 b=QRJB2PRfWA9TRDXrAM6tqlsywrwwQRdV27uMUZU/fCcGNzvx4wIhe64X9POXiQifNT
 nl8hzUrt2aaTOT62GDgqs3pPjAU7k18QbX8cDfmP72Lz9dM/N0SEn6e6o/1NadliuHb3
 eid0JGnQf81dOrsVlHE+xoolJK1T515I0Xphk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QRJB2PRf
Subject: [Buildroot] [PATCH v4 1/2] package/pocketpy: new package
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

It is a portable Python 3.x interpreter, written in C11. It has no
dependencies other than the C standard library, which can be easily
integrated into your C/C++ project

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v3 -> v4:
 - Replace 0001-Fix-getchar-helper.patch with 0001-fix-371.patch.

Changes v2 -> v3:
 - Add package/pocketpy/0001-Fix-getchar-helper.patch.
 - Add depends on !BR2_STATIC_LIBS for dlfcn.h

Changes v1 -> v2:
 - mv staging commands under POCKETPY_INSTALL_STAGING_CMDS hook.

 DEVELOPERS                          |  1 +
 package/Config.in                   |  1 +
 package/pocketpy/0001-fix-371.patch | 73 +++++++++++++++++++++++++++++
 package/pocketpy/Config.in          |  9 ++++
 package/pocketpy/pocketpy.hash      |  3 ++
 package/pocketpy/pocketpy.mk        | 25 ++++++++++
 6 files changed, 112 insertions(+)
 create mode 100644 package/pocketpy/0001-fix-371.patch
 create mode 100644 package/pocketpy/Config.in
 create mode 100644 package/pocketpy/pocketpy.hash
 create mode 100644 package/pocketpy/pocketpy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a7bb3bd83460..46d24afceb71 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/ufs-utils/
diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87d5..9aad65488a6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -968,6 +968,7 @@ if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
+	source "package/pocketpy/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
diff --git a/package/pocketpy/0001-fix-371.patch b/package/pocketpy/0001-fix-371.patch
new file mode 100644
index 000000000000..6d9e324ba762
--- /dev/null
+++ b/package/pocketpy/0001-fix-371.patch
@@ -0,0 +1,73 @@
+From e2e3bdca6e79ce7be5607397c5f0152c28c7500b Mon Sep 17 00:00:00 2001
+From: blueloveTH <blueloveth@foxmail.com>
+Date: Sat, 7 Jun 2025 02:19:55 +0800
+Subject: [PATCH] fix #371
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from https://github.com/pocketpy/pocketpy/commit/70e824a6b695e963621664589d1d00aeb182c018
+---
+ include/pocketpy/pocketpy.h | 2 +-
+ src/interpreter/vm.c        | 6 ++++--
+ src/public/modules.c        | 2 +-
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/include/pocketpy/pocketpy.h b/include/pocketpy/pocketpy.h
+index a44faa41a922..a6cb4f658f73 100644
+--- a/include/pocketpy/pocketpy.h
++++ b/include/pocketpy/pocketpy.h
+@@ -69,7 +69,7 @@ typedef struct py_Callbacks {
+     /// Used by `print` to output a string.
+     void (*print)(const char*);
+     /// Used by `input` to get a character.
+-    int (*getchar)();
++    int (*getchr)();
+ } py_Callbacks;
+ 
+ /// Native function signature.
+diff --git a/src/interpreter/vm.c b/src/interpreter/vm.c
+index 2bae82740ac7..2da28fa80730 100644
+--- a/src/interpreter/vm.c
++++ b/src/interpreter/vm.c
+@@ -29,6 +29,8 @@ static char* pk_default_importfile(const char* path) {
+ 
+ static void pk_default_print(const char* data) { printf("%s", data); }
+ 
++static int pk_default_getchr() { return getchar(); }
++
+ static void py_TypeInfo__ctor(py_TypeInfo* self,
+                               py_Name name,
+                               py_Type index,
+@@ -67,7 +69,7 @@ void VM__ctor(VM* self) {
+ 
+     self->callbacks.importfile = pk_default_importfile;
+     self->callbacks.print = pk_default_print;
+-    self->callbacks.getchar = getchar;
++    self->callbacks.getchr = pk_default_getchr;
+ 
+     self->last_retval = *py_NIL();
+     self->curr_exception = *py_NIL();
+@@ -810,7 +812,7 @@ int py_replinput(char* buf, int max_size) {
+     printf(">>> ");
+ 
+     while(true) {
+-        int c = pk_current_vm->callbacks.getchar();
++        int c = pk_current_vm->callbacks.getchr();
+         if(c == EOF) return -1;
+ 
+         if(c == '\n') {
+diff --git a/src/public/modules.c b/src/public/modules.c
+index 3efb362701e2..cdfd5549461a 100644
+--- a/src/public/modules.c
++++ b/src/public/modules.c
+@@ -205,7 +205,7 @@ static bool builtins_input(int argc, py_Ref argv) {
+     c11_sbuf buf;
+     c11_sbuf__ctor(&buf);
+     while(true) {
+-        int c = pk_current_vm->callbacks.getchar();
++        int c = pk_current_vm->callbacks.getchr();
+         if(c == '\n' || c == '\r') break;
+         if(c == EOF) break;
+         c11_sbuf__write_char(&buf, c);
+-- 
+2.43.0
+
diff --git a/package/pocketpy/Config.in b/package/pocketpy/Config.in
new file mode 100644
index 000000000000..b0bd0cafe008
--- /dev/null
+++ b/package/pocketpy/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_POCKETPY
+	bool "pocketpy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  pocketpy is a portable Python 3.x interpreter,
+	  written in C11.
+
+	  https://github.com/pocketpy/pocketpy
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
new file mode 100644
index 000000000000..aabd5f077a2b
--- /dev/null
+++ b/package/pocketpy/pocketpy.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
+sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
new file mode 100644
index 000000000000..20a8e9ad1e20
--- /dev/null
+++ b/package/pocketpy/pocketpy.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# pocketpy
+#
+################################################################################
+
+POCKETPY_VERSION = 2.0.8
+POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
+POCKETPY_LICENSE = MIT
+POCKETPY_LICENSE_FILES = LICENSE
+POCKETPY_INSTALL_STAGING = YES
+
+POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
+
+define POCKETPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
+endef
+
+define POCKETPY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/pocketpy
+	cp -r $(@D)/include/* $(STAGING_DIR)/usr/include/pocketpy
+endef
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
