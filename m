Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82C6FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AA6610A9;
	Tue, 28 Apr 2026 17:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqqnyqT0bCR5; Tue, 28 Apr 2026 17:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BB866108B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396847;
	bh=+OQCUwPVUqeadVJ4+drHi/MeS4aKa0ZzT7IOHZ2H7vw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Nm2YdY9Z4OmCBUdWIpqBJJr5HykCbbs7lc+3wd8PeWtMyzhDUSvebxd6ZZ0BxxM5e
	 58TPnIxsot9JFEQbRfQO2AE8/V1yWZIyi0u4DdATd2sXNoj/w6hPTmDFL808ErL306
	 wy3xXA7tmloZ2P9JnSq4SX+hQ3q0PgDEAersfagRklRuk8AKQNsJdPzHkSe52u4IWe
	 P6dM1rZI5Gj7o5s5Cbl3t1LZ9kOnQidlcA8QWDonK7KQJYaa6zXQRuJO7g7MKxLbZn
	 UxXgLr/LK1ttRrndHCuL2qRDpNDFoJFAV00th6k5TkbrVu1XDGmtgwPqbxEGu0sXJ0
	 PJzrHBKLXqK3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB866108B;
	Tue, 28 Apr 2026 17:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 738791B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65A8440B44
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJsadJQ48VJK for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 585E740B3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585E740B3D
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 585E740B3D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id
 af79cd13be357-8ee63e91acfso681390485a.2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396844; x=1778001644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90Y4fd4SfZkdQmjY8TvLEPiY3o0hvoQgXtmqaQdbYD0=;
 b=hDVhmtzrtJJq+5ZlWm3yAYrQOg6DNkHzJCnn8BKQM/r3w6INmGLlMKPqQf9BwpTlbN
 rr0gBE3G/q9EPOjh9cdyc8uE28eJ/jBk9vyK0ow6BbhqawmQ61ifDZwwcTUav9hrScxG
 NZkBJqhSZ8nI/V3HkJSlYlEOeswPTHfQeq7L7zmPzoaHNhnkkPb3h0H8C/RH4PTZuHyg
 TZBKL7qG/2T+Krfj57zN3/IBVSc9zxVqlRgOAvB212/e8uOEjO/7KK+Xe2uBmgNTDg6w
 DFJJefGfBPWp1uoSAE0RuOOuvpL/3njt3ebvALb366DhnNCQQB+6/7PU/wSag0z9mGQb
 LlBQ==
X-Gm-Message-State: AOJu0YxZQgggVSTsE7zEIUixkTROs0qYPvzk0rF5mxH9Tr6erw4c4AKy
 trkKzUJoWUxW9vDprSWQugjisimQKFi1xBqiz4GAW9nkZIraxN6v4SQ0nEqywhP29AsS15VR
X-Gm-Gg: AeBDietSe6yojcg6BrfV5pbZWMsI1kUCh39pFbXMnFFSMRG04/+uIash37YCuxQtsjs
 U/RZ+SJjVspqdj3q4zFq5zwJ+CDZ3rnpCN9q8D+nNUYZEDemKv/A3cRcwVz+fKq9FHSf+RUFPBX
 zx1Qizh99DsIdD1zdTzopn/krDkKAYFVs2/EmXdxdBESbbqhgiSj2GFusnAnAujyfR2YZAjhyDs
 IedKL2uoHXFDm0Py3hmuk6r4qmFjQ02UaVU4xzIxcAOJo0bt/KgzDqapdN8ejFv5XR+AQ5qhwLN
 ULPNUVkOzhHP460y/IVJn3IcJaxZYZgCRxgieGDt3sIVhfmumd2kJKOLM32Lx+MQlnmj07UGzEa
 a3xu/uOWMYPIuayXDKRFVi4sid1uW6QEmOVTd7Ksge9DFEV1iC4SxFEu+UEl0+e0rvMq+Vvm+4T
 6CPJTFWhsrl4bX3MWu0ajLJEccqaNY0hgv4spH46dSvv8vZD8/A4YH6DwvYIaEin2T5s6gXClFI
 LYnmAv2SKLUJxiSJ2g1
X-Received: by 2002:a05:620a:19a4:b0:8f0:f1a5:680c with SMTP id
 af79cd13be357-8f8f5997d55mr69174885a.29.1777396843899; 
 Tue, 28 Apr 2026 10:20:43 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c48c7f2dsm252965285a.9.2026.04.28.10.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:20:43 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:20:37 -0400
Message-ID: <20260428172037.2696-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396844; x=1778001644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=90Y4fd4SfZkdQmjY8TvLEPiY3o0hvoQgXtmqaQdbYD0=;
 b=ezGTc4hCCYMhj74oO2I2BVQtRg7NR+QgMbO8EmZ3dQGJ4T8mkSWiTUoheoGT4c7jOe
 d0r0bTGXZnpZIWzX1y/MDa9DvUFUKfQlO49qcqri8XNaOEvnbChvkbzAec6g4udhLM9v
 qjPXuUmr2LkfskTMPL7OUt3QCiA142PPyHSnGT9HOs0YkH01s6W5YZ6dG6OyU5p/aAFl
 Eh9zTa9/5D2vrrCupjzrAjSVow046OZzKQcaVuUxGHgpFO0GRv/ARjNzvTwtxqBTMQ1F
 zCMowKITvDOkqeZYSxEqFA3uqBwNpAnFcQrdk++mF97ptXoemSB2xJVp6tkgjYyCjQ1W
 whmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ezGTc4hC
Subject: [Buildroot] [PATCH 07/13] package/python-ntlmlib: new package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-ntlmlib/Config.in           |  6 ++++++
 package/python-ntlmlib/python-ntlmlib.hash |  3 +++
 package/python-ntlmlib/python-ntlmlib.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-ntlmlib/Config.in
 create mode 100644 package/python-ntlmlib/python-ntlmlib.hash
 create mode 100644 package/python-ntlmlib/python-ntlmlib.mk

diff --git a/package/Config.in b/package/Config.in
index 83c9e0809c..882459cefc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1263,6 +1263,7 @@ menu "External python modules"
 	source "package/python-networkx/Config.in"
 	source "package/python-nmcli/Config.in"
 	source "package/python-numpy/Config.in"
+	source "package/python-ntlmlib/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-orjson/Config.in"
diff --git a/package/python-ntlmlib/Config.in b/package/python-ntlmlib/Config.in
new file mode 100644
index 0000000000..9c3c21eff9
--- /dev/null
+++ b/package/python-ntlmlib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_NTLMLIB
+	bool "python-ntlmlib"
+	help
+	  Pure Python implementation of the NTLM protocol.
+
+	  https://pypi.org/project/ntlmlib/
\ No newline at end of file
diff --git a/package/python-ntlmlib/python-ntlmlib.hash b/package/python-ntlmlib/python-ntlmlib.hash
new file mode 100644
index 0000000000..084f2028bb
--- /dev/null
+++ b/package/python-ntlmlib/python-ntlmlib.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/ntlmlib/0.72/json
+sha256  6b365027ec3cdaf09421a679a5b2b397a8b41f8adde8dcd88b80e695a8d2e9c2  ntlmlib-0.72.tar.gz
+sha256  68f3b1c862730d19e8024de80621bd3df816400da6573f09be267fb1f50085be  PKG-INFO
\ No newline at end of file
diff --git a/package/python-ntlmlib/python-ntlmlib.mk b/package/python-ntlmlib/python-ntlmlib.mk
new file mode 100644
index 0000000000..b5d3d67e69
--- /dev/null
+++ b/package/python-ntlmlib/python-ntlmlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ntlmlib
+#
+################################################################################
+
+PYTHON_NTLMLIB_VERSION = 0.72
+PYTHON_NTLMLIB_SOURCE = ntlmlib-$(PYTHON_NTLMLIB_VERSION).tar.gz
+PYTHON_NTLMLIB_SITE = https://files.pythonhosted.org/packages/source/n/ntlmlib
+PYTHON_NTLMLIB_SETUP_TYPE = setuptools
+PYTHON_NTLMLIB_LICENSE = Apache-2.0
+PYTHON_NTLMLIB_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
