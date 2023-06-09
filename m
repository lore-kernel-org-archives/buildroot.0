Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C0C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 17:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA2983C1A;
	Fri,  9 Jun 2023 17:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA2983C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4VdxmZpOYqc; Fri,  9 Jun 2023 17:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E368B842B3;
	Fri,  9 Jun 2023 17:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E368B842B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECF701BF37B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F75600C5
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F75600C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m91J4Rm09bv5 for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09FF600C7
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E09FF600C7
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 17:50:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ae4ec1ac7so1438546f8f.2
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 10:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686333002; x=1688925002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iir68XajEe2nCCwttcCmU6Xg6GVCZfKSl2FZgLa/vc=;
 b=KVWwcQwmRDtyAVryMFfUXN+RGPXoanbz7HPxHE71dcI9ErDOTafWJR6WXUuueyJ4m+
 874SRls/rp7N/4fRd0FGSiJdJuWWcA5FrFGpUIwdeDjHS8tjz4hS2/wm2hyH2pMxIG5Q
 sJUVvv5H1lt/JmLTdVs+gI0ll1Vt8bf5K2brGYZ0+/RlhRQBKt/wjXIxfhbSNOfYz1ul
 4riLm5RwlzGNv7B8s2O+yLBmhKrzuE3896zfyqpqcf+/dFe7r9MHPCJ93cY9kF5fhIny
 Ije/E0sWCY/V+7FTcbcgeJdWfBJLdcqkcTyGQ6BKsinjPVK1yi2nOYCZu7W2HGxFBmhs
 6uTw==
X-Gm-Message-State: AC+VfDy9SdfWH1GacIK7o4aDoKzUZa70RcxV7ss+Q+S9RiIIy1Jx5hVi
 TGllL9sXqi/S8qPRjv854VM7za4jSRQ=
X-Google-Smtp-Source: ACHHUZ7FqAp3z5YP9ONjcy3TlziN7N6fZ6x2xj08vDXe/dFR0sfY+zc8Ux7OKD92PiBcnS2nZ0DKRg==
X-Received: by 2002:a5d:4e88:0:b0:309:41d8:eec4 with SMTP id
 e8-20020a5d4e88000000b0030941d8eec4mr1219736wru.39.1686333001927; 
 Fri, 09 Jun 2023 10:50:01 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00307c46f4f08sm5048877wrs.79.2023.06.09.10.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:50:01 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 19:49:55 +0200
Message-Id: <20230609174955.409551-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609174955.409551-1-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686333002; x=1688925002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iir68XajEe2nCCwttcCmU6Xg6GVCZfKSl2FZgLa/vc=;
 b=XM6ZUVLMXp69LCs4xBguyI7vum4hgynsUpJ6fz+qqdnfMCMVCdeyy/o2wmmsS13omd
 4yUBLkQ1PVvnogmTMobLB70x9PMG8R2oXNvNWXOIgn2GgD+CuE2TY9ZtOXpqYmoIRMmP
 o0JToL0wwxE0RPxkfu+MCa+gvsWebVDHD4CFen3hXj+7z9Ah+POCZWLGiE2XsECOGvX3
 h+1G44M8oBbz3hWq0LMq4D51U0i6xw7qSD9r4uzglAd0Fh1TAM818ZASFcfOlCOlrIpG
 n/mS88kt0U2j0UOEUiuDmFNmXCoa5fqWfw0AA5ivhcLJ07vSEPV+XQB7WfFXt8u07Y91
 HyGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XM6ZUVLM
Subject: [Buildroot] [PATCH 4/4] support/testing: TestPythonPy3MakoExt: add
 a test for mako external plugin (pygmentsplugin, babel)
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mako provide some external plugins that requires additionnal and
optionnal runtime dependencies.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../testing/tests/package/sample_python_mako_ext.py  |  3 +++
 support/testing/tests/package/test_python_mako.py    | 12 ++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_mako_ext.py

diff --git a/support/testing/tests/package/sample_python_mako_ext.py b/support/testing/tests/package/sample_python_mako_ext.py
new file mode 100644
index 0000000000..5b06a28181
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mako_ext.py
@@ -0,0 +1,3 @@
+from mako import runtime
+import mako.ext.pygmentplugin
+import mako.ext.babelplugin
diff --git a/support/testing/tests/package/test_python_mako.py b/support/testing/tests/package/test_python_mako.py
index b6075bde6a..f1031d1d59 100644
--- a/support/testing/tests/package/test_python_mako.py
+++ b/support/testing/tests/package/test_python_mako.py
@@ -10,3 +10,15 @@ class TestPythonPy3Mako(TestPythonPackageBase):
         """
     sample_scripts = ["tests/package/sample_python_mako.py"]
     timeout = 30
+
+class TestPythonPy3MakoExt(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAKO=y
+        BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN=y
+        BR2_PACKAGE_PYTHON_MAKO_EXT_BABELPLUGIN=y
+        """
+    sample_scripts = ["tests/package/sample_python_mako_ext.py"]
+    timeout = 30
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
