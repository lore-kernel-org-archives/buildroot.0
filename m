Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80022E937EE
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 19:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253E760D50;
	Sun, 12 Apr 2026 19:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl5n_WH_FztD; Sun, 12 Apr 2026 19:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0616D608F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776020732;
	bh=9ms+kRDKfXG6Orva/0a1CJJ6+5RdhPM5qHt8uer3pN0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qr0PMQ7PwWGTMB2s7xq8sumzMIiq6GxnQPq5hEAA8EPyOHWdZ4+qhc4+Ap5bAdJQY
	 3wQ3zodNANwGDZ2Fk+Ci9B4Vt28wZzGAOHgeeCmCpjKzW4qdlCBOz+2X30iKKsQbDV
	 ev83woTCF4Rui5SQISpy5TEF1v9yXjUyMS7nKZKrrkSH0m8f2YHvRvHaw5vPYI+NuZ
	 S+V1ZA43RaRRnCPkqXfkwUY9SxAX/p3AoNtqNSL8ku27mmXE54n76tAgct69qpSQ94
	 dGWeaTucmLgZUR5xnXcMJ2ZAYDNQfZ+3+OEOG07PLmZBW3Q0PpQeRW9mNtCNqC9w2P
	 ppdcywncVHtjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0616D608F9;
	Sun, 12 Apr 2026 19:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4575C237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9DD401CE
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0dVZROiQhkd for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 19:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 872D1401A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872D1401A3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 872D1401A3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:05:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1768132016; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 12 Apr 2026 19:05:25 +0000 (UTC)
Received: from peko by dell.fritz.box with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wC07Y-00000009rZx-0KoX;
 Sun, 12 Apr 2026 21:05:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 21:05:21 +0200
Message-ID: <20260412190522.2350896-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uRG5IYF1z51BT/TAwEEGhlLZPGiG141SHHgGDWuqPRj47oiZSNvw99Nu6kFu8HS0ErnYpglFQYeqc5KqanFQfTZ2sBLlvzPm2xqghXlgbJJlcvXuKFNE+r3lrQ2amfwxfJAvqSy7IEPmsabWQcaPn5gZUON2ODHpC5CBfy7T+UTuGXVwVXzJZwknmBZpsW4wqO954t9lcimwPOq5WRRp/aMQQg/mXuOUWhVVR655yGn7NvCixdMOy44vj9JOg+3khedmpJaqcvrVxtqZSdLSOpggp/vABOss2MbdeSiVIzTEY+bdPEPAdRm1QFs6OB4ozYgPWg5L/UHcZqqmG8/wgw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=17Ydqrt9jzE1r303tzlb3cfXSWuxhiYtq0TzeVga79w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=uRG5IYF1
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/ugetty: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minimal getty implementation with optional ppp and ssh multiplexing support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/busybox/busybox.mk |  1 +
 package/ugetty/Config.in   | 10 ++++++++++
 package/ugetty/ugetty.hash |  6 ++++++
 package/ugetty/ugetty.mk   | 23 +++++++++++++++++++++++
 6 files changed, 42 insertions(+)
 create mode 100644 package/ugetty/Config.in
 create mode 100644 package/ugetty/ugetty.hash
 create mode 100644 package/ugetty/ugetty.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 18197347a1..500dbf9ed8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2710,6 +2710,7 @@ F:	package/rnnoise/
 F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
+F:	package/ugetty/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
diff --git a/package/Config.in b/package/Config.in
index f12112c1d6..f4aa881fad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2894,6 +2894,7 @@ menu "System tools"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
 	source "package/tpm2-totp/Config.in"
+	source "package/ugetty/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/watchdog/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a33548c355..ebe169cdb9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -72,6 +72,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_TAR),tar) \
 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
+	$(if $(BR2_PACKAGE_UGETTY),ugetty) \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
diff --git a/package/ugetty/Config.in b/package/ugetty/Config.in
new file mode 100644
index 0000000000..e00e9fb73a
--- /dev/null
+++ b/package/ugetty/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UGETTY
+	bool "ugetty"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # std=c17
+	help
+	  A minimal getty for embedded Linux that auto-detects the
+	  client and dispatches incoming serial connections to a login
+	  prompt, a PPP session, or the local SSH server as
+	  appropriate.
+
+	  https://github.com/ryancdotorg/ugetty
diff --git a/package/ugetty/ugetty.hash b/package/ugetty/ugetty.hash
new file mode 100644
index 0000000000..b69c068a3f
--- /dev/null
+++ b/package/ugetty/ugetty.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256  302fe8a41eb8a752d08c82779f3c71b4b3060ddc48749a019135b0e649cde84c  ugetty-f1b7858778800b7256e9874f266c1d16ced22a6e.tar.gz
+sha256  26738bf10eec3fef6ee16c1dadc9279444552d9a86ff96122809af0529a8fec7  LICENSE
+sha256  a3290942cbf3fc43da5569318ccaa1e7fc601c30f81e32e51a55f5157a030ae3  LICENSE.0BSD
+sha256  15efcf4646d41aabd27e0cba3cb205e28acf5159b905c028ebed883f64fbefea  LICENSE.CC0
+sha256  0b230d23f22b80ffefcf65015f6e2308c2199dfaece79878b3ab13ad2577e685  LICENSE.MIT-0
diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
new file mode 100644
index 0000000000..0e306a02c2
--- /dev/null
+++ b/package/ugetty/ugetty.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# ugetty
+#
+################################################################################
+
+UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
+UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
+UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
+UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
+
+define UGETTY_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) bin/ugetty
+endef
+
+# Install ugetty->getty symlink to ensure ugetty is used
+define UGETTY_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/bin/ugetty \
+		$(TARGET_DIR)/sbin/ugetty
+	ln -snf ugetty $(TARGET_DIR)/sbin/getty
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
