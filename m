Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10950C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6CB5405D9;
	Tue,  2 Jul 2024 16:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqWMi6iTeZWj; Tue,  2 Jul 2024 16:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93FB140613
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FB140613;
	Tue,  2 Jul 2024 16:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79C881BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 731E9400FF
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJMdRQ57Pg_x for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2A0B403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A0B403AC
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A0B403AC
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:29:02 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OgNHsDIqDJaU4OgNHsN2Ri; Tue, 02 Jul 2024 18:28:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:28:57 +0200
Message-Id: <20240702162857.199474-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfE+OzWcnjU5q0P5wqrXxRDikoQGkFig5OLm290NvOn712uneXijor3/hABddhidipH6BHcDdVdmbmt1m2kPT5GRd8OmLezeWE9XZobezzaB2Jpp9MG8d
 JmWSjkKHWnWSyQL+dMLTgf4MQUWRulINMU4qlMF7yh2yq9qF+Yv1iv7Y9r+seFKeP2vnmpvFj3M6KxAtmb7yf34SpXGoRAlG8N+Tm41zJZh3jKicooYqj2U+
 rYnvq0bHy6cv9SRAU5m9Y+E58hNzBLGXQXvSUzfIqXA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1719937739; bh=hNUZMBKlgaLvXKUKT3yaoDf29sErdf3+EDUXcaN32DY=;
 h=From:To:Subject:Date:MIME-Version;
 b=BZlOCHA+EmqR12fR9ChzQbxXHI4Ls5KSuiI/tHE3wenDeoBi/kQ/XtBFGJIjEAte4
 MRNaZyYW4TUFEFxJ3YEv0CSWaPCGJ21f2NTTSTwDyLtRjwzMYaFhicfkJxlefEJSCp
 BDqm7l2wKYhJy1tQfwpLiRZB6/lM/kR9YjNWF9VSNi/NhnrRRR/HnQyMYptb7IOGAa
 3X9UIE2GzchMBpMLUSeeKAluNU4zKNXQWwmgBZ8ZPFm88YpO3NJC9xTUxXhcFT8sR7
 OZLD8yM9SNOEL85H8qOYz/oNu/I6vxoJ6LTMhK3ij7DtYG2rf1m6H+IikufN1yxFsM
 Qw0YXuE2AGRvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BZlOCHA+
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.9
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting with libnvme commit [0] MMU is required so let's add a depends
on BR2_USE_MMU accordingly.

[0]:
https://github.com/linux-nvme/libnvme/commit/7d927f5f38ebd7c90abebb5ebac4701a1bad0993

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/Config.in    | 1 +
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/Config.in b/package/libnvme/Config.in
index f298046563..bf169f4a90 100644
--- a/package/libnvme/Config.in
+++ b/package/libnvme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNVME
 	bool "libnvme"
+	depends on BR2_USE_MMU # malloc_usable_size()
 	help
 	  libnvme provides type definitions for NVMe specification
 	  and utilities for nvme devices handling in Linux.
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 469006d632..99c633882a 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  d59939a280eec41eb7a716e1681d0d0c612099385204ffb55d07134a6be08d75  libnvme-1.8.tar.gz
+sha256  455867060d2b7563eab59fe21779dff469d98465028997178c7efbe4b8763206  libnvme-1.9.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index bf131d2a38..da8707db7d 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.8
+LIBNVME_VERSION = 1.9
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
