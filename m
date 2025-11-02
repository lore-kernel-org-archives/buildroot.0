Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBBECCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 08:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48392848DA;
	Sun,  2 Nov 2025 08:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SDFzQr4JTWd; Sun,  2 Nov 2025 08:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B53848FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B53848FF;
	Sun,  2 Nov 2025 08:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E06E2A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0021740F73
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGgpdxlXkpSq for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 08:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 875944036E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875944036E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 875944036E
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:29:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02806A4C5FA3;
 Sun,  2 Nov 2025 09:29:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55450)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFTTB-000000007aR-3fhf;
 Sun, 02 Nov 2025 08:29:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun,  2 Nov 2025 09:29:49 +0100
Message-ID: <20251102082949.4515-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762072190;
 bh=MJcIMCrzXY2MNT09+i7wzhObY7hfEL+iTHFjiImO6Ko=;
 h=From:To:Cc:Subject:Date:From;
 b=sKV6Xps1cRevZnVuPT+SRjevFmDlDDHYrpHmrZ8bcfNSA5K1ujUGPTljGDvIX5Qau
 RlRB0OZ3z134shw410VXLoy3nc4WVxqqfiyTxoOhsTXhwvmpHJ3TMpQ7HIcgTK9KvJ
 rePTsm+GhognAGqIrTUFtDcg/YmgMHA1uzDTVvVnXsDfYPtGAwNveUc76V41uC3N6q
 4ob17NnUTdvA1TFZfB0z9rZWM+u7KWwYkfPYnytfdY7z7J3ukSTd+v26cjvNlinRKU
 StW9qP9P9PNSxVpHCDvL3VqeTAS/xfpSckDdM4RdYh6zIEjPa1YdvqpEgwkG4aSXH2
 uMUyd44ASAMOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=sKV6Xps1
Subject: [Buildroot] [PATCH v2 1/1] package/exim: bump version to 4.99
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

Release notes:
https://lists.exim.org/lurker/message/20251028.114149.3bf19800.en.html

Rebased patch 0001 due to upstream commit
https://github.com/Exim/exim/commit/cd43f5ee0f7f76f0d624899f892b10eb5f40a37c

Rebased patch 0004 due to upstream commit
https://github.com/Exim/exim/commit/834dae55650eb31b893242b9d50b477f5a339bf5

Added patch 0005 to fix cross-builds.

Added ldflags for mips arch to solve build error with br-mips64-n64-full
defconfig, code copied from package/linux-tools/linux-tool-perf.mk.in:

output/per-package/exim/host/bin/mips64el-linux-ld: dkim_tmp.o: ABI is incompatible with that of the selected emulation
output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge target specific data of file dkim_tmp.o
output/per-package/exim/host/bin/mips64el-linux-ld: dkim_transport.o: ABI is incompatible with that of the selected emulation
output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge target specific data of file dkim_transport.o
output/per-package/exim/host/bin/mips64el-linux-ld: pdkim.o: ABI is incompatible with that of the selected emulation
output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge target specific data of file pdkim.o
output/per-package/exim/host/bin/mips64el-linux-ld: signing.o: ABI is incompatible with that of the selected emulation
output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge target specific data of file signing.o
output/per-package/exim/host/bin/mips64el-linux-ld: attempt to do relocatable link with elf64-tradlittlemips input and elf32-ntradlittlemips output
output/per-package/exim/host/bin/mips64el-linux-ld: dkim_tmp.o: file class ELFCLASS64 incompatible with ELFCLASS32
output/per-package/exim/host/bin/mips64el-linux-ld: final link failed: file in wrong format

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed various build errors (Julien)

 .../0001-Build-buildconfig-for-the-host.patch |  6 +-
 .../exim/0004-sieve-fix-build-errors.patch    |  8 +-
 ...-cross-compile-by-adding-LD-variable.patch | 94 +++++++++++++++++++
 package/exim/exim.hash                        |  4 +-
 package/exim/exim.mk                          | 25 ++++-
 5 files changed, 127 insertions(+), 10 deletions(-)
 create mode 100644 package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index e9da80765a..6f4351a50f 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -2,7 +2,7 @@ buildconfig is meant to be executed on the host, so it has to be compiled
 using $(HOSTCC), not $(CC).
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-[Bernd: rebased for version 4.97.1]
+[Bernd: rebased for version 4.99]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  OS/Makefile-Base |    4 ++--
@@ -12,7 +12,7 @@ diff --git a/OS/Makefile-Base b/OS/Makefile-Base
 index 29a6ad3..420ba60 100644
 --- a/OS/Makefile-Base
 +++ b/OS/Makefile-Base
-@@ -258,8 +258,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
+@@ -257,8 +257,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
  
  # Targets for special-purpose configuration header builders
  buildconfig: buildconfig.c
@@ -22,4 +22,4 @@ index 29a6ad3..420ba60 100644
 +	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c
  
  
- # Target for the exicyclog utility script
+ util_deps: config ../src/utils/msgid.frag
diff --git a/package/exim/0004-sieve-fix-build-errors.patch b/package/exim/0004-sieve-fix-build-errors.patch
index c1a2c45b8d..e311b6105e 100644
--- a/package/exim/0004-sieve-fix-build-errors.patch
+++ b/package/exim/0004-sieve-fix-build-errors.patch
@@ -21,16 +21,16 @@ buildsystem.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream: https://bugs.exim.org/show_bug.cgi?id=2523
-[Bernd: rebased for version 4.97.1]
+[Bernd: rebased for version 4.99]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/sieve.c | 2 ++
+ src/miscmods/sieve_filter.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/sieve.c b/src/sieve.c
 index 5e8d1e6f4776..9632f2d43810 100644
---- a/src/sieve.c
-+++ b/src/sieve.c
+--- a/src/miscmods/sieve_filter.c
++++ b/src/miscmods/sieve_filter.c
 @@ -14,6 +14,8 @@
 
  /* Sieve mail filter. */
diff --git a/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
new file mode 100644
index 0000000000..70e4f927e8
--- /dev/null
+++ b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
@@ -0,0 +1,94 @@
+From a47de397eb1f28356086f315a443c288599d8657 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 1 Nov 2025 17:00:52 +0100
+Subject: [PATCH] Fix cross-compile by adding LD variable
+
+Fixes cross-build error due to commit
+a449ff8ca50e6df5faee2f1e83e1198c27738dfc.
+
+Hard-coding "ld" when cross-compiling is a bad idea.
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/OS/Makefile-Base      | 10 +++++-----
+ src/OS/Makefile-Default   |  1 +
+ src/src/miscmods/Makefile |  2 +-
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/OS/Makefile-Base b/OS/Makefile-Base
+index 5a15b0a6b..0250647f0 100644
+--- a/OS/Makefile-Base
++++ b/OS/Makefile-Base
+@@ -1065,7 +1065,7 @@ dynmodules: buildlookups buildrouters buildtransports buildauths \
+ buildlookups: config
+ 	 @cd lookups && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
+ 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" HDRS="../version.h $(PHDRS)" \
+-	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
++	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
+ 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE) $(LOOKUP_INCLUDE)"
+ 	 @echo " "
+ 
+@@ -1074,7 +1074,7 @@ buildlookups: config
+ buildrouters: config
+ 	 @cd routers && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
+ 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
+-	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
++	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
+ 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
+ 	 @echo " "
+ 
+@@ -1083,7 +1083,7 @@ buildrouters: config
+ buildtransports: config
+ 	 @cd transports && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
+ 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
+-	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
++	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
+ 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
+ 	 @echo " "
+ 
+@@ -1092,7 +1092,7 @@ buildtransports: config
+ buildauths: config
+ 	 @cd auths && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
+ 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
+-	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
++	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
+ 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
+ 	 @echo " "
+ 
+@@ -1101,7 +1101,7 @@ buildmisc: config
+ 	   CC="$(CC)" CFLAGS="$(CFLAGS)" \
+ 	     CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
+ 	     LDFLAGS_PARTIAL="$(LDFLAGS_PARTIAL)" HDRS="../version.h $(PHDRS)" \
+-	     FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
++	     FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
+ 	     PERL_CC="$(PERL_CC)" PERL_CCOPTS="$(PERL_CCOPTS)" \
+ 	     PERL_CFLAGS="$(PERL_CFLAGS)" PERL_LFLAGS="$(PERL_LFLAGS)" \
+ 	     INCLUDE="$(INCLUDE) $(IPV6_INCLUDE)" TLS_INCLUDE="$(TLS_INCLUDE)"
+diff --git a/OS/Makefile-Default b/OS/Makefile-Default
+index 858361bf3..c469c7f01 100644
+--- a/OS/Makefile-Default
++++ b/OS/Makefile-Default
+@@ -227,6 +227,7 @@ HOSTNAME_COMMAND=/bin/hostname
+ 
+ RANLIB=ranlib
+ 
++LD=ld
+ 
+ # EXIM_CHMOD is available to specify a command that is automatically applied
+ # to the Exim binary immediately it is compiled. (I find this useful when
+diff --git a/src/miscmods/Makefile b/src/miscmods/Makefile
+index 1e46d4456..cfae5aac2 100644
+--- a/src/miscmods/Makefile
++++ b/src/miscmods/Makefile
+@@ -62,7 +62,7 @@ dkim.o:
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) pdkim.c
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) $(TLS_INCLUDE) signing.c
+ 	$(FE)mv dkim.o dkim_tmp.o
+-	$(FE)ld -r -o dkim.o $(LDFLAGS_PARTIAL) \
++	$(FE)$(LD) -r -o dkim.o $(LDFLAGS_PARTIAL) \
+ 		dkim_tmp.o dkim_transport.o pdkim.o signing.o
+ 
+ # Similarly, we want a single .so for the dynamic-load module
+-- 
+2.47.3
+
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 0dd5ac47ae..dd20fb805a 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  88b8e8a67c1db6cc0b1d148161aa36e662f4ca2fef25d5b6f3694d490e42dcae  exim-4.98.2.tar.xz
+sha256  5df38b042ffa9a9c8d31b20bc8481558070e361b06f657608622a62a327adcba  exim-4.99.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  aaa4cfc8aee90818c6d1c2fd0cf64b82668d1a343f462f678b38b2b79e10a467240f2e81786eec7705eec3598d23686a74437c50b68502f29ff67788393c812a  exim-4.98.2.tar.xz
+sha512  06521aff437dfe99c015606d2cdde76eaf6e4d2f03779b07fbc0e7d06fe0584366cae9c3fa7d73a86c348f0d25336acd06c42bd5b8f18e5a969de9849088e3aa  exim-4.99.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 3afe553caa..d9adfb59d5 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.98.2
+EXIM_VERSION = 4.99
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
@@ -99,6 +99,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
 	$(call exim-config-add,AR,$(TARGET_AR) cq)
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
+	$(call exim-config-add,LD,$(TARGET_LD))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
@@ -125,6 +126,27 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+# We need to pass an argument to ld for setting the emulation when
+# building for MIPS architecture, otherwise the default one will always
+# be used and the compilation for most variants will fail.
+ifeq ($(BR2_mips),y)
+EXIM_LDFLAGS = -m elf32btsmip
+else ifeq ($(BR2_mipsel),y)
+EXIM_LDFLAGS = -m elf32ltsmip
+else ifeq ($(BR2_mips64),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+EXIM_LDFLAGS = -m elf32btsmipn32
+else
+EXIM_LDFLAGS = -m elf64btsmip
+endif
+else ifeq ($(BR2_mips64el),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+EXIM_LDFLAGS = -m elf32ltsmipn32
+else
+EXIM_LDFLAGS = -m elf64ltsmip
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 EXIM_DEPENDENCIES += libexecinfo
 EXIM_EXTRALIBS += -lexecinfo
@@ -142,6 +164,7 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
+		LDFLAGS_PARTIAL="$(EXIM_LDFLAGS)" \
 		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_CFLAGS)" exim
 endef
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
