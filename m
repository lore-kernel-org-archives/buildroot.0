Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA083CFB43C
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 22:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD3481253;
	Sat,  5 Oct 2024 22:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLXRZxA_0Rbd; Sat,  5 Oct 2024 22:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E8B8124B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E8B8124B;
	Sat,  5 Oct 2024 22:58:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69AD21BF5A7
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 22:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6649E8124B
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 22:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P19m2BVTBUQp for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 22:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9AC48112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9AC48112C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9AC48112C
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 22:58:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 17B9EB0054E;
 Sun,  6 Oct 2024 00:58:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 00:58:07 +0200
Message-ID: <20241005225808.903365-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728169109;
 bh=CRu8wBfkrya1ZNvwPvauvNDrgomkWT1FFVgZnS1seBo=;
 h=From:To:Cc:Subject:Date:From;
 b=hx+2RHLCjbyeuaoggcHCIzrkewpou7u3joEqWBKnenc9tK6ZS7WaqjblaPJ2zCRp4
 imm8DTYk0aZsH2NEM0Tbh77dbI32o50DSfe8rQpFj8oY42yZwLwE+HWKJlLR75v3s2
 PalH3TWphyINDkc0Fgog0Hmbvn5FgwHBKfkrBySbMUlI0EWtgUPl6KJy5HoR15il4N
 NvC9ZyW6F2H1p0C5D8ytkpESrX+Xw5IIvvb/BpNRlwu2FjwQENzGlsAT0W6my73Cy1
 79IfhCnNr2wYL0eIZkfELBEwVTfGXxhGMXPoVP5d/XnyENOc8v9OycfMSsH3MAirPu
 EMzjRi313xyWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hx+2RHLC
Subject: [Buildroot] [PATCH v2 1/2] package/oath-toolkit: new package
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OATH Toolkit provide components to build one-time password
authentication systems. It contains shared C libraries,
command line tools and a PAM module. Supported technologies
include the event-based HOTP algorithm (RFC 4226), the
time-based TOTP algorithm (RFC 6238), and Portable Symmetric
Key Container (PSKC, RFC 6030) to manage secret key
data. OATH stands for Open AuTHentication, which is the
organization that specify the algorithms.

https://www.nongnu.org/oath-toolkit/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Included all changes recommended by Gilles:
 - bump to 2.6.12 to include recent security fix
 - add _INSTALL_STAGING = YES
 - Fix PSKC typo

Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8002912026
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/oath-toolkit/Config.in         | 27 +++++++++++++++++++
 package/oath-toolkit/oath-toolkit.hash | 12 +++++++++
 package/oath-toolkit/oath-toolkit.mk   | 37 ++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/oath-toolkit/Config.in
 create mode 100644 package/oath-toolkit/oath-toolkit.hash
 create mode 100644 package/oath-toolkit/oath-toolkit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b1947487..8c20c329ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,7 @@ F:	package/kexec/
 F:	package/libjxl/
 F:	package/libopenmpt/
 F:	package/mokutil/
+F:	package/oath-toolkit/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..ca5508fbfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1611,6 +1611,7 @@ menu "Crypto"
 	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
+	source "package/oath-toolkit/Config.in"
 	source "package/openssl/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
diff --git a/package/oath-toolkit/Config.in b/package/oath-toolkit/Config.in
new file mode 100644
index 0000000000..f2d697a7c9
--- /dev/null
+++ b/package/oath-toolkit/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_OATH_TOOLKIT
+	bool "oath-toolkit"
+	depends on BR2_USE_WCHAR
+	help
+	  OATH Toolkit provide components to build one-time password
+	  authentication systems. It contains shared C libraries,
+	  command line tools and a PAM module. Supported technologies
+	  include the event-based HOTP algorithm (RFC 4226), the
+	  time-based TOTP algorithm (RFC 6238), and Portable Symmetric
+	  Key Container (PSKC, RFC 6030) to manage secret key
+	  data. OATH stands for Open AuTHentication, which is the
+	  organization that specify the algorithms.
+
+	  https://www.nongnu.org/oath-toolkit/
+
+if BR2_PACKAGE_OATH_TOOLKIT
+
+config BR2_PACKAGE_OATH_TOOLKIT_PSKC
+	bool "enable PSKC"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Enable the Portable Symmetric Key Container (PSKC) support.
+
+endif
+
+comment "oath-toolkit needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
new file mode 100644
index 0000000000..a89dd6bb94
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -0,0 +1,12 @@
+# After checking pgp signature from:
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.12.tar.gz.sig
+# using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
+# From release announce:
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2024-10/msg00002.html
+sha1  0bfb6ad29d59628487c9e180c7a43f4ca301e4d1  oath-toolkit-2.6.12.tar.gz
+sha256  cafdf739b1ec4b276441c6aedae6411434bbd870071f66154b909cc6e2d9e8ba  oath-toolkit-2.6.12.tar.gz
+# Locally calculated
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  liboath/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  oathtool/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  pam_oath/COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
new file mode 100644
index 0000000000..b36cd47053
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# oath-toolkit
+#
+################################################################################
+
+OATH_TOOLKIT_VERSION = 2.6.12
+OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
+OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
+OATH_TOOLKIT_LICENSE_FILES = \
+	COPYING \
+	liboath/COPYING \
+	oathtool/COPYING \
+	pam_oath/COPYING
+OATH_TOOLKIT_CPE_ID_VENDOR = nongnu
+OATH_TOOLKIT_CPE_ID_PRODUCT = oath_toolkit
+OATH_TOOLKIT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+# Set the pam directory defined in linux-pam (see --enable-securedir
+# in LINUX_PAM_CONF_OPTS in package/linux-pam/linux-pam.mk).
+OATH_TOOLKIT_CONF_OPTS += \
+	--enable-pam \
+	--with-pam-dir=/lib/security
+OATH_TOOLKIT_DEPENDENCIES += linux-pam
+else
+OATH_TOOLKIT_CONF_OPTS += --disable-pam
+endif
+
+ifeq ($(BR2_PACKAGE_OATH_TOOLKIT_PSKC),y)
+OATH_TOOLKIT_CONF_OPTS += --enable-pskc
+OATH_TOOLKIT_DEPENDENCIES += libxml2
+else
+OATH_TOOLKIT_CONF_OPTS += --disable-pskc
+endif
+
+$(eval $(autotools-package))
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
