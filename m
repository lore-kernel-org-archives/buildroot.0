Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4FFE6FE51
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A421B40524;
	Tue, 23 Dec 2025 22:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErxRKvPhJgJk; Tue, 23 Dec 2025 22:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F234054E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528123;
	bh=9hfTnPQj78SSCcRA+Y3Uc/LPpDL/YxKimI1g1IPeKm8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QKPkDhPJnItpzuDUY2l32oeduGqyuCcVlDg0GPz/2YMui4Q5J6bcGf39vlf9pO1ph
	 Yc90ZRq3fOiG+UKUNIYZKGA8Pa05EYGchFwYMNk4uMiJedsJmePS/GJFy3DxLZ+evJ
	 kBO0kV61fQCTkG+24vSuyn/qWbYANLj8pc/Kej1mn85I8eQL2ow73L8DoVOjtzTCtX
	 JcKUY/bp5GJmCCOZyexqANSm1+lJWUhiP/bJ/ohNp8MaLVLhbbXu48ZfNoFHsC+ZYJ
	 CVMNZYfmXAyBlDFDRbvqertlQ4OAQ4KZYEzYcSg8WlIQMV098/BsifdN0RrrT8LT/c
	 9dmcEPggszXig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F234054E;
	Tue, 23 Dec 2025 22:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DBFB9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B2AE4079D
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjrDOUtBRymH for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.41;
 helo=mail-ej1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3B08401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B08401D0
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3B08401D0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:17 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b728a43e410so996877166b.1
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 14:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528116; x=1767132916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anuVuvndGLtT2zpsVk/RgjioaJhYlV4hxqMW4vkcWYc=;
 b=MUFS8v4PxhFGjyj+JeuAx+no1j5VYDnkW9UfM1ympGvg+cTXAd3pKnzceIfH36iUmd
 jWwYQmciKr/s4gaxFm4XeAtX+9edBbE71CqJV8ZseLnHWytdR/5ufLJM/50qOwBm3Qs2
 ypJKE6U09+ZGls/GXeVVcsEoXfoqRWSuL0bNgN6uvfHd3nYLYzp8Xam+Xdmn0AcK6SxC
 xZkMvJDQBjNcbOls0b0gnU8BF5EtKHRsXR9LbzjwF28z9COBk2VI3/rvSFz15vyPwjFD
 EqWTNGzMnVUeQlHjYsA6NTfqZLvgOrw1pNSM2zeS5c4vo//B+dFpAozqnvE7p4urQAXd
 kEaA==
X-Gm-Message-State: AOJu0YwG3OiG60cLcEMDmDw9QXBD/pmuXkstZoZRmt7FoPc4oBaDT1lk
 DQAJtexWLenM53YSkbbQ8mci6IvYstGTYV8VztA6KFNbtEidM6ojR2KrQGf3zz/fGyg=
X-Gm-Gg: AY/fxX5u69204u7gs4e55h8ufqpIgkkrKccAsUOaFKiGY9eHZU2KytL8veK1uoPxlNv
 QJkhV+nLU8TgOfVfdCwClGrPVHYKzk/QGzuLZ16wApRlWJS7SQr9zBxSeOCrl0i2wjAeme3Kr+R
 oCSEWMq3861r+GCnrT634nqdkSHaL5Xt8uMlAxm1bbIqZU2yUf+NOdwpBFSm2mJjp3W4OQeMONv
 w8nWRugHFREj90SN49SwhEkvRqUitZpCq2FycDYc1vN+hqGEg0tuWHVK/0Aki6cS4V5IHli6AdJ
 LdTwixUaX5nSZ6eguETNrpkzGL8muMJoIWCaGVKEgTH4D8aInkEsvwex1oC4sZKbdvPORBO0JXF
 ZJJzZ1lHSkJWxhofisdWv1DVRCuNvTULDCfODxUsx2+pctC0e8xYIV5ImphzAmdXcbMEcvk/t9w
 586PO2/tHQdI5vHpmSQgLLhiJO+USYO4D1DYfHww0O57Ainnx7epl3
X-Google-Smtp-Source: AGHT+IGsxJdztD7vNprOepPff5Oj7bK+JAWbsDxSCF9OR3MwXsCNZ80YzTPZaj4gKvu6NXXOlk8NiA==
X-Received: by 2002:a17:906:6a2a:b0:b76:e6bd:7bcd with SMTP id
 a640c23a62f3a-b8036f107cdmr1738412066b.20.1766528114408; 
 Tue, 23 Dec 2025 14:15:14 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb5f:fa00:faf0:ebea:87cc:7ff9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037f51144sm1565020766b.69.2025.12.23.14.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:15:13 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Hendrik De Vloed <hendrik.devloed@dekimo.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 23 Dec 2025 23:15:01 +0100
Message-ID: <20251223221507.62183-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/efitools: new package
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
Content-Type: multipart/mixed; boundary="===============4318984271982750751=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4318984271982750751==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Hendrik De Vloed <hendrik.devloed@dekimo.com>

The efitools package provides utilities for managing UEFI
Secure Boot keys and includes sample EFI applications.
Binaries such as efi-readvar, efi-updatevar and
cert-to-efi-sig-list are built for the target system.

Inspired by https://lists.buildroot.org/pipermail/buildroot/2018-July/213212.html.

Patch series can be found here:
https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools

Note that 0001-add-binary-only-make-rules.patch has been moved to
0018-add-binary-only-make-rules.patch, because two patches start
with 0001, and buildroot prepares the lowercase first while applying.

Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 .../0001-Fix-for-the-cross-compilation.patch  | 185 +++++++++++++++
 ...e-_GNU_SOURCE-for-a-declaration-of-f.patch |  29 +++
 ...e-wrong-dependency-for-blacklist.esl.patch |  29 +++
 ...tem-warm-reset-after-the-key-provisi.patch |  45 ++++
 ...w-to-override-tools-for-target-build.patch |  95 ++++++++
 ...-Makefile-remove-help2man-dependency.patch |  35 +++
 ...ic-keyword-for-IsValidVariableHeader.patch |  39 ++++
 ...-openssl.cnf-for-openssl-1.0.x-1.1.x.patch |  51 ++++
 ...mpilation-against-latest-usr-include.patch |  40 ++++
 ...ckDown-enable-the-enrollment-for-DBX.patch |  86 +++++++
 ...the-error-message-with-3-sec-timeout.patch |  97 ++++++++
 ...kefile-do-not-build-signed-efi-image.patch |  43 ++++
 .../efitools/0013-Build-DBX-by-default.patch  |  47 ++++
 ...-the-entrance-into-BIOS-setup-to-re-.patch |  50 ++++
 ...5-fix-segfault-for-efitools-commands.patch | 220 ++++++++++++++++++
 ...6-Make.rules-Pass-CFLAGS-to-Makefile.patch |  32 +++
 ...les-fix-efi-files-for-gnu-efi-3.0.18.patch |  38 +++
 .../0018-add-binary-only-make-rules.patch     |  44 ++++
 ...les-allow-to-specify-the-target-arch.patch |  27 +++
 package/efitools/Config.in                    |  15 ++
 package/efitools/Config.in.host               |  13 ++
 package/efitools/efitools.hash                |   3 +
 package/efitools/efitools.mk                  |  42 ++++
 25 files changed, 1307 insertions(+)
 create mode 100644 package/efitools/0001-Fix-for-the-cross-compilation.patch
 create mode 100644 package/efitools/0002-Make.rules-define-_GNU_SOURCE-for-a-declaration-of-f.patch
 create mode 100644 package/efitools/0003-Fix-the-wrong-dependency-for-blacklist.esl.patch
 create mode 100644 package/efitools/0004-LockDown-run-system-warm-reset-after-the-key-provisi.patch
 create mode 100644 package/efitools/0005-Allow-to-override-tools-for-target-build.patch
 create mode 100644 package/efitools/0006-Makefile-remove-help2man-dependency.patch
 create mode 100644 package/efitools/0007-Add-static-keyword-for-IsValidVariableHeader.patch
 create mode 100644 package/efitools/0008-Dynamically-load-openssl.cnf-for-openssl-1.0.x-1.1.x.patch
 create mode 100644 package/efitools/0009-console.c-Fix-compilation-against-latest-usr-include.patch
 create mode 100644 package/efitools/0010-LockDown-enable-the-enrollment-for-DBX.patch
 create mode 100644 package/efitools/0011-LockDown-show-the-error-message-with-3-sec-timeout.patch
 create mode 100644 package/efitools/0012-Makefile-do-not-build-signed-efi-image.patch
 create mode 100644 package/efitools/0013-Build-DBX-by-default.patch
 create mode 100644 package/efitools/0014-LockDown-disable-the-entrance-into-BIOS-setup-to-re-.patch
 create mode 100644 package/efitools/0015-fix-segfault-for-efitools-commands.patch
 create mode 100644 package/efitools/0016-Make.rules-Pass-CFLAGS-to-Makefile.patch
 create mode 100644 package/efitools/0017-Make.rules-fix-efi-files-for-gnu-efi-3.0.18.patch
 create mode 100644 package/efitools/0018-add-binary-only-make-rules.patch
 create mode 100644 package/efitools/0019-Make.rules-allow-to-specify-the-target-arch.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/Config.in.host
 create mode 100644 package/efitools/efitools.hash
 create mode 100644 package/efitools/efitools.mk

diff --git a/package/Config.in b/package/Config.in
index 3b29aa31a0d..c1f812973a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2845,6 +2845,7 @@ menu "System tools"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
+	source "package/efitools/Config.in"
 	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
 	source "package/fluent-bit/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 6357eec2652..f6e6f6c965f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/efitools/Config.in.host"
 	source "package/environment-setup/Config.in.host"
 	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
diff --git a/package/efitools/0001-Fix-for-the-cross-compilation.patch b/package/efitools/0001-Fix-for-the-cross-compilation.patch
new file mode 100644
index 00000000000..ab35866a480
--- /dev/null
+++ b/package/efitools/0001-Fix-for-the-cross-compilation.patch
@@ -0,0 +1,185 @@
+From e2473e0b68dba57fc41a83fbe73b889f5de63971 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Tue, 15 Mar 2016 21:28:33 +0800
+Subject: [PATCH] Fix for the cross compilation
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 48 ++++++++++++++++++++++++++----------------------
+ Makefile   | 18 +++++++++---------
+ 2 files changed, 35 insertions(+), 31 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 903a5a4..65a634c 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -13,21 +13,25 @@ ARCH3264 =
+ else
+ $(error unknown architecture $(ARCH))
+ endif
+-INCDIR	   = -I$(TOPDIR)include/ -I/usr/include/efi -I/usr/include/efi/$(ARCH) -I/usr/include/efi/protocol
+-CPPFLAGS   = -DCONFIG_$(ARCH)
+-CFLAGS	   = -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
+-LDFLAGS	   = -nostdlib
++INCDIR	   = -I$(TOPDIR)include/ -I$(INCDIR_PREFIX)/usr/include -I$(INCDIR_PREFIX)/usr/include/efi -I$(INCDIR_PREFIX)/usr/include/efi/$(ARCH) -I$(INCDIR_PREFIX)/usr/include/efi/protocol
++cppflags   = -DCONFIG_$(ARCH)
++cflags	   = -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
++ldflags	   = -nostdlib
+ CRTOBJ		= crt0-efi-$(ARCH).o
+ CRTPATHS	= /lib /lib64 /lib/efi /lib64/efi /usr/lib /usr/lib64 /usr/lib/efi /usr/lib64/efi /usr/lib/gnuefi /usr/lib64/gnuefi
+-CRTPATH		= $(shell for f in $(CRTPATHS); do if [ -e $$f/$(CRTOBJ) ]; then echo $$f; break; fi; done)
++CRTPATH		= $(shell for f in $(CRTPATHS); do if [ -e $(CRTPATH_PREFIX)/$$f/$(CRTOBJ) ]; then echo $(CRTPATH_PREFIX)/$$f; break; fi; done)
+ CRTOBJS		= $(CRTPATH)/$(CRTOBJ)
+ # there's a bug in the gnu tools ... the .reloc section has to be
+ # aligned otherwise the file alignment gets screwed up
+ LDSCRIPT	= elf_$(ARCH)_efi.lds
+-LDFLAGS		+= -shared -Bsymbolic $(CRTOBJS) -L $(CRTPATH) -L /usr/lib -L /usr/lib64 -T $(LDSCRIPT)
++ldflags		+= -shared -Bsymbolic $(CRTOBJS) -L $(CRTPATH) -T $(LDSCRIPT)
+ LOADLIBES	= -lefi -lgnuefi $(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
+ FORMAT		= --target=efi-app-$(ARCH)
+ OBJCOPY		= objcopy
++NM		= nm
++AR		= ar
++OPENSSL		= openssl
++SBSIGN		= sbsign
+ MYGUID		= 11111111-2222-3333-4444-123456789abc
+ INSTALL		= install
+ BINDIR		= $(DESTDIR)/usr/bin
+@@ -36,23 +40,23 @@ EFIDIR		= $(DESTDIR)/usr/share/efitools/efi
+ DOCDIR		= $(DESTDIR)/usr/share/efitools
+ 
+ # globally use EFI calling conventions (requires gcc >= 4.7)
+-CFLAGS += -DGNU_EFI_USE_MS_ABI
++cflags += -DGNU_EFI_USE_MS_ABI
+ 
+ ifeq ($(ARCH),x86_64)
+-  CFLAGS += -DEFI_FUNCTION_WRAPPER -mno-red-zone
++  cflags += -DEFI_FUNCTION_WRAPPER -mno-red-zone
+ endif
+ 
+ ifeq ($(ARCH),ia32)
+-  CFLAGS += -mno-red-zone
++  cflags += -mno-red-zone
+ endif
+ 
+ ifeq ($(ARCH),arm)
+-  LDFLAGS += --defsym=EFI_SUBSYSTEM=0x0a
++  ldflags += --defsym=EFI_SUBSYSTEM=0x0a
+   FORMAT = -O binary
+ endif
+ 
+ ifeq ($(ARCH),aarch64)
+-  LDFLAGS += --defsym=EFI_SUBSYSTEM=0x0a
++  ldflags += --defsym=EFI_SUBSYSTEM=0x0a
+   FORMAT = -O binary
+ endif
+ 
+@@ -61,9 +65,9 @@ endif
+ 		   -j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
+ 		   -j .reloc $(FORMAT) $*.so $@
+ %.so: %.o
+-	$(LD) $(LDFLAGS) $^ -o $@ $(LOADLIBES)
++	$(LD) $(ldflags) $^ -o $@ $(LOADLIBES)
+ 	# check we have no undefined symbols
+-	nm -D $@ | grep ' U ' && exit 1 || exit 0
++	${NM} -D $@ | grep ' U ' && exit 1 || exit 0
+ 
+ %.h: %.auth
+ 	./xxdi.pl $< > $@
+@@ -99,28 +103,28 @@ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else ec
+ 	./sign-efi-sig-list -a -c PK.crt -k PK.key dbx $< $@
+ 
+ %.o: %.c
+-	$(CC) $(INCDIR) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
++	$(CC) $(INCDIR) $(cflags) $(cppflags) -c $< -o $@
+ 
+ %.efi.o: %.c
+-	$(CC) $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
++	$(CC) $(INCDIR) $(cflags) $(cppflags) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
+ 
+ %.efi.s: %.c
+-	$(CC) -S $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
++	$(CC) -S $(INCDIR) $(cflags) $(cppflags) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
+ 
+ %.crt:
+-	openssl req -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
++	$(OPENSSL) req -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
+ 
+ %.cer: %.crt
+-	openssl x509 -in $< -out $@ -outform DER
++	$(OPENSSL) x509 -in $< -out $@ -outform DER
+ 
+ %-subkey.csr:
+-	openssl req -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
++	$(OPENSSL) req -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
+ 
+ %-subkey.crt: %-subkey.csr KEK.crt
+-	openssl x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
++	$(OPENSSL) x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
+ 
+ %-signed.efi: %.efi DB.crt
+-	sbsign --key DB.key --cert DB.crt --output $@ $<
++	$(SBSIGN) --key DB.key --cert DB.crt --output $@ $<
+ 
+ ##
+ # No need for KEK signing
+@@ -129,7 +133,7 @@ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else ec
+ #	sbsign --key KEK.key --cert KEK.crt --output $@ $<
+ 
+ %.a:
+-	ar rcv $@ $^
++	$(AR) rcv $@ $^
+ 
+ doc/%.1: doc/%.1.in %
+ 	$(HELP2MAN) --no-info -i $< -o $@ ./$*
+diff --git a/Makefile b/Makefile
+index 7d471da..124c2aa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -88,31 +88,31 @@ HelloWorld.so: lib/lib-efi.a
+ ShimReplace.so: lib/lib-efi.a
+ 
+ cert-to-efi-sig-list: cert-to-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ sig-list-to-certs: sig-list-to-certs.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ sign-efi-sig-list: sign-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ hash-to-efi-sig-list: hash-to-efi-sig-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a
+ 
+ cert-to-efi-hash-list: cert-to-efi-hash-list.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ efi-keytool: efi-keytool.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a
+ 
+ efi-readvar: efi-readvar.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ efi-updatevar: efi-updatevar.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a -lcrypto
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a -lcrypto
+ 
+ flash-var: flash-var.o lib/lib.a
+-	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
++	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a
+ 
+ clean:
+ 	rm -f PK.* KEK.* DB.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
+-- 
+2.43.0
+
diff --git a/package/efitools/0002-Make.rules-define-_GNU_SOURCE-for-a-declaration-of-f.patch b/package/efitools/0002-Make.rules-define-_GNU_SOURCE-for-a-declaration-of-f.patch
new file mode 100644
index 00000000000..ac96bcfadc8
--- /dev/null
+++ b/package/efitools/0002-Make.rules-define-_GNU_SOURCE-for-a-declaration-of-f.patch
@@ -0,0 +1,29 @@
+From b8f346ccaad6d39828a90c56630f2ed10e41a08f Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sat, 24 Jun 2023 14:58:14 +0800
+Subject: [PATCH] Make.rules: define _GNU_SOURCE for a declaration of function
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 65a634c..66d63f0 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -14,7 +14,7 @@ else
+ $(error unknown architecture $(ARCH))
+ endif
+ INCDIR	   = -I$(TOPDIR)include/ -I$(INCDIR_PREFIX)/usr/include -I$(INCDIR_PREFIX)/usr/include/efi -I$(INCDIR_PREFIX)/usr/include/efi/$(ARCH) -I$(INCDIR_PREFIX)/usr/include/efi/protocol
+-cppflags   = -DCONFIG_$(ARCH)
++cppflags   = -DCONFIG_$(ARCH) -D_GNU_SOURCE
+ cflags	   = -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
+ ldflags	   = -nostdlib
+ CRTOBJ		= crt0-efi-$(ARCH).o
+-- 
+2.43.0
+
diff --git a/package/efitools/0003-Fix-the-wrong-dependency-for-blacklist.esl.patch b/package/efitools/0003-Fix-the-wrong-dependency-for-blacklist.esl.patch
new file mode 100644
index 00000000000..09bfb411c5a
--- /dev/null
+++ b/package/efitools/0003-Fix-the-wrong-dependency-for-blacklist.esl.patch
@@ -0,0 +1,29 @@
+From 4325daa8e467e232e696ed22a3d3c0b76554334c Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Tue, 15 Mar 2016 21:07:31 +0800
+Subject: [PATCH] Fix the wrong dependency for %-blacklist.esl
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 66d63f0..fed93b9 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -75,7 +75,7 @@ endif
+ %.hash: %.efi hash-to-efi-sig-list
+ 	./hash-to-efi-sig-list $< $@
+ 
+-%-blacklist.esl: %.crt cert-to-efi-hash-list
++%-blacklist.esl: %.crt cert-to-efi-sig-list
+ 	./cert-to-efi-sig-list $< $@
+ 
+ %-hash-blacklist.esl: %.crt cert-to-efi-hash-list
+-- 
+2.43.0
+
diff --git a/package/efitools/0004-LockDown-run-system-warm-reset-after-the-key-provisi.patch b/package/efitools/0004-LockDown-run-system-warm-reset-after-the-key-provisi.patch
new file mode 100644
index 00000000000..91dae6febbd
--- /dev/null
+++ b/package/efitools/0004-LockDown-run-system-warm-reset-after-the-key-provisi.patch
@@ -0,0 +1,45 @@
+From 09d14116bfb68da7d7b46301a28f8155cac58b14 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Fri, 25 Mar 2016 10:52:34 +0800
+Subject: [PATCH] LockDown: run system warm reset after the key provision
+ success
+
+In addition, BIOS would stop at its setup screen. The end user can thus
+enable UEFI secure boot immediately.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ LockDown.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/LockDown.c b/LockDown.c
+index 29df9de..821985c 100644
+--- a/LockDown.c
++++ b/LockDown.c
+@@ -99,5 +99,20 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 	}
+ 	Print(L"Platform %s set to boot securely\n", SecureBoot ? L"is" : L"is not");
+ 
++	/* Reset system to go back the real UEFI secure boot flow.
++	 * If SecureBoot is still false, the user needs to turn on
++	 * UEFI secure boot in BIOS setup.
++	 */
++	Print(L"Prepare to execute system warm reset after 3 seconds ...\n");
++	if (!SecureBoot)
++	        Print(L"After warm reset, enter to BIOS setup to enable UEFI Secure Boot.\n");
++
++	BS->Stall(3000000);
++
++	if (!SecureBoot)
++	        SETOSIndicationsAndReboot(EFI_OS_INDICATIONS_BOOT_TO_FW_UI);
++	else
++	        RT->ResetSystem(EfiResetWarm, EFI_SUCCESS, 0, NULL);
++
+ 	return EFI_SUCCESS;
+ }
+-- 
+2.43.0
+
diff --git a/package/efitools/0005-Allow-to-override-tools-for-target-build.patch b/package/efitools/0005-Allow-to-override-tools-for-target-build.patch
new file mode 100644
index 00000000000..359b7e3a3e7
--- /dev/null
+++ b/package/efitools/0005-Allow-to-override-tools-for-target-build.patch
@@ -0,0 +1,95 @@
+From 8ba70177430e19f8f6ae4e483f009a615da78ce7 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Wed, 23 Mar 2016 19:05:29 +0800
+Subject: [PATCH] Allow to override tools for target build
+
+These tools should use the ones from native build.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 22 +++++++++++++---------
+ Makefile   |  4 ++--
+ 2 files changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index fed93b9..1c50114 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -32,6 +32,10 @@ NM		= nm
+ AR		= ar
+ OPENSSL		= openssl
+ SBSIGN		= sbsign
++SIGN_EFI_SIG_LIST ?= ./sign-efi-sig-list
++CERT_TO_EFI_SIG_LIST ?= ./cert-to-efi-sig-list
++CERT_TO_EFI_HASH_LIST ?= ./cert-to-efi-hash-list
++HASH_TO_EFI_SIG_LIST ?= ./hash-to-efi-sig-list
+ MYGUID		= 11111111-2222-3333-4444-123456789abc
+ INSTALL		= install
+ BINDIR		= $(DESTDIR)/usr/bin
+@@ -73,34 +77,34 @@ endif
+ 	./xxdi.pl $< > $@
+ 
+ %.hash: %.efi hash-to-efi-sig-list
+-	./hash-to-efi-sig-list $< $@
++	$(HASH_TO_EFI_SIG_LIST) $< $@
+ 
+ %-blacklist.esl: %.crt cert-to-efi-sig-list
+-	./cert-to-efi-sig-list $< $@
++	$(CERT_TO_EFI_SIG_LIST) $< $@
+ 
+ %-hash-blacklist.esl: %.crt cert-to-efi-hash-list
+-	./cert-to-efi-hash-list $< $@
++	$(CERT_TO_EFI_HASH_LIST) $< $@
+ 
+ %.esl: %.crt cert-to-efi-sig-list
+-	./cert-to-efi-sig-list -g $(MYGUID) $< $@
++	$(CERT_TO_EFI_SIG_LIST) -g $(MYGUID) $< $@
+ 
+ getcert = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo "-c PK.crt -k PK.key"; else echo "-c KEK.crt -k KEK.key"; fi)
+ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else echo db; fi)
+ 
+ %.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list $(call getcert,$*) $(call getvar,$*) $< $@
++	$(SIGN_EFI_SIG_LIST) $(call getcert,$*) $(call getvar,$*) $< $@
+ 
+ %-update.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a $(call getcert,$*) $(call getvar,$*) $< $@
++	$(SIGN_EFI_SIG_LIST) -a $(call getcert,$*) $(call getvar,$*) $< $@
+ 
+ %-pkupdate.auth: %.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c PK.crt -k PK.key $(call getvar,$*) $< $@
++	$(SIGN_EFI_SIG_LIST) -a -c PK.crt -k PK.key $(call getvar,$*) $< $@
+ 
+ %-blacklist.auth: %-blacklist.esl KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c KEK.crt -k KEK.key dbx $< $@
++	$(SIGN_EFI_SIG_LIST) -a -c KEK.crt -k KEK.key dbx $< $@
+ 
+ %-pkblacklist.auth: %-blacklist.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c PK.crt -k PK.key dbx $< $@
++	$(SIGN_EFI_SIG_LIST) -a -c PK.crt -k PK.key dbx $< $@
+ 
+ %.o: %.c
+ 	$(CC) $(INCDIR) $(cflags) $(cppflags) -c $< -o $@
+diff --git a/Makefile b/Makefile
+index 124c2aa..0343224 100644
+--- a/Makefile
++++ b/Makefile
+@@ -66,10 +66,10 @@ noPK.esl:
+ 	> noPK.esl
+ 
+ noPK.auth: noPK.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -t "$(shell date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -c PK.crt -k PK.key PK $< $@
++	$(SIGN_EFI_SIG_LIST) -t "$(shell date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -c PK.crt -k PK.key PK $< $@
+ 
+ ms-%.esl: ms-%.crt cert-to-efi-sig-list
+-	./cert-to-efi-sig-list -g $(MSGUID) $< $@
++	$(CERT_TO_EFI_SIG_LIST) -g $(MSGUID) $< $@
+ 
+ hashlist.h: HashTool.hash
+ 	cat $^ > /tmp/tmp.hash
+-- 
+2.43.0
+
diff --git a/package/efitools/0006-Makefile-remove-help2man-dependency.patch b/package/efitools/0006-Makefile-remove-help2man-dependency.patch
new file mode 100644
index 00000000000..7651f001a83
--- /dev/null
+++ b/package/efitools/0006-Makefile-remove-help2man-dependency.patch
@@ -0,0 +1,35 @@
+From ef44a16cc563659d5b108664c1eca709ba6903e4 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sat, 24 Jun 2023 15:26:27 +0800
+Subject: [PATCH] Makefile: remove help2man dependency
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0343224..f493778 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,13 +27,11 @@ include Make.rules
+ 
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(EFISIGNED) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
++all: $(EFISIGNED) $(BINARIES) noPK.auth $(KEYAUTH) \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
+ 
+ install: all
+-	$(INSTALL) -m 755 -d $(MANDIR)
+-	$(INSTALL) -m 644 $(MANPAGES) $(MANDIR)
+ 	$(INSTALL) -m 755 -d $(EFIDIR)
+ 	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
+ 	$(INSTALL) -m 755 -d $(BINDIR)
+-- 
+2.43.0
+
diff --git a/package/efitools/0007-Add-static-keyword-for-IsValidVariableHeader.patch b/package/efitools/0007-Add-static-keyword-for-IsValidVariableHeader.patch
new file mode 100644
index 00000000000..808af684d58
--- /dev/null
+++ b/package/efitools/0007-Add-static-keyword-for-IsValidVariableHeader.patch
@@ -0,0 +1,39 @@
+From c17225f9681e5ec04bc1e69db943f044061a0cf8 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Sun, 12 Jun 2016 13:45:54 +0800
+Subject: [PATCH] Add static keyword for IsValidVariableHeader()
+
+GCC does not inline any functions when not optimizing (-O0 specified) unless
+you specify "always_inline" attribute for the function.
+
+By default, GCC complies with C89 standard for c code, which means
+"inline" equals to "extern inline" and thus the definition is used only for
+inlining with the assembly code actually generated.
+
+Therefore, "static inline" is used for both purposes. If -O0 is specified,
+GCC will generate the assembly code as long as the function is referred.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ include/variableformat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/variableformat.h b/include/variableformat.h
+index 32cde05..45d0ebb 100644
+--- a/include/variableformat.h
++++ b/include/variableformat.h
+@@ -109,7 +109,7 @@ typedef struct {
+ 
+ #pragma pack()
+ 
+-inline BOOLEAN
++static inline BOOLEAN
+ IsValidVariableHeader (VARIABLE_HEADER   *vh) {
+ 	if (vh == NULL || vh->StartId != VARIABLE_DATA)
+ 		return FALSE;
+-- 
+2.43.0
+
diff --git a/package/efitools/0008-Dynamically-load-openssl.cnf-for-openssl-1.0.x-1.1.x.patch b/package/efitools/0008-Dynamically-load-openssl.cnf-for-openssl-1.0.x-1.1.x.patch
new file mode 100644
index 00000000000..fc9aba76685
--- /dev/null
+++ b/package/efitools/0008-Dynamically-load-openssl.cnf-for-openssl-1.0.x-1.1.x.patch
@@ -0,0 +1,51 @@
+From 818b708313dabb63bb24b187c8525c2b399798a5 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Wed, 16 Aug 2017 22:59:12 +0800
+Subject: [PATCH] Dynamically load openssl.cnf for openssl-1.0.x/1.1.x/3.0
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 1c50114..0316ce5 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -116,13 +116,27 @@ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else ec
+ 	$(CC) -S $(INCDIR) $(cflags) $(cppflags) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
+ 
+ %.crt:
+-	$(OPENSSL) req -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
++	@if [ -s "$(OPENSSL_LIB)/ssl-3/openssl.cnf" ]; then \
++	    cfg="$(OPENSSL_LIB)/ssl-3/openssl.cnf"; \
++	elif [ -s "$(OPENSSL_LIB)/ssl-1.1/openssl.cnf" ]; then \
++	    cfg="$(OPENSSL_LIB)/ssl-1.1/openssl.cnf"; \
++	else \
++	    cfg="$(OPENSSL_LIB)/ssl/openssl.cnf"; \
++	fi; \
++	$(OPENSSL) req -config $$cfg -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
+ 
+ %.cer: %.crt
+ 	$(OPENSSL) x509 -in $< -out $@ -outform DER
+ 
+ %-subkey.csr:
+-	$(OPENSSL) req -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
++	@if [ -s "$(OPENSSL_LIB)/ssl-3/openssl.cnf" ]; then \
++	    cfg="$(OPENSSL_LIB)/ssl-3/openssl.cnf"; \
++	elif [ -s "$(OPENSSL_LIB)/ssl-1.1/openssl.cnf" ]; then \
++	    cfg="$(OPENSSL_LIB)/ssl-1.1/openssl.cnf"; \
++	else \
++	    cfg="$(OPENSSL_LIB)/ssl/openssl.cnf"; \
++	fi; \
++	$(OPENSSL) req -config $$cfg -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
+ 
+ %-subkey.crt: %-subkey.csr KEK.crt
+ 	$(OPENSSL) x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
+-- 
+2.43.0
+
diff --git a/package/efitools/0009-console.c-Fix-compilation-against-latest-usr-include.patch b/package/efitools/0009-console.c-Fix-compilation-against-latest-usr-include.patch
new file mode 100644
index 00000000000..c0566bb821b
--- /dev/null
+++ b/package/efitools/0009-console.c-Fix-compilation-against-latest-usr-include.patch
@@ -0,0 +1,40 @@
+From ea384e6462f41d425370a081efa0400ed60d35b7 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Mon, 4 Nov 2019 12:42:49 -0800
+Subject: [PATCH] console.c: Fix compilation against latest /usr/include/efi
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| gcc  -I/opt/tmp/work/x86_64-linux/efitools-native/1.9.2+gitAUTOINC+392836a46c-r0/git/include/ -I/opt/tmp/work/x86_64-linux/efitools-native/1.9.2+gitAUTOINC+392836a46c-r0/recipe-sysroot-native/usr/include -I/opt/tmp/work/x86_64-linux/efitools-native/1.9.2+gitAUTOINC+392836a46c-r0/recipe-sysroot-native/usr/include/efi -I/opt/tmp/work/x86_64-linux/efitools-native/1.9.2+gitAUTOINC+392836a46c-r0/recipe-sysroot-native/usr/include/efi/x86_64 -I/opt/tmp/work/x86_64-linux/efitools-native/1.9.2+gitAUTOINC+392836a46c-r0/recipe-sysroot-native/usr/include/efi/protocol -O2 -g  -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check -DGNU_EFI_USE_MS_ABI -DEFI_FUNCTION_WRAPPER -mno-red-zone -DCONFIG_x86_64 -fno-toplevel-reorder -DBUILD_EFI -c console.c -o console.efi.o
+| console.c:360:5: error: ‘EFI_WARN_UNKOWN_GLYPH’ undeclared here (not in a function); did you mean ‘EFI_WARN_UNKNOWN_GLYPH’?
+|   {  EFI_WARN_UNKOWN_GLYPH,      L"Warning Unknown Glyph"},
+|      ^~~~~~~~~~~~~~~~~~~~~
+|      EFI_WARN_UNKNOWN_GLYPH
+| ../Make.rules:113: recipe for target 'console.efi.o' failed
+|
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ lib/console.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/console.c b/lib/console.c
+index 9c10560..b932a44 100644
+--- a/lib/console.c
++++ b/lib/console.c
+@@ -357,7 +357,7 @@ static struct {
+ 	{  EFI_SECURITY_VIOLATION,     L"Security Violation"},
+ 
+ 	// warnings
+-	{  EFI_WARN_UNKOWN_GLYPH,      L"Warning Unknown Glyph"},
++	{  EFI_WARN_UNKNOWN_GLYPH,     L"Warning Unknown Glyph"},
+ 	{  EFI_WARN_DELETE_FAILURE,    L"Warning Delete Failure"},
+ 	{  EFI_WARN_WRITE_FAILURE,     L"Warning Write Failure"},
+ 	{  EFI_WARN_BUFFER_TOO_SMALL,  L"Warning Buffer Too Small"},
+-- 
+2.43.0
+
diff --git a/package/efitools/0010-LockDown-enable-the-enrollment-for-DBX.patch b/package/efitools/0010-LockDown-enable-the-enrollment-for-DBX.patch
new file mode 100644
index 00000000000..f9fbdfbf4e0
--- /dev/null
+++ b/package/efitools/0010-LockDown-enable-the-enrollment-for-DBX.patch
@@ -0,0 +1,86 @@
+From 19735bc07ba0013bc56c6b47734965ac5dbf51a0 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Fri, 22 Apr 2016 16:28:05 +0800
+Subject: [PATCH] LockDown: enable the enrollment for DBX
+
+DBX acting as blacklist now is able to be enrolled.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ LockDown.c | 16 +++++++++++-----
+ Makefile   |  4 +++-
+ 2 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/LockDown.c b/LockDown.c
+index 821985c..fec2e79 100644
+--- a/LockDown.c
++++ b/LockDown.c
+@@ -12,6 +12,7 @@
+ #include "PK.h"
+ #include "KEK.h"
+ #include "DB.h"
++#include "DBX.h"
+ 
+ EFI_STATUS
+ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+@@ -47,6 +48,7 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 		return efi_status;
+ 	}
+ 	Print(L"Created KEK Cert\n");
++
+ 	efi_status = RT->SetVariable(L"db", &SIG_DB,
+ 				     EFI_VARIABLE_NON_VOLATILE
+ 				     | EFI_VARIABLE_RUNTIME_ACCESS 
+@@ -58,15 +60,19 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 		return efi_status;
+ 	}
+ 	Print(L"Created db Cert\n");
+-#if 0
+-	/* testing revocation ... this will revoke the certificate
+-	 * we just enrolled in db */
+-	efi_status = SetSecureVariable(L"dbx", DB_cer, DB_cer_len, SIG_DB, 0);
++
++	efi_status = RT->SetVariable(L"dbx", &SIG_DB,
++				     EFI_VARIABLE_NON_VOLATILE
++				     | EFI_VARIABLE_RUNTIME_ACCESS
++				     | EFI_VARIABLE_BOOTSERVICE_ACCESS
++				     | EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS,
++				     DBX_auth_len, DBX_auth);
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to enroll dbx: %d\n", efi_status);
+ 		return efi_status;
+ 	}
+-#endif
++	Print(L"Created dbx Cert\n");
++
+ 	/* PK must be updated with a signed copy of itself */
+ 	efi_status = RT->SetVariable(L"PK", &GV_GUID,
+ 				     EFI_VARIABLE_NON_VOLATILE
+diff --git a/Makefile b/Makefile
+index f493778..da209f6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,7 +51,7 @@ lib/asn1/libasn1.a lib/asn1/libasn1-efi.a: FORCE
+ .KEEP: PK.crt KEK.crt DB.crt PK.key KEK.key DB.key PK.esl DB.esl KEK.esl \
+ 	$(EFIFILES)
+ 
+-LockDown.o: PK.h KEK.h DB.h
++LockDown.o: PK.h KEK.h DB.h DBX.h
+ PreLoader.o: hashlist.h
+ 
+ PK.h: PK.auth
+@@ -60,6 +60,8 @@ KEK.h: KEK.auth
+ 
+ DB.h: DB.auth
+ 
++DBX.h: DBX.auth
++
+ noPK.esl:
+ 	> noPK.esl
+ 
+-- 
+2.43.0
+
diff --git a/package/efitools/0011-LockDown-show-the-error-message-with-3-sec-timeout.patch b/package/efitools/0011-LockDown-show-the-error-message-with-3-sec-timeout.patch
new file mode 100644
index 00000000000..6a908568887
--- /dev/null
+++ b/package/efitools/0011-LockDown-show-the-error-message-with-3-sec-timeout.patch
@@ -0,0 +1,97 @@
+From 1241c10fefedbe32ec843e32315a289c6b8046c7 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Tue, 17 Jan 2017 12:48:27 +0800
+Subject: [PATCH] LockDown: show the error message with 3-sec timeout
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ LockDown.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/LockDown.c b/LockDown.c
+index fec2e79..13c626f 100644
+--- a/LockDown.c
++++ b/LockDown.c
+@@ -27,12 +27,12 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"No SetupMode variable ... is platform secure boot enabled?\n");
+-		return EFI_SUCCESS;
++		goto out;
+ 	}
+ 
+ 	if (!SetupMode) {
+ 		Print(L"Platform is not in Setup Mode, cannot install Keys\n");
+-		return EFI_SUCCESS;
++		goto out;
+ 	}
+ 
+ 	Print(L"Platform is in Setup Mode\n");
+@@ -45,7 +45,7 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 				     KEK_auth_len, KEK_auth);
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to enroll KEK: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Created KEK Cert\n");
+ 
+@@ -57,7 +57,7 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 				     DB_auth_len, DB_auth);
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to enroll db: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Created db Cert\n");
+ 
+@@ -69,7 +69,7 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 				     DBX_auth_len, DBX_auth);
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to enroll dbx: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Created dbx Cert\n");
+ 
+@@ -84,14 +84,14 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 	
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to enroll PK: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Created PK Cert\n");
+ 	/* enrolling the PK should put us in SetupMode; check this */
+ 	efi_status = RT->GetVariable(L"SetupMode", &GV_GUID, NULL, &DataSize, &SetupMode);
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to get SetupMode variable: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Platform is in %s Mode\n", SetupMode ? L"Setup" : L"User");
+ 
+@@ -101,7 +101,7 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 
+ 	if (efi_status != EFI_SUCCESS) {
+ 		Print(L"Failed to get SecureBoot variable: %d\n", efi_status);
+-		return efi_status;
++		goto out;
+ 	}
+ 	Print(L"Platform %s set to boot securely\n", SecureBoot ? L"is" : L"is not");
+ 
+@@ -121,4 +121,8 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 	        RT->ResetSystem(EfiResetWarm, EFI_SUCCESS, 0, NULL);
+ 
+ 	return EFI_SUCCESS;
++
++out:
++	BS->Stall(3000000);
++	return efi_status;
+ }
+-- 
+2.43.0
+
diff --git a/package/efitools/0012-Makefile-do-not-build-signed-efi-image.patch b/package/efitools/0012-Makefile-do-not-build-signed-efi-image.patch
new file mode 100644
index 00000000000..75d1199b3b5
--- /dev/null
+++ b/package/efitools/0012-Makefile-do-not-build-signed-efi-image.patch
@@ -0,0 +1,43 @@
+From e1ce0350d339b55778b2e9fecefe85e3090cccf2 Mon Sep 17 00:00:00 2001
+From: Yunguo Wei <yunguo.wei@windriver.com>
+Date: Tue, 17 Jan 2017 17:24:51 +0800
+Subject: [PATCH] Makefile: do not build signed efi image
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Makefile | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index da209f6..df8c1e8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,11 +1,10 @@
+-EFIFILES = HelloWorld.efi LockDown.efi Loader.efi ReadVars.efi UpdateVars.efi \
+-	KeyTool.efi HashTool.efi SetNull.efi ShimReplace.efi
++EFIFILES = LockDown.efi
+ BINARIES = cert-to-efi-sig-list sig-list-to-certs sign-efi-sig-list \
+ 	hash-to-efi-sig-list efi-readvar efi-updatevar cert-to-efi-hash-list \
+ 	flash-var
+ 
+ ifeq ($(ARCH),x86_64)
+-EFIFILES += PreLoader.efi
++#EFIFILES += PreLoader.efi
+ endif
+ 
+ MSGUID = 77FA9ABD-0359-4D32-BD60-28F4E78F784B
+@@ -27,7 +26,7 @@ include Make.rules
+ 
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(EFISIGNED) $(BINARIES) noPK.auth $(KEYAUTH) \
++all: $(EFIFILES) $(BINARIES) noPK.auth $(KEYAUTH) \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
+ 
+-- 
+2.43.0
+
diff --git a/package/efitools/0013-Build-DBX-by-default.patch b/package/efitools/0013-Build-DBX-by-default.patch
new file mode 100644
index 00000000000..daa5644d1e6
--- /dev/null
+++ b/package/efitools/0013-Build-DBX-by-default.patch
@@ -0,0 +1,47 @@
+From 19f5669200f31fe8523cde899747784f7316333d Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Sat, 28 Jan 2017 13:42:28 +0800
+Subject: [PATCH] Build DBX by default
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index df8c1e8..66f5d2e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -26,7 +26,7 @@ include Make.rules
+ 
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(EFIFILES) $(BINARIES) noPK.auth $(KEYAUTH) \
++all: $(EFIFILES) $(BINARIES) noPK.auth $(KEYAUTH) DBX.auth \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
+ 
+@@ -47,7 +47,7 @@ lib/asn1/libasn1.a lib/asn1/libasn1-efi.a: FORCE
+ 
+ .SUFFIXES: .crt
+ 
+-.KEEP: PK.crt KEK.crt DB.crt PK.key KEK.key DB.key PK.esl DB.esl KEK.esl \
++.KEEP: PK.crt KEK.crt DB.crt DBX.crt PK.key KEK.key DB.key PK.esl DB.esl KEK.esl DBX.esl \
+ 	$(EFIFILES)
+ 
+ LockDown.o: PK.h KEK.h DB.h DBX.h
+@@ -114,7 +114,7 @@ flash-var: flash-var.o lib/lib.a
+ 	$(CC) $(ARCH3264) -o $@ $< $(EXTRA_LDFLAGS) lib/lib.a
+ 
+ clean:
+-	rm -f PK.* KEK.* DB.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
++	rm -f PK.* KEK.* DB.* DBX.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
+ 	rm -f noPK.*
+ 	rm -f doc/*.1
+ 	$(MAKE) -C lib clean
+-- 
+2.43.0
+
diff --git a/package/efitools/0014-LockDown-disable-the-entrance-into-BIOS-setup-to-re-.patch b/package/efitools/0014-LockDown-disable-the-entrance-into-BIOS-setup-to-re-.patch
new file mode 100644
index 00000000000..bff1f0900c1
--- /dev/null
+++ b/package/efitools/0014-LockDown-disable-the-entrance-into-BIOS-setup-to-re-.patch
@@ -0,0 +1,50 @@
+From bd705b991dc1f58653685d891eb61ceb2aed5793 Mon Sep 17 00:00:00 2001
+From: Lans Zhang <jia.zhang@windriver.com>
+Date: Wed, 15 Feb 2017 14:52:07 +0800
+Subject: [PATCH] LockDown: disable the entrance into BIOS setup to re-enable
+ secure boot
+
+In most cases, this step is not necessary.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ LockDown.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/LockDown.c b/LockDown.c
+index 13c626f..fbde3f2 100644
+--- a/LockDown.c
++++ b/LockDown.c
+@@ -20,6 +20,11 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 	EFI_STATUS efi_status;
+ 	UINT8 SecureBoot, SetupMode;
+ 	UINTN DataSize = sizeof(SetupMode);
++	/* This controls whether it is required to enter into BIOS setup in
++	 * order to re-enable UEFI secure boot. This operation is unnecessary
++	 * in most cases.
++	 */
++	UINTN NeedSetAttempt = 0;
+ 
+ 	InitializeLib(image, systab);
+ 
+@@ -110,12 +115,12 @@ efi_main (EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
+ 	 * UEFI secure boot in BIOS setup.
+ 	 */
+ 	Print(L"Prepare to execute system warm reset after 3 seconds ...\n");
+-	if (!SecureBoot)
++	if (NeedSetAttempt && !SecureBoot)
+ 	        Print(L"After warm reset, enter to BIOS setup to enable UEFI Secure Boot.\n");
+ 
+ 	BS->Stall(3000000);
+ 
+-	if (!SecureBoot)
++	if (NeedSetAttempt && !SecureBoot)
+ 	        SETOSIndicationsAndReboot(EFI_OS_INDICATIONS_BOOT_TO_FW_UI);
+ 	else
+ 	        RT->ResetSystem(EfiResetWarm, EFI_SUCCESS, 0, NULL);
+-- 
+2.43.0
+
diff --git a/package/efitools/0015-fix-segfault-for-efitools-commands.patch b/package/efitools/0015-fix-segfault-for-efitools-commands.patch
new file mode 100644
index 00000000000..02e14cf1880
--- /dev/null
+++ b/package/efitools/0015-fix-segfault-for-efitools-commands.patch
@@ -0,0 +1,220 @@
+From 5aa1ecda0877a99c9153d086d56d545ef9e9b7c6 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 20 Jul 2023 12:36:14 +0800
+Subject: [PATCH] fix segfault for efitools commands
+
+Segfault occurs when missing argument in some options.
+
+e.g.
+$ sign-efi-sig-list -g
+Segmentation fault
+
+$ cert-to-efi-hash-list -s
+Segmentation fault
+
+$ efi-readvar -s
+Segmentation fault
+
+$ efi-updatevar -d
+Segmentation fault
+
+This is because argv[2] is not checked for NULL before using it. Add
+check to avoid the segfault.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ cert-to-efi-hash-list.c | 22 ++++++++++++++++------
+ cert-to-efi-sig-list.c  | 11 ++++++++---
+ efi-readvar.c           | 11 ++++++++---
+ efi-updatevar.c         | 26 ++++++++++++++++++--------
+ flash-var.c             | 15 ++++++++++-----
+ sign-efi-sig-list.c     | 11 ++++++++---
+ 6 files changed, 68 insertions(+), 28 deletions(-)
+
+diff --git a/cert-to-efi-hash-list.c b/cert-to-efi-hash-list.c
+index 8a5468a..ead82f1 100644
+--- a/cert-to-efi-hash-list.c
++++ b/cert-to-efi-hash-list.c
+@@ -76,13 +76,23 @@ main(int argc, char *argv[])
+ 			help(progname);
+ 			exit(0);
+ 		} else if (strcmp("-g", argv[1]) == 0) {
+-			str_to_guid(argv[2], &owner);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				str_to_guid(argv[2], &owner);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else if (strcmp("-s", argv[1]) == 0) {
+-			sha = atoi(argv[2]);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				sha = atoi(argv[2]);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else if (strcmp("-t", argv[1]) == 0) {
+ 			timestampstr = argv[2];
+ 			argv += 2;
+diff --git a/cert-to-efi-sig-list.c b/cert-to-efi-sig-list.c
+index fe65e15..d06cac9 100644
+--- a/cert-to-efi-sig-list.c
++++ b/cert-to-efi-sig-list.c
+@@ -61,9 +61,14 @@ main(int argc, char *argv[])
+ 			help(progname);
+ 			exit(0);
+ 		} else if (strcmp("-g", argv[1]) == 0) {
+-			str_to_guid(argv[2], &owner);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				str_to_guid(argv[2], &owner);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else {
+ 			break;
+ 		}
+diff --git a/efi-readvar.c b/efi-readvar.c
+index 816b306..2f6584a 100644
+--- a/efi-readvar.c
++++ b/efi-readvar.c
+@@ -132,9 +132,14 @@ main(int argc, char *argv[])
+ 			argv += 2;
+ 			argc -= 2;
+ 		} else if (strcmp(argv[1], "-s") == 0) {
+-			sscanf(argv[2], "%d-%d", &sig, &entry);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				sscanf(argv[2], "%d-%d", &sig, &entry);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else if (strcmp(argv[1], "-o") == 0) {
+ 			file = argv[2];
+ 			argv += 2;
+diff --git a/efi-updatevar.c b/efi-updatevar.c
+index 4247105..5f626be 100644
+--- a/efi-updatevar.c
++++ b/efi-updatevar.c
+@@ -85,7 +85,7 @@ main(int argc, char *argv[])
+ 			attributes |= EFI_VARIABLE_APPEND_WRITE;
+ 			argv += 1;
+ 			argc -= 1;
+-		} if (strcmp(argv[1], "-e") == 0) {
++		} else if (strcmp(argv[1], "-e") == 0) {
+ 			esl_mode = 1;
+ 			argv += 1;
+ 			argc -= 1;
+@@ -98,12 +98,17 @@ main(int argc, char *argv[])
+ 			argv += 2;
+ 			argc -= 2;
+ 		} else if (strcmp(argv[1], "-g") == 0) {
+-			if (str_to_guid(argv[2], &guid)) {
+-				fprintf(stderr, "Invalid GUID %s\n", argv[2]);
++			if (argv[2]) {
++				if (str_to_guid(argv[2], &guid)) {
++					fprintf(stderr, "Invalid GUID %s\n", argv[2]);
++					exit(1);
++				}
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
+ 				exit(1);
+ 			}
+-			argv += 2;
+-			argc -= 2;
+ 		} else if (strcmp(argv[1], "-c") == 0) {
+ 			crt_file = argv[2];
+ 			argv += 2;
+@@ -113,9 +118,14 @@ main(int argc, char *argv[])
+ 			argv += 2;
+ 			argc -= 2;
+ 		} else if (strcmp(argv[1], "-d") == 0) {
+-			sscanf(argv[2], "%d-%d", &delsig, &delentry);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				sscanf(argv[2], "%d-%d", &delsig, &delentry);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else if (strcmp(argv[1], "--engine") == 0) {
+ 			engine = argv[2];
+ 			argv += 2;
+diff --git a/flash-var.c b/flash-var.c
+index aa10ae6..7c31cf1 100644
+--- a/flash-var.c
++++ b/flash-var.c
+@@ -59,13 +59,18 @@ main(int argc, char *argv[])
+ 			help(progname);
+ 			exit(0);
+ 		} else if (strcmp(argv[1], "-g") == 0) {
+-			if (str_to_guid(argv[2], &guid)) {
+-				fprintf(stderr, "Invalid GUID %s\n", argv[2]);
++			if (argv[2]) {
++				if (str_to_guid(argv[2], &guid)) {
++					fprintf(stderr, "Invalid GUID %s\n", argv[2]);
++					exit(1);
++				}
++				owner = &guid;
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
+ 				exit(1);
+ 			}
+-			owner = &guid;
+-			argv += 2;
+-			argc -= 2;
+ 		} else if (strcmp("-t", argv[1]) == 0) {
+ 			timestampstr = argv[2];
+ 			argv += 2;
+diff --git a/sign-efi-sig-list.c b/sign-efi-sig-list.c
+index 94bd7d4..147fcfb 100644
+--- a/sign-efi-sig-list.c
++++ b/sign-efi-sig-list.c
+@@ -88,9 +88,14 @@ main(int argc, char *argv[])
+ 			help(progname);
+ 			exit(0);
+ 		} else if (strcmp("-g", argv[1]) == 0) {
+-			str_to_guid(argv[2], &vendor_guid);
+-			argv += 2;
+-			argc -= 2;
++			if (argv[2]) {
++				str_to_guid(argv[2], &vendor_guid);
++				argv += 2;
++				argc -= 2;
++			} else {
++				usage(progname);
++				exit(1);
++			}
+ 		} else if (strcmp("-r", argv[1]) == 0) {
+ 			rsasig = 1;
+ 			argv += 1;
+-- 
+2.43.0
+
diff --git a/package/efitools/0016-Make.rules-Pass-CFLAGS-to-Makefile.patch b/package/efitools/0016-Make.rules-Pass-CFLAGS-to-Makefile.patch
new file mode 100644
index 00000000000..bf53b670bfa
--- /dev/null
+++ b/package/efitools/0016-Make.rules-Pass-CFLAGS-to-Makefile.patch
@@ -0,0 +1,32 @@
+From 0a35118497477f30d4b5ae0c60882072c5fc9a97 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 17 Aug 2023 15:11:25 +0800
+Subject: [PATCH] Make.rules: Pass CFLAGS to Makefile
+
+Make sure the right debug directory remapping options are passed to
+the compiler.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 0316ce5..90f444a 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -15,7 +15,7 @@ $(error unknown architecture $(ARCH))
+ endif
+ INCDIR	   = -I$(TOPDIR)include/ -I$(INCDIR_PREFIX)/usr/include -I$(INCDIR_PREFIX)/usr/include/efi -I$(INCDIR_PREFIX)/usr/include/efi/$(ARCH) -I$(INCDIR_PREFIX)/usr/include/efi/protocol
+ cppflags   = -DCONFIG_$(ARCH) -D_GNU_SOURCE
+-cflags	   = -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
++cflags	   = $(CFLAGS) -O2 -g $(ARCH3264) -fpic -Wall -fshort-wchar -fno-strict-aliasing -fno-merge-constants -fno-stack-protector -ffreestanding -fno-stack-check
+ ldflags	   = -nostdlib
+ CRTOBJ		= crt0-efi-$(ARCH).o
+ CRTPATHS	= /lib /lib64 /lib/efi /lib64/efi /usr/lib /usr/lib64 /usr/lib/efi /usr/lib64/efi /usr/lib/gnuefi /usr/lib64/gnuefi
+-- 
+2.43.0
+
diff --git a/package/efitools/0017-Make.rules-fix-efi-files-for-gnu-efi-3.0.18.patch b/package/efitools/0017-Make.rules-fix-efi-files-for-gnu-efi-3.0.18.patch
new file mode 100644
index 00000000000..264a132c620
--- /dev/null
+++ b/package/efitools/0017-Make.rules-fix-efi-files-for-gnu-efi-3.0.18.patch
@@ -0,0 +1,38 @@
+From 5832f5d81438cdaf92f79f01921bfa35873e21a2 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 6 Jun 2024 22:16:52 +0800
+Subject: [PATCH] Make.rules: fix efi files for gnu-efi 3.0.18
+
+With commit [1] and [2] in gnu-efi 3.0.18, For efi files, the .dynsym
+section was dropped and the .rodata section was splitted out from lds
+files. These changes make LockDown.efi no longer work. Referring to
+gnu-efi 3.0.18, copy .rodata section and remove .dynsym section to efi
+files.
+
+[1] https://sourceforge.net/p/gnu-efi/code/ci/1be024100e80885cfbc840e322673cb850b57316
+[2] https://sourceforge.net/p/gnu-efi/code/ci/b3e80c38bcab002bef2b9e66b7037fbb1980e173
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Make.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 90f444a..2c08e48 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -65,7 +65,7 @@ ifeq ($(ARCH),aarch64)
+ endif
+ 
+ %.efi: %.so
+-	$(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic -j .dynsym \
++	$(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic -j .rodata \
+ 		   -j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
+ 		   -j .reloc $(FORMAT) $*.so $@
+ %.so: %.o
+-- 
+2.43.0
+
diff --git a/package/efitools/0018-add-binary-only-make-rules.patch b/package/efitools/0018-add-binary-only-make-rules.patch
new file mode 100644
index 00000000000..6d85b74c4ca
--- /dev/null
+++ b/package/efitools/0018-add-binary-only-make-rules.patch
@@ -0,0 +1,44 @@
+From bba66acd2a617af2b22c09058367905e689106af Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 27 Nov 2024 17:15:33 +0000
+Subject: [PATCH] add binary-only make rules
+
+Add rules to build and install just the binaries, for the native recipe.
+
+Source: https://github.com/Wind-River/meta-secure-core/tree/c4f7798/meta-efi-secure-boot/recipes-bsp/efitools/efitools
+Upstream: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Makefile | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 66f5d2e..e42de67 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,15 +29,18 @@ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ all: $(EFIFILES) $(BINARIES) noPK.auth $(KEYAUTH) DBX.auth \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
++binaries: $(BINARIES)
+ 
+-install: all
++install: all install-binaries
+ 	$(INSTALL) -m 755 -d $(EFIDIR)
+ 	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
++	$(INSTALL) -m 755 -d $(DOCDIR)
++	$(INSTALL) -m 644 README COPYING $(DOCDIR)
++
++install-binaries: binaries
+ 	$(INSTALL) -m 755 -d $(BINDIR)
+ 	$(INSTALL) -m 755 $(BINARIES) $(BINDIR)
+ 	$(INSTALL) -m 755 mkusb.sh $(BINDIR)/efitool-mkusb
+-	$(INSTALL) -m 755 -d $(DOCDIR)
+-	$(INSTALL) -m 644 README COPYING $(DOCDIR)
+ 
+ lib/lib.a lib/lib-efi.a: FORCE
+ 	$(MAKE) -C lib $(notdir $@)
+-- 
+2.43.0
+
diff --git a/package/efitools/0019-Make.rules-allow-to-specify-the-target-arch.patch b/package/efitools/0019-Make.rules-allow-to-specify-the-target-arch.patch
new file mode 100644
index 00000000000..f33028d9d5b
--- /dev/null
+++ b/package/efitools/0019-Make.rules-allow-to-specify-the-target-arch.patch
@@ -0,0 +1,27 @@
+From 09f491cec9aaf9156926f89abbf0aa2feaf99502 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Thu, 4 Dec 2025 23:08:35 +0100
+Subject: [PATCH] Make.rules: allow to specify the target arch
+
+Upstream: Inappropriate [embedded specific]
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Make.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 2c08e48..ba42d75 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -1,7 +1,7 @@
+ EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ MANPAGES = $(patsubst doc/%.1.in,doc/%.1,$(wildcard doc/*.1.in))
+ HELP2MAN = help2man
+-ARCH	 = $(shell uname -m | sed 's/i.86/ia32/;s/arm.*/arm/')
++ARCH	?= $(shell uname -m | sed 's/i.86/ia32/;s/arm.*/arm/')
+ ifeq ($(ARCH),ia32)
+ ARCH3264 = -m32
+ else ifeq ($(ARCH),x86_64)
+-- 
+2.43.0
+
diff --git a/package/efitools/Config.in b/package/efitools/Config.in
new file mode 100644
index 00000000000..baaae0cb90c
--- /dev/null
+++ b/package/efitools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EFITOOLS
+	bool "efitools"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS \
+		&& !BR2_RISCV_64
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  The efitools package provides utilities for managing UEFI
+	  Secure Boot keys and includes sample EFI applications.
+	  Binaries such as efi-readvar, efi-updatevar and
+	  cert-to-efi-sig-list are built for the target system.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
diff --git a/package/efitools/Config.in.host b/package/efitools/Config.in.host
new file mode 100644
index 00000000000..c5e60cd5bbf
--- /dev/null
+++ b/package/efitools/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_EFITOOLS
+	bool "host efitools"
+	select BR2_PACKAGE_HOST_GNU_EFI
+	select BR2_PACKAGE_HOST_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_HOST_OPENSSL
+	select BR2_PACKAGE_HOST_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  The efitools package provides utilities for managing UEFI
+	  Secure Boot keys and includes sample EFI applications.
+	  Binaries such as efi-readvar, efi-updatevar and
+	  cert-to-efi-sig-list are built for the target system.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
diff --git a/package/efitools/efitools.hash b/package/efitools/efitools.hash
new file mode 100644
index 00000000000..aa251ef1e56
--- /dev/null
+++ b/package/efitools/efitools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0f315b36e7d1ba74bfc97ab9f304f0a3072c47578bbe5e42594acae381f9acfe  efitools-1.9.2.tar.gz
+sha256  824d6063f4319acb32fe5de52738c72e54ce8ff3dea3470462ff135b958480b5  COPYING
diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
new file mode 100644
index 00000000000..6260e361387
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 1.9.2
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
+EFITOOLS_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+
+EFITOOLS_LICENSE_FILES = COPYING
+
+EFITOOLS_DEPENDENCIES = gnu-efi openssl
+EFITOOLS_CONFIGURE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	INCDIR_PREFIX="$(STAGING_DIR)" \
+	ARCH="$(GNU_EFI_PLATFORM)"
+
+define EFITOOLS_BUILD_CMDS
+	$(EFITOOLS_CONFIGURE_OPTS) $(MAKE) -C $(@D) binaries
+endef
+
+define EFITOOLS_INSTALL_TARGET_CMDS
+	$(EFITOOLS_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-binaries
+endef
+
+HOST_EFITOOLS_DEPENDENCIES = host-gnu-efi host-openssl
+HOST_EFITOOLS_CONFIGURE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	INCDIR_PREFIX="$(HOST_DIR)" \
+	CRTPATH_PREFIX="$(HOST_DIR)" \
+	EXTRA_LDFLAGS="$(HOST_LDFLAGS)"
+
+define HOST_EFITOOLS_BUILD_CMDS
+	$(HOST_EFITOOLS_CONFIGURE_OPTS) $(MAKE) -C $(@D) binaries
+endef
+
+define HOST_EFITOOLS_INSTALL_CMDS
+	$(HOST_EFITOOLS_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install-binaries
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.43.0


--===============4318984271982750751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4318984271982750751==--
