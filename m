Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE39ECCD19F
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DAB40687;
	Thu, 16 Oct 2025 20:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlg9BI6SHqT3; Thu, 16 Oct 2025 20:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C26405D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C26405D1;
	Thu, 16 Oct 2025 20:52:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D62D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2C57405D1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAK_wtJv81TQ for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C63E9405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63E9405BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C63E9405BA
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBEBBA4C6A21;
 Thu, 16 Oct 2025 22:52:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54320)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9UxS-000000001YX-25XK;
 Thu, 16 Oct 2025 20:52:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 22:52:21 +0200
Message-ID: <20251016205222.16679-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760647943;
 bh=rulFz/tyqPNSjdeJOW2zZtEdPNr6dDETvU222AzF/iY=;
 h=From:To:Cc:Subject:Date:From;
 b=CmQOwUNmwcH2xYVMufByTiGUiAVRv6jh5FdENIpn4HziAMK2KuijhMMAQ0NpsaDZH
 x7WS/5zY30PP1JpMnt1CRr6HGuLt1lSyz3Cc/5fiK0A8FTb1D2HO0dg0StWiXmFHSY
 DJfDpNy+6gbQMbVBSQoiEe+1UfFU+beaFt4IX/tG81rDWDrEvhDatht26b4Kvg6SP6
 tFZvXUDiTm6J2LD6FM25augWbe68YQBj5Rn0l6SynmwM5yzmIVS/THxpSxFImnUvQv
 OqH0/8Dza/VzYmMVgKkT7vo1S7nTWeAKYvG++ArM4qzAa3+d2tVgGoR3dPF3HlyE/w
 hOfrsW9JYDLXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=CmQOwUNm
Subject: [Buildroot] [PATCH 1/2] package/python-patch-ng: new package
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
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed by python-lmdb 1.7.3+.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in                            |  1 +
 package/python-patch-ng/Config.in            |  6 ++++++
 package/python-patch-ng/python-patch-ng.hash |  5 +++++
 package/python-patch-ng/python-patch-ng.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-patch-ng/Config.in
 create mode 100644 package/python-patch-ng/python-patch-ng.hash
 create mode 100644 package/python-patch-ng/python-patch-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 1ae92409c4..b06288941e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,6 +1260,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
+	source "package/python-patch-ng/Config.in"
 	source "package/python-path/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathspec/Config.in"
diff --git a/package/python-patch-ng/Config.in b/package/python-patch-ng/Config.in
new file mode 100644
index 0000000000..60c50cbb85
--- /dev/null
+++ b/package/python-patch-ng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATCH_NG
+	bool "python-patch-ng"
+	help
+	  Library to parse and apply unified diffs.
+
+	  https://github.com/conan-io/python-patch
diff --git a/package/python-patch-ng/python-patch-ng.hash b/package/python-patch-ng/python-patch-ng.hash
new file mode 100644
index 0000000000..f832552c30
--- /dev/null
+++ b/package/python-patch-ng/python-patch-ng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/patch-ng/json
+md5  208be456725a65cb570ffd3e3589f6ba  patch-ng-1.19.0.tar.gz
+sha256  27484792f4ac1c15fe2f3e4cecf74bb9833d33b75c715b71d199f7e1e7d1f786  patch-ng-1.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d807f69dbc4f24153544ac011b741015ea47231c69fe16b1e74759f299349a78  LICENSE
diff --git a/package/python-patch-ng/python-patch-ng.mk b/package/python-patch-ng/python-patch-ng.mk
new file mode 100644
index 0000000000..fe24b0bc95
--- /dev/null
+++ b/package/python-patch-ng/python-patch-ng.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-patch-ng
+#
+################################################################################
+
+PYTHON_PATCH_NG_VERSION = 1.19.0
+PYTHON_PATCH_NG_SOURCE = patch-ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
+PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/65/bb/ebd7c6058dcfbf634986f9a8b3fb638f3269501c73701a48b7530042da5b
+PYTHON_PATCH_NG_SETUP_TYPE = setuptools
+PYTHON_PATCH_NG_LICENSE = MIT
+PYTHON_PATCH_NG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
