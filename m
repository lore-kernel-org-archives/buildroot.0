Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E77BC35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 13:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486B082A83;
	Tue, 25 Mar 2025 13:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq0YBtiEOKRl; Tue, 25 Mar 2025 13:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E579D82A5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E579D82A5D;
	Tue, 25 Mar 2025 13:47:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69EF21B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B48340BBB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-29MCpemwqq for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 13:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EACFE40B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EACFE40B50
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp4.osuosl.org (Postfix) with ESMTP id EACFE40B50
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:47:01 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 980721FD0F;
 Tue, 25 Mar 2025 14:46:55 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 1F3235F497;
 Tue, 25 Mar 2025 14:48:18 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 09:46:09 -0400
Message-Id: <20250325134609.610846-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325134609.610846-1-guillaume.chaye@zeetim.com>
References: <20250325134609.610846-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1742910415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXk2H/TSPEjttOihjrboJJLMKqwhTqWnToNWSXA47zw=;
 b=amdWZMsICxkznvI7EKgQJXI6/+G9kk5fo3Z1c2NbkOEeP+a+D/GpsYdGTMefb88VzePyzE
 MYnsgV+KrnLlULafkdWJEgVOv87XV0gyvPns54q3wswPU++8T0EYDPIczzvHW7oDbyJWfU
 /XP+bSugyy/sIFgFvGscqNo+mTGAIsnZ/k7z9AUzAOkLuK/nnx6qxoGxlOGGS5KkMrpc2E
 IyOjlc7dyRvOH1yBb1zG4GaA2wdDBWRXMhKsM28WbDC/HV0886bznY++4Tx6e6KlaVi5Nx
 Z4c5jDohXuxSkVTANtsSiLe46jdgZRk0zjio8/Yb0Cqe8uSAjDOmXxeQWBIpXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=amdWZMsI
Subject: [Buildroot] [PATCH 2/2] package/efitools: efitools is a set of
 utilities to manipulate efi variables.
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...d-EXTRA_LDFLAGS-variable-to-Makefile.patch | 61 +++++++++++++++
 ...d-SYSROOT_DIR-variable-to-Make.rules.patch | 44 +++++++++++
 ...ve-EFISIGNED-variable-from-makefiles.patch | 31 ++++++++
 ...-to-efi-updatevar-to-read-from-stdin.patch | 74 +++++++++++++++++++
 package/efitools/Config.in                    | 15 ++++
 package/efitools/efitools.hash                |  3 +
 package/efitools/efitools.mk                  | 37 ++++++++++
 ...d-only-binaries-when-cross-compiling.patch | 43 +++++++++++
 10 files changed, 312 insertions(+)
 create mode 100644 package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
 create mode 100644 package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
 create mode 100644 package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch
 create mode 100644 package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.hash
 create mode 100644 package/efitools/efitools.mk
 create mode 100644 package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index ff069b9c40..d597924d7c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye <guillaume.chaye@zeetim.com>
+F:	package/efitools/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/Config.in b/package/Config.in
index 3f4dd42cbe..c5a4405dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/efitools/Config.in"
 	source "package/esp-hosted/Config.in"
 	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
diff --git a/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch b/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
new file mode 100644
index 0000000000..d931e9965b
--- /dev/null
+++ b/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
@@ -0,0 +1,61 @@
+From 4847a5a8a46462ee3c6386e2333fb2be87fb9ae6 Mon Sep 17 00:00:00 2001
+From: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Date: Fri, 24 Jan 2025 10:05:27 +0100
+Subject: [PATCH] efitools: Add EXTRA_LDFLAGS variable to Makefile
+
+This patch allows to build binaries with proper rpath
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ Makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7d471da..7fb29cc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -88,31 +88,31 @@ HelloWorld.so: lib/lib-efi.a
+ ShimReplace.so: lib/lib-efi.a
+ 
+ cert-to-efi-sig-list: cert-to-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ sig-list-to-certs: sig-list-to-certs.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ sign-efi-sig-list: sign-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ hash-to-efi-sig-list: hash-to-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS)
+ 
+ cert-to-efi-hash-list: cert-to-efi-hash-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ efi-keytool: efi-keytool.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS)
+ 
+ efi-readvar: efi-readvar.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ efi-updatevar: efi-updatevar.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS) -lcrypto
+ 
+ flash-var: flash-var.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS)
+ 
+ clean:
+ 	rm -f PK.* KEK.* DB.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
+-- 
+2.39.5
+
diff --git a/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
new file mode 100644
index 0000000000..200873254b
--- /dev/null
+++ b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
@@ -0,0 +1,44 @@
+From bc8b77009b94e644d056eecca667c6f2a8f563f1 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 11 Oct 2024 11:02:58 +0200
+Subject: [PATCH] efitools: Add SYSROOT_DIR variable to Make.rules
+
+We need to be able to change the root directory of include paths and library
+paths in order to cross compile efitools
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ Make.rules | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 903a5a4..dddc149 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -13,18 +13,19 @@ ARCH3264 =
+ else
+ $(error unknown architecture $(ARCH))
+ endif
+-INCDIR	   = -I$(TOPDIR)include/ -I/usr/include/efi -I/usr/include/efi/$(ARCH) -I/usr/include/efi/protocol
++SYSROOT_DIR=
++INCDIR	   = -I$(TOPDIR)include/ -I$(SYSROOT_DIR)/usr/include -I$(SYSROOT_DIR)/usr/include/efi -I$(SYSROOT_DIR)/usr/include/efi/$(ARCH) -I$(SYSROOT_DIR)/usr/include/efi/protocol
+ CPPFLAGS   = -DCONFIG_$(ARCH)
+ CFLAGS	   = -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
+ LDFLAGS	   = -nostdlib
+ CRTOBJ		= crt0-efi-$(ARCH).o
+-CRTPATHS	= /lib /lib64 /lib/efi /lib64/efi /usr/lib /usr/lib64 /usr/lib/efi /usr/lib64/efi /usr/lib/gnuefi /usr/lib64/gnuefi
++CRTPATHS	= $(SYSROOT_DIR)/lib $(SYSROOT_DIR)/lib64 $(SYSROOT_DIR)/lib/efi $(SYSROOT_DIR)/lib64/efi $(SYSROOT_DIR)/usr/lib $(SYSROOT_DIR)/usr/lib64 $(SYSROOT_DIR)/usr/lib/efi $(SYSROOT_DIR)/usr/lib64/efi $(SYSROOT_DIR)/usr/lib/gnuefi $(SYSROOT_DIR)/usr/lib64/gnuefi
+ CRTPATH		= $(shell for f in $(CRTPATHS); do if [ -e $$f/$(CRTOBJ) ]; then echo $$f; break; fi; done)
+ CRTOBJS		= $(CRTPATH)/$(CRTOBJ)
+ # there's a bug in the gnu tools ... the .reloc section has to be
+ # aligned otherwise the file alignment gets screwed up
+ LDSCRIPT	= elf_$(ARCH)_efi.lds
+-LDFLAGS		+= -shared -Bsymbolic $(CRTOBJS) -L $(CRTPATH) -L /usr/lib -L /usr/lib64 -T $(LDSCRIPT)
++LDFLAGS		+= -shared -Bsymbolic $(CRTOBJS) -L $(CRTPATH) -L $(SYSROOT_DIR)/usr/lib -L $(SYSROOT_DIR)/usr/lib64 -T $(LDSCRIPT)
+ LOADLIBES	= -lefi -lgnuefi $(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
+ FORMAT		= --target=efi-app-$(ARCH)
+ OBJCOPY		= objcopy
+-- 
+2.39.5
+
diff --git a/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch b/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch
new file mode 100644
index 0000000000..92d2c898e4
--- /dev/null
+++ b/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch
@@ -0,0 +1,31 @@
+From f7b880dedc4f66c674406687fb6d357b146892ee Mon Sep 17 00:00:00 2001
+From: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Date: Fri, 24 Jan 2025 11:55:05 +0100
+Subject: [PATCH] efitools: remove EFISIGNED variable from makefiles
+
+Efitools sign efi files with a key generated during build.
+We disable it to remove a build dependencie to sbsigntools.
+These signed files were not actually installed to the target.
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7d471da..718e700 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,7 +27,7 @@ include Make.rules
+ 
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(EFISIGNED) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
++all: $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
+ 
+-- 
+2.39.5
+
diff --git a/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
new file mode 100644
index 0000000000..9704269116
--- /dev/null
+++ b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
@@ -0,0 +1,74 @@
+From 3c7fbc5e24634e229ea785e106382cef4c8eec5c Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Wed, 11 Sep 2024 10:52:19 +0200
+Subject: [PATCH] efitools: add option to efi-updatevar to read from stdin
+ using -f- option
+
+The option "-f /dev/stdin" is actually not working.
+This patch allow to pipe keys in your script without having errors.
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ efi-updatevar.c | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/efi-updatevar.c b/efi-updatevar.c
+index 4247105..89d7c92 100644
+--- a/efi-updatevar.c
++++ b/efi-updatevar.c
+@@ -14,6 +14,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <stdbool.h>
+ 
+ #include <openssl/x509.h>
+ #include <openssl/bio.h>
+@@ -72,6 +73,7 @@ main(int argc, char *argv[])
+ 		| EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS;
+ 	char *hash_mode = NULL, *file = NULL, *var, *progname = argv[0], *buf,
+ 		*name, *crt_file = NULL, *key_file = NULL;
++	bool read_stdin=false;
+ 	
+ 
+ 	while (argc > 1 && argv[1][0] == '-') {
+@@ -97,6 +99,10 @@ main(int argc, char *argv[])
+ 			file = argv[2];
+ 			argv += 2;
+ 			argc -= 2;
++		} else if (strcmp(argv[1], "-f-") == 0) {
++			read_stdin=true;
++			argv += 1;
++			argc -= 1;
+ 		} else if (strcmp(argv[1], "-g") == 0) {
+ 			if (str_to_guid(argv[2], &guid)) {
+ 				fprintf(stderr, "Invalid GUID %s\n", argv[2]);
+@@ -147,7 +153,7 @@ main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 
+-	if (delsig == -1 && (!!file + !!hash_mode + !!crt_file != 1)) {
++	if (delsig == -1 && !read_stdin && (!!file + !!hash_mode + !!crt_file != 1)) {
+ 		fprintf(stderr, "must specify exactly one of -f, -b or -c\n");
+ 		exit(1);
+ 	}
+@@ -219,7 +225,14 @@ main(int argc, char *argv[])
+ 		buf = malloc(st.st_size);
+ 		read(fd, buf, st.st_size);
+ 		close(fd);
+-	} else {
++	}else if (read_stdin){
++		buf=malloc(0x400);
++		st.st_size=0;
++		while (read(STDIN_FILENO,buf+st.st_size,1)){
++			st.st_size++;
++			if (!(st.st_size&0x3FF)) buf=realloc(buf,st.st_size+0x400);
++		}
++	}else {
+ 		X509 *X = NULL;
+ 		BIO *bio;
+ 		char *crt_file_ext = &crt_file[strlen(crt_file) - 4];
+-- 
+2.39.2
+
diff --git a/package/efitools/Config.in b/package/efitools/Config.in
new file mode 100644
index 0000000000..0c9c10a2a0
--- /dev/null
+++ b/package/efitools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EFITOOLS
+	bool "efitools"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	help
+	  A variety of tools for manipulating keys and binary
+	  signatures on UEFI secure boot platforms.
+	  These tools provide access to the keys and certificates
+	  stored in the secure boot variables of the UEFI firmware,
+	  usually in the NVRAM area.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
diff --git a/package/efitools/efitools.hash b/package/efitools/efitools.hash
new file mode 100644
index 0000000000..33a6f3153c
--- /dev/null
+++ b/package/efitools/efitools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bca4271686a20cf27674e01e3dba3c23f36869c84cbc4a4ec3d60ca90896cb67  efitools-b988d20-git4.tar.gz
+sha256  824d6063f4319acb32fe5de52738c72e54ce8ff3dea3470462ff135b958480b5  COPYING
diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
new file mode 100644
index 0000000000..1da3b88acf
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 	b988d20
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
+EFITOOLS_SITE_METHOD = git
+EFITOOLS_LICENSE = GPL-2.0
+EFITOOLS_LICENSE_FILES = COPYING
+EFITOOLS_DEPENDENCIES = gnu-efi openssl
+HOST_EFITOOLS_DEPENDENCIES = host-gnu-efi host-openssl host-perl-file-slurp
+
+define EFITOOLS_BUILD_CMDS
+	cd $(@D); $(TARGET_CONFIGURE_OPTS) $(MAKE) SYSROOT_DIR=$(STAGING_DIR) EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define HOST_EFITOOLS_BUILD_CMDS
+	cd $(@D); $(HOST_CONFIGURE_OPTS) $(MAKE) SYSROOT_DIR=$(HOST_DIR) EXTRA_LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define EFITOOLS_INSTALL_TARGET_CMDS
+	cd $(@D); $(TARGET_CONFIGURE_OPTS) $(MAKE) install DESTDIR=$(TARGET_DIR)
+endef
+
+define HOST_EFITOOLS_INSTALL_CMDS
+	cd $(@D); $(HOST_CONFIGURE_OPTS) $(MAKE) install DESTDIR=$(HOST_DIR)
+endef
+
+define EFITOOLS_APPLY_ADDITIONAL_PATCHES
+	$(APPLY_PATCHES) $(@D) $(EFITOOLS_PKGDIR)/target \*.patch
+endef
+EFITOOLS_POST_PATCH_HOOKS+=  EFITOOLS_APPLY_ADDITIONAL_PATCHES
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
new file mode 100644
index 0000000000..9eeaaa1260
--- /dev/null
+++ b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
@@ -0,0 +1,43 @@
+From 595a7dc8527f90ba6bf7e0218b00aa7f93885ef1 Mon Sep 17 00:00:00 2001
+From: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Date: Fri, 24 Jan 2025 12:56:02 +0100
+Subject: [PATCH] efitools: build only binaries when cross compiling
+
+We cannot execute binaries to generate "auth" files when compiling
+for another architecture.
+help2man is also not working properly when cross compiling.
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ Makefile | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 718e700..3d81f6e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,15 +27,14 @@ include Make.rules
+ 
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
+-	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
++all: $(BINARIES)
+ 
+ 
+ install: all
+-	$(INSTALL) -m 755 -d $(MANDIR)
+-	$(INSTALL) -m 644 $(MANPAGES) $(MANDIR)
+-	$(INSTALL) -m 755 -d $(EFIDIR)
+-	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
++#	$(INSTALL) -m 755 -d $(MANDIR)
++#	$(INSTALL) -m 644 $(MANPAGES) $(MANDIR)
++#	$(INSTALL) -m 755 -d $(EFIDIR)
++#	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
+ 	$(INSTALL) -m 755 -d $(BINDIR)
+ 	$(INSTALL) -m 755 $(BINARIES) $(BINDIR)
+ 	$(INSTALL) -m 755 mkusb.sh $(BINDIR)/efitool-mkusb
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
