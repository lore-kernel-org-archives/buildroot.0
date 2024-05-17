Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7EAC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 17:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856394061D;
	Fri, 17 May 2024 17:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX5sOG1KR-P1; Fri, 17 May 2024 17:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E688D40723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E688D40723;
	Fri, 17 May 2024 17:32:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04BCB1BF357
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B4D402E0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my5VgZMJuogo for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 17:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCD7340104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCD7340104
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCD7340104
 for <buildroot@buildroot.org>; Fri, 17 May 2024 17:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C2FC61DDA;
 Fri, 17 May 2024 17:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFAEC2BD10;
 Fri, 17 May 2024 17:31:57 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 20:31:40 +0300
Message-ID: <20240517173140.24531-4-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517173140.24531-1-jarkko@kernel.org>
References: <20240517173140.24531-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715967118;
 bh=0qEfZvQaBzgDoALeq+bYnA+mLsZ50OgGHfJG28Yi0Rk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=inKzHGNTeKlkA/wonXgfVnWvTF8GQpB4uH5YTDWaNIAujj920RZa+86XB7xBB2Qeq
 f40rl7a3e7oBRNy6Myr5Gy/t3bgIKpPLwbs6a2Smz2A8535ay+wJHZ9tT6JEU7ANJd
 DbRPZsK3NZqgvcfIHEXKBRDmuuUIU62gN+6PoXajviyyRFyTULsprlYKXXzbXLl4dZ
 U5esaQT7AdV6iu+PLpf8wB6yS2hShNPC7q9h1PW3DEGN2pB6vPWPLzs80wlVESG33w
 kZRod9oVqjzOam9j1NjV3VBu9FuFbS2oV4Ec+68eRskt2FKHluXsVfOk3QN10MdtC4
 wfU2/U4IsvdeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=inKzHGNT
Subject: [Buildroot] [PATCH v2 3/3] package/swtpm: add host package
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

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v2:
- Remove libraries from Config.host.in.
- Put deps line-by-line.
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/swtpm/Config.in.host | 12 ++++++++++++
 package/swtpm/swtpm.hash     |  2 ++
 package/swtpm/swtpm.mk       | 23 +++++++++++++++++++++++
 5 files changed, 39 insertions(+)
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
index 0000000000..79a9aa28af
--- /dev/null
+++ b/package/swtpm/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_SWTPM
+	bool "host swtpm"
+	select BR2_PACKAGE_LIBTOOL
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
index 0000000000..1d42d72e71
--- /dev/null
+++ b/package/swtpm/swtpm.mk
@@ -0,0 +1,23 @@
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
+HOST_SWTPM_DEPENDENCIES = \
+	host-json-glib \
+	host-libopenssl \
+	host-libtasn1 \
+	host-libtool \
+	host-libtpms \
+	host-pkgconf
+
+HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
+
+$(eval $(host-autotools-package))
--
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
