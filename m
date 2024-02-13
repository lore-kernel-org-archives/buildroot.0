Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDD6C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 11:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 733DA4117B;
	Tue, 13 Feb 2024 11:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmgBOubRruBW; Tue, 13 Feb 2024 11:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F4540CB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0F4540CB3;
	Tue, 13 Feb 2024 11:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B797F1BF421
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 11:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA23B6060A
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 11:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YBozFh-YW1A for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 11:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2E3760668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2E3760668
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2E3760668
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 11:49:36 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 940672C83906;
 Tue, 13 Feb 2024 12:49:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 12:49:32 +0100
Message-Id: <20240213114933.2444440-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213114933.2444440-1-buildroot@bubu1.eu>
References: <20240213114933.2444440-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707824974; bh=K4sZX0/um23ydzXq2Co+yI4IXUMvHi2tZ3O+XorWNlg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gGJeAO1GaZHTvIDCJi4bN6qqDBe6LKqGHhgFIaYY7gjJ/DEI0sAPH6vjPQ32a1ztS
 O0ZbkS5dhnD8Y4rCKjLWUEtTIrl94Or9uUSTG5Yjxdu0cME9A9VUHAFlcEuSFp+vXP
 NY1RN8y4OBSzepX55IiuwahWZ9PPVtAiw/fD5MLzJhuSiZnhQB8iwBXmqsMMov4s8Z
 d60jr83O9HSBIyVBpAhj9SkO1PkvHvh8WC/bNV1v/DVEqZPDpIE3Yim/vkrGEAs9GR
 pawQxcFuwHzGAMXDs8KYTx048NtvDWl0MNF3thgDYtJM9p6limB/edBoQds7hd8XTX
 n/UKjbCU+t69g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=gGJeAO1G
Subject: [Buildroot] [PATCH 2/2] package/tio: disable installing man page
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the man subdir from inclusion in the main meson.build file.

Reported upstream to get an option to disable this properly:
https://github.com/tio/tio/issues/222

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/tio/tio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index a7d3537850..66ce69db2f 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -16,4 +16,10 @@ else
 TIO_CONF_OPTS +=-Dbashcompletiondir=no
 endif
 
+define TIO_DISABLE_BUILDING_MAN_PAGE
+	sed -i -e "/subdir('man')/d" $(@D)/meson.build
+endef
+
+TIO_POST_PATCH_HOOKS += TIO_DISABLE_BUILDING_MAN_PAGE
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
