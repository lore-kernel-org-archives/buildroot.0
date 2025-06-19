Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC63C71159
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 07:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E935740489;
	Thu, 19 Jun 2025 07:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H4kEp3AyXOC; Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3F840043
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3F840043;
	Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5B1181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 313CD60711
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-Mjd8iLddSM for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 07:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FCAB606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FCAB606E6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FCAB606E6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:51 +0000 (UTC)
X-CSE-ConnectionGUID: za6lwEf1SpSldXvW2MACtA==
X-CSE-MsgGUID: S/95N5zRSYaQrW8/rh+0FQ==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:39:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 09:39:52 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 19 Jun 2025 09:39:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 19 Jun 2025 09:39:50 +0200
X-CSE-ConnectionGUID: T3csTCBvRGeIB3nm1JoX0w==
X-CSE-MsgGUID: 6Z66JiNsRg6DfwUURtjQJA==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; d="scan'208";a="301983784"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Thu, 19 Jun 2025 09:39:47 +0200
Message-ID: <da298ddc209338ad20a162ba0457738e1dd39dda.1750318763.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750318763.git.yann.morin@orange.com>
References: <cover.1750318763.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX108.corporate.adroot.infra.ftgroup (10.115.27.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750318792; x=1781854792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KQJ3AnwEj9r9BZniySfzgME5RypY+yWoJiht0M4XWY=;
 b=Brhb9pwOB4GofJ0HqFmV4igqXRnHX4SNYSs726T3qrks9Zgc4x4D1BTY
 FQf9jlCXyHuvZ/uMStt/+xLpAtqpRStmehj3wanjWURQkTIrtWboUvB+P
 fB65UAHuyp8WsMSakb6KKLPRpAhLnFoV82yS4tA1mBi2m5doKte3GmQ2V
 XBGjJsfRqLsOn7Bs31J7babmIpnFHI+4aRIXA8j34IBKH5FTUkl0CotOa
 Dwz7RP6R2NXKqpAkRD7q/soIKVf6QfRGanYYAADGXhiXwzlphEG08smJ4
 UCs4Wzd2w+MmUZyVN1NzjdcgQymvwt9K6EJXHFVmc0eDVeT/2pndWsoHq
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Brhb9pwO
Subject: [Buildroot] [PATCH 2/3 v2] package/skopeo: use
 containers-image-config files
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

... and extend the skopeo runtime test to make use of those.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/Config.in                     |  1 +
 support/testing/tests/package/test_skopeo.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index f1acc3a50f..0de9b16047 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SKOPEO
 	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_LVM2
 	help
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
index 79c3da8b3d..99ba978de2 100644
--- a/support/testing/tests/package/test_skopeo.py
+++ b/support/testing/tests/package/test_skopeo.py
@@ -32,6 +32,20 @@ class TestSkopeo(infra.basetest.BRTest):
         bb_info = json.loads("".join(output))
         self.assertEqual(bb_info["Name"], "docker.io/library/busybox")
 
+        # Then check we can retrieve the image from the default registry
+        # Copy all archs in the image to check we can enumerate those (inspect
+        # does not enumerate all archs)
+        self.assertRunOk(
+            "skopeo copy -a docker://busybox:latest oci-archive:busybox-latest.oci",
+            timeout=120,
+        )
+
+        # Check we can inspect a local OCI archive
+        self.assertRunOk(
+            "skopeo inspect oci-archive:busybox-latest.oci",
+            timeout=30,
+        )
+
         # Now, check we can reach an arbitrary registry: quay.io
         output, _ = self.emulator.run(
             "skopeo inspect docker://quay.io/quay/busybox:latest",
@@ -39,3 +53,9 @@ class TestSkopeo(infra.basetest.BRTest):
         )
         skopeo_info = json.loads("".join(output))
         self.assertEqual(skopeo_info["Name"], "quay.io/quay/busybox")
+
+        # Finally check we can retrieve the image from an arbitrary registry
+        self.assertRunOk(
+            "skopeo copy docker://quay.io/quay/busybox:latest oci-archive:busybox-quay.io-latest.oci",
+            timeout=120,
+        )
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
