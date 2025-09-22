Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468FCCAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E836151C;
	Mon, 22 Sep 2025 10:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLBnRUJxBVSq; Mon, 22 Sep 2025 10:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089126152D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 089126152D;
	Mon, 22 Sep 2025 10:25:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24411E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 10:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E7B844EE
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 10:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TR5Potcc-I1Z for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 10:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A9A7844E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9A7844E9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A9A7844E9
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 10:25:42 +0000 (UTC)
X-CSE-ConnectionGUID: fR2meNAhRMK2CgE3bQzwzA==
X-CSE-MsgGUID: w3/g2IYsSa2jeo/Tc6VYhA==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 22 Sep 2025 12:25:40 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2025 12:25:40 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58;
 Mon, 22 Sep 2025 12:25:38 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 22 Sep 2025 12:25:38 +0200
X-CSE-ConnectionGUID: Y7oM1N+YQRyRwxz9oI4L6w==
X-CSE-MsgGUID: MGFLw541QcSevTwHcHEHgA==
X-IronPort-AV: E=Sophos;i="6.18,284,1751234400"; d="scan'208";a="336586243"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 22 Sep 2025 12:25:38 +0200
Message-ID: <4fad4381479c4d50e4c8fa839c8e5d0b44e3a7f0.1758536738.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1758536744; x=1790072744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jbD8t3abwr0Tgsyl5WTN4Lpv9LeZJK0MMT5bXW/dXqk=;
 b=EGJ/Ghs0BEa8yzI+eyvpgDQ3W+y1ieAn/lwsgb7vBr8v6QLqO7+MskEP
 xs8v7DUeNbDYVGyXI4TCGOKulijPBbx6Wfj3DbU0oQ5aj9BNoexLJOKwd
 TLx3nrbEzI9IqaWluhWfUTYxZTEJBCTWQox9LueuQC35UpHOypsLGv18Q
 o81JniAIk86P00uzhqhbzgyxnvEfsaCVYmat1m4oelDqD/+cn27ONdPJU
 mp+jufpaGH0O43GyqgiLxavCGBqYqgzWFTYWWL6u5Cs6Wscog50awO4sc
 biSFIM75TtHIgfC6Cb6roL3gxmrsc/4QfMhrZReZox56Mf6P+QmxpsyNZ
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=EGJ/Ghs0
Subject: [Buildroot] [PATCH] package/skopeo: bump to 1.20.0
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

From: "Yann E. MORIN" <yann.morin@orange.com>

In 1.20.0, skopeo gained a new optional dependency on sqlite, so enable
that when available, and use that in the runtime tests.

Changes since 1.18.0:
    https://github.com/containers/skopeo/releases/tag/v1.19.0
    https://github.com/containers/skopeo/releases/tag/v1.20.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.hash                                 | 2 +-
 package/skopeo/skopeo.mk                                   | 7 ++++++-
 .../testing/tests/package/test_distribution_registry.py    | 1 +
 support/testing/tests/package/test_skopeo.py               | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index e663ac1f61..02cb76d6f1 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a711db2bba3a357bebbbaf607ec731df6ea24c2d3cd9e0fef5e8fe9cefb154b  skopeo-1.18.0-go2.tar.gz
+sha256  0c19fe51b2cd8d1bd5e38c03b97421e318fc08153bdf5ef2f816a29889eacdef  skopeo-1.20.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index b3b213983f..a8587f06b8 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.18.0
+SKOPEO_VERSION = 1.20.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
@@ -17,6 +17,11 @@ SKOPEO_DEPENDENCIES = \
 	libgpgme \
 	lvm2
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+SKOPEO_DEPENDENCIES += sqlite
+SKOPEO_TAGS += libsqlite3
+endif
+
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
 	host-libgpgme \
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
index 956b76aa8b..65fe6d850e 100644
--- a/support/testing/tests/package/test_distribution_registry.py
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -21,6 +21,7 @@ class TestDistributionRegistry(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_PACKAGE_CA_CERTIFICATES=y
         BR2_PACKAGE_DISTRIBUTION_REGISTRY=y
+        BR2_PACKAGE_SQLITE=y
         BR2_PACKAGE_SKOPEO=y
         BR2_PACKAGE_HOST_GO_BIN=y
         BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
index 99ba978de2..f19703bef2 100644
--- a/support/testing/tests/package/test_skopeo.py
+++ b/support/testing/tests/package/test_skopeo.py
@@ -9,6 +9,7 @@ class TestSkopeo(infra.basetest.BRTest):
         BR2_PER_PACKAGE_DIRECTORIES=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_SQLITE=y
         BR2_PACKAGE_SKOPEO=y
         BR2_PACKAGE_HOST_GO_BIN=y
         BR2_TARGET_ROOTFS_CPIO=y
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
