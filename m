Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF7E748FC
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08FBD60B13;
	Tue, 23 Dec 2025 22:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5A3Ny7i7megO; Tue, 23 Dec 2025 22:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42DF60E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528136;
	bh=pqzall6xfx+jpvNviW1mFBJ3a4pxGMBktmXtVLyDsxQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=icBf8EXj0cej/Mn8/uuDzbi2QGG8PLgdE/2OEs2UuZXzbaFvCegASXL6x6DHoDm8O
	 daUQtY9qNB94yMhxGFNYmUqe1p2HJosf9rfo5MmWPA6a/TPMHgrPWPTawxeUYVXqXz
	 NC/Yqs95SB3/PuI39c3/APVVHREh2N9HrCsZY62T+u/nLy46RkdDPWcIDVbkfOXyQv
	 NhNMEm4/skexDCvelr0RHCQPFcjJCcDU0WZtjWdf38O7hIPCEcKNOMHn05KUKkyrG9
	 VIvVWpak7aFuH753qfrcALBrqRQObGMbgl2QIvs4UtrVq0cQvqhgm9lb0zD1wLYG4g
	 jn3Q3u8NeCCdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42DF60E97;
	Tue, 23 Dec 2025 22:15:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FCA119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71D6E40A22
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C-9KFV13lFT for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.43;
 helo=mail-ej1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA5FF40A21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5FF40A21
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA5FF40A21
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:15:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b735487129fso979777766b.0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 14:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528132; x=1767132932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBs3g4p8XpRB3jmHHDwLVTF/WbLzULqBm2j/Tvi3yas=;
 b=BlwX2r5RJ+4xVHWYS1Io8S4CRlsUtPamzanpShu6lenvA1WJChEv+WsQBoKHDmXZ/y
 xNklgu6WzEntDc/NpvGckQWVqVL/Cxe0h9p1nbAyFNQX9VTQGgFTpX5AALxbElkpOSt5
 SsJj618jvMN1MB6pjN4jn1KcqDLS3Slr3/uRyYX/KZYk24Rw6Pt5Lyll0dhAr389YMdH
 mb/QMS8lmPHL2hftxlvAsIBIxYo5GYCKcvtK6nQVdmuszBmmw9tMWtuxgJ9w7EqvO7EA
 S3l3wnsvCR55chNojfkfQHLw5ZSOOqHR9yrahDyHTFLhMQBlvODmU9Hu3a8WZr1T5UQp
 ANrA==
X-Gm-Message-State: AOJu0Yy3osb0UYSoOXjbo2AstqLc8OAIGfRlzBgATs3DtTKGlMMVADGv
 P4t+A+h85k90v9j7pvuUcoSvS2dVeMHVXPNY38oam7/f91kTzp7TP1Lh2nM6kpBxKb8=
X-Gm-Gg: AY/fxX7hJWG56iXI2iOfCFKIxoRGpdFzjLWtu0FsQS07T9I3D9G1lCPCRnWeycw6DOL
 dzi82IfKDYGM5vk9F/y6fF4bajZqm+atvEpQRN49I6uk1fQp4dyled6qoqTvII1/lReDwDHVNKw
 nb31AtYxijuXgeGIJHBBxwx245O1/5fv0eFM7B8PYCIyAASS1EUtwA3Ag2p+khJNbzNSv2EAcYW
 iRbMOg6EFRsrx9Du+4nnUCiS7QaEqHSLJ7Z+wzC1cC21nqeEve7ctZm2iubhGMZcTgA4WGTPKec
 Drfy0ZH92VgTU+eNAiCYms7rJV1LPHQrj/rlE0bPpj5xR43OZSejA+WT6r4xVp9/GGKBSbgqPB4
 yv4lUtNhr89hE5f8jRqci/CWsaKdfXSvUNarB0JMHSZuODbwZ6w15Kwl7K4t37lWj2tod4Hr9Em
 DimlXvggg7HelCLxZRx88vZhowVwoqyQa0KYqN8NrplSbI2qlyXxOL
X-Google-Smtp-Source: AGHT+IG+tURcq0dKcltD83NECJC2tgmF3jFrSfhMiimFGiDURjAb0Z11tS0m3ySkKWYXtLxQ4jUIhQ==
X-Received: by 2002:a17:907:97c7:b0:b76:8164:88b5 with SMTP id
 a640c23a62f3a-b803719d432mr1811420566b.46.1766528131593; 
 Tue, 23 Dec 2025 14:15:31 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb5f:fa00:faf0:ebea:87cc:7ff9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm1556300366b.64.2025.12.23.14.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:15:31 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Hendrik De Vloed <hendrik.devloed@dekimo.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 23 Dec 2025 23:15:27 +0100
Message-ID: <20251223221527.62560-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/sbsigntools: new package
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

From: Hendrik De Vloed <hendrik.devloed@dekimo.com>

A Linux user-space application to sign and verify application
for UEFI Secure Boot.

Inspired by https://lists.buildroot.org/pipermail/buildroot/2018-July/213212.html.

Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...-configure-fix-AM_INIT_AUTOMAKE-call.patch | 36 ++++++++++
 ...error-handling-in-__fileio_read_file.patch | 70 +++++++++++++++++++
 ...uilding-of-docs-and-tests-by-default.patch | 34 +++++++++
 package/sbsigntools/Config.in                 | 19 +++++
 package/sbsigntools/Config.in.host            | 15 ++++
 package/sbsigntools/sbsigntools.hash          |  9 +++
 package/sbsigntools/sbsigntools.mk            | 53 ++++++++++++++
 9 files changed, 238 insertions(+)
 create mode 100644 package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
 create mode 100644 package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
 create mode 100644 package/sbsigntools/0003-disable-building-of-docs-and-tests-by-default.patch
 create mode 100644 package/sbsigntools/Config.in
 create mode 100644 package/sbsigntools/Config.in.host
 create mode 100644 package/sbsigntools/sbsigntools.hash
 create mode 100644 package/sbsigntools/sbsigntools.mk

diff --git a/package/Config.in b/package/Config.in
index c1f812973a2..44e4eff5e47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ menu "Filesystem and flash utilities"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
+	source "package/sbsigntools/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index f6e6f6c965f..90d3db2b5a8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -108,6 +108,7 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sbsigntools/Config.in.host"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
diff --git a/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch b/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
new file mode 100644
index 00000000000..caee43fc7d0
--- /dev/null
+++ b/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
@@ -0,0 +1,36 @@
+From 12ac736442a92d010b6b4bb3216ef93b060b5279 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Tue, 3 Jul 2018 15:45:04 -0300
+Subject: [PATCH] configure: fix AM_INIT_AUTOMAKE call
+
+Requires subdir-objects to prevent warning messages:
+
+    lib/ccan/Makefile.am:2: warning: source file 'ccan/time/time.c' is in a subdirectory,
+    lib/ccan/Makefile.am:2: but option 'subdir-objects' is disabled
+    automake: warning: possible forward-incompatibility.
+    automake: At least a source file is in a subdirectory, but the 'subdir-objects'
+
+Added foreign to avoid complaints about missing AUTHORS and ChangeLog.
+
+Upstream: N/A
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8a5340a..7f38fb8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ AC_INIT([sbsigntool], [0.9.5], [James.Bottomley@HansenPartnership.com])
+ 
+-AM_INIT_AUTOMAKE()
++AM_INIT_AUTOMAKE([foreign subdir-objects])
+ 
+ AC_PREREQ(2.60)
+ 
+-- 
+2.43.0
+
diff --git a/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch b/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
new file mode 100644
index 00000000000..fa3c8d38fb4
--- /dev/null
+++ b/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
@@ -0,0 +1,70 @@
+From ba5a6a6cd4e459acf36f807c854b498b2920b2d1 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Wed, 4 Jul 2018 11:07:31 -0300
+Subject: [PATCH] fileio: improve error handling in __fileio_read_file
+
+Prevent compiler warnings:
+    fileio.c:178:12: warning: 'buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
+    fileio.c:179:12: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
+
+Call talloc_free before returning on read errors to prevent memory leak.
+
+Upstream: N/A
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ src/fileio.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/fileio.c b/src/fileio.c
+index 032eb1e..5a109a7 100644
+--- a/src/fileio.c
++++ b/src/fileio.c
+@@ -154,30 +154,30 @@ static int __fileio_read_file(void *ctx, const char *filename,
+ 
+ 	rc = fstat(fd, &statbuf);
+ 	if (rc)
+-		goto out;
++		goto close_fd;
+ 
+ 	len = statbuf.st_size;
+ 
+ 	buf = talloc_array(ctx, uint8_t, len);
+ 	if (!buf)
+-		goto out;
++		goto close_fd;
+ 
+ 	if (!read_all(fd, buf, len))
+-		goto out;
++		goto read_error;
+ 
++	*out_buf = buf;
++	*out_len = len;
+ 	rc = 0;
+-
++	goto close_fd;
++
++read_error:
++	if (!(flags & FLAG_NOERROR))
++		fprintf(stderr, "Error reading file %s: %s\n", filename,
++				strerror(errno));
++	talloc_free(ctx);
++close_fd:
++	close(fd);
+ out:
+-	if (fd >= 0)
+-		close(fd);
+-	if (rc) {
+-		if (!(flags & FLAG_NOERROR))
+-			fprintf(stderr, "Error reading file %s: %s\n",
+-					filename, strerror(errno));
+-	} else {
+-		*out_buf = buf;
+-		*out_len = len;
+-	}
+ 	return rc;
+ 
+ }
+-- 
+2.43.0
+
diff --git a/package/sbsigntools/0003-disable-building-of-docs-and-tests-by-default.patch b/package/sbsigntools/0003-disable-building-of-docs-and-tests-by-default.patch
new file mode 100644
index 00000000000..44d67173880
--- /dev/null
+++ b/package/sbsigntools/0003-disable-building-of-docs-and-tests-by-default.patch
@@ -0,0 +1,34 @@
+From d07966827cfa7d4efd6aecf8d8e6d62e96d68bc6 Mon Sep 17 00:00:00 2001
+From: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+Date: Wed, 3 Dec 2025 16:10:40 +0100
+Subject: [PATCH] disable building of docs and tests by default
+
+Upstream: N/A
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d347e9b..336797b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,2 +1,2 @@
+ 
+-SUBDIRS = lib/ccan src docs tests
++SUBDIRS = lib/ccan src
+diff --git a/configure.ac b/configure.ac
+index 7f38fb8..d2860cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -93,5 +93,5 @@ AC_SUBST(EFI_ARCH, $EFI_ARCH)
+ AC_SUBST(CRTPATH, $CRTPATH)
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile lib/ccan/Makefile]
+-		[docs/Makefile tests/Makefile])
++		[ ])
+ AC_OUTPUT
+-- 
+2.43.0
+
diff --git a/package/sbsigntools/Config.in b/package/sbsigntools/Config.in
new file mode 100644
index 00000000000..70d48034d7f
--- /dev/null
+++ b/package/sbsigntools/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SBSIGNTOOLS
+	bool "sbsigntools"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # binutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  A Linux user-space application to sign and verify application
+	  for UEFI Secure Boot.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/about/
+
+comment "sbsigntools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/sbsigntools/Config.in.host b/package/sbsigntools/Config.in.host
new file mode 100644
index 00000000000..847073482e2
--- /dev/null
+++ b/package/sbsigntools/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_SBSIGNTOOLS
+	bool "host sbsigntools"
+	select BR2_PACKAGE_HOST_BINUTILS
+	select BR2_PACKAGE_HOST_GNU_EFI
+	select BR2_PACKAGE_HOST_GNU_EFI
+	select BR2_PACKAGE_HOST_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_HOST_OPENSSL
+	select BR2_PACKAGE_HOST_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	select BR2_PACKAGE_HOST_UTIL_LINUX_LIBUUID
+	help
+	  A Linux user-space application to sign and verify application
+	  for UEFI Secure Boot.
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/about/
diff --git a/package/sbsigntools/sbsigntools.hash b/package/sbsigntools/sbsigntools.hash
new file mode 100644
index 00000000000..2c2c38714e2
--- /dev/null
+++ b/package/sbsigntools/sbsigntools.hash
@@ -0,0 +1,9 @@
+# Locally computed
+sha256  d25c26b834be5d66fe3881a3eb8890e0a18fffa3fa1cea4a62cee53d860e3f9e  sbsigntools-v0.9.5-git4.tar.gz
+sha256  7f424707cdb69df658b7b66ea1f9c9ab3ea0a0988999ecba3dad10a811db654f  COPYING
+sha256  02a66d6af5a4ef501849a33e6d8a0624e2b4284c8bed19ba0b0c24e8ac1add4e  lib/ccan.git/licenses/BSD-3CLAUSE
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  lib/ccan.git/licenses/BSD-MIT
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  lib/ccan.git/licenses/GPL-2
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  lib/ccan.git/licenses/GPL-3
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  lib/ccan.git/licenses/LGPL-2.1
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  lib/ccan.git/licenses/LGPL-3
diff --git a/package/sbsigntools/sbsigntools.mk b/package/sbsigntools/sbsigntools.mk
new file mode 100644
index 00000000000..1851225d305
--- /dev/null
+++ b/package/sbsigntools/sbsigntools.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# sbsigntools
+#
+################################################################################
+
+SBSIGNTOOLS_VERSION = v0.9.5
+SBSIGNTOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git
+SBSIGNTOOLS_LICENSE = GPL-3.0+
+SBSIGNTOOLS_LICENSE_FILES = COPYING \
+	lib/ccan.git/licenses/BSD-3CLAUSE \
+	lib/ccan.git/licenses/BSD-MIT \
+	lib/ccan.git/licenses/GPL-2 \
+	lib/ccan.git/licenses/GPL-3 \
+	lib/ccan.git/licenses/LGPL-2.1 \
+	lib/ccan.git/licenses/LGPL-3
+SBSIGNTOOLS_AUTORECONF = YES
+SBSIGNTOOLS_GIT_SUBMODULES = YES
+
+SBSIGNTOOLS_DEPENDENCIES = host-pkgconf binutils gnu-efi openssl util-linux
+HOST_SBSIGNTOOLS_DEPENDENCIES = host-pkgconf host-binutils host-gnu-efi host-openssl host-util-linux
+
+SBSIGNTOOLS_CONF_ENV = \
+	CRTPATH="$(STAGING_DIR)/lib/crt0-efi-$(GNU_EFI_PLATFORM).o"
+HOST_SBSIGNTOOLS_CONF_ENV = \
+	CRTPATH="$(HOST_DIR)/lib/crt0-efi-$(shell uname -m).o" \
+	CFLAGS="$(HOST_CFLAGS) \
+		-I$(HOST_BINUTILS_DIR)/include \
+		-I$(HOST_BINUTILS_DIR)/bfd" \
+	ac_cv_header_bfd_h=yes
+
+define SBSIGNTOOLS_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+
+SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += SBSIGNTOOLS_RUN_AUTOGEN
+HOST_SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += SBSIGNTOOLS_RUN_AUTOGEN
+
+define SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+	$(SED) 's|^EFI_ARCH=.*|EFI_ARCH=$(GNU_EFI_PLATFORM)|' $(@D)/configure.ac
+	$(SED) 's|/usr/include/efi|$(STAGING_DIR)/usr/include/efi|g' $(@D)/configure.ac
+endef
+
+SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+
+define HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+	$(SED) 's|/usr/include/efi|$(HOST_DIR)/include/efi|g' $(@D)/configure.ac
+endef
+
+HOST_SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
