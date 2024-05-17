Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4FC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56C960854;
	Fri, 17 May 2024 13:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpfkzHwPD9Xm; Fri, 17 May 2024 13:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39EC6083C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A39EC6083C;
	Fri, 17 May 2024 13:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 652281BF995
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E5E46082A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcJCvtvxPYCY for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1ACF560841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ACF560841
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ACF560841
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:21:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42DB6CE1ACF;
 Fri, 17 May 2024 13:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9308C32789;
 Fri, 17 May 2024 13:21:03 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:20:39 +0300
Message-ID: <20240517132039.7124-5-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517132039.7124-1-jarkko@kernel.org>
References: <20240517132039.7124-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715952064;
 bh=RBAtTFkSbzXrG6FB8BSe4sGfejvMTgXVtu7McjiTkFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rjmK/yokJS2hUHZDI3ApUT0fERV/pv9k+L1vERZnnJfjiWz3MAEJ4DsFzkIYhI9fg
 5YwHY6QOiHGNUBS1mhV8xpve00o9s8mJUrTbfl5fSo1CyltaE0ue8an5dbrH7weEoc
 neYITpHWPWi4Pn+eQQnGdAYvKxuaIGv/3Nf0kq+2GE0Pn0izJ2Z/d1Blk/xEDNie5N
 9yS23VVIlRsi1nm9osrOSwC7nCrPyBt5I3qnkxqUnNscWi2plNJddtRGX8y+JOYZI5
 Yw1EP3QG2RygCFaspFuK96bnqOLIM9sU+trgtx9gW6VY9xSVPlTT7aFEWVI0BrAkJu
 bvC+tRE+PT6nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=rjmK/yok
Subject: [Buildroot] [PATCH 4/4] package/swtpm: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SWTPM package provides TPM emulators with different front-end
interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
Unix) and the Linux CUSE interface for the creation of multiple native
/dev/vtpm* devices.

Link: https://gitlab.com/jarkkojs/linux-tpmdd-test
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/swtpm/Config.in.host | 16 ++++++++++++++++
 package/swtpm/swtpm.hash     |  2 ++
 package/swtpm/swtpm.mk       | 17 +++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index db0dc702a8..732002f85b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1521,6 +1521,7 @@ F:	package/libvirt/
 N:	Jarkko Sakkinen <jarkko@kernel.org>
 F:	package/libtpms/
 F:	package/quota/
+F:	package/swtpm/
 
 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
diff --git a/package/Config.in.host b/package/Config.in.host
index 986b2854d0..0cf9dc3897 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -110,6 +110,7 @@ menu "Host utilities"
 	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/swtpm/Config.in.host"
 	source "package/swugenerator/Config.in.host"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
diff --git a/package/swtpm/Config.in.host b/package/swtpm/Config.in.host
new file mode 100644
index 0000000000..264f74e458
--- /dev/null
+++ b/package/swtpm/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_SWTPM
+	bool "host swtpm"
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBTPMS
+	help
+	  Compiles SWTPM software TPM emulator for the host.
+
+	  The SWTPM package provides TPM emulators with different
+	  front-end interfaces to libtpms. TPM emulators provide socket
+	  interfaces (TCP/IP and Unix) and the Linux CUSE interface for
+	  the creation of multiple native /dev/vtpm* devices.
+
+	  https://github.com/stefanberger/swtpm/wiki
diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
new file mode 100644
index 0000000000..934d3b6ee0
--- /dev/null
+++ b/package/swtpm/swtpm.hash
@@ -0,0 +1,2 @@
+sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
+sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
new file mode 100644
index 0000000000..29c8e37c47
--- /dev/null
+++ b/package/swtpm/swtpm.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# swtpm
+#
+################################################################################
+
+SWTPM_VERSION = 0.8.2
+SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
+SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE_FILES = LICENSE
+SWTPM_AUTORECONF = YES
+
+HOST_SWTPM_DEPENDENCIES = host-m4 host-libtool host-pkgconf host-json-glib \
+			  host-libopenssl host-libtasn1 host-libtpms
+HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
+
+$(eval $(host-autotools-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
