Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D7F5A8B1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 19:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FAE61112;
	Mon, 20 Apr 2026 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nC53nj4dFS2X; Mon, 20 Apr 2026 19:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD2E6110B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776714926;
	bh=ZaLbFsNjkJjVg0Nfy0x3nfXoiv2xyEuCHMWnshz9vDw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HWbTZurhND7Bd1PHmaIxB0g4BqBYH5+vhkwwNi4/rjVZ7OETl4Wa2N/jS5gkMkwoE
	 iDp7JV8NXQ9IYNSX85zYvrJZScOcRFzGltBbftTOWdKhFlMvl8aD0IVbEshpoEllUP
	 xw5SuCoEag1aBkW/gtiQKgPt7+yuDwn2dbSwor9Yk48oeLI4x/zV1oqRAd52uDgT6x
	 69ZSJLuoemd05cwqgS4jEeEJnv/8KEzqrlm9bkplNEZglIDn8RJbOzy6jnGZIU34iW
	 xKuW6skCxddikKpD+qoT7FrK2O2aIy9lQNv3+6D+hmPd48Gaia7WZ6lts6kigV40fU
	 HAQyTWagTJMKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD2E6110B;
	Mon, 20 Apr 2026 19:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FB3259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9536403E5
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlLsI9bUVnHc for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 19:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 925C440895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925C440895
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 925C440895
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:55:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488c2690057so34252175e9.0
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714922; x=1777319722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJu4dCnS9iQAALm/LGXs92WUz5f1CcnvRu/Gh8tvxfE=;
 b=mMTRsF/0nk09Q7W5pottrYDzIXwPfnnkgIemKU59tMSVJU6fgkiO62Iq1n8y3o2ke9
 tansqbl0tB9Sv5mMNx2AKPXEMXchSQWVWd2S3RmeBHf63iQWsIPRpTjzr4+DS3w3oHzH
 0lGsf+V4pvc5VpeRLtNM/5H1RUISGeiE7NDNazoFri+EAODHXiaKTs/dV973k7Ub7ErN
 ik9oe2x6PUbzyNaCfo3jIZ7nYvAWUEuerMzCZf7bN36mTmN18OPzOQbxJexNt035WsO0
 Rls9rZpMWHqHrMGCNjRZSyXxlq92mmFPS9DuM4fOutpXejsGBk/iLueKSRV1+KD4ec9x
 /IjQ==
X-Gm-Message-State: AOJu0YxLR3K2+oijlwxSC4zmeMuGNXgJ4kUbA3oK7pZ1YMR7kOLN2zii
 DZlrIAwOq/zOQ8yr7+H1Lcv8yoytBTSU4hWvuPQXgIA9DnYknzBUTxg8fLACEd5M4s1ESr5NgEB
 W9xKQ
X-Gm-Gg: AeBDieuMxupf86M95CtvW2Evn/ryYqP5qFIXUpZqRcWRWgRiZFUs2Fp95iH1KfFDRQs
 Hr9/CpRMHhn97jjvD6KNa9L2jfsq6L5N/VVwRiUrx0EUfIMG9U4BE/Kw4mp1CBg5EoCex38JgA0
 tsS5d303LtaJE4VYGlId8Ow8hG5kxBB/fctgkYNegmTt1zX6kPSsYj6k9GKQ7wQLxhohVGnN+Hw
 TENkDHybo7I5hzOPlh8um7t9BbDg3wQTqXp2C4N6edBkYPejhMokC4zy5rP+i6KYf0tVGxdvu/2
 jkejpJUJbB20GmBOi+HuPDsa7lBQKemtsc7LhqTiwQBZmU2z063odQ7M2JWzz2Xsd6nbDozxfAd
 YXe04XUJ7QccTko1S2GEbqja6RtuYxk3yXsGzKOR6pyiWLGiZXy4y8wp74FQ9RPaVfXqtFPwvSe
 Aeh03Jj9a4ecsvkvzwO5Nw1oh09U/npTBAjDMQM0+LR79FFASGn8AxP3cHx9DsmAVH9w==
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-488fb780463mr202343195e9.22.1776714921267; 
 Mon, 20 Apr 2026 12:55:21 -0700 (PDT)
Received: from arch (94.105.119.19.dyn.edpnet.net. [94.105.119.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14a61asm287777145e9.15.2026.04.20.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 12:55:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 20 Apr 2026 21:55:20 +0200
Message-ID: <20260420195520.191853-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776714922; x=1777319722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJu4dCnS9iQAALm/LGXs92WUz5f1CcnvRu/Gh8tvxfE=;
 b=CUrDRliSKXLG35Gg0GYLLJU4hLfGVfqZ/FndyqRd/1ANjqn4Am4+oEpEGi30+LpN3Z
 yqn9OzmFJrQgjEcHUPcLSX7l7Lntt2YXPX6owGAMsqf5jn+INlUi6JD9Ht9oND9IxkEQ
 aJCunZfkgVAsZ28buMh7ieB3qDOcJAx6MpLGnC7NubfRlWDHT6FCiSnbRY7rlpjWYU8y
 JvZ5sLR7mkA7afbL4vqC0Gs8WJItW4Ajr30G2DBXL8PEwCNZQ09+xY9yxciIFQ8W19m4
 9fOwminzHZcSWNcYf7QOoBZSVSWsFxr0g1DgMgw4n5TiyUDZt9lrXmSzzzvQj78CFuiW
 gZ/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CUrDRliS
Subject: [Buildroot] [PATCH] package/cups: security bump to v2.4.17
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information about the release, see:

- https://github.com/OpenPrinting/cups/releases/tag/v2.4.17
- https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md

The new release 2.4.17 contains the following security fixes:

- CVE-2026-27447: The scheduler treated local user and group names as
  case-insensitive.
  https://www.cve.org/CVERecord?id=CVE-2026-27447

- CVE-2026-34978: The RSS notifier could write outside the scheduler's
  RSS directory.
  https://www.cve.org/CVERecord?id=CVE-2026-34978

- CVE-2026-34979: The scheduler did not always allocate enough memory
  for a job's options string.
  https://www.cve.org/CVERecord?id=CVE-2026-34979

- CVE-2026-34980: The scheduler did not filter control characters from
  option values.
  https://www.cve.org/CVERecord?id=CVE-2026-34980

- CVE-2026-34990: The scheduler incorrectly allowed local certificates
  over the loopback interface.
  https://www.cve.org/CVERecord?id=CVE-2026-34990

- CVE-2026-39314: Fixed the range check for job password strings.
  https://www.cve.org/CVERecord?id=CVE-2026-39314

- CVE-2026-39316: Fixed a printer subscription bug in the scheduler.
  https://www.cve.org/CVERecord?id=CVE-2026-39316

- CVE-2026-41079: Fixed a SNMP string conversion bug in the backends.
  https://www.cve.org/CVERecord?id=CVE-2026-41079

Also updated patch offsets.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch | 2 +-
 package/cups/0004-Remove-PIE-flags-from-the-build.patch        | 2 +-
 package/cups/cups.hash                                         | 2 +-
 package/cups/cups.mk                                           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 30c3ddb48f..3c00bb1b49 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -18,7 +18,7 @@ diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
 index 613f01ddf..6f1bcb07e 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
-@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
+@@ -467,7 +467,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
  LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
  
  AS_CASE(["$COMPONENTS"], [all], [
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index e4081d0e07..82251d0fec 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -23,7 +23,7 @@ diff --git a/Makedefs.in b/Makedefs.in
 index 0d8df733b..2560c0c36 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -156,7 +156,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
+@@ -154,7 +154,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
  			$(ONDEMANDFLAGS) $(OPTIONS)
  ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
  ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 7c08a68c10..e421c6457b 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
+sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index d3e6094c67..f79e3846df 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.16
+CUPS_VERSION = 2.4.17
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
