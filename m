Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EE8CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 16:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F04400B8;
	Mon, 11 May 2026 16:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlrmlE8BOM0y; Mon, 11 May 2026 16:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D4E4010D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778515280;
	bh=FVLKy8ohNC+Bb2mGX1N0nK5puzT7OHBrE6/PTnCydrM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hsqj3CJ/HPwnFDFqZoLls0kx9BpIeiTegOhq+WkcIQIizY/JWDIKF1KMMqheXQMpD
	 sHPrmoA5eQgGdWS7MsxIeHfic5ouJDOQHrIWzj4ieF2UXK8j8I7UupNCiVB84czBGt
	 invUmlfp/jmDBn9bf/wdm7i3rXOxIaeYepsU1xjxsTEx2jdLOizUphQR5XGdWfx84Q
	 mEMl4mVZQ8yn9mSN1tUvQWQA2qZ4i6zriyKZNIj99QW/9HVv14Jq/ReMdLrcLI7tNt
	 x4hiLdK45ihQyHgHFRQcS7tAJl+YlEIHXsZZtPqGqWIaqjITnIdzP0w6TUYD7IxDXA
	 0se956x9qxBfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D4E4010D;
	Mon, 11 May 2026 16:01:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02394223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC48E400B8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbBJYErRG_t5 for <buildroot@buildroot.org>;
 Mon, 11 May 2026 16:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 810E14010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 810E14010D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 810E14010D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:01:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB286A4C3595
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:01:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38930)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMT4C-000000007rK-3lFB
 for buildroot@buildroot.org; Mon, 11 May 2026 16:01:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 18:01:13 +0200
Message-ID: <20260511160113.1225755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778515273;
 bh=CBgidspD6Q5Xx0FhfMBRVEmbNu2Tgz+pB9F+5ooQAkc=;
 h=From:To:Subject:Date:From;
 b=kTD9PviaZcZgaMH0vLbwNAeoJh2ew1ctXSiNR/hNwcwtdTol0HU/RXCygxmOJ3OiM
 n16pY7BUP8EhR/WENp6nz4NFvSVnpx/LjWrDu1IqCFC09R2uZXOvficl0/MboAPXMx
 W0/CsB4vlkl0Iu3C1KhGTLU8aiHZ1yYBPAm/Zrr4npRo0F2blO0YLN4BVX9amFYw4t
 4GGcweLF5Zaa4I1MEOPmyb1THh6xHwzaPsFx5T+Txxuq+Yc+3q94oMYjYnVYNuypKd
 M0iu0I6+2N3zvii8LnzJbYK8ovwpRxL0ZC12c95PpHy7VFX+rspYuWaQrXV9vVkryq
 noiSpiS2IpD2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kTD9Pvia
Subject: [Buildroot] [PATCH 1/1] package/lm-sensors: bump version to 3.6.2
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

https://github.com/lm-sensors/lm-sensors/blob/V3-6-2/CHANGES

Removed patch 0002 which is included in this release:
https://github.com/lm-sensors/lm-sensors/commit/e31cb3b2f8fa5f0a7a61b9bca919bb54e7c89eea

Rebased and renumbered remaining patch.

Updated license hash due to upstream commit
https://github.com/lm-sensors/lm-sensors/commit/6128b9e8eb58d6a12d4c8a8d6a635a3f066a0127

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  3 +-
 ...nfig.patch => 0001-no-host-ldconfig.patch} |  6 +-
 package/lm-sensors/0001-static-build.patch    | 81 -------------------
 package/lm-sensors/lm-sensors.hash            |  4 +-
 package/lm-sensors/lm-sensors.mk              |  2 +-
 5 files changed, 8 insertions(+), 88 deletions(-)
 rename package/lm-sensors/{0002-no-host-ldconfig.patch => 0001-no-host-ldconfig.patch} (86%)
 delete mode 100644 package/lm-sensors/0001-static-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d7125c74fc..3759d635f3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -566,8 +566,7 @@ package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstrea
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
 package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/lm-sensors/0001-static-build.patch lib_patch.Upstream
-package/lm-sensors/0002-no-host-ldconfig.patch lib_patch.Upstream
+package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch lib_patch.Upstream
diff --git a/package/lm-sensors/0002-no-host-ldconfig.patch b/package/lm-sensors/0001-no-host-ldconfig.patch
similarity index 86%
rename from package/lm-sensors/0002-no-host-ldconfig.patch
rename to package/lm-sensors/0001-no-host-ldconfig.patch
index 51f7f6af01..24858624ed 100644
--- a/package/lm-sensors/0002-no-host-ldconfig.patch
+++ b/package/lm-sensors/0001-no-host-ldconfig.patch
@@ -10,14 +10,16 @@ need to link against a separate library. Therefore, this patch simply
 removes the libiconv handling.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for 3.6.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 Index: b/prog/sensors/Module.mk
 ===================================================================
 --- a/prog/sensors/Module.mk
 +++ b/prog/sensors/Module.mk
-@@ -37,10 +37,8 @@
- REMOVESENSORSBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(BINDIR)/%,$(PROGSENSORSTARGETS))
+@@ -39,10 +39,8 @@
  REMOVESENSORSMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORSMAN1DIR)/%,$(PROGSENSORSMAN1FILES))
+ REMOVESENSORSZSH := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(ZSHCOMPDIR)/%,$(PROGSENSORSZSHCOMPFILES))
  
 -LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
 -
diff --git a/package/lm-sensors/0001-static-build.patch b/package/lm-sensors/0001-static-build.patch
deleted file mode 100644
index 63edd44f84..0000000000
--- a/package/lm-sensors/0001-static-build.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Add support for static only build
-
-This patch adds support for a BUILD_SHARED_LIB variable that allows to
-enable/disable the build of the shared library, in order to support
-static-only builds.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -85,6 +85,9 @@
- # Build and install static library
- BUILD_STATIC_LIB := 1
- 
-+# Build and install shared library
-+BUILD_SHARED_LIB := 1
-+
- # Set these to add preprocessor or compiler flags, or use
- # environment variables
- # CFLAGS :=
-Index: b/lib/Module.mk
-===================================================================
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -43,8 +43,14 @@
- LIBSTLIBNAME := libsensors.a
- LIBSHSONAME := libsensors.so.$(LIBMAINVER)
- 
-+ifeq ($(BUILD_SHARED_LIB),1)
- LIBTARGETS := $(MODULE_DIR)/$(LIBSHLIBNAME) \
-               $(MODULE_DIR)/$(LIBSHSONAME) $(MODULE_DIR)/$(LIBSHBASENAME)
-+LIBDEP_FOR_PROGS := $(LIBSHBASENAME)
-+else
-+LIBDEP_FOR_PROGS := $(LIBSTLIBNAME)
-+endif
-+
- ifeq ($(BUILD_STATIC_LIB),1)
- LIBTARGETS += $(MODULE_DIR)/$(LIBSTLIBNAME)
- endif
-@@ -131,9 +137,11 @@
- ifeq ($(BUILD_STATIC_LIB),1)
- 	$(INSTALL) -m 644 $(LIB_DIR)/$(LIBSTLIBNAME) $(DESTDIR)$(LIBDIR)
- endif
-+ifeq ($(BUILD_SHARED_LIB),1)
- 	$(INSTALL) -m 755 $(LIB_DIR)/$(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)
- 	$(LN) $(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBSHSONAME)
- 	$(LN) $(LIBSHSONAME) $(DESTDIR)$(LIBDIR)/$(LIBSHBASENAME)
-+endif
- 	@if [ -z "$(DESTDIR)" -a "$(LIBDIR)" != "/usr/lib" -a "$(LIBDIR)" != "/lib" ] ; then \
- 	   if [ -e "/usr/lib/$(LIBSHSONAME)" -o -e "/usr/lib/$(LIBSHBASENAME)" ] ; then \
- 	     echo '******************************************************************************' ; \
-Index: b/prog/sensord/Module.mk
-===================================================================
---- a/prog/sensord/Module.mk
-+++ b/prog/sensord/Module.mk
-@@ -41,7 +41,7 @@
- REMOVESENSORDBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(SBINDIR)/%,$(PROGSENSORDTARGETS))
- REMOVESENSORDMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORDMAN8DIR)/%,$(PROGSENSORDMAN8FILES))
- 
--$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
-+$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBDEP_FOR_PROGS)
- 	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORDSOURCES:.c=.ro) -Llib -lsensors -lrrd
- 
- all-prog-sensord: $(PROGSENSORDTARGETS)
-Index: b/prog/sensors/Module.mk
-===================================================================
---- a/prog/sensors/Module.mk
-+++ b/prog/sensors/Module.mk
-@@ -39,8 +39,8 @@
- 
- LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
- 
--$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
--	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors
-+$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBDEP_FOR_PROGS)
-+	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors -lm
- 
- all-prog-sensors: $(PROGSENSORSTARGETS)
- user :: all-prog-sensors
diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 0ca07b7e69..9ffbe1a32f 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  c6a0587e565778a40d88891928bf8943f27d353f382d5b745a997d635978a8f0  lm-sensors-3-6-2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 8975efaffa..1de826dba0 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3-6-0
+LM_SENSORS_VERSION = 3-6-2
 LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
