Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479BC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06732842C9;
	Tue,  1 Jul 2025 14:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3O01XL3UenT; Tue,  1 Jul 2025 14:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0A0842B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0A0842B4;
	Tue,  1 Jul 2025 14:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88C9197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEFB240185
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIiDFxJ16Y1M for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 14:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF7AB400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7AB400C1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF7AB400C1
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:09:16 +0000 (UTC)
X-CSE-ConnectionGUID: 2Y/Oxu6/Sqqglq2d3BDclA==
X-CSE-MsgGUID: JQ0WzC66QgeTvoNANYNgWA==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 16:09:14 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 16:09:14 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 16:09:12 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 16:09:12 +0200
X-CSE-ConnectionGUID: O71fhP78TYCd91yIlLK+WA==
X-CSE-MsgGUID: E2+5DAYfToGFz3Vvrlps8w==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="308631268"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Tue, 1 Jul 2025 16:09:12 +0200
Message-ID: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX205.corporate.adroot.infra.ftgroup (10.115.27.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751378957; x=1782914957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KeOeijrrGXqb47+kK8XK06UDdK++HnuXp/0i6IM+x80=;
 b=IgdSX0K8mVFuUDZqB5mhYbXCBbLSMlk+F+5fAgEoCgYX2FJPZso0+u/V
 MbX3LvxPU88fdGuvsn24aLPfRG5MKWI4cmapue9uTm7K/FdJHLrUdXioO
 LVMxP2vKXu29rN1Zthb131/NEDAtxjSt64vm/wrNPmgYaMro2jkjlomQd
 IZ7HAH7iLw8w8rOJLV1MIO1tGbcfIp09r4rE/WW+USQmRfTjYA1sva/GU
 dfoqoUt0oZPS3S4HX/QOADEtCbb9fE7W0K7nP9L7XY1HXJiHVSzwAYGa0
 4csy9GQS0pfqMp8caL9kjbVXFp2k2gMtxxA8WT56Aoo6jdaA6B+h0LWnR
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IgdSX0K8
Subject: [Buildroot] [PATCH] support/testing: enable lpxelinux for syslinux
 runtime test
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

The syslinux runtime test (which is in fact a build-only test) ensures
that syslinux does get build at least once a week (via the gitlab-CI
weekly pipeline). Runtime testing would need much more work, though, but
nothing in syslinux is currently runtime tested anyway.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 support/testing/tests/boot/test_syslinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 41152cde7e..17fe904263 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
         BR2_TARGET_SYSLINUX=y
         BR2_TARGET_SYSLINUX_ISOLINUX=y
+        BR2_TARGET_SYSLINUX_LPXELINUX=y
         BR2_TARGET_SYSLINUX_PXELINUX=y
         BR2_TARGET_SYSLINUX_MBR=y
         """
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
