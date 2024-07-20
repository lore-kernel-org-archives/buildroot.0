Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843D0C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 08:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D4360F83;
	Sat, 20 Jul 2024 08:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxC9IIGWprvf; Sat, 20 Jul 2024 08:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 092FF606F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 092FF606F2;
	Sat, 20 Jul 2024 08:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17ACB1BF349
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0365B82163
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuLDeVic6OzP for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 08:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DB05820FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB05820FC
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DB05820FC
 for <buildroot@busybox.net>; Sat, 20 Jul 2024 08:19:09 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so2385961a12.1
 for <buildroot@busybox.net>; Sat, 20 Jul 2024 01:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721463547; x=1722068347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cdkcqcil1KlQDWDhPlCgee3qFi0cB47pK3y1Mnh/6yk=;
 b=eWNPfZofBsKtLnpXbeWscBDFa+oGdjJQ4vE38W8gvoX6xDzZKYETsJlsYtLI7hHi2J
 68Z3WbiZsi6GBa5OkFZ2aTCwvfwRZcbBtjKS3Huut0jKdwN5TJkllczZx9IPmHu876YF
 K184W0rliXKThd4GlRwb0gqSXlnOQPcsbZQYSWp2BRCamnWMJzc7VD+Pqzgd7K+e7hvA
 ms4eXSV9csfyaN3wJjjnYMgU/s62z4dn8pGdO22p8zpj9REYlhftr4plfgvqwQ8hB3vW
 iMq92MtVS5rzvNRz1/w/kaazWoA9BBs1M3ooqjyk7X2m9pcQIdUV1rKDYRyxjKO/eVS/
 ypew==
X-Gm-Message-State: AOJu0Yx/4plaXidR05onRS/XRNUE+PCK+X0zuzxSfp30GbEPHi7DDDoX
 YoWGQ6w4witf5XJRXJOUNAuRz0sBePI15QQZHR6UgODs5dxIlq4UDxsz+abUgCkzmU2sM+dOrDE
 =
X-Google-Smtp-Source: AGHT+IGIdgrUVHB1KnfzGtSfwtDwlRLaIy7D6AiRdddIkRGv/t/KcNMuBPMoYwlJeskW0MkEPIV40g==
X-Received: by 2002:a50:d598:0:b0:582:7394:a83d with SMTP id
 4fb4d7f45d1cf-5a2cc7919a8mr4771832a12.12.1721463547133; 
 Sat, 20 Jul 2024 01:19:07 -0700 (PDT)
Received: from vm-2404.. (203.34.66.37.rev.sfr.net. [37.66.34.203])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c7d38f7sm2549407a12.88.2024.07.20.01.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 01:19:06 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 20 Jul 2024 10:18:38 +0200
Message-ID: <20240720081839.1594227-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721463547; x=1722068347; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cdkcqcil1KlQDWDhPlCgee3qFi0cB47pK3y1Mnh/6yk=;
 b=LiddZRpJphJvFbJHud5WwNNFtsf6Wxly2TElKAdhveS1TfyTitxGepsrYwFTu23lgt
 vjBQPtoK+Pj0jjMU0tmNp1g9DTMXjvIm57jhCcy71GWp1Ka5FWmW+i8AFMGQm0qSZyqU
 6jpJa1nfj26B106vOxnb72hFEXNCS98tlB1Ndeanhx0IVJ+XnCR68idQPkO4o3yC84Q8
 LOLCaB+1Unf/cvDjMvALtp0KiQEC64TR7DjehjPdvQG0QxIAZ1ySltQYQV9Y9Y64ZJW+
 nK2jwoFUnJBE0bWsy8jrliTtg5/ww72z6tmg4hJD4kXLHBvVWsjMtA5pSzA+xvKC0xPA
 aFCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=LiddZRpJ
Subject: [Buildroot] [PATCH] package/lynis: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                  |  1 +
 package/Config.in                           |  1 +
 package/lynis/Config.in                     | 16 ++++++++++++
 package/lynis/lynis.hash                    |  3 +++
 package/lynis/lynis.mk                      | 29 +++++++++++++++++++++
 support/testing/tests/package/test_lynis.py | 23 ++++++++++++++++
 6 files changed, 73 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

diff --git a/DEVELOPERS b/DEVELOPERS
index eb0c28aa4..d629f962d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,6 +1154,7 @@ F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
 F:	package/lzlib/
+F:	package/lynis/
 F:	package/moarvm/
 F:	package/mstpd/
 F:	package/netsurf/
diff --git a/package/Config.in b/package/Config.in
index 86f6a1e7f..2fd6f69e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2667,6 +2667,7 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
+	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/lynis/Config.in b/package/lynis/Config.in
new file mode 100644
index 000000000..f5a460207
--- /dev/null
+++ b/package/lynis/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LYNIS
+	bool "lynis"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_COREUTILS  # runtime (stat)
+	select BR2_PACKAGE_GAWK  # runtime (awk)
+	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
+	help
+	  Lynis is an auditing tool which tests and gathers (security)
+	  information from Unix based systems.
+	  Written in shell and running on system itself.
+
+	  Relevant optional dependency:
+
+	  - Busybox compiled with CONFIG_PGREP
+
+	  https://cisofy.com/lynis/
diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
new file mode 100644
index 000000000..57b8b9afc
--- /dev/null
+++ b/package/lynis/lynis.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ca38a27c9c92e78877be4ecffce25f3345a1d24bbcd68be66a3a600e2ff748d1  lynis-3.1.1.tar.gz
+sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
new file mode 100644
index 000000000..525691d71
--- /dev/null
+++ b/package/lynis/lynis.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# lynis
+#
+################################################################################
+
+LYNIS_VERSION = 3.1.1
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
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lynis.py b/support/testing/tests/package/test_lynis.py
new file mode 100644
index 000000000..27e92aec0
--- /dev/null
+++ b/support/testing/tests/package/test_lynis.py
@@ -0,0 +1,23 @@
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
+        self.assertRunOk("lynis show version", timeout=90)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
