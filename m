Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C4CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF63811DA;
	Tue, 23 Sep 2025 13:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oS5MFmU4Azcy; Tue, 23 Sep 2025 13:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD37F811C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD37F811C1;
	Tue, 23 Sep 2025 13:11:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC531E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D618E4096B
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Oijhtdy7b6L for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:11:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E447B409AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E447B409AA
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E447B409AA
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:11:46 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so1015893566b.0
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758633104; x=1759237904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qO+mJLUYbBbwo/Tw40ynVM+p3WCburxe/oR5+O520N8=;
 b=BiyEd8Nl6/nElD2EduEOWZikjjjhWrqdg4EZnQZrcaCoSTgclQuanulVBEhPaG+FeY
 QDl2WluZb4W0SDwpMMqrVP/XEi37881f19Ou0pmCSjYKc5/uyllvizg0MfC8MsTOUMsm
 EGOWV9yhIUvbhwyDnh5MmCRphr3uavhn/QsftNomZQYP1wakeCV4y9MR2Ws8jmIOOHcg
 QkTmwPUNJ8hWXFq80e3dVI1GwWqgMVP0BfPoEBAiLsXoNv3zw6bHvfCDY5JtAlLv5047
 I9AKVuIzXt94ohTq80ZLD4K9JUkQzIJTcDdiG3LHVWLkP26DDZ0nnMRMFeM4/pSqXWTd
 TPCg==
X-Gm-Message-State: AOJu0YyFNq/tqdORWBgo2mkNczbShW+Rq73Q9tas9xu/hT5QiP2E3SNf
 erd7rkI+yVmoNj21bbTNwhcHW2gD1ePqs4SUSWowVk22Z6FxHgYhDoDUpZYxPA5tnme5BHft2sE
 H1+tIuh9HlQ==
X-Gm-Gg: ASbGncueXig/2kE0UEEgs96hJS9FCNyTCrZ0aJEolXqCHZF0//LNAMEohVNbQ43lSJ2
 TWv25LNgKYmvJ4f1tj50J9HzmTD1AsqkTmnR+wiGRTJW02CNcWcgMO1u/z3Yd3LlYh+d+h60lju
 POjukdjcnTbcGIf1QOhr0+qYr6wftpVJXs5vdinA5N/mpj4GAfkOrL7+ft0d0UPoYKY/dC5024O
 oL4LscaRgDbGIFV8I4G3Ay2zuMKM/4UX5h8J6pSYpZ6FPhEWpn6XpnOQy98chSzJU0rqCMA7FFo
 ijUs/ucVCMieOjib7Vs7K4t4ggWlih3r8lXoj+YPQn/wh/af6AmcgEALxPbH5H8wnVHNUC5yp93
 UQnQlFv8ucf2VBc12qiHMGj6ggUjW7xaX
X-Google-Smtp-Source: AGHT+IE63hTTnEpnxwmMEBjc0Rpp+ZhrCyON3d/Ey6iVhmNZ2uvWLa1d8C7P3a57qYKXVIEi1O+yYA==
X-Received: by 2002:a17:907:970e:b0:b04:a780:4673 with SMTP id
 a640c23a62f3a-b302b513b3bmr231875766b.31.1758633104109; 
 Tue, 23 Sep 2025 06:11:44 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b28be3fa38bsm776942466b.46.2025.09.23.06.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 06:11:43 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 23 Sep 2025 15:11:34 +0200
Message-ID: <20250923131134.156372-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758633104; x=1759237904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qO+mJLUYbBbwo/Tw40ynVM+p3WCburxe/oR5+O520N8=;
 b=ZbjmNfMW+AQ7bn91TVM3KJ/1g0zOW2/c7Z+mlyd/6kFAs0SXqGeGD/ysPU95rQAr1r
 FWvrZh12yqG+wX0hDcDDCdClDw6dPn0aCr+6aJF++JNhGezjO/E15mWa4UVOsQsf56dY
 NgW5iL+oboSDxJW1whkPLkoyB/snpL3UoXZKycpb2SSVu2QGelsI/e6Yg8ruFaCXP7zR
 juQdpzUsHqgpbPwiCc+9STabfAsXifN6jj9nIBjuf81/5czuA4CW8MdBE+MQ4dsuNmOv
 Uqm3U2KTQU/Xw3R9u424S2ogskEgrhgG8btlNLVevUbIxUT9STo1MRB/FZzEuvImtfl/
 jcFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZbjmNfMW
Subject: [Buildroot] [PATCH] package/cups: security bump to v2.4.14
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:

- https://github.com/OpenPrinting/cups/releases/tag/v2.4.13
- https://github.com/OpenPrinting/cups/releases/tag/v2.4.14

This fixes the following vulnerabilities:
- CVE-2025-58060:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. In versions 2.4.12 and earlier,
    when the `AuthType` is set to anything but `Basic`, if the request
    contains an `Authorization: Basic ...` header, the password is not
    checked. This results in authentication bypass. Any configuration that
    allows an `AuthType` that is not `Basic` is affected. Version 2.4.13
    fixes the issue.
    https://www.cve.org/CVERecord?id=CVE-2025-58060

- CVE-2025-58364:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. In versions 2.4.12 and earlier, an
    unsafe deserialization and validation of printer attributes causes
    null dereference in the libcups library. This is a remote DoS
    vulnerability available in local subnet in default configurations. It
    can cause the cups & cups-browsed to crash, on all the machines in
    local network who are listening for printers (so by default for all
    regular linux machines). On systems where the vulnerability
    CVE-2024-47176 (cups-filters 1.x/cups-browsed 2.x vulnerability) was
    not fixed, and the firewall on the machine does not reject incoming
    communication to IPP port, and the machine is set to be available to
    public internet, attack vector "Network" is possible. The current
    versions of CUPS and cups-browsed projects have the attack vector
    "Adjacent" in their default configurations. Version 2.4.13 contains a
    patch for CVE-2025-58364.
    https://www.cve.org/CVERecord?id=CVE-2025-58364

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index e363a761eb..a200a82deb 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59  cups-2.4.12-source.tar.gz
+sha256  660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699  cups-2.4.14-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 21fe6a7c5e..e6de671174 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.12
+CUPS_VERSION = 2.4.14
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
