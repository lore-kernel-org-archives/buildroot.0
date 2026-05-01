Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9521ACD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E69C42764;
	Fri,  1 May 2026 12:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DmS_cb3xTnj; Fri,  1 May 2026 12:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678684294D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639444;
	bh=6zBXEnTbYaq68UR3jc4y1aSRavQPvozhjJW8p7n+mWg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C33IvIG9y1o7ZVP0Gn+yaWjeVR1dG6KPkcXnP8XFYQ5erJ5pfI7QGBlEq8Y67ce2r
	 b3DXD9Kxh5A/Ocaax2B2Kxt6HfRLN57iiK4oe9P/9x77H1732SBHW0IfRXydB/DZn2
	 leGGCSZgdHD4iS6I3g1jTRHuphuHybwb5qJrpzn+Z4E4++76QkIr8CxZuMqhM6Zk3r
	 xKwqJdZYb2329oXraIal7r8D52FBwjupbAgtdRvOQrK9WyWaaOZHq4bG5sZKtkkUr+
	 Bb4r9u3ybGC9KJApGDa/p2zFAaavsmrnnAg4Xka7FntyTuXWcPuYnPNi7JQ8YhzKxi
	 01/sX5EHfN7Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678684294D;
	Fri,  1 May 2026 12:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 548F6127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB04403E7
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ecL-H83ZNl2 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A966401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A966401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A966401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07637A4C305E;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-1qAF;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:51 +0200
Message-ID: <20260501123100.1918951-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=3w4kfLxTLCBv0cLuyF6jcgqLQ+EQsIC4YoONx09D3lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n+5e7yO6Vk2Pm9PyP4KOczAWzASmrAW6fdFEL2NbRtZrSvQuVipKKUiYgWjiN8PHm
 KCGUp3mWjVn/oWvreIkEpgPgZT0TACmSW6goFAhLFm5EE5ztQeGN6sc77/YIXgjoZq
 dk8b6ElFESsSFkaU5uBpPUrFA/HthQLrGKAGPdqz4IBBqt1BIbd+iYXI1Sjn/H2vsV
 5uP7n+Geo6ISxaveRjYGOuBDdyX5sgRn6Q/SpDfJtth3UrWzselAm3g99x4xhNccvv
 RZ1w2Dq5iZcTalTaqpkb7w74QzF/TOYdmGhZYDkhxbLF57kp1sw2JlJ0Mnwri6nGA+
 KlFiuyxEGaipA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=n+5e7yO6
Subject: [Buildroot] [PATCH 66/75] package/python-unittest-xml-reporting:
 bump version to 4.0.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/xmlrunner/unittest-xml-reporting/releases/tag/4.0.0

Added dependency to host-python-setuptools-scm and removed patch which
is not needed anymore due to the removal of setup.py in upstream commit
https://github.com/xmlrunner/unittest-xml-reporting/commit/63519096e5fec64b888831bce60dbdb02a66a910

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ta_files-installs-LICENSE-to-incorre.patch | 40 -------------------
 .../python-unittest-xml-reporting.hash        |  4 +-
 .../python-unittest-xml-reporting.mk          |  7 ++--
 3 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch

diff --git a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
deleted file mode 100644
index 4bc005f448..0000000000
--- a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 662cd67695c31126d72035a818b0f5f1da5a31ca Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 17 Aug 2024 12:24:28 +0200
-Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
- place
-
-As reported in issue
-https://github.com/xmlrunner/unittest-xml-reporting/issues/284, the
-data_files statement in the setup() calls installs the LICENSE file in
-the wrong place: in /usr/LICENSE, or even /LICENSE depending on the
-configuration.
-
-So let's drop this, and let setuptools install the LICENSE file
-automatically: since setuptools v56, the license_files attribute is
-automatically assigned to a default value, which includes "LICENSE",
-so there is in fact nothing to do to the get the LICENSE file
-installed at the correct location. See
-https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
-
-Upstream: https://github.com/xmlrunner/unittest-xml-reporting/pull/287
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c524ed4..afa5925 100755
---- a/setup.py
-+++ b/setup.py
-@@ -27,7 +27,6 @@ setup(
-     description = 'unittest-based test runner with Ant/JUnit like XML reporting.',
-     long_description = long_description,
-     long_description_content_type = 'text/markdown',
--    data_files = [('', ['LICENSE'])],
-     install_requires = ['lxml'],
-     license = 'BSD',
-     platforms = ['Any'],
--- 
-2.46.0
-
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
index 674a533e6a..753c5ef0cb 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/unittest-xml-reporting/json
-md5  f12aeab63ff44e295526e103313d66c8  unittest-xml-reporting-3.2.0.tar.gz
-sha256  edd8d3170b40c3a81b8cf910f46c6a304ae2847ec01036d02e9c0f9b85762d28  unittest-xml-reporting-3.2.0.tar.gz
+md5  fe1f9cceab8940e22d8d2bc968098597  unittest_xml_reporting-4.0.0.tar.gz
+sha256  bfa1ed65e9e6f33c161d04470d89050458cfb65a5a5d0358834ef7ce037d9136  unittest_xml_reporting-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0596648105bee470f9cafd62753b931efe52392096439d88e2564cf7d7cf0e68  LICENSE
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
index 05bbed79a8..364099f707 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.2.0
-PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest-xml-reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
-PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/ed/40/3bf1afc96e93c7322520981ac4593cbb29daa21b48d32746f05ab5563dca
+PYTHON_UNITTEST_XML_REPORTING_VERSION = 4.0.0
+PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest_xml_reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
+PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/42/6b/5847d0e6e95d08e056f23b3f8cd95bede2d3ade10a1c1a9d5b50916454e1
+PYTHON_UNITTEST_XML_REPORTING_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
 PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
 PYTHON_UNITTEST_XML_REPORTING_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
