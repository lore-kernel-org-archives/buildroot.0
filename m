Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D76E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 18:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA4E8122C;
	Mon,  6 Jan 2025 18:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gflxCCCHtAvt; Mon,  6 Jan 2025 18:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F199181217
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F199181217;
	Mon,  6 Jan 2025 18:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1400ADB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0A7F8120D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEVfsKzyxKNL for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 18:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9770881209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9770881209
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9770881209
 for <buildroot@busybox.net>; Mon,  6 Jan 2025 18:20:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso98006555e9.1
 for <buildroot@busybox.net>; Mon, 06 Jan 2025 10:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187626; x=1736792426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ldBX0/gUHvaFQHQyD3vUYX7mTSJsMqcvvW8rjYri6o=;
 b=cM5eQ0Wc1bXoQqNCMdi1xjeB5C3p1+pikB/5q1y5ticy/Wuk40+89UB+G92CBj/1au
 mTZ4fUwvRQMWShKDDEXSIVEKA+5KLEBFRq/6M5k39Mn3HUTLVdI2xHQKjqiKhOKc5rip
 CDi51Rq+7gQWfrXmDMquHPndIwU4T9HS1oIeUK6NwGzSdAxysg6T3xfnFFhVBhkdVe39
 IwXLYqciiFG8WQVm65Uk3xglcFpoot0DVMHQXCI6gl+CifUUXq1NiN7W8IN1b6pO2VIP
 QY25u+DBtr3+yqDZPC7cHRsZls6ugTkSZkgdcto/xlVueOfeJjOYjwxFEFa8WlGKL98D
 nZfQ==
X-Gm-Message-State: AOJu0Yy4l8ORBObjm17XN/wf/4dEMI+mky/0EDkJY6VoPvlHmSlntjyg
 etgyDiDWy4i0Ye5aTs0qsI5tkxmahgriTm5w+S80cZaOUStPDW1aYGthpOPqgaRPUWtqxoh4USj
 N7Q==
X-Gm-Gg: ASbGncsIZ/3oagHqpSH+gXwpEkYAYj1i3FoBYhP0jWIzhqMGHzUvfGh2tPl7qVhGL74
 82cQx6I54DDJn5yooKRW+6exmG4f470s9L6pEuKGT4qxQMVZToJ+WESnIToo6J6+NyQb5xh6/Et
 3Sw6Y1KD8XF1jA9nFlQ/SAkUKACW/7UDAdMfKBN25idHqLQXvEADITtV85OWlsERVOo5aTZlcHf
 6kt/TgwILODyIQcc42FF4qvaYBkPNGchjCsneey54j8aMq+5HmKbbT2zX86YSLvWWbUD2uK7ILT
 f/02bPS3xYcq+BI=
X-Google-Smtp-Source: AGHT+IEgJ9ZoP8bg1erwzxFYLY1p6aF1bj0IgnKnSOhKISLuVE3wPXrcHQlyOHuZ/qwMPt97FirZxQ==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id
 5b1f17b1804b1-436686436f9mr522995795e9.9.1736187626476; 
 Mon, 06 Jan 2025 10:20:26 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm606125305e9.18.2025.01.06.10.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 10:20:25 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Jan 2025 19:20:17 +0100
Message-ID: <20250106182018.2006380-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106182018.2006380-1-francois.perrad@gadz.org>
References: <20250106182018.2006380-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1736187626; x=1736792426; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ldBX0/gUHvaFQHQyD3vUYX7mTSJsMqcvvW8rjYri6o=;
 b=dF/542N2i6+Cb0oxSUg1mLKqEjP/iSWzm6UyJV07ZjmewBIlnytm3/XJ7Ez8dizNmW
 MsSwNRxYuMg/YhdnjtM+UdwROIAy0LZwYN3lwD5eLeyomskCnRN/F7419D3y5tDc2XbJ
 Jk1owHJm5R/FjZxHZKONoIoUZ026aCDPJnbToUD2y8gutjpj/A9LuWuG2UDLG/ei9tqy
 df5oa6sdPhyOBu0P7E/feRU2Gx6IML1ZK5htYFhBn+Ev15e6lVX5qEh7n3dVjSg6a1Ry
 gb1THxUDXX3v7lFFs+A/lkY/pikaNoSn3+CufmHKrOfDJl2ngRteX3AiZkOSxQefmMrg
 DN+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=dF/542N2
Subject: [Buildroot] [PATCH v4 2/2] package/lynis: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                  |  1 +
 package/Config.in                           |  1 +
 package/lynis/Config.in                     | 10 +++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 48 +++++++++++++++++++++
 support/testing/tests/package/test_lynis.py | 26 +++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

diff --git a/DEVELOPERS b/DEVELOPERS
index aedd73677..70b1fb9dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,6 +1162,7 @@ F:	package/lpty/
 F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
+F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
 F:	package/mstpd/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e02..b16a32709 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2732,6 +2732,7 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
+	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/lynis/Config.in b/package/lynis/Config.in
new file mode 100644
index 000000000..2757e86a2
--- /dev/null
+++ b/package/lynis/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LYNIS
+	bool "lynis"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
+	help
+	  Lynis is an auditing tool which tests and gathers (security)
+	  information from Unix based systems.
+	  Written in shell and running on system itself.
+
+	  https://cisofy.com/lynis/
diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
new file mode 100644
index 000000000..1027fb21a
--- /dev/null
+++ b/package/lynis/lynis.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9932147acafb1c5e13289a8bd46e8d330d4a97473da30ec04650ad019e497cd0  lynis-3.1.3.tar.gz
+sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
new file mode 100644
index 000000000..13a883bd5
--- /dev/null
+++ b/package/lynis/lynis.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# lynis
+#
+################################################################################
+
+LYNIS_VERSION = 3.1.3
+LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
+LYNIS_LICENSE = GPL-3.0
+LYNIS_LICENSE_FILES = LICENSE
+
+define LYNIS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/lynis \
+		$(TARGET_DIR)/usr/sbin/lynis
+	$(INSTALL) -D -m 0644 $(@D)/default.prf \
+		$(TARGET_DIR)/etc/lynis/default.prf
+	$(INSTALL) -D -m 0644 $(@D)/developer.prf \
+		$(TARGET_DIR)/etc/lynis/developer.prf
+	$(INSTALL) -D -m 0644 $(@D)/plugins/* \
+		-t $(TARGET_DIR)/etc/lynis/plugins
+	$(INSTALL) -D -m 0644 $(@D)/include/* \
+		-t $(TARGET_DIR)/usr/share/lynis/include
+	$(INSTALL) -D -m 0644 $(@D)/db/*.db \
+		-t $(TARGET_DIR)/usr/share/lynis/db
+	$(INSTALL) -D -m 0644 $(@D)/db/languages/en \
+		$(TARGET_DIR)/usr/share/lynis/db/languages/en
+endef
+
+ifneq ($(BR2_PACKAGE_GAWK),y)
+define LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AWK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_AWK_LIBM)
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_COREUTILS),y)
+define LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
+endef
+endif
+
+define LYNIS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PGREP)
+	$(LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS)
+	$(LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lynis.py b/support/testing/tests/package/test_lynis.py
new file mode 100644
index 000000000..bed4023e6
--- /dev/null
+++ b/support/testing/tests/package/test_lynis.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestLynis(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LYNIS=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("which awk")
+        self.assertRunOk("which stat")
+        self.assertRunOk("which zgrep")
+        self.assertRunOk("lynis show version", timeout=90)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
