Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E549C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07FB81570;
	Wed,  9 Jul 2025 15:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZFixcaqb0tB; Wed,  9 Jul 2025 15:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DFB815D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DFB815D9;
	Wed,  9 Jul 2025 15:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 288E515F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA60815D9
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hb-8w97M1-tB for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:15:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D74F816A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D74F816A0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D74F816A0
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-451d54214adso41188315e9.3
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 08:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752074147; x=1752678947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDj2+GDxcRftbnH5P9WBguUh7sEcMI0Fe9rzKNaZj54=;
 b=hL/vujKFzy/8/++TYaAPVPoURBIjlUnaRD8BQYpl7r9MHHRj9eiCNR0Yjz0msZMbJN
 1TtGuHYS8qnUg0taGMz8KCKk2RhCrw5eD/CkJ18VnGr4S6+12dqvlt97AJ9QlSLWEli6
 m3HrlGH5MmlAqCNk+hLgpoyWwa4c8xj/uOsRrRGFLCqm+RstAZN7X51RIMS/RK3+XpsD
 tYtMxiebdDRsjt/i5zsAlFl7zFMZIy8zw6E8LyEiO3nN7Lv14zIulMrHW2YYxQDqPJag
 lagylns7TpY4KUhQ/DvCu5AjS6XejUdRnOAnDHQmjGwWqSRutuKKNGoWsKGMCfZ9Jvdp
 FOng==
X-Gm-Message-State: AOJu0YyRTftUrT/dWKWij7ZmuKbQjqi7T9kb36nrdeppr1lY83qV1LvV
 hO+kIh9rTuu7OO0Zw39bEKqLymsbwjnbWxlxW/6ami5DcI18ln8DoAY1HghqJXfDBdRgNnPA40P
 JfgVGk+4=
X-Gm-Gg: ASbGncvfpHDBefCpktvt2z9NxEhW2K6qJ1h3nnjxPdQ1NaV1OO7HY/woBPZ+MRuWLy2
 hK4qq4R/3o/i+Fh1IcWrDWBr4CO0e+UtLMyRZiJdzR89sCNt2Dgz6zFmrf+dGG6YDMDrYGxjFly
 Lh321zWHxFRocEqMdomIU+vyn8vGv40cJaQylAHLPUA9a9ojZ7nHBs7BTCteu3TfB7MmVHFuJiE
 4F4RSmgJ1H34OnAbhjwvkaJ12N6/l1645WunClYZhfpDP0nEm9o0yirvUm4oQkTZjupZ8vDkveT
 Wim06CNQAKzlU6zeA/L5jZB6s2esbyuEru3XO1kuWDg6/fRjgiwt0kGKBhnsF1dSyT8oBNR4W+8
 B0t1qZbyv05wLWRm/itfPSrcCw1Gl19/BH8dKp7Z8q6mFKnsrILsYLVZZIA==
X-Google-Smtp-Source: AGHT+IEF/q1Rp8uPaxLpgml8yhuyHXN47n7P/gnrIrcFFTD3NrbxKHJm0PWm944I8HAXW4XCpXtekQ==
X-Received: by 2002:a5d:584e:0:b0:3a8:6260:d321 with SMTP id
 ffacd0b85a97d-3b5e44e3fb6mr2060004f8f.3.1752074146550; 
 Wed, 09 Jul 2025 08:15:46 -0700 (PDT)
Received: from TimMind.telenet.be
 (ptr-377wgeyf4tq7vco44vbx.18120a2.ip6.access.telenet.be.
 [2a02:181f:0:4023:f979:8572:d806:db9d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b49cb46c61sm12455771f8f.63.2025.07.09.08.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 08:15:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed,  9 Jul 2025 17:15:42 +0200
Message-Id: <20250709151542.2605609-3-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250709151542.2605609-1-tim.soubry@mind.be>
References: <20250709151542.2605609-1-tim.soubry@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752074147; x=1752678947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDj2+GDxcRftbnH5P9WBguUh7sEcMI0Fe9rzKNaZj54=;
 b=dVu54H/3pbQDa9K7fDe90BGANGvzAOI9S4+cknLfShdJdi6zCWSToblT545Dr697H2
 AFHnFL3x6d33q4Cdfap5TvAG7VoAZAzrwsBl+KHpE2qBznFB7E0arc4eQqPEEdpv4zBM
 NdOplCfnmqWR0eBNhubAYOMmZVkpe14T00vPLNF7omve3sD/a1hPpZ/FoA2xKtSBdYc0
 lgg2u3VDBa1kdaDpHiMAZJi494wJrAPZbOvi1eO1GPUgNuKlorD0+v3Q19M8LS5YK4Gp
 7L473XWrGj7aXuuk+KRDBJKCH/y8/Rd/hS8+IztVX+Ge2nqKtGoytu4QCdEXyQrMrbsJ
 zWzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dVu54H/3
Subject: [Buildroot] [PATCH 3/3] package/libxml2: add patch for
 CVE-2025-49795
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch mitigates CVE-2025-49795 [1] by backporting the commit [2] to
libxml2 2.13.

[1] https://nvd.nist.gov/vuln/detail/cve-2025-49795
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/499bcb78ab389f60c2fd634ce410d4bb85c18765
[3] https://security-tracker.debian.org/tracker/CVE-2025-49795

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 ...ull-pointer-dereference-leading-to-D.patch | 70 +++++++++++++++++++
 package/libxml2/libxml2.mk                    |  3 +
 2 files changed, 73 insertions(+)
 create mode 100644 package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch

diff --git a/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch b/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
new file mode 100644
index 0000000000..38b3e9be41
--- /dev/null
+++ b/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
@@ -0,0 +1,70 @@
+From 4df1c80c4edc51ecb9f2f574203128a06fd31406 Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
+
+(CVE-2025-49795)
+
+Fixes #932
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/499bcb78ab389f60c2fd634ce410d4bb85c18765
+CVE: CVE-2025-49795
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+---
+ result/schematron/zvon16_0.err | 1 +
+ schematron.c                   | 2 ++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 4 files changed, 15 insertions(+)
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
+new file mode 100644
+index 00000000..465cf2eb
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1 @@
++xmlSchematronParse: could not load './test/schematron/zvon16.sct'
+\ No newline at end of file
+diff --git a/schematron.c b/schematron.c
+index 426300c8..b51b20e1 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1509,6 +1509,8 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             select = xmlGetNoNsProp(child, BAD_CAST "select");
+             comp = xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval = xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval == NULL)
++                return ret;
+ 
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 00000000..4d24c054
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
++	<sch:pattern id="TestPattern">
++		<sch:rule context="book">
++			<sch:report test="not(@available)">Book <sch:value-of select="falae()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 00000000..551e2d65
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+-- 
+2.39.5
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index a4373a691a..0149ba1f0a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -21,6 +21,9 @@ LIBXML2_IGNORE_CVES += CVE-2025-6021
 #0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
 LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
 
+#0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
+LIBXML2_IGNORE_CVES += CVE-2025-49795
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
