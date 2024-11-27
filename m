Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79427D65521
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 05:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B7986077C;
	Wed, 27 Nov 2024 05:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfB251EHXtHc; Wed, 27 Nov 2024 05:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF3F360771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3F360771;
	Wed, 27 Nov 2024 05:25:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF99E712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0C3405EC
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsSNTRprb6r5 for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 05:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A79040003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A79040003
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A79040003
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:25:46 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-214f6ed9f17so9424285ad.1
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732685146; x=1733289946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0A4AWtZwuix/qebEV9R/ZsJOxERkVRFzmRf3zIpEqU=;
 b=Dz2oSu5GiSWeJP/2UGTVFGhMZ6XOy9alTyGEwePmFqFhWcK3Ciqdws0odZy0ZFosmv
 0iN/e4g7m2sSqJoLUif5EkWGmjMa+lwztsGUYkCb4uoerf+fPGX9NC+69KKtj6WVMhtg
 hrQCANWOnbOtf74xsnl/xWLCoqVhjG8PL1nuS4mIhOKAjqABjbPfBlR4YyVUDes0PoSJ
 ZwTdgRYMUQs2HMfqsQwGsP0/7aDadTFt9IV/rtnVvNq1sR++uduIJnx1yJ5y+rkrMr5c
 5m5l1zbEQKWF7ewgn8EYwOGw6WPtKm/NG8LsnHDiaZX4Xc15vABRHxOp5BZBI2jsiHkF
 NNZA==
X-Gm-Message-State: AOJu0Yy+/6k3/3UdQVnpo5EndrODTVtlJ+bhGBHVzjqEsOKLVAXoAI03
 SYiVbQ8lFhNWmBchGnoV7CTTwDJil0Zo/YLo1KX8yZXLC+MQmfOSqMfgcA==
X-Gm-Gg: ASbGncsV1614/E3F0zC6Lpank+TF1uOFcxKlw63Naq3TV2MqWrXmnd512IdWax/Jhhs
 idMPYXerTeQLO/GVbSyB92cuhnQrYbdtFbvsqrtA60bjbePjhQ1Fyjp0yRMLJK76nBLWNR2odAV
 YUUU/twYCJI3NomGBpyAslgx0f12xEzGzU3+qTTmfc+OlzgutBMmwvt63w8D5VOJfVzi+A+Vthv
 3E57ojCzGfXEcVZpIdV0rfDR9Cl6gecVaAP9uMLMaq3zzhHAL3+aHQqpZ49RTTJEnWqW71GfcF6
 Z5rvJpSWhySmNfgUvKzxaIk6BGW//m0=
X-Google-Smtp-Source: AGHT+IFFq0yWrSvSsLXUPjb47GQtw1AYiR1p45wtigsnPLQoRe/SIjRgUG2REuHIgi0kNr3TM72TEQ==
X-Received: by 2002:a17:902:ce10:b0:211:a6d:85dd with SMTP id
 d9443c01a7336-21501f62400mr23628825ad.47.1732685146025; 
 Tue, 26 Nov 2024 21:25:46 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc22263sm93631375ad.252.2024.11.26.21.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 21:25:45 -0800 (PST)
From: abelino <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 abelino <abelino.romo@gmail.com>
Date: Tue, 26 Nov 2024 21:25:41 -0800
Message-ID: <20241127052541.3689574-1-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125000233.2772592-2-abelino.romo@gmail.com>
References: <20241125000233.2772592-2-abelino.romo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732685146; x=1733289946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0A4AWtZwuix/qebEV9R/ZsJOxERkVRFzmRf3zIpEqU=;
 b=UOuErgFw/HYqZCsOjAXn9t1Vwh6YtRzoRYqv7rlwArPUx3eTGj5g3pGMHpBCzGHFGZ
 1LWBXr9Xkh98LWBZ9EqA3Zvxc04beEpUhZEgtyVZpL+4IXM00DBSBm00VlHyIu+T4KEA
 rJ/oj7BbYDAhikBo0VGOjxWdWkb+p5VfRoqL30xOCh5r72vfVPwaCMWSAl7/HaK+CYKm
 R77etdotnVtD6GWRogAaAf/oQH22Sb1GZpuun4M1CqWORv4mvZa5TCX/QXXIuQmNDLfA
 T00vJVMfmLQpJkVRcva/b38fTV9kD2B4enmTp6w0wL/shIyMQdod9EX3AQQyjE0ZnOGt
 Q8gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UOuErgFw
Subject: [Buildroot] [PATCH v2 1/2] package/tpm2-tss: bump version to 4.1.3
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

On v3.2.2, testing with an Infineon SLB9673 resulted in the following
error when attempting to read from a previously written NV index.
Upgrading to the latest release, v4.1.3, resolves the issue:

```shell
~# tpm2_nvread 0x1900001
WARN: Reading full size of the NV index
ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
ERROR: Failed to get shandle
ERROR: Failed to read NVRAM area at index 0x1900001
ERROR: Unable to run tpm2_nvread
```

Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
features. Bumping to v4.1.3 adds access to these improvements and
addresses the NV index read issue.

[1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0

Signed-off-by: abelino <abelino.romo@gmail.com>
---
Changes v1 -> v2:
  - Update `TPM2_TSS_SITE` to use `$(call github,...)` but required additional
    changes to properly bootstrap `configure`. The previous URL downloaded
    the release artifact which is bootstraped ahead of time, while the tagged
    source archive does not contain a `VERSION` and `configure` file.
    (suggested by Vincent Jardin)

 .checkpackageignore                           |  2 +-
 .../0001-Prepare-bootstrap-file.patch         | 44 +++++++++++++++++++
 ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
 package/tpm2-tss/Config.in                    |  2 +
 package/tpm2-tss/tpm2-tss.hash                |  2 +-
 package/tpm2-tss/tpm2-tss.mk                  | 20 ++++++---
 6 files changed, 61 insertions(+), 53 deletions(-)
 create mode 100644 package/tpm2-tss/0001-Prepare-bootstrap-file.patch
 delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..1b9e32f4d7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1237,7 +1237,7 @@ package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_pat
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
+package/tpm2-tss/0001-Prepare-bootstrap-file.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
diff --git a/package/tpm2-tss/0001-Prepare-bootstrap-file.patch b/package/tpm2-tss/0001-Prepare-bootstrap-file.patch
new file mode 100644
index 0000000000..81ee3b6266
--- /dev/null
+++ b/package/tpm2-tss/0001-Prepare-bootstrap-file.patch
@@ -0,0 +1,44 @@
+From a0a6c030edf233316b9acc56224bfc0d8f637308 Mon Sep 17 00:00:00 2001
+From: abelino <abelino.romo@gmail.com>
+Date: Tue, 26 Nov 2024 16:49:14 -0800
+Subject: [PATCH] Prepare bootstrap file
+
+The bootstrap script uses git to create a VERSION file and we do not
+have access to any git history when pulling the tarball from GitHub's
+Archive. Therefore, we move the responsibility of generating the
+VERSION file and autoreconf'ing from the bootstrap script and off to
+this package's makefile.
+
+Signed-off-by: abelino <abelino.romo@gmail.com>
+---
+ bootstrap | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/bootstrap b/bootstrap
+index 47135577..2032dde8 100755
+--- a/bootstrap
++++ b/bootstrap
+@@ -1,8 +1,6 @@
+ #!/bin/sh
+ set -e
+ 
+-git describe --tags --always --dirty > VERSION
+-
+ # generate list of source files for use in Makefile.am
+ # if you add new source files, you must run ./bootstrap again
+ src_listvar () {
+@@ -89,11 +87,3 @@ if test "${GEN_FUZZ}0" -eq 10; then
+ else
+   touch Makefile-fuzz-generated.am
+ fi
+-
+-${AUTORECONF} --install --sym $@
+-
+-if grep "Invalid policy. Valid policies: git-directory, minor-version." configure >/dev/null; then
+-    echo "ERROR: ax_is_release.m4 is outdated. ./configure will fail."
+-    echo "Please download from http://ftpmirror.gnu.org/autoconf-archive/autoconf-archive-2019.01.06.tar.xz"
+-    exit 1
+-fi
+-- 
+2.47.0
+
diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
deleted file mode 100644
index 812c753ffb..0000000000
--- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7dc753ad27a8cd14c9b00be94ca89b847cf05ce9 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 23 Dec 2019 08:02:19 -0300
-Subject: [PATCH] Temporary fix for build without C++
-
-C++ is required only for the fuzzing tests but AC_PROG_CXX is included
-by configure.ac even when fuzzing is not enabled (which we don't do on
-Buildroot).
-
-The patch applied upstream had issues and was reverted[1]. Use a local
-patch to solve the problem temporaryly.
-
-Fixes:
-    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
-    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
-    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
-    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
-    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
-    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
-    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
-    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
-
-1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ff59dd7c..3e4028fb 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
- AX_CHECK_ENABLE_DEBUG([info])
- 
- AC_PROG_CC
--AC_PROG_CXX
- AC_PROG_LN_S
- AC_USE_SYSTEM_EXTENSIONS
- LT_INIT()
--- 
-2.26.2
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 857987ae36..d87c1e0d8d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -39,6 +39,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  This option allows to enable Feature API (FAPI).  Feature
 	  API (FAPI) as described in the "TSS 2.0 Feature API
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index c9fa4e6ae0..a7a0c5cca8 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
+sha256  8a389bda64690910e7af7deaf64703a3faed416dc538c9c3e4f893f24893524d  tpm2-tss-4.1.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b76d16e71e..ae77d4f313 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,17 +4,23 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.2
-TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
+TPM2_TSS_VERSION = 4.1.3
+TPM2_TSS_SITE = $(call github,tpm2-software,tpm2-tss,$(TPM2_TSS_VERSION))
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
-
-# 0001-configure-Only-use-CXX-when-fuzzing.patch
+TPM2_TSS_DEPENDENCIES = openssl host-autoconf-archive host-pkgconf
 TPM2_TSS_AUTORECONF = YES
+TPM2_TSS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+define TPM2_TSS_BOOTSTRAP
+	echo $(TPM2_TSS_VERSION) > $(@D)/VERSION
+	cd $(@D) && ./bootstrap
+endef
+
+TPM2_TSS_PRE_CONFIGURE_HOOKS = TPM2_TSS_BOOTSTRAP
 
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users adn tmpfiles, which we do not care
@@ -36,10 +42,10 @@ TPM2_TSS_CONF_OPTS = \
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
-TPM2_TSS_DEPENDENCIES += json-c libcurl
+TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
 TPM2_TSS_CONF_OPTS += --enable-fapi
 else
-TPM2_TSS_CONF_OPTS += --disable-fapi
+TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
 endif
 
 define TPM2_TSS_USERS
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
