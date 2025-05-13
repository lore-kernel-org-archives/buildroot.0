Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FD2C3ABCC
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCC981F32;
	Tue, 13 May 2025 11:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8TJ1uEbc4-i; Tue, 13 May 2025 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2243481EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2243481EC1;
	Tue, 13 May 2025 11:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B24D12A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B3540DD6
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBtkYUZwKFKl for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 752A540E3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752A540E3F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 752A540E3F
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:19 +0000 (UTC)
X-CSE-ConnectionGUID: RsdlGgBuTRaHQfuRvqAq+Q==
X-CSE-MsgGUID: yYePGTgKSpCf3yCnJyTGqg==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:48:17 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 13:48:17 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 13 May 2025 13:48:15 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 13 May 2025 13:48:15 +0200
X-CSE-ConnectionGUID: xyV6sidURWWu6I3/pCWWIg==
X-CSE-MsgGUID: odkk3F7iS1OBaAGwY+C8nA==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; d="scan'208";a="289803487"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Tue, 13 May 2025 13:48:12 +0200
Message-ID: <42f212d20e1eefadccc1fb7ce7bc83b3bc4713e2.1747136889.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747136889.git.yann.morin@orange.com>
References: <cover.1747136889.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1747136899; x=1778672899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KQJ3AnwEj9r9BZniySfzgME5RypY+yWoJiht0M4XWY=;
 b=UaRTMzOC3jT2gjRtz5/rWb/g5g5LC89kzigcHvrSVyCysfHsHtXvpS/z
 OqumyIrnlix1vDUPu5zarLsrdUh2gzowKjwGtTnL3Lz5mpW/r0Ezn6sPm
 5uOh8/MTM5l0ITmGuYZpxSt7dcC+/Qjb4s7BNZbxEQ8K9YNigWG7N+FQm
 gmf7gb8tZJrVGTSsPUICFXIoUkJ9APN6OtmEGIy42KqfD70sgVflqX/w0
 cNd8pYplNcPlrBbYr3LZEpdM65Wg3fPsYjR0aIDqAh6hQA/QwpkNlcdnz
 z2qZrIrEdR2BfBWSJkL/WFd7dUKJiQHbIJ+TukJO7R5bYrBoTkYSCa9d1
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=UaRTMzOC
Subject: [Buildroot] [PATCH 2/3] package/skopeo: use containers-image-config
 files
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
