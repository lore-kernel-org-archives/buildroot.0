Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D63C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 11:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2CA8200B;
	Tue, 21 May 2024 11:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8GusXEiWf_I; Tue, 21 May 2024 11:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48A4F82007
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A4F82007;
	Tue, 21 May 2024 11:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C086F1C4FC0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B94D9400D1
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1mGF3K_u-IX for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 11:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3B24401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3B24401F3
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3B24401F3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:06:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E684262153;
 Tue, 21 May 2024 11:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F231C2BD11;
 Tue, 21 May 2024 11:06:32 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:06:14 +0300
Message-ID: <20240521110614.5322-4-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521110614.5322-1-jarkko@kernel.org>
References: <20240521110614.5322-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716289592;
 bh=uHmZFQmDiP7rzLfxz3H6dGCqdlixbz4F6cNdIeJCyeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WP0GDp6PKcA9T8pzZP+ADQBy/rvRefg2fl36Dhbr3AQ/BpCS58fjsHE/w4jt7Yydp
 pKw5qToTk38yxXxM+8+VXeJeoO2vKPnBWrmHu8MhN4kgKZiuBWauB03J4F+RrRGhQ8
 jzeuMbZ8UDPnubgrxDOuE6Pmz781mNGu40XwKslGiqLgB1dg7mNBxezuw+BauZ1eMx
 n6QCWngLxJtBQ7cSrO57yNwBFRgj6fCYZc9gzEbPR/4/W8/hzaRh/VITZl6Ozwae3j
 F1kuzXr15KxxJA0HYi+qdnXNQNdNL7rz02KCHx4gEzPrPoLOlpTkqIgUT+eO2yHFrl
 cJUqTnynOdYbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=WP0GDp6P
Subject: [Buildroot] [PATCH v5 3/3] package/swtpm: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
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
v5:
- HOST_AUTORECONF
v3:
- Remove libtool from Config.host.in.
v2:
- Remove libraries from Config.host.in.
- Put deps line-by-line.
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/swtpm/Config.in.host | 11 +++++++++++
 package/swtpm/swtpm.hash     |  2 ++
 package/swtpm/swtpm.mk       | 23 +++++++++++++++++++++++
 5 files changed, 38 insertions(+)
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
index 1a3a571669..4e0dab0504 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -111,6 +111,7 @@ menu "Host utilities"
 	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/swtpm/Config.in.host"
 	source "package/swugenerator/Config.in.host"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
diff --git a/package/swtpm/Config.in.host b/package/swtpm/Config.in.host
new file mode 100644
index 0000000000..0dd984ff8d
--- /dev/null
+++ b/package/swtpm/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_SWTPM
+	bool "host swtpm"
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
index 0000000000..b05a248c03
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
+
+# Required because a plain Git clone is used:
+HOST_SWTPM_AUTORECONF = YES
+HOST_SWTPM_DEPENDENCIES = \
+	host-json-glib \
+	host-libopenssl \
+	host-libtasn1 \
+	host-libtool \
+	host-libtpms \
+	host-pkgconf
+HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
+
+$(eval $(host-autotools-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
