Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD51E7BD91
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 12:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A21F60B50;
	Mon, 16 Feb 2026 12:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsJyx1jCGE36; Mon, 16 Feb 2026 12:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A86D60B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771243330;
	bh=ju2tb3ciCvz/uZ/KH5550yQLX3terNOVhfVfZyFyImQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JfZ9Lkt6/3wqRPLE0mgH5nczTtejQBZu2tbFso5aAOuYvoff/vcKDfUnsnkbAlFYd
	 wxAp/M0v1PrQS9Rl9/BRijOguZa0EB4peHEIUh86dGnfvz98gvDtW/NTuQisssfHdf
	 j2Tr3Nu4sP22ymVUBHBGZE6NjyfLD94XiECHgH//t/2esuWExAbtJFTL2YyEE2V9t5
	 qIN3P9LoLIpRF8ZuM6V1mmdOkQ8sAN5SNUwSCDg7osteuAVWs4d7mmmjEuhlWnYSXV
	 rS0A4WKN8NI2E5hgA6KyDo5W3KlxsJ4QmMHBqvQQ4jVvy0bWT+RaTNpKwe+D7cQWZJ
	 FADaKQKKpi3aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A86D60B51;
	Mon, 16 Feb 2026 12:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ADD7270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B30C8175D
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDONbrR5BG-d for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 12:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9663B81AD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9663B81AD7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9663B81AD7
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:02:07 +0000 (UTC)
X-CSE-ConnectionGUID: Yn3wVxoBTzW4bYumez8GJw==
X-CSE-MsgGUID: fMfT7SqhQQGm/mQbaFp6ag==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 16 Feb 2026 13:02:04 +0100
Received: from unknown (HELO OPE16NORMBX607.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:02:04 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX607.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 16 Feb 2026 13:02:04 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Mon, 16 Feb 2026 13:02:02 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 16 Feb 2026 13:02:01 +0100
X-CSE-ConnectionGUID: X6/ZiQolQkmDWS7CuZUpUQ==
X-CSE-MsgGUID: Feud/pfwTr+fhQWZxxkTyw==
X-IronPort-AV: E=Sophos;i="6.21,294,1763420400"; d="scan'208";a="392840017"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 16 Feb 2026 13:02:01 +0100
Message-ID: <0b6f75dfab9a0258eebab63e0a47a4e4c9796246.1771243321.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771243328; x=1802779328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=meIiiM+HDluVMqVRI2W/RuYDzt2wKcYCsrv7G5/OPm0=;
 b=nDaTE7ez+lSzx+M71RQEZ41gEKD0jA8DmowakShkX0xYPlF9ECSXyjw4
 kY/C5SQZ/3aIx4Y8KKlBS/y3EahwzZqOMdQz5pOt2NfHsRoWJA7qwaIYE
 npk8Zz0fS2kPKclho847bMHuMGcY644AtDSJkrJ/VvQ5j9e+2qbDjcDCK
 b2RbF9fa4SiUvslpKcbKrZbCKr8QOKtxlf+JoxasXvDX8GHKc20h0J2ls
 6nJg3xamDWfluAb58frtozZORhPSKzPqJosc6929Rp9+ZHG5PZgprjDMG
 yoiI8vGX3FCGi7vyNEVrFPZmqyfR5yOG6jK9hm72rpZvH3VmelQujD+g1
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=nDaTE7ez
Subject: [Buildroot] [PATCH] package/python-humanfriendly: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, yann.morin@orange.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-humanfriendly/Config.in           |  7 +++++++
 .../python-humanfriendly.hash                    |  3 +++
 .../python-humanfriendly/python-humanfriendly.mk | 16 ++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-humanfriendly/Config.in
 create mode 100644 package/python-humanfriendly/python-humanfriendly.hash
 create mode 100644 package/python-humanfriendly/python-humanfriendly.mk

diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..3068da79a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "External python modules"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
+	source "package/python-humanfriendly/Config.in"
 	source "package/python-humanize/Config.in"
 	source "package/python-hwdata/Config.in"
 	source "package/python-hyperframe/Config.in"
diff --git a/package/python-humanfriendly/Config.in b/package/python-humanfriendly/Config.in
new file mode 100644
index 0000000000..06197843b3
--- /dev/null
+++ b/package/python-humanfriendly/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_HUMANFRIENDLY
+	bool "python-humanfriendly"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Human friendly input/output for text interfaces using Python.
+
+	  https://github.com/xolox/python-humanfriendly/
diff --git a/package/python-humanfriendly/python-humanfriendly.hash b/package/python-humanfriendly/python-humanfriendly.hash
new file mode 100644
index 0000000000..35f9395325
--- /dev/null
+++ b/package/python-humanfriendly/python-humanfriendly.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/project/humanfriendly/#humanfriendly-10.0.tar.gz
+sha256  6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc  humanfriendly-10.0.tar.gz
+sha256  4ac48f4117809f2734066150450f120b3bb110ac1d3b32170795e0560dbbc1f5  LICENSE.txt
diff --git a/package/python-humanfriendly/python-humanfriendly.mk b/package/python-humanfriendly/python-humanfriendly.mk
new file mode 100644
index 0000000000..fcf3b47924
--- /dev/null
+++ b/package/python-humanfriendly/python-humanfriendly.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-humanfriendly
+#
+################################################################################
+
+PYTHON_HUMANFRIENDLY_VERSION = 10.0
+PYTHON_HUMANFRIENDLY_SOURCE = humanfriendly-$(PYTHON_HUMANFRIENDLY_VERSION).tar.gz
+PYTHON_HUMANFRIENDLY_SITE = https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43
+
+PYTHON_HUMANFRIENDLY_LICENSE = MIT
+PYTHON_HUMANFRIENDLY_LICENSE_FILES = LICENSE.txt
+
+PYTHON_HUMANFRIENDLY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
