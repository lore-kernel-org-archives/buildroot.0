Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC42FF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 05:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B901841A7;
	Fri,  1 May 2026 05:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik7rPSjQm0Gv; Fri,  1 May 2026 05:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32507859E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777613934;
	bh=2QlIxxL6VMK9Iaa3M+TZGVI3CRAvMfFuL7rw1NeZecc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MkjYYPAI1CeQE1NXeYpl68uLQIFcTAhLjX3ak05CCrYBBNWWwTsTTklg+Fjg0WKme
	 H2oKfhVObZT4i9eytVesqEkMdfEQsHLpN8mf7oIR5KGvGej9h2ks46YUDv5BDXv5iS
	 HsH+YgX7/WOvlIxaXef6usjCnjKcXvWbZp74xa3rj1wRIEE8NlSqUN00kM94u2eJZU
	 B/p4sofOOlGVB2QNjfwKN7pNUDTLQkekLyByyLYfwxf77L1nLegbIU/pB3czHQY5LE
	 dPr8RHFVCf30YMhusS5u3lbPU5ymqnh2hYP3u4tbNRALObDlsu6SkSr6xzxYL2EIvv
	 Yg5M+IdxPl+kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32507859E1;
	Fri,  1 May 2026 05:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A4E127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 05:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 516164234B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 05:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6kHP9zIKEf8 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 05:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E19942335
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E19942335
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E19942335
 for <buildroot@buildroot.org>; Fri,  1 May 2026 05:36:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8DD32A4C25CC;
 Fri,  1 May 2026 07:36:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37922)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIgYF-0000000086z-2Fhu;
 Fri, 01 May 2026 05:36:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  1 May 2026 07:36:34 +0200
Message-ID: <20260501053635.370157-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777613795;
 bh=LaXjrakL728oroBsMzdmumUn9H4EkfiUxHPZO9HVE74=;
 h=From:To:Cc:Subject:Date:From;
 b=NitcbPkBxbVEwTWWeQq8MEr3BxHHLUbI6RV8icE2dcyhgmd0etzmvLSkPZpJrt59H
 O6YU+s3JBctIncrIBwPaMs55WRrO6rmOsDql4qwfdgE6pEssN/xYbnB2u/HJ2w2Glm
 YzaQoF9+EylzrbVBkKNs6+jwH2j5KMdYfI/pXgKbtVYFj2jKBJiE709JPf8zixdyLv
 2G/5k2rkohMsZiYBwDlQGilnaUy8KtxsC4TrUSvxl93b+9O9nytShPeyQqZ6RGanP4
 5qmGH3E0/2mAL3GSQJ4+Sl4Dm3/Oqvv98Jr6er5lP/x6gw6UWfjAnL6K8z45K+GJRO
 /GF6qeDu6NkiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NitcbPkB
Subject: [Buildroot] [PATCH 1/1] package/cups: bump version to 2.4.19
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

https://github.com/OpenPrinting/cups/blob/v2.4.19/CHANGES.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cups/cups.hash | 3 ++-
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index e421c6457b..7cb25fc4dd 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,5 @@
+# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
+sha256  820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389  cups-2.4.19-source.tar.gz
 # Locally calculated:
-sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f79e3846df..0df4f411bb 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.17
+CUPS_VERSION = 2.4.19
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
