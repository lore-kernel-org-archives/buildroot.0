Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D468E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1CA81649;
	Mon, 23 Dec 2024 14:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oQIQg9rSwSp; Mon, 23 Dec 2024 14:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B07D815E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B07D815E7;
	Mon, 23 Dec 2024 14:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00353757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55D9814B3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5zjhlAah8jn for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0E1E8149C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E1E8149C
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E1E8149C
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:51 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so159678039f.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965390; x=1735570190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYt7OPh1Qn39FBzP1uQGTxs2X5aG2bmy2FP2Py5NjGQ=;
 b=DlFCEKk9yLOFdFSDDjGYM6iIY3os7jkBsAl3Gy7GVGMnYEfGJeKQM+esNfcVZ3jF7O
 95so9BvUAMLjlO//i/35NDjcm5epjf2XHGHQoamhQ+PZYGIG/PdSulVlPRDvH/aoxs5f
 sDTuEYemAfc9ZsO4uHm1L6q/6OfLcD+eIVeOGnuhxN/R15wDfqg+AhlxOR0zP5BTUFG8
 qH58tYGom54FrxtE7RKEpGgshcclkyITQgN/Mg0CrgSeNevyB2BhXu/y4ju3TwZ47OiH
 8XaDboByz6EO7knbmVSOHm+u0xggzb8E/9GPAOp/ega109yoRcpa391QJzoif/6pjttp
 AGeQ==
X-Gm-Message-State: AOJu0YxjIj+/4TB4pKTqkU3Z1MlLXtayR67nlG05X9+HBaLPVmZdqNhI
 tXOH6J4jopTcqr+YvGaXDkXQ8dh5g9m0koZWhkMxqd7ByADZ1CovW23HIr0AY2o=
X-Gm-Gg: ASbGnct6uTEpsYpvHaqm5MyuUmeLXOF4bpz5U+T8tmXTxWdyfn1emaNZoJW4m1xr0Hd
 oGgFBSxbA9q9sav8E2SWS3psX3xY1kJeL+oLdaan9rjJIgxpdlzTTP8pVXw+nK4wpln1/6Yaby9
 87EcOicOUKSPIDMwDQ19jtHpecy9EEzXiKXCxAb6hvCHn20bKdc/6AUTXqMjoZvcpWtW3aC3JGk
 tHCVTrqKZp0M1JReSH4sywnhAOWCcua+y3KJx27BA2g9FWXPOsR/4LSpGDUecjURWQkkr/4mQqS
 1Uqx6u08itkABJKeHsbDiW5yRyZ5OwVpGQ==
X-Google-Smtp-Source: AGHT+IHSh0X8g6d0f86L+lyEAIVU1Jm606fwF7Wc3Ma+09E1YR7qfreEguosLfwHhcZNV4w70KMv7w==
X-Received: by 2002:a05:6602:3f95:b0:83b:5306:d24d with SMTP id
 ca18e2360f4ac-8499eb0ef09mr949374339f.6.1734965390474; 
 Mon, 23 Dec 2024 06:49:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8498d9028ddsm220073639f.50.2024.12.23.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:49:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:49:38 -0700
Message-Id: <20241223144939.1719298-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734965390; x=1735570190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IYt7OPh1Qn39FBzP1uQGTxs2X5aG2bmy2FP2Py5NjGQ=;
 b=fxysBQ/AU7+3/bORBYHS1MdNonyQ/fpVwobis73ulgPPYutLKT5qlmJHHPcgNi8DX5
 8eodH8Ck4z36SSE/FsxzoOlcZYNe4N5iYHN2tofSeqH9bp8UyrILBLK0cDU6qB7G/D/J
 +6gnibNtkMAHr73OkWp0tUMNIskA8Ffu/RuwCPHg8SBMe47oTqPdJo5+A25AtiynIFNu
 w35i7uFoGqa10gX4BU2B9N775RiA/XG/zRaZrUBBiMgTrEx6+Q/agEJkK9CxNS/yD01P
 wF4WhbmICS74Q4y7BkRvopZcGoHZ4Hk1CXjxyyRlhasRXRnnqmWiyBM58wGQuULE4ALs
 jE5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fxysBQ/A
Subject: [Buildroot] [PATCH 1/2] package/python-telnetlib3: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-telnetlib3/Config.in              |  6 ++++++
 package/python-telnetlib3/python-telnetlib3.hash |  5 +++++
 package/python-telnetlib3/python-telnetlib3.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-telnetlib3/Config.in
 create mode 100644 package/python-telnetlib3/python-telnetlib3.hash
 create mode 100644 package/python-telnetlib3/python-telnetlib3.mk

diff --git a/package/Config.in b/package/Config.in
index 06472aa972..8da59cdcbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1421,6 +1421,7 @@ menu "External python modules"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
+	source "package/python-telnetlib3/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
diff --git a/package/python-telnetlib3/Config.in b/package/python-telnetlib3/Config.in
new file mode 100644
index 0000000000..487258c272
--- /dev/null
+++ b/package/python-telnetlib3/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TELNETLIB3
+	bool "python-telnetlib3"
+	help
+	  Python 3 asyncio Telnet server and client Protocol library.
+
+	  http://telnetlib3.rtfd.org/
diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
new file mode 100644
index 0000000000..db18889b8f
--- /dev/null
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/telnetlib3/json
+md5  2dfac7e10ed63c408da50ea712415f87  telnetlib3-2.0.4.tar.gz
+sha256  dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d  telnetlib3-2.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  caaf4ac82c4363d4874a49b50af15797618f6aee5bf42218697cdcb41c391ca5  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
new file mode 100644
index 0000000000..e68533af5c
--- /dev/null
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-telnetlib3
+#
+################################################################################
+
+PYTHON_TELNETLIB3_VERSION = 2.0.4
+PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/ef/af/0fadfddd1764e627f4ba9c7381caaf121795ed459a1cc3d0fbb89a187954
+PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
+PYTHON_TELNETLIB3_LICENSE = ISC
+PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
