Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED9E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE6360DD1;
	Sat, 20 Dec 2025 17:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id te-so62qqIOU; Sat, 20 Dec 2025 17:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EAB60DDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766252079;
	bh=lYoDWDSwl6mM1HCQYUENJSlxVWTw8OhSTs/AY4BfKE4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=b2VCwtoI7c19BHIqlCijEeNaSZcE38ch5ahcTtNz/CYYroUwblvNHmjBy6f37+j/P
	 iWHakt5adPWLLsTPdO+U8FnG5mjFUSd436YSGhnQ91sYJJAyD7gJNKVnQg8uqXAGjG
	 WNydjVTgCc7daWWQ10Cr/btHn/+WOxmFHQxFr/7HRXU6iwfxOrEryd74hjwUN7XsUt
	 kPAGx2M1SwApaQvmYSN3dx/GPnfJu0CwrA34IbzTaeiixXvMwP46CF8X1qNH/bs+KR
	 fjUCyugEvH2UmDjLzLVFDVpqdpTizt1qYE8QW0ijeQwjvN7VSCLj8AcC0N8RsgvHod
	 iAC4Q9wE9BUSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86EAB60DDC;
	Sat, 20 Dec 2025 17:34:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C4D2119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E744980FA1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhJemS1b-hJ7 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F1FD80FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F1FD80FFE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F1FD80FFE
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2014160f8f.1
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 09:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766252071; x=1766856871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MVN6ZSVPHJtk7tZukqHysvrHJs2WXf/k6CIj+cJkNZE=;
 b=B+ah6uafQL5a+R/OCqk0mOa5MIskw5KweN6ku17Xrb2ExFU4SZwcr9pPo6h/VPBtIr
 qeBIo9sElcbXvohAayeeduoVLBVaoQq+x1gB53Wxvz5UudpWpx5EOofRjBbMUST5PdlI
 9SxG7vNpn55P1jPxsYf4bLCj5Huu4umnGXT+p7RKE6u/nJh9NGuQXCOGWLXpyM55bXwe
 PAOFR93TqZO7vaUoomRTXO/U/M2fu9d1jUBdxd27DnyfizYD2mcigFpZaWShoCf6XSAa
 O//+QSFqPDk7CcY+zMhAOEVtm2wlGW4Sm/9WdNdKuNHGd14EVW5kyYHbXgOlYdn37iD5
 uSpQ==
X-Gm-Message-State: AOJu0YwEd98Wb1vwVKmFuWHaDput5NPaCLs3awRobCbuC3ZSMIEHSimM
 0K4sHn4utf1X9u/qEdujrDsSmO+49NFTWuh0jFWHuWTGicsv3cIq67GWS7aLlsPHeVvMZB++KC7
 SMcvZsA==
X-Gm-Gg: AY/fxX6002yR8EGI6l3ODrxlGTGQEKEo1MzF7cg7cPrcr+gaviULPgE0YT0+/sz3ZXZ
 EORZFHJ33KS6lhOTwfTcEJZPIKe7V59sWwW9uc5F+ivJZSRx9EGb9H/6cm4iQb40J0KdvJR1Szb
 JsQkLyAGpZev7Yd7ZHDJteIGgelvUPgj3YEqoftygSaAjBwqQQ/3yluJM9wdjO0SD1xFab8Nkq/
 q7ydYHoQMwuGJk0l2xBuI4oDW0H2ml8tX2kzKD+nLHKdf7tihMg7WAXiX/asfsyF5fFxUyp7E2f
 +1PL4DELx9ADvxPAd2jts6R/iJI/YEnlWjHawD2tAuM3WhvcRx023dIIY02H368TRnCtL2asK1o
 4EtOxpqPfQlJ6WSugH/JZDk691uIEa2ySxhQgLTWU/arh31SjJmV7OPCWaSj3AH5l7hWZkDnK7w
 e5kz0hGbKYcdMuEJSRpwEDbqntSEyDNfXWzTY=
X-Google-Smtp-Source: AGHT+IEGO4YRG/kRXXBps9T/in91ICt4oa5kUgZ03zvSqMu3AMcsuscxoFCIVFasO9jqXIyrUYkaVw==
X-Received: by 2002:a05:6000:2c01:b0:431:92e:1d44 with SMTP id
 ffacd0b85a97d-4324e4cbc63mr6314248f8f.20.1766252070766; 
 Sat, 20 Dec 2025 09:34:30 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325dbc522esm1036447f8f.11.2025.12.20.09.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 09:34:30 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 18:34:12 +0100
Message-ID: <20251220173412.433583-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220173412.433583-1-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766252071; x=1766856871; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVN6ZSVPHJtk7tZukqHysvrHJs2WXf/k6CIj+cJkNZE=;
 b=fO6IY45R9PlmgzwesqPPSHgpyTNQTmKXLAEjXfBrACkzms31irTPmMveTABtF7SJ+X
 xIslyhDveAVLOpzIOqGzr8GKBU39qesKwIy5gtL6IQvVbHRKnQZZo1ls1gnobhjwk1T/
 Gpott0bPZ+6sG+XAp+xpaxiI6Ns89rfN17QJBk5JRxjg6ysoNYBK3XvozkemhmBYLRu2
 1zfDdYTq8KMDKXMbYNh6p1CghZ+O6gX7GxQqvjwRwnGcO2dxii3Q174HVLoPiqq2dutB
 V3v7uVGVFvZWGzXPJ+8NNdE33HyCtu44EUz4b7TL2A6xa9bQpro519wtGonH+PFiH769
 8rhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=fO6IY45R
Subject: [Buildroot] [PATCH 4/4] package/janet-spork: new package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  5 ++++
 package/janet-spork/Config.in                 |  6 +++++
 package/janet-spork/janet-spork.hash          |  3 +++
 package/janet-spork/janet-spork.mk            | 12 +++++++++
 .../testing/tests/package/test_janet_spork.py | 26 +++++++++++++++++++
 6 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/janet-spork/Config.in
 create mode 100644 package/janet-spork/janet-spork.hash
 create mode 100644 package/janet-spork/janet-spork.mk
 create mode 100644 support/testing/tests/package/test_janet_spork.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 20c3550cc..1a5fb19d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,7 +1171,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/graphene/
-F:	package/janet/
+F:	package/janet*
 F:	package/jpm/
 F:	package/libgtk4/
 F:	package/libtomcrypt/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0..c2ade1f09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -693,6 +693,11 @@ endif
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/janet/Config.in"
+if BR2_PACKAGE_JANET
+menu "Janet libraries/modules"
+	source "package/janet-spork/Config.in"
+endmenu
+endif
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
diff --git a/package/janet-spork/Config.in b/package/janet-spork/Config.in
new file mode 100644
index 000000000..9a7261e26
--- /dev/null
+++ b/package/janet-spork/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JANET_SPORK
+	bool "janet-spork"
+	help
+	  Various Janet utility modules - the official "Contrib" library.
+
+	  https://github.com/janet-lang/spork
diff --git a/package/janet-spork/janet-spork.hash b/package/janet-spork/janet-spork.hash
new file mode 100644
index 000000000..5c4d0358f
--- /dev/null
+++ b/package/janet-spork/janet-spork.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0d3ae19b252997be1f1e0f5285a1340df53771f6c7ceb5d4bd9cb3501d6b3f25  janet-spork-1.1.1.tar.gz
+sha256  c92ff452e04f8c6f6c3727afc841fa85f92214a0214b41522d16a4b8143487f3  LICENSE
diff --git a/package/janet-spork/janet-spork.mk b/package/janet-spork/janet-spork.mk
new file mode 100644
index 000000000..db8f9de26
--- /dev/null
+++ b/package/janet-spork/janet-spork.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# janet-spork
+#
+################################################################################
+
+JANET_SPORK_VERSION = 1.1.1
+JANET_SPORK_SITE = $(call github,janet-lang,spork,v$(JANET_SPORK_VERSION))
+JANET_SPORK_LICENSE = MIT
+JANET_SPORK_LICENSE_FILES = LICENSE
+
+$(eval $(janet-package))
diff --git a/support/testing/tests/package/test_janet_spork.py b/support/testing/tests/package/test_janet_spork.py
new file mode 100644
index 000000000..59a8380b3
--- /dev/null
+++ b/support/testing/tests/package/test_janet_spork.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestJanetSpork(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_JANET=y
+        BR2_PACKAGE_JANET_SPORK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("janet --version")
+        self.assertRunOk("janet -l spork/version -e '(print text)'")  # spork/version.janet
+        self.assertRunOk("janet -l spork/zip -e '(compress :test)'")  # spork/zip.so
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
