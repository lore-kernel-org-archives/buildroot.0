Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826ADFC590F
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326BE41FAF;
	Thu, 26 Feb 2026 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2kk77C0_vIW; Thu, 26 Feb 2026 08:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BBB74208C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772095501;
	bh=K13BYwEfL+i6TZhBtxz2KicnYWDSpR4OyURUOl4kw1c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UWkp6yq1HmlHfLbrFu3X3jh4s2N9qGCkBmg1OWZGHdML+0DeWfbMyQVesD+DdV5uF
	 /bE1dD/4FtJxYk6Sz6lnt2uNqFE2nmJL6PxNsmvcqDrxyeeBqeHwIq2AMESDVMWcXV
	 3hrf/yU4gY8jil8TLOhbLLYLJaf7S9JqSCg/m7jJwyugmv/r211ugdQYNXGPIClNdm
	 M10ws+XbcyRWJbEDYN7D7+RBm9bWKx1UuYywXyKq/uVgdFE5ShtLXNAgmFM8SPXj1L
	 bKS42tJT50At3iS3PV/BReqBq2YLffBXFNHvCRTUDqUy7+Vn76jYGtEct2GftqtVQZ
	 tGFtFzXSIgwlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBB74208C;
	Thu, 26 Feb 2026 08:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2B023D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F42294063E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CHFFINF08gC for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 08:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F19240644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F19240644
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F19240644
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:44:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so3476615e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 00:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772095495; x=1772700295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGAkFkBQ18vPE2+YPPtPf+Imoon0xbFSUqm41/38/JY=;
 b=FFaZqT9fQ1LaU+5wbr2TV9T4HgSQ8xyYSW2SAPIYDD6gxSQeG/XvH8CjPUr2RxaH0S
 q3CQcJlqHFkSm4isL7vaRuJ5DRjBy125cU5HPIAEmGRJbmA4Rm2O8ELaABArphhtw/+J
 iHQpd+Ntlyv1a9+5dKKbQHjsQpdcM2fuSHMqalea9mMnu9rCPdlK7etznXJYtKdk7qHu
 U1tPIUQaPFytwodQaQXDFQ+gX9uqKqVMaXfnNvvCB70B30ehLsidVnkMXNtnOpvFQl6M
 cw15ZisuC0qAri8NLizeRF00VwC+9jbhc/V7TnISmJN417SKvcMO+HCCWWvJcaIUxjEP
 FCwg==
X-Gm-Message-State: AOJu0YyA2zFDYyznR/1Ab7sclASFW5ciENddhuKRRNJNTv/mxsSiyiWV
 c0bRaTqivvhZwxE+K80RDsGFf/mkk/VyqN/s6D6Z1ucbiI+ola6AtTYxXizpmP59yzKOtppGd9V
 RBW50
X-Gm-Gg: ATEYQzwwx57lJuFFYwfdD/tBxlbsnGokpyaWXuwpIofjQ5/XgBLNzTANBx89v80cc33
 qS4DE6cAKO+BGz8yE4Tl8FH813DIzvT/L93EcxVvHVQw1kbk/ponsZQ4TmXnEiaASkrrD10eWtq
 ZedG9o7KOyvVz/wOAwQhaoi8jahoBdCy5DCTw1gH4Vj0hGzqTfB7iwRp23IXqlBtmbnZKcXVvsH
 f0kPG8zVYeuTRUUeCOsnMBtOFq2ER5zfkCZNxKRMACGLn2qCBsEaNGB/x2eyDkkNUUVrBKI6kNE
 L5nt8fKByoTUzgZjN2D+DMQDKkOMmG0KUfnatNkI5feDKhJzaAIpmePKlk+PANZozJWW2pWGIO1
 HFUtQQDAVAe8/1o/ikWmqRX463VlPCWGzrWmCRTsv+qrUI0Dk7jRWznINDpDGUIr1AdqA3+os7b
 1jDQrycWzX9jGKrJ0=
X-Received: by 2002:a05:600c:8b54:b0:483:7f4e:fef6 with SMTP id
 5b1f17b1804b1-483c21a01f9mr58524725e9.26.1772095495503; 
 Thu, 26 Feb 2026 00:44:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb776b0sm32895495e9.1.2026.02.26.00.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:44:55 -0800 (PST)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 26 Feb 2026 09:44:54 +0100
Message-ID: <20260226084454.59339-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772095495; x=1772700295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NGAkFkBQ18vPE2+YPPtPf+Imoon0xbFSUqm41/38/JY=;
 b=NnETzm3tNr1Ix0+A/Dt7b57ypvfYok6adYwuAqDHVPEM5qnQnoQDxApk/iiZNCj7aV
 /Lv0GhJLbmzvb4KNwSpHAwYAARnyXopWHeoCkumsudWTxtCHa0qUWgxb9XcDGyBf5Oaz
 cNO2VE+lQq/RiGUIzlnuDc796+P0SaQzL9Ichz15nAdjs4qDx8V+NGJ2OZ11Hin/EjSW
 4h1XRPahNLQBYzJjovgsXORqGklvJ8i3Uv08idVn1qcf49RAGdHtBAAWh0VWINEx8I2x
 MXIckA2JrqeMi3YAsCjcSZeaMqNghgnEssqDED5P5gjsdqwIL+LSRbfpZnx8jCFjTWS9
 cNyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NnETzm3t
Subject: [Buildroot] [PATCH] package/cups: security bump to v2.4.16
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

For more information on the version bump, see:
  - https://github.com/OpenPrinting/cups/blob/v2.4.16/CHANGES.md
  - https://github.com/OpenPrinting/cups/releases/tag/v2.4.16
  - https://github.com/OpenPrinting/cups/releases/tag/v2.4.15

Fixes the following vulnerabilities:

- CVE-2025-58436:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to version 2.4.15, a client
    that connects to cupsd but sends slow messages, e.g. only one byte per
    second, delays cupsd as a whole, such that it becomes unusable by
    other clients.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2025-58436
  - https://github.com/OpenPrinting/cups/commit/40008d76a001babbb9beb9d9d74b01a86fb6ddb4

- CVE-2025-61915:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to version 2.4.15, a user in
    the lpadmin group can use the cups web ui to change the config and
    insert a malicious line. Then the cupsd process which runs as root
    will parse the new config and cause an out-of-bound write.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2025-61915
  - https://github.com/OpenPrinting/cups/commit/db8d560262c22a21ee1e55dfd62fa98d9359bcb0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index a200a82deb..7c08a68c10 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699  cups-2.4.14-source.tar.gz
+sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index e6de671174..d3e6094c67 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.14
+CUPS_VERSION = 2.4.16
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
