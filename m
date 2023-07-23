Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F890C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 11:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03BE140A9B;
	Sun, 23 Jul 2023 11:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03BE140A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ownbF8I8Lqgk; Sun, 23 Jul 2023 11:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2472D40A91;
	Sun, 23 Jul 2023 11:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2472D40A91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE1C21BF3B9
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7EE181D7C
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EE181D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXBm0wNrFphM for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 11:22:45 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02E8381D70
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 11:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E8381D70
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991da766865so584139666b.0
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 04:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690111363; x=1690716163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5b70ihbYYTgHRL+pO0waj1PW9sIkbH+FfMvQe8PQQFw=;
 b=k2O49p24eE6gOLFMIVIm8+SK48ESuBjMWaS1cMEEPQoLtLdslPGfiONXwhjkJ+s09N
 pBYzu/4GOLviqc3gNCsPpIAR+lH92FN5izaKN5Cdre/R2NDPiKZiKgWbBD6RCFXJXm6e
 XBNlMD9nAFOQ9ZWRHFKeCRBYnPadMMi3l4nGNzuml4RFbRkRwKsez6sHNofQBLKMnTHL
 re3jwBohXZXavgLFWePzw4yVW+qiHs7lKzwD3HlJKwXApz5Q7y7n9xZAmKfe0u2ABpQj
 oe47xHIe/5E7IMQv0okuiV/ZuLh3I3cWs+s9JAMdBKPSeRmHGGIbsX+dcl+4Zbm3vTQm
 TkYw==
X-Gm-Message-State: ABy/qLbUN/mKiZQNbEnOHzBxFyde1Gv9ayvs9O8NnW6MWq3jLq/5ESJF
 ZjBIH4HXovl1gjnKOIYA0EMaj+FvVUo=
X-Google-Smtp-Source: APBJJlFxaiM9nbDHu1Dg0BJfPAYPQNbKNIRzydOYh31UtmmC59Mbp6HoxZ65xrcZoStjg10d7hoo1w==
X-Received: by 2002:a17:907:2718:b0:993:f15f:efb7 with SMTP id
 w24-20020a170907271800b00993f15fefb7mr7773800ejk.8.1690111362577; 
 Sun, 23 Jul 2023 04:22:42 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 h19-20020a1709063c1300b009828e26e519sm4924166ejg.122.2023.07.23.04.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 04:22:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 13:21:59 +0200
Message-Id: <20230723112159.3816711-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1690111363; x=1690716163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5b70ihbYYTgHRL+pO0waj1PW9sIkbH+FfMvQe8PQQFw=;
 b=Zt2/3HGFHJTVUHUGdp4QyQLtT2rvOgyLxHWNzBmJYgeXy0JDtpVpnKsjZ/LfsB0cR6
 Yy2wLTINgN6samZXnZ/98g2MdcLfyJf08vjSspLxecEMvxaus2oKr2G/G/kbkv7HuMNH
 UROjPWMUqSsXRrqeIj9Nx5nNV2jTpyfRWL/owZ2Tseo0dAmr1MymHECInNv4wvltDNwF
 cvH3NJpicLzeBWO/Qcu1QWx3GU3yB33XIf3BhoO4O8rPhtbqIFtKcjpTEuVIMxntaatZ
 W6gIBwRgW59DKiz4TO1LrDbsk/ARVrntOPBBNPRdUB5iZfirp1u/9oa6EPkGzC8M6pTi
 x3Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Zt2/3HGF
Subject: [Buildroot] [PATCH] support/testing: add test for python-pysmb
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pysmb.py |  2 ++
 support/testing/tests/package/test_python_pysmb.py   | 12 ++++++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pysmb.py
 create mode 100644 support/testing/tests/package/test_python_pysmb.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a6644819bd..58c8b4c8aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3146,11 +3146,13 @@ F:	package/zlog/
 F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
 F:	support/testing/tests/package/sample_python_munch.py
+F:	support/testing/tests/package/sample_python_pysmb.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
 F:	support/testing/tests/package/test_python_munch.py
+F:	support/testing/tests/package/test_python_pysmb.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_pysmb.py b/support/testing/tests/package/sample_python_pysmb.py
new file mode 100644
index 0000000000..68767f252a
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pysmb.py
@@ -0,0 +1,2 @@
+from nmb.NetBIOS import NetBIOS
+from smb.SMBHandler import SMBHandler
diff --git a/support/testing/tests/package/test_python_pysmb.py b/support/testing/tests/package/test_python_pysmb.py
new file mode 100644
index 0000000000..cc4c7fb1e5
--- /dev/null
+++ b/support/testing/tests/package/test_python_pysmb.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pysmb(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYSMB=y
+        """
+    sample_scripts = ["tests/package/sample_python_pysmb.py"]
+    timeout = 40
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
