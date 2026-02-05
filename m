Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A75BECD996
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460626063E;
	Thu,  5 Feb 2026 18:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mk3lDxclrtcv; Thu,  5 Feb 2026 18:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BDC160D6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770317302;
	bh=y70pJ6MiTnKFjr7Hhc3qfp7iDorXk2OtTDsXpr9sFIo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mmr+/CkRfL3yzck9Me6fQAIdDkddFtqQ56vZ99R4G+/QlpEllQrQRzM1PFvwKCijv
	 Fwy9zWc3taKPbesKT9GNoXWy5BZQD4W1L6apc0rf3j6QxrKGopk8kaCywFq91Da8/+
	 xWUCpTYs3YXIZ4MyTI8IP82HTBktBr3mKymerfboaTdptxXaSF5zQOFgWn+WWDyeHw
	 5azHpydzrjdX/4fWUvsn70wdUXoMIA95FZGA1eHcHnQmycUH9rvSwBSFcwwfPb+UA9
	 Yz3W2so0HlJp1EMKh4cVLWZ7auhPaReGFc42hZkfhGji+xVJAokdoCD7QfIpc65IRZ
	 eCzQg+jGb0u5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BDC160D6B;
	Thu,  5 Feb 2026 18:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C640217A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A80D640232
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGwJETzHdtyT for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 18:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8E0940087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E0940087
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8E0940087
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:48:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so2039580a12.3
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 10:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770317297; x=1770922097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/fdMvtjrYZOTUizZrd/kBoRsel/Nd/GngJmdQ6FqnQ=;
 b=p/86b0yMdLABHy3bdHEr0pJpS5dplmwUiR+bdAmMFaZCOPzgXHQv1M9n6n7Kw8aPoi
 6RbERruZUvydv5Cz7OBeDQqEkTckJv57Jlw0GgqXn1SzAFljJ/YW8m1uPrFrbCc+10CJ
 o0xCRQTFmdBYoko0+bdAWFc6zJ6RKLwDl3pMcnlwAQxbktn5aOcBeoxvZsfbXB3RAJiA
 R5wzjfJFUzR2cRBrrzfrTrlxOj+bescuUGVs7WYeTjb3wzGjAwapGeWx347yRakxYZDy
 DqlARkm7apfkxA5rPZPQipjsbRtSu+qJEO7Ae8U5Ct2ly5qFunMfXQKaFEJ1pb6SnexA
 jgGA==
X-Gm-Message-State: AOJu0Yzuon17jFA5TSIBBNn/TF169IaQ9+VGe/FunwaFVH5opaUyitl3
 DvpRTy7mOEKiKDoK6iqShLAoO2fjXagvkm2p6CCWucls4qs+aCvAHhNCnZ7Rzg==
X-Gm-Gg: AZuq6aIt2vLcqS0EXhdot3wuEwgtPoIA+A3gB6+WUI+ktMOvpWSbUdhHVewPNXGGB02
 nD/nDRmkVjmsbYPgiVv9/mqIEYD68wGR1D566TkUFRQzMFRvxgHijVcHcNoWOT1cgv/drvccqeZ
 jWiq6YHd944lf+3UsBdAko2C1bqw8k6ybToykoRec4NKGwT4JRGmvkBDg8LmvR/aq6mUj8vKVjO
 pkkXxSGVAz/AlZT/ZwUu1vfhKj0STK9nvfFCbNPVIL7cum1TbVYM7WGvXBKzWxeOIMoA7d/KIAL
 1dY8oQFY9luZ9N+mZHi3uyBRz7+c6iCMi9UV79YpZEOWvbTJxHKcB+yYhoUiRP1wolGpjaKIEun
 x+mPEfX0Jdk/qZYCpHJukoSElLNHoREWaeyLlII1GN6HEgi7UXdJzUWUYGUkzPXZsARP3CglD4q
 LVc37vcDMH
X-Received: by 2002:a17:907:e0d8:b0:b8e:d13f:e20f with SMTP id
 a640c23a62f3a-b8ed13fe5c5mr72894166b.55.1770317297282; 
 Thu, 05 Feb 2026 10:48:17 -0800 (PST)
Received: from trial ([2a02:a311:4383:f700:e3c5:29dd:2134:1c1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf150csm8791266b.53.2026.02.05.10.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 10:48:16 -0800 (PST)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Thu,  5 Feb 2026 19:48:01 +0100
Message-ID: <20260205184800.3308827-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770317297; x=1770922097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/fdMvtjrYZOTUizZrd/kBoRsel/Nd/GngJmdQ6FqnQ=;
 b=hgIDQzqdm/68uwF2O7eQdO9HHw356lzT5b7SPiIeKzrSms2kbRpM32kNKYsaleWDcC
 BHr4QKr6iOfMOl8/dCt8fvHY5dnpqibODKiuTUBDNjU6lEozGKZPX/vlzWicG/o3/+ix
 Pm1T/5MFmWMvuFhAQKRF5g2VaT23xLCly50VVxMb/5vzq7eaUM4hjDViD/lE1mJmwN6y
 D6Tcsp90/SNTRPls7Eee4rV6+PS37gFCXQq6MZUxBtEV8tUifghlw4uJsf52fnTiTBrV
 i7BAD9SLFazQjenA3QRs9b6mleGi14BnlJTTpzbAg6287+TYCXy3EhNZyRlOqMCzAULA
 CSlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hgIDQzqd
Subject: [Buildroot] [PATCH] support/testing: add memcached test
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

Add a basic runtime test for memcached. The test starts memcached and
checks if it responds to a basic set/get request.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 .../testing/tests/package/test_memcached.py   | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 support/testing/tests/package/test_memcached.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8290ccc281..f2f3bb8e44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1160,6 +1160,9 @@ F:	package/tbb/
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
+N:	Franciszek Stachura <fbstachura@gmail.com>
+F:	support/testing/tests/package/test_memcached.py
+
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
 F:	board/sipeed/licheepi_nano/
 F:	board/visionfive2/
diff --git a/support/testing/tests/package/test_memcached.py b/support/testing/tests/package/test_memcached.py
new file mode 100644
index 0000000000..2d00e47ab4
--- /dev/null
+++ b/support/testing/tests/package/test_memcached.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestMemcached(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_MEMCACHED=y
+    BR2_PACKAGE_NETCAT=y
+    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        output, exit_code = self.emulator.run("memcached -u root &")
+
+        set_key_cmd = "set test_key 0 100 10\\r\\ntest_value\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{set_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), 'STORED')
+
+        get_key_cmd = "get test_key\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{get_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[2].strip(), 'test_value')
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
