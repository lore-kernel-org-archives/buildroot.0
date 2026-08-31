Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAB0C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 21:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B0B80B03;
	Mon, 31 Aug 2026 21:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giO61pY4jkHU; Mon, 31 Aug 2026 21:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788212655;
	bh=Im+lSILhAzgI9rJhAuwEsonlIEzqaG9k+wdyZJiw9Zc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O420wc2f16NOnQvu/o+F+kugzb0uYAZnqOvAzwygk8YjPXO1/qSR7W7+4l0Vq+id0
	 zReeM7drbk/tuSnmW+R6FsoKzaUr3QLX3HY78wqmN0dJ7TuPTZ9XGUwfyoyS8vk2Ib
	 fJesGRsckJL7DF6PiyjQkDoCaGFvnumhqWZJAw3K2YDOALJZtNLGXRznA4/ecqwRqd
	 czwMIOsg0A4MWm/dET5YYT9Fj9F4kB703WfWgVy8ifl7lGQ2UDzzNpPGTynRgZl6qd
	 Aek+nX0Ovji1Lls1wyQzL86CFtEsquLZ8rgexN+xPNe01FZchuVjK+3urmRZYqL0AC
	 C+xIxSK3/LBxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A530C80ADC;
	Mon, 31 Aug 2026 21:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 578D023E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DA6360665
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wU_z9x1M3YhQ for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 21:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LL8obHCW
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D17B60640
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:44:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48431648f33so272443f8f.0
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788212651; x=1788817451; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=u/5TRTFwvegZojxdvDo7HtGZLY0gsRTRQty26vnLf24=;
 b=LL8obHCWSzOm7Sv/y6/9diHej5PbKoB0QluOF1gz4D/A6VOdWnK6X6fuqFlcbbDp5D
 368HWU5jAVDicgZOj8sH/lj3XqnaeO2aFlDlMGkUF9h2kJ0zvj7Rt4oTykp3CosbmWUZ
 Cz7XSV3Wv6Ml+7+Nc9wtlhokzHn//+yLdoUctrG3T/NTRKRr4gntcBnLLXUJVx5w2mWe
 BihOO6afPYgrP5xKYPjFdRJy4/kFGAUu+1YnH6xWw0HfrLmT10vyyqTil+q3+k3YXuro
 E8HxgqJfrqab9JX9rlN0gmzsflPTik8mp9+WV2K89nWN+wHMQ+dNBr1KTYJVs5yT3lUg
 Jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788212651; x=1788817451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u/5TRTFwvegZojxdvDo7HtGZLY0gsRTRQty26vnLf24=;
 b=mP8sEfhrINu0RT/tSaqNlYzOAT2uZ/8zZOFrKLDYLZL2kZFR2Kljaw8C5wAqeMdJ70
 Fum0+jGG+S5UJcyvShjYhCoXYuHBwhrzjURL+iQBd7A7hc9NPZoBx6Lnq80gClTNposR
 BgmA3G1TMDhaZdcksbl3R6HoNqOBP16uW+FGlaFJlSaCvhYktLjn61D9HzTwmCnmsJ4z
 kYoIQ+RGFElECL1Ep+2sttMGUWdMekUTTedjwwbnNi1m9wxtdobSivZRJMBcmiwFG8jR
 MxZDaW4qA28xvph8oKGduUWvKPPX2EtpmcnbLATRbmX1LyYPQq7dcbcKgFNxw4z3641X
 2Kcg==
X-Gm-Message-State: AFuF++kL8qMN3GrHyHEF6EnI1Y8ReGpV3oFa+FPuq+MfL8ryJV7zm0iu
 1G7EG84TS+bhFomCajUQkM77EVSnICJGgbAWOw4YAP12p778ZGnFIUNdVgty+A==
X-Gm-Gg: AR+sD12XF5kbKaFNwlZZJ7bAy/boa9wgL7dMZbV80HnvAyT28M20oqxsffF9jmVmjqx
 G0wGT12A3tRfOUDLNJI4OBNApc4Yh1zxKMWe+7VmBgZWX0kQmqrPGe6Mt0D+JSAJ7oNs66VKLGf
 I1XcNobfE+eRMbfBypghzBzobcw7qektlz7I9b9bauml5Gj3EQ2+kNI3W3op6UHL9mrbOw4phQA
 CFiBmjqjRamlCSLnhzYQjPld+y/IF5opJhL6eYor3659Os2t7ddDIao4KlwNSe9q/0dPB6SmBqS
 87gG/pAxPdQ1dczGE/TzxVJit1tjTnZwZrgIdf2wZTRtqH1XaoYqYNsHxc6XsQ6jyEFXV0a16sl
 mXc4/qIBxpD1pKRgWWhceEUTIHLqcfmm2p7poCJF0iQ6+skqfBEn9foZg2MyI0V3tBj7ZGDXjs+
 can26nHSrcJ5CUSQe6EHcwAqxH784cj0ufirPxwKc+UAVP1FzxYOLxGUnaKO0uMiqSnRBYv9Kzk
 hAj5YD8g2Ka6vfz72UgLCHO4RZPOp3rv/pQMEsydera/5LhYGheiJS6CKiOXSV9QNixNhnWyPqw
 pHOex8v0KZnx3cFGhf0+gqP77gUb
X-Received: by 2002:a05:600c:8519:b0:49c:799a:177b with SMTP id
 5b1f17b1804b1-49cdd402618mr16709605e9.2.1788212650409; 
 Mon, 31 Aug 2026 14:44:10 -0700 (PDT)
Received: from trial.home (aki234.neoplus.adsl.tpnet.pl. [83.26.12.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce08862sm21062075e9.1.2026.08.31.14.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 14:44:10 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Mon, 31 Aug 2026 23:43:52 +0200
Message-ID: <20260831214351.3577118-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: add nano test
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

Add a basic runtime test for nano. The test attempts to write a file
using the editor.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_nano.py | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_nano.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 53104cc60b..0b5060f1fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1170,6 +1170,7 @@ F:	package/ser2net/
 
 N:	Franciszek Stachura <fbstachura@gmail.com>
 F:	support/testing/tests/package/test_memcached.py
+F:	support/testing/tests/package/test_nano.py
 
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
 F:	board/sipeed/licheepi_nano/
diff --git a/support/testing/tests/package/test_nano.py b/support/testing/tests/package/test_nano.py
new file mode 100644
index 0000000000..c1cc56d031
--- /dev/null
+++ b/support/testing/tests/package/test_nano.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestNano(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_NANO=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        cmd = "nano -V | grep 'GNU nano'"
+        self.assertRunOk(cmd)
+
+        self.emulator.qemu.sendline("nano")
+
+        # send file contents
+        self.emulator.qemu.send("test")
+        # ^X for exit
+        self.emulator.qemu.send(chr(0x18))
+        # y for 'Save modified buffer?'
+        self.emulator.qemu.send("y")
+        # target filename
+        self.emulator.qemu.send("file")
+        # ^M for enter
+        self.emulator.qemu.send(chr(0xd))
+
+        self.emulator.qemu.sendline("clear; reset")
+
+        # wait for prompt
+        self.emulator.qemu.expect("# ")
+
+        cmd = "cat file | grep '^test$'"
+        self.assertRunOk(cmd)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
