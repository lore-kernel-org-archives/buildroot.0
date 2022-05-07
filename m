Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64126C433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6950409A3;
	Sat,  7 May 2022 16:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuQukghtubAl; Sat,  7 May 2022 16:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63186409A1;
	Sat,  7 May 2022 16:13:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB8F1BF82D
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 16:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D0D28270B
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 16:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=riseup.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t97n2ZZ99A-Y for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 16:13:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA5C6826F5
 for <buildroot@buildroot.org>; Sat,  7 May 2022 16:13:44 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4KwXYM6mcMz9tqc;
 Sat,  7 May 2022 09:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1651940024; bh=K4nqd2CnnsvRkGRxE14dMwCNVJGMfJYIHtqgFsObBfk=;
 h=From:To:Cc:Subject:Date:From;
 b=sQb1fWkXi+RC2UJY7bdBeSQBgaC1GFvXqVta4bEtceS/E9zePO3pBJSaHoBMJPtDj
 /yqBiGtwfKSDRpULn9gcLhlaL9DehssnV96j8EULD2/0961dhwGyv7cUSfQwAI/qo2
 F9GjjmmpsKIE37BkYvR9wU0iMdRRfUwmDLoSHoLo=
X-Riseup-User-ID: FEEDDAD295BBB6274DE71B7F249757E02134B162C8F011E387499C939A70872E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KwXYL5dqpz5vsl;
 Sat,  7 May 2022 09:13:42 -0700 (PDT)
From: Rufus Segar <rhs@riseup.net>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 17:13:37 +0100
Message-Id: <20220507161338.2125859-1-rhs@riseup.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package: add agent-proxy target and host
 packages
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
Cc: Rufus Segar <rhs@riseup.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Rufus Segar <rhs@riseup.net>
---
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/agent-proxy/Config.in      | 11 ++++++++++
 package/agent-proxy/Config.in.host | 11 ++++++++++
 package/agent-proxy/agent-proxy.mk | 33 ++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/agent-proxy/Config.in
 create mode 100644 package/agent-proxy/Config.in.host
 create mode 100644 package/agent-proxy/agent-proxy.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..40e41d77a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ menu "Compressors and decompressors"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/agent-proxy/Config.in"
 	source "package/babeltrace2/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3..e71008f9d9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
+	source "package/agent-proxy/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
diff --git a/package/agent-proxy/Config.in b/package/agent-proxy/Config.in
new file mode 100644
index 0000000000..fb66599589
--- /dev/null
+++ b/package/agent-proxy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_AGENT_PROXY
+	bool "agent-proxy"
+	help
+	  This is a simple, small proxy which was intended for use with
+	  kgdb, or gdbserver type connections where you want to share a
+	  text console and a debug session.
+
+	  The idea is that you use the agent-proxy to connect to a
+	  serial port directly or to a remote terminal server.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/agent-proxy/Config.in.host b/package/agent-proxy/Config.in.host
new file mode 100644
index 0000000000..34697665d4
--- /dev/null
+++ b/package/agent-proxy/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_AGENT_PROXY
+	bool "host agent-proxy"
+	help
+	  This is a simple, small proxy which was intended for use with
+	  kgdb, or gdbserver type connections where you want to share a
+	  text console and a debug session.
+
+	  The idea is that you use the agent-proxy to connect to a
+	  serial port directly or to a remote terminal server.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/agent-proxy/agent-proxy.mk b/package/agent-proxy/agent-proxy.mk
new file mode 100644
index 0000000000..faec7fba32
--- /dev/null
+++ b/package/agent-proxy/agent-proxy.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# agent-proxy
+#
+################################################################################
+
+AGENT_PROXY_VERSION = agent-proxy-1.97
+AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+AGENT_PROXY_LICENSE = GPL-2.0+
+AGENT_PROXY_LICENSE_FILES = COPYING
+
+define AGENT_PROXY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define AGENT_PROXY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(STAGING_DIR)/usr/bin
+endef
+
+define AGENT_PROXY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(TARGET_DIR)/usr/bin
+endef
+
+define HOST_AGENT_PROXY_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_AGENT_PROXY_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(INSTALL) -D -m 0755 $(@D)/agent-proxy $(HOST_DIR)/bin
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
