Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC3C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 14:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA7A813FD;
	Wed, 28 Feb 2024 14:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlxDBWworjtU; Wed, 28 Feb 2024 14:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EF68233C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75EF68233C;
	Wed, 28 Feb 2024 14:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB0A91BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C4A40987
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uy-DuoncK1E8 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 14:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 077C54081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 077C54081E
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 077C54081E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 9A706164B3;
 Wed, 28 Feb 2024 15:50:29 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id AFsiSHu97weL; Wed, 28 Feb 2024 15:50:29 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id BEF0D16255;
 Wed, 28 Feb 2024 15:50:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 15:50:09 +0100
Message-ID: <20240228145013.411919-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1709131829; bh=RC
 9Z7DgZlZ7YKPtHVV66tmEtuEY+lvM71uxMv3Ku4oQ=; b=MlnWlaU/TTQl5iomJb
 GB7X3XpNERIutQCuAYqYCSLzUePu24VX4Nyy3yNWD4Vu4W46An0MeHYkY6bjVu5c
 IeY6NnAxW/gmi/uD0XUaqSCU/2DJBPVAGhgEDxDFFadGH8bdCZAHZlmA4d4NfPpm
 k6JxJBLgbPobjScT0UTfxMoNE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=MlnWlaU/
Subject: [Buildroot] [PATCH 1/3] package/python-fonttools: enable
 host-package
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Hitz <christian.hitz@bbv.ch>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

The fonttools are used to generate static fonts from variable fonts
at build time.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/python-fonttools/Config.in.host      | 6 ++++++
 package/python-fonttools/python-fonttools.mk | 1 +
 2 files changed, 7 insertions(+)
 create mode 100644 package/python-fonttools/Config.in.host

diff --git a/package/python-fonttools/Config.in.host b/package/python-fonttools/Config.in.host
new file mode 100644
index 0000000000..641efb1cfb
--- /dev/null
+++ b/package/python-fonttools/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_FONTTOOLS
+	bool "host-python-fonttools"
+	help
+	  Tools to manipulate font files.
+
+	  https://github.com/fonttools/fonttools
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index e2472aa184..682a453ab4 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -14,3 +14,4 @@ PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
 PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
