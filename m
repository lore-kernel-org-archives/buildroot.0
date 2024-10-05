Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D55CFB421
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 16:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E973E60688;
	Sat,  5 Oct 2024 16:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEeIq550SKGR; Sat,  5 Oct 2024 16:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3629606CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3629606CC;
	Sat,  5 Oct 2024 16:59:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82B271BF29C
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7274F4026A
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xotHrShQcbSy for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 16:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AEDD401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEDD401F6
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AEDD401F6
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 16:59:06 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a34ccc6a9aso10353335ab.1
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 09:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728147545; x=1728752345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TS1dcpk371Jil7a756NrRxLu4zhONcCZiSOsv08Hcw=;
 b=itSkC1fg5uClAq3njbEurgodSZbn3y2Tej9IYrEuF7gGD3t4J+pUlPwcOKiBEdD645
 CjMC848cYg8wNnWBcCW8KS2Gxu25JCAPDZIejRjRnpJ6O5WKjWAAvs/26oJQR5nlm2lH
 P/gAMnxonCIOp65W3Kv+ITE7tJ2OaP3IlAKVwBXav9FkoghusrrylmATsgAOM5Zz1W5J
 WSjMUH8mVOJ1IRyfbCkmWS8fRKlqZbzL9VhomraGe6iFxdbWubMx1I+vQ1+mBp53tCPZ
 bZuBuP4p3BVYJH2s4o1YbXGcYwTR6Q9kHgLWTOSU/5gLbduZ2bjCEg5fWWNUymqJNBQn
 tIoQ==
X-Gm-Message-State: AOJu0Yy6tmQSga99IvxZ0NWDgyoLSxLDMg5Y2+SF4O4SowlGwCOxCq+1
 /WYZ9//pYiDTZ3tZRucFztCpAz6Q39SpNNLG9vYbWus8Q/w/uFlS
X-Google-Smtp-Source: AGHT+IH+kYoj6GbpRz+EYA0O4OAq/qoBAGXR5xZ8y4yBRmTSPGZzZpbSCMID7ttxiH7m0Ty46R6iLg==
X-Received: by 2002:a05:6e02:12e5:b0:3a1:d180:15b4 with SMTP id
 e9e14a558f8ab-3a375bd2fb8mr55239755ab.23.1728147544900; 
 Sat, 05 Oct 2024 09:59:04 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a8750a5sm5200455ab.80.2024.10.05.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 09:59:04 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 05 Oct 2024 11:58:44 -0500
MIME-Version: 1.0
Message-Id: <20241005-dtc-1-7-1-v1-1-89550f828a4c@gmail.com>
References: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
In-Reply-To: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728147545; x=1728752345; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TS1dcpk371Jil7a756NrRxLu4zhONcCZiSOsv08Hcw=;
 b=EC6HcRF8anZU7O8gNt7QwKU02mghB+u0Fplc9aD3XEyo96cuaM8s71kKPqW18o1F6w
 oPASc/93dBygELbvoL3C2APuhgjqEBVEomUf9eIrojw6d5gIyoJ0yrndk2U9zFPwYeWS
 xm0b5QWGYsoFcqyma6b3CNaqDnTUWtGXFaRkih8qj09FDy6aGbmjOgcGkFHPFe8hsrF9
 Hkcyw5kjG+nomE9WzGoGIPXrRBud4LKD4uQGLKMsEuXyui2eq1pFD010O61LXjFymxLt
 LE/6DmuNLFub4i/o1BCsC3lA/doGqljUxhRpUrQX9HfXLKVPiErSR1FNH/Vf/JMIWtRW
 6qLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EC6HcRF8
Subject: [Buildroot] [PATCH RESEND 1/2] support/testing: add new test for dtc
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
Cc: Brandon Maier <brandon.maier@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a test that runs the dtc commandline tools. To test devicetree
compilation, we use an example devicetree from the dtc project. The
example source is GPL-2.0+ licensed.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 support/testing/tests/package/test_dtc.py          | 40 ++++++++++++++++++
 .../package/test_dtc/rootfs-overlay/test_tree1.dts | 48 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/support/testing/tests/package/test_dtc.py b/support/testing/tests/package/test_dtc.py
new file mode 100644
index 0000000000000000000000000000000000000000..75dbd4a779f5baab9ef40d6ad100ca693f97c0b9
--- /dev/null
+++ b/support/testing/tests/package/test_dtc.py
@@ -0,0 +1,40 @@
+import os
+
+import infra.basetest
+
+
+class TestDtc(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DTC=y
+        BR2_PACKAGE_DTC_PROGRAMS=y
+        BR2_ROOTFS_OVERLAY="{}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """.format(
+           # overlay to add a bats test suite
+           infra.filepath("tests/package/test_dtc/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        # Test 'dtc'
+        self.assertRunOk("dtc -I dts -O dtb -o /tmp/test_tree1.dtb /test_tree1.dts")
+
+        # Test 'fdtdump'
+        self.assertRunOk("fdtdump /tmp/test_tree1.dtb")
+
+        # Test 'fdtget'
+        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
+        self.assertEqual(out[0].strip(), "test_tree1")
+
+        # Test 'fdtput'
+        self.assertRunOk("fdtput -t s /tmp/test_tree1.dtb / compatible 'test set compatible'")
+        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
+        self.assertEqual(out[0].strip(), "test set compatible")
+
diff --git a/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6649e7cc0fedc52e15dc7de7dd726272d3349c48
--- /dev/null
+++ b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
@@ -0,0 +1,48 @@
+/* From https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/tests/test_tree1.dts?id=99031e3a4a6e479466ae795790b44727434ca27d */
+
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
+	prop-str = "hello world";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			placeholder = "this is a placeholder string", "string2";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		reg = <2>;
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ssn0: subsubnode@0 {
+			reg = <0>;
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
