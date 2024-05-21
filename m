Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98142C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 11:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672AD81CBA;
	Tue, 21 May 2024 11:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWLl2fpABbl1; Tue, 21 May 2024 11:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B1981F61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B1981F61;
	Tue, 21 May 2024 11:06:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCD41C4FC0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B13F401F3
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfLxEXoCmKl5 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 11:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1E72400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E72400D1
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1E72400D1
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D19A61DD9;
 Tue, 21 May 2024 11:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58529C2BD11;
 Tue, 21 May 2024 11:06:28 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:06:13 +0300
Message-ID: <20240521110614.5322-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521110614.5322-1-jarkko@kernel.org>
References: <20240521110614.5322-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716289588;
 bh=ex73dwv7Bcitp6ELXZu+ZpAuV75MUQJ8nGSdqsk7YuI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e5w6l53vZZ+jtKOA6WQ9aoNlIlxflhAQQHozdCET6ht1GT314P9+R39rkGgJzcX9z
 H4jYhWvsavuhmuBdZhnpgvWJZkIZgdwAzCSYw/4MeSP3Tad8ckM5q0/G0S01BOOir/
 7D34U5u4FxcwFvs+8lKW6NvoSuyLDRRP/tTngfu6Cm4KC7Lg5ZLtMCKSt+yE7k6EiF
 e0kgrMe3WB9JOEcevDwZ4Kq1Ddv56GI2S40bhEmU4fFac+Kiu2tk6c47WtRiaL9jRU
 du507nnNtDSSrf2x7fSVP5bxTF1CyjZ5uUpDa45kONu9+CoPmD7QQ5OkyiFwjSasB/
 GRDSYVzr5JaUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=e5w6l53v
Subject: [Buildroot] [PATCH v5 2/3] package/libtpms: add host package
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

Libtpms is a library that targets the integration of TPM functionality
into hypervisors, primarily into Qemu. Libtpms provides a very narrow
public API for this purpose so that integration is possible. Only the
minimum of necessary APIs are made publicly available.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v5:
- Config.in.host
- s/"libtpms"/"host libtpms"/
v4:
- Changed in libtpms.mk to purely HOST_*.
v3:
- Use package deps in Kconfig as this just a library.
- DEPENDENCIES and CONF_OPTS for the host build
v2:
- Use host packages in package/libtpms/Config.in.
- Select BR2_HOST_PACKAGE_LIBOPENSSL.
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/libtpms/Config.in.host | 18 ++++++++++++++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 18 ++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/libtpms/Config.in.host
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..db0dc702a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1519,6 +1519,7 @@ N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/libvirt/

 N:	Jarkko Sakkinen <jarkko@kernel.org>
+F:	package/libtpms/
 F:	package/quota/

 N:	Jason Pruitt <jrspruitt@gmail.com>
diff --git a/package/Config.in.host b/package/Config.in.host
index 986b2854d0..1a3a571669 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/libtpms/Config.in.host"
 	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
diff --git a/package/libtpms/Config.in.host b/package/libtpms/Config.in.host
new file mode 100644
index 0000000000..f0fceaa4de
--- /dev/null
+++ b/package/libtpms/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_HOST_PACKAGE_LIBTPMS
+	bool "host libtpms"
+	help
+	  Libtpms is a library that targets the integration of TPM
+	  functionality into hypervisors, primarily into Qemu. Libtpms
+	  provides a very narrow public API for this purpose so that
+	  integration is possible. Only the minimum of necessary APIs
+	  are made publicly available.
+
+	  It is assumed that the user of libtpms is familiar with the
+	  concepts of the Trusted Platform Module (TPM). For the
+	  interaction with libtpms it is necessary to know how to
+	  construct valid TPM commands and to be able to parse their
+	  results. It is not within the scope of libtpms's documentation
+	  to provide background on this. See the section on references
+	  below.
+
+	  https://github.com/stefanberger/libtpms/wiki
diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
new file mode 100644
index 0000000000..1026aaa4f4
--- /dev/null
+++ b/package/libtpms/libtpms.hash
@@ -0,0 +1,2 @@
+sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  libtpms-0.9.6.tar.gz
+sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
new file mode 100644
index 0000000000..19d7cef89f
--- /dev/null
+++ b/package/libtpms/libtpms.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libtpms
+#
+################################################################################
+
+LIBTPMS_VERSION = 0.9.6
+LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
+LIBTPMS_LICENSE = BSD-4-Clause
+LIBTPMS_LICENSE_FILES = LICENSE
+LIBTPMS_INSTALL_STAGING = YES
+
+# Required because a plain Git clone is used:
+HOST_LIBTPMS_AUTORECONF = YES
+HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
+HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+
+$(eval $(host-autotools-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
