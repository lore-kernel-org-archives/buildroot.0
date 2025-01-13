Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85CBE7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 11:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9020B608EE;
	Mon, 13 Jan 2025 11:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQkNNdLxIzlM; Mon, 13 Jan 2025 11:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 520AD608BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 520AD608BE;
	Mon, 13 Jan 2025 11:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D085940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 11:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A93B40129
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 11:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0Smyn6w8wSO for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 11:02:10 +0000 (UTC)
X-Greylist: delayed 549 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 Jan 2025 11:02:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 562364046B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 562364046B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp2.osuosl.org (Postfix) with ESMTP id 562364046B
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 11:02:10 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 7843C1FB9F;
 Mon, 13 Jan 2025 11:51:55 +0100 (CET)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 99C0F5F497;
 Mon, 13 Jan 2025 11:37:45 +0100 (CET)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:51:32 +0100
Message-Id: <20250113105132.890144-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113105132.890144-1-guillaume.chaye@zeetim.com>
References: <20250113105132.890144-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1736765515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgJOj4jH9widYs4FUan40LY0dTmApVKh8Ynz3XQX7Zg=;
 b=tLq6MKjbnrNErnMjETOKIFIEMcbaHx9rwt4IjRLmjibeAmN4mw++vXnbcgsKAdmOmG3zWL
 u8JK92MH0D5C3iHcGz5oVCH4XvNmLzcpRY07mpM1YFwCqJOQ+hduTctGgzpVvTwIYDWXZe
 nuHalDfQ5UGIVZmULLl1/rFOAIimvbNKWEGnYvdFIzZKydy5x040C7o6fq/ZLtQQMeDgpQ
 5Je0UFJRM5CeOa1pPEcUdVrkTzyCb+8aUDfJTWpCkpcvP9+7CGg42jUMdqs9VB6VAz3EPr
 Rky6oQVWESTzCwrv1NCpGYe9zMUXOFVn0sNS9UDEaLETSforg+fmjFYLrgmEqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=tLq6MKjb
Subject: [Buildroot] [PATCHv3 2/2] package/efitools: efitools is a set of
 utilities to manipulate efi variables
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christopher McCrory <chrismcc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/Config.in                             |  1 +
 ...ve-EFISIGNED-variable-from-makefiles.patch | 58 +++++++++++++++
 ...d-SYSROOT_DIR-variable-to-Make.rules.patch | 43 +++++++++++
 ...-to-efi-updatevar-to-read-from-stdin.patch | 73 +++++++++++++++++++
 package/efitools/Config.in                    | 14 ++++
 package/efitools/efitools.mk                  | 20 +++++
 6 files changed, 209 insertions(+)
 create mode 100644 package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
 create mode 100644 package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
 create mode 100644 package/efitools/0003-Add-option-to-efi-updatevar-to-read-from-stdin.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..a6e56a6d74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/efitools/Config.in"
 	source "package/esp-hosted/Config.in"
 	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
diff --git a/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch b/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
new file mode 100644
index 0000000000..b2ba1ed2e4
--- /dev/null
+++ b/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
@@ -0,0 +1,58 @@
+From ec1b602d119f17ebb62d0d841eec1d93313f54aa Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Wed, 11 Sep 2024 10:32:07 +0200
+Subject: [PATCH 1/3] efitools: remove EFISIGNED variable from makefiles
+
+Efitools sign efi files with a key generated during build.
+We disable it to remove a build dependencie to sbsigntools.
+These signed files were not actually installed to the target.
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+---
+ Make.rules | 10 ----------
+ Makefile   |  4 +---
+ 2 files changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 903a5a4..8c06be8 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -1,4 +1,3 @@
+-EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ MANPAGES = $(patsubst doc/%.1.in,doc/%.1,$(wildcard doc/*.1.in))
+ HELP2MAN = help2man
+ ARCH	 = $(shell uname -m | sed 's/i.86/ia32/;s/arm.*/arm/')
+@@ -119,15 +118,6 @@ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else ec
+ %-subkey.crt: %-subkey.csr KEK.crt
+ 	openssl x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
+ 
+-%-signed.efi: %.efi DB.crt
+-	sbsign --key DB.key --cert DB.crt --output $@ $<
+-
+-##
+-# No need for KEK signing
+-##
+-#%-kek-signed.efi: %.efi KEK.crt
+-#	sbsign --key KEK.key --cert KEK.crt --output $@ $<
+-
+ %.a:
+ 	ar rcv $@ $^
+ 
+diff --git a/Makefile b/Makefile
+index 7d471da..79dc603 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,9 +25,7 @@ export TOPDIR	:= $(shell pwd)/
+ 
+ include Make.rules
+ 
+-EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+-
+-all: $(EFISIGNED) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
++all: $(EFIFILES) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
+ 
+-- 
+2.39.2
+
diff --git a/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
new file mode 100644
index 0000000000..699ed1bc08
--- /dev/null
+++ b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
@@ -0,0 +1,43 @@
+From aed26937117cf569a1274fb818c1f1846dab0e05 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Wed, 11 Sep 2024 10:41:45 +0200
+Subject: [PATCH 2/3] efitools: Add SYSROOT_DIR variable to Make.rules
+
+We need to be able to change the root directory of include paths and library
+paths in order to cross compile efitools
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+---
+ Make.rules | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 8c06be8..d7cd20b 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -12,18 +12,19 @@ ARCH3264 =
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
+2.39.2
+
diff --git a/package/efitools/0003-Add-option-to-efi-updatevar-to-read-from-stdin.patch b/package/efitools/0003-Add-option-to-efi-updatevar-to-read-from-stdin.patch
new file mode 100644
index 0000000000..d486eb4a88
--- /dev/null
+++ b/package/efitools/0003-Add-option-to-efi-updatevar-to-read-from-stdin.patch
@@ -0,0 +1,73 @@
+From 3c7fbc5e24634e229ea785e106382cef4c8eec5c Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Wed, 11 Sep 2024 10:52:19 +0200
+Subject: [PATCH 3/3] efitools: add option to efi-updatevar to read from stdin
+ using -f- option
+
+The option "-f /dev/stdin" is actually not working.
+This patch allow to pipe keys in your script without having errors.
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
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
index 0000000000..5b8fdc9145
--- /dev/null
+++ b/package/efitools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EFITOOLS
+    bool "efitools"
+    depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+    select BR2_PACKAGE_GNU_EFI
+    select BR2_PACKAGE_OPENSSL
+    select BR2_PACKAGE_LIBOPENSSL
+    select BR2_PACKAGE_LIBOPENSSL_ENGINES
+    help
+        A variety of tools for manipulating keys and binary signatures
+        on UEFI secure boot platforms. The tools provide access to the 
+        keys and certificates stored in the secure variables of the 
+        UEFI firmware, usually in the NVRAM area.
+
+        https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
new file mode 100644
index 0000000000..0f90de16a0
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 1.9.2
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
+EFITOOLS_LICENSE = GPL-2.0
+EFITOOLS_DEPENDENCIES = gnu-efi openssl host-perl-file-slurp
+
+define EFITOOLS_BUILD_CMDS
+	cd $(@D); $(TARGET_CONFIGURE_OPTS) $(MAKE) SYSROOT_DIR=$(STAGING_DIR)
+endef
+
+define EFITOOLS_INSTALL_TARGET_CMDS
+	cd $(@D); $(TARGET_MAKE_ENV) $(MAKE) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
