Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F4DC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 14:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A1260A8E;
	Fri, 17 Jan 2025 14:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8cWOUMVTv-c; Fri, 17 Jan 2025 14:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083B660F35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083B660F35;
	Fri, 17 Jan 2025 14:17:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06ED294B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 14:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7EE40533
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 14:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svg-znIVl_lb for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 14:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D72F404F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D72F404F9
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D72F404F9
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 14:16:57 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 590381FB9F;
 Fri, 17 Jan 2025 15:16:21 +0100 (CET)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 6BA7E5F499;
 Fri, 17 Jan 2025 15:16:21 +0100 (CET)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jan 2025 15:16:09 +0100
Message-Id: <20250117141609.3384660-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250117141609.3384660-1-guillaume.chaye@zeetim.com>
References: <20250117141609.3384660-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1737123381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N99I1GQ881DGQq/uRpHzWFFTGPNjWltxk2aGYrL1hhI=;
 b=FRlT7wPKlFTpOJ2nKGxswDEaHvzch7uSPCJ6otXkEI7PnMtita8RH593xbHHrPcfyPoSpM
 9/2O/mU4Nc/MPzgingmhZlsWAV2bRPt82EJn6SKPxJCDStbdFOqrJecWE6BiIj4kEPJKjC
 sJ1zszwZ5S6AkaK58Cbu2loD21wV9J/Xx9HgBK9URVjuSbiZQKCscnE/QzilDtpQVhd+B2
 QWY55Q0Wfwk/350PcrBylYuBqG6AwaVN/dNv6xt3bUodUSTGa1+F/L9IgafWoz7CFrl74K
 6wRLps8XqjdKixRlo7RGbZr2FRjenTPC0J4oFB/3T2eq9EInQuWIC7Ohk1pl/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=FRlT7wPK
Subject: [Buildroot] [PATCH 2/2] [PATCHv4 2/2] package/efitools: efitools is
 a set of utilities to manipulate efi variables
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
 =?UTF-8?q?Guillaume=20Chay=C3=A9?= <guillaume.chaye@zeetim.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...ve-EFISIGNED-variable-from-makefiles.patch | 41 +++++++++++
 ...d-SYSROOT_DIR-variable-to-Make.rules.patch | 43 +++++++++++
 ...d-EXTRA_LDFLAGS-variable-to-Makefile.patch | 60 +++++++++++++++
 ...-to-efi-updatevar-to-read-from-stdin.patch | 73 +++++++++++++++++++
 package/efitools/Config.in                    | 14 ++++
 package/efitools/efitools.mk                  | 35 +++++++++
 ...d-only-binaries-when-cross-compiling.patch | 55 ++++++++++++++
 9 files changed, 325 insertions(+)
 create mode 100644 package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
 create mode 100644 package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
 create mode 100644 package/efitools/0003-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
 create mode 100644 package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.mk
 create mode 100644 package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d8ae8289b..dd761d27ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1330,6 +1330,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye <guillaume.chaye@zeetim.com>
+F:	package/efitools/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/Config.in b/package/Config.in
index 400183516e..fb0e06f664 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/efitools/Config.in"
 	source "package/esp-hosted/Config.in"
 	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
diff --git a/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch b/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
new file mode 100644
index 0000000000..2c41d05859
--- /dev/null
+++ b/package/efitools/0001-Remove-EFISIGNED-variable-from-makefiles.patch
@@ -0,0 +1,41 @@
+From d494f5d5de8121ce586377f48ceb8651a17996ab Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 11 Oct 2024 11:01:25 +0200
+Subject: [PATCH 1/4] efitools: remove EFISIGNED variable from makefiles
+
+Efitools sign efi files with a key generated during build.
+We disable it to remove a build dependencie to sbsigntools.
+These signed files were not actually installed to the target.
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+---
+ Makefile | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7d471da..0387bbd 100644
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
+@@ -115,7 +113,7 @@ flash-var: flash-var.o lib/lib.a
+ 	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
+ 
+ clean:
+-	rm -f PK.* KEK.* DB.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
++	rm -f PK.* KEK.* DB.* $(EFIFILES) $(BINARIES) *.o *.so
+ 	rm -f noPK.*
+ 	rm -f doc/*.1
+ 	$(MAKE) -C lib clean
+-- 
+2.39.5
+
diff --git a/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
new file mode 100644
index 0000000000..a8b21c059d
--- /dev/null
+++ b/package/efitools/0002-Add-SYSROOT_DIR-variable-to-Make.rules.patch
@@ -0,0 +1,43 @@
+From bc8b77009b94e644d056eecca667c6f2a8f563f1 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 11 Oct 2024 11:02:58 +0200
+Subject: [PATCH 2/4] efitools: Add SYSROOT_DIR variable to Make.rules
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
diff --git a/package/efitools/0003-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch b/package/efitools/0003-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
new file mode 100644
index 0000000000..cab10bba98
--- /dev/null
+++ b/package/efitools/0003-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
@@ -0,0 +1,60 @@
+From d2a1c8a6ea82ce975dd503e2090f0f7dc3f2e068 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 11 Oct 2024 11:07:08 +0200
+Subject: [PATCH 3/4] efitools: Add EXTRA_LDFLAGS variable to Makefile
+
+This patch allows to build binaries with proper rpath
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+---
+ Makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0387bbd..f7b616b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -86,31 +86,31 @@ HelloWorld.so: lib/lib-efi.a
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
+ 	rm -f PK.* KEK.* DB.* $(EFIFILES) $(BINARIES) *.o *.so
+-- 
+2.39.5
+
diff --git a/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
new file mode 100644
index 0000000000..793899bd02
--- /dev/null
+++ b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
@@ -0,0 +1,73 @@
+From 3c7fbc5e24634e229ea785e106382cef4c8eec5c Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Wed, 11 Sep 2024 10:52:19 +0200
+Subject: [PATCH 4/4] efitools: add option to efi-updatevar to read from stdin
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
index 0000000000..4aaf72dffe
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 1.9.2
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
+EFITOOLS_LICENSE = GPL-2.0
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
+	$(APPLY_PATCHES) $(@D) $(EFITOOLS_PKGDIR)/target *.patch
+endef
+EFITOOLS_POST_PATCH_HOOKS+=  EFITOOLS_APPLY_ADDITIONAL_PATCHES
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
new file mode 100644
index 0000000000..6836288f5f
--- /dev/null
+++ b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
@@ -0,0 +1,55 @@
+From 83c40badb624f871245d9e9910e0fc7cdff4b310 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 11 Oct 2024 11:14:06 +0200
+Subject: [PATCH 4/4] efitools: Build only binaries when cross compiling
+
+We cannot execute binaries to generate "auth" files when compiling
+for another architecture.
+help2man is also not working properly when cross compiling.
+
+Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
+---
+ Makefile | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f7b616b..64f0afa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,15 +25,14 @@ export TOPDIR	:= $(shell pwd)/
+ 
+ include Make.rules
+ 
+-all: $(EFIFILES) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
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
+@@ -113,9 +112,9 @@ flash-var: flash-var.o lib/lib.a
+ 	$(CC) $(ARCH3264) -o $@ $< lib/lib.a $(EXTRA_LDFLAGS)
+ 
+ clean:
+-	rm -f PK.* KEK.* DB.* $(EFIFILES) $(BINARIES) *.o *.so
+-	rm -f noPK.*
+-	rm -f doc/*.1
++	rm -f $(BINARIES) *.o
++#	rm -f noPK.*
++#	rm -f doc/*.1
+ 	$(MAKE) -C lib clean
+ 	$(MAKE) -C lib/asn1 clean
+ 
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
