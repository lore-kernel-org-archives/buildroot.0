Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09EACF9C5F
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 18:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 538296084C;
	Fri, 20 Sep 2024 18:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IN3gnoLmtOtS; Fri, 20 Sep 2024 18:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4EF46F4BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4EF46F4BA;
	Fri, 20 Sep 2024 18:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB171BF593
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B98A84BEA
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQlQnjp7BWXF for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 18:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0011A84463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0011A84463
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0011A84463
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 18:12:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374c7e64b60so1333629f8f.2
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 11:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726855962; x=1727460762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ID4ihN4JbsHnStah184wmoYLg3LTqchWnObXDiIZlMQ=;
 b=JvT/AUO3RYEe4X/GpAwnrbWp2IViT601hWkkANXwH5mJD4EIzOOArTjJgSYxO+Er+k
 3w+oLN5fW2BavaR0NREb58Xwl0aXD7/hJP+33jfp49EIMGnmquvH64tE6p3sihSbBK+N
 7i6H6dvR7+CTq3VBs9BZkmgKubF2mdpjQguJomGYgQZDkTowOMCoggXl/z21jkotuid8
 5ReoHQxdAMm8v10/wKuVLPwNel40YPZvUUSKzVY7BVA2Yar5uvWLh3GHtvCtnXbZLk4M
 Nyzz7gYIyLF7OsoXE5AEERYmndaS9Oph5T5wvG3gutTMUhlFTlYgMrflhaZgme0lwaXO
 e1kA==
X-Gm-Message-State: AOJu0YwPqxhoX45q/+f/eup3cu8wuAopXvLmw+vZ5VGzxec3u+oit4DL
 4IMgyAyCqkvCL8ET6F71Cv9JzTXPM53owWQiFQslA3oa+7SCa1bO5HRUz0bk7bzD3Ag8ckCf/yS
 FVw==
X-Google-Smtp-Source: AGHT+IGQwAaGWCdlO51xSSjGOZQAwuu8vEcF3KeLGJ2DQMfe/GKIlOkPDsf9bGVNi7aamGlYHLL/vQ==
X-Received: by 2002:adf:eb8a:0:b0:374:c05f:231d with SMTP id
 ffacd0b85a97d-37a41fdbacfmr1901524f8f.0.1726855961705; 
 Fri, 20 Sep 2024 11:12:41 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7af898fasm29548805e9.15.2024.09.20.11.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 11:12:40 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Sep 2024 20:12:12 +0200
Message-ID: <20240920181212.3572055-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920181212.3572055-1-francois.perrad@gadz.org>
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726855962; x=1727460762; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ID4ihN4JbsHnStah184wmoYLg3LTqchWnObXDiIZlMQ=;
 b=oySkgH19czNhfVZ0Goh8+IHO/eSaU6oC9Wpf+0R2TdjA1IyTBjixgxN3i9gEsdI6aW
 ZQvoVcDt2jdIScyW26+vYtxEVUv/XzXjcsH8X4pFoSMFrFl/e5RzKqZRoToIxPyAfPFY
 kpgNf7KEWjwp5NRn1c507T3AEJr0JwX2XQ8sv2ooH47el3qQOl64YlDbelHjthuoqM3n
 pg1oPDIlrMPSXZjbuzvVutjOCBskY+iAAUg58K0ZVjoT22BsZAWwmudZvxUNgxQGMRTs
 qgS7C+sBexYEKIgkaJLDBG8Mb5NEh9c25felQbd9f2LQcG3Dg2mxlb3Z1rq+F8X9KID5
 VgNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=oySkgH19
Subject: [Buildroot] [PATCH v2 2/2] package/lynis: new package
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
 package/lynis/Config.in                     | 11 ++++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 41 +++++++++++++++++++++
 support/testing/tests/package/test_lynis.py | 23 ++++++++++++
 6 files changed, 80 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 069965680..9c6c8c30b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,6 +1167,7 @@ F:	package/lpty/
 F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
+F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
 F:	package/mstpd/
diff --git a/package/Config.in b/package/Config.in
index 6ceb826e9..35ed324c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2700,6 +2700,7 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
+	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/lynis/Config.in b/package/lynis/Config.in
new file mode 100644
index 000000000..3f64bc2e1
--- /dev/null
+++ b/package/lynis/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LYNIS
+	bool "lynis"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_COREUTILS  # runtime (stat)
+	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
+	help
+	  Lynis is an auditing tool which tests and gathers (security)
+	  information from Unix based systems.
+	  Written in shell and running on system itself.
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
index 000000000..b62911453
--- /dev/null
+++ b/package/lynis/lynis.mk
@@ -0,0 +1,41 @@
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
+ifneq ($(BR2_PACKAGE_GAWK),y)
+define LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AWK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_AWK_LIBM)
+endef
+endif
+
+define LYNIS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PGREP)
+	$(LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS)
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
