Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A0E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1980B80F12;
	Wed, 11 Dec 2024 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bpd8NpzkU7_j; Wed, 11 Dec 2024 19:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C32480F88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C32480F88;
	Wed, 11 Dec 2024 19:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F5F9962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E20F41CA6
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlELYPCgWgo1 for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:13:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 407CC40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 407CC40184
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 407CC40184
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:13:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51F41A4C2545;
 Wed, 11 Dec 2024 20:13:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35714)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLS9L-000000002mD-2Kkc;
 Wed, 11 Dec 2024 19:13:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Wed, 11 Dec 2024 20:13:31 +0100
Message-Id: <20241211191331.1380127-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733944412;
 bh=bA8KENJmJ06gPyZA0oswkV8oYwmxtDcrQDkAdzdLCnk=;
 h=From:To:Cc:Subject:Date:From;
 b=htT9a4ESaqROo9PdybX0imQQ0uWue4hQQe9vZtX7aCVfUaSEKG52JmONN61yEESBq
 7ejsVDMZHIvF4w92y0jhCnckqdysGNyIqt1xNStlk4HhE8ZObMiEppKnlTOSbWCNtC
 kSYrXQ2PpCkci5/mT+oPDZ1OBxcgDfMDpHbGT3lwewpxBL5CW0NT1uLkKcZC+sBRkM
 QaZCk6qDlZl0gKZ9tMqpxRcVD8jpGb1b6F1D3OYHIgv4v39WOJxZiJS1BexJdkD0OP
 hSgF/6ttTFxuW7RKeUFaDcGOy27DhdP3z03XvMIAvvXd8v5kxKAeSFQj9J26WwuJ2R
 eWMsyxGwEWJVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=htT9a4ES
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump version to 4.6
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

Release notes:
https://github.com/troglobit/mrouted/releases/tag/4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mrouted/mrouted.hash | 4 ++--
 package/mrouted/mrouted.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index 7516a1329c..aabfd19f33 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/
-sha256  99e1a1ca45e4e6c05b3cf379fd59a239aeabd9512656114528ad5e172d3c8ba8  mrouted-4.5.tar.gz
+# From https://github.com/troglobit/mrouted/releases/download/4.6/mrouted-4.6.tar.gz.sha256
+sha256  49443c47b5b28a5ab65d796f3495d72a94c1c95e54333cb11fe04075006b576b  mrouted-4.6.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 7b5f5039f6..077afac2b9 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.5
+MROUTED_VERSION = 4.6
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
