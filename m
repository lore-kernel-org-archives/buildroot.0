Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5652EC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 12:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BA4340A12;
	Tue, 13 Aug 2024 12:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i5oPQnsXtiH; Tue, 13 Aug 2024 12:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84131409FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84131409FB;
	Tue, 13 Aug 2024 12:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16C521BF3DD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E36409FB
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZfQrTpd4d4K for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 12:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A07A4015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A07A4015E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A07A4015E
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 12:19:08 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AB4EC2C80192;
 Tue, 13 Aug 2024 14:19:05 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 14:19:04 +0200
Message-Id: <20240813121904.248928-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723551545; bh=3Dp9e/WndAj9RgAz4cVytXownLq8dpz/k9AjuQGnb8c=;
 h=From:To:Cc:Subject:Date;
 b=pDeEh2PF4Gqjl7e2tcl6hL1pVwNsMcP5wi+lTBArEFXylV0bJO+ub9zWkpULH64qW
 3B8WalEg1o+nzbplBqqKxp2meJkovKfKz7erY3yxVTCrWDdEvmzLDrGS5RR+HMBZUV
 xh53eaEcfs61Hc2++SX9hxbpVW7dplIXwOm7ggatdGxBZlM7V5qzSr+mpBXS9ZB+8S
 BEpiL8DX/EpePfviDTteWtZTFxmEyY40W0AvB6ZpnVQdMiv8a9ZR76H7cPC6m5H0Ti
 gqo/xQUN5slUcYGxNZYkXHcQMa07DcD+JX0wXr5nCUQCKmF+H111QzORBuWv2edsol
 gn9TRKt66JDdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=pDeEh2PF
Subject: [Buildroot] [PATCH] package/python-immutabledict: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in                                 |  1 +
 package/python-immutabledict/Config.in            |  7 +++++++
 .../python-immutabledict.hash                     |  5 +++++
 .../python-immutabledict/python-immutabledict.mk  | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-immutabledict/Config.in
 create mode 100644 package/python-immutabledict/python-immutabledict.hash
 create mode 100644 package/python-immutabledict/python-immutabledict.mk

diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..07bd1499d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-ibmiotf/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
+	source "package/python-immutabledict/Config.in"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflect/Config.in"
 	source "package/python-inflection/Config.in"
diff --git a/package/python-immutabledict/Config.in b/package/python-immutabledict/Config.in
new file mode 100644
index 0000000000..51b180bf29
--- /dev/null
+++ b/package/python-immutabledict/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_IMMUTABLEDICT
+	bool "python-immutabledict"
+	help
+	  Immutable wrapper around dictionaries (a fork of
+	  frozendict).
+
+	  https://github.com/corenting/immutabledict
diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
new file mode 100644
index 0000000000..8232bc6e0e
--- /dev/null
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/immutabledict/json
+md5  6796be00860cc5cf45ae839b9ed2de52  immutabledict-4.2.0.tar.gz
+sha256  e003fd81aad2377a5a758bf7e1086cf3b70b63e9a5cc2f46bce8d0a2b4727c5f  immutabledict-4.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
new file mode 100644
index 0000000000..4d782aace6
--- /dev/null
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-immutabledict
+#
+################################################################################
+
+PYTHON_IMMUTABLEDICT_VERSION = 4.2.0
+PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/55/f4/710c84db4d77767176342913ac6b25f43aaed6d0a0bdb9168a8d2936d9c7
+PYTHON_IMMUTABLEDICT_SETUP_TYPE = pep517
+PYTHON_IMMUTABLEDICT_LICENSE = MIT
+PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
+PYTHON_IMMUTABLEDICT_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
