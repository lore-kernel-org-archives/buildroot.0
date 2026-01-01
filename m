Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6307EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF6E81161;
	Thu,  1 Jan 2026 18:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Hxj9b2ebrwh; Thu,  1 Jan 2026 18:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B89D980EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767291001;
	bh=6r5KOLqsA7PDpG8JmNY2ll+HTHK/Gyl5XOlDsoJclHA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cfDJN2Upqb2jD4hPy4BLh4gQAGGDqoyvOEP0/0WdDtRzntHkyn6XUezR25thiLGVD
	 Djc9gjCysUtkW9GwNxlMwNbKI+Nd/WoSsaXtK72d8yNvP6Y3o//8wB14COQzKjHCNN
	 g4Wszc0QOF49KuOk4JCZC/UQaZ1FJsz2sTl/oiTrmTD2V0qdZ8SwWyNz/zY8cY8pIK
	 SesG5x+nmvWXLWs9mgi9V6vKWMg/UJqBLJ4Et4f19LFOFpUrelfvryky/7dYr4MUwn
	 z/fXXA8xRcOAQ9iSS7NgfDebVGC9nPq5RrEG4P/mvlG1saIJs4KBP18UHgP9C/ANvs
	 mhLm1+MHkeZ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89D980EAD;
	Thu,  1 Jan 2026 18:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A706D19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DD394020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGqiHt2XTEer for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89B39400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89B39400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89B39400F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55810A4C2EEA;
 Thu,  1 Jan 2026 19:08:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41084)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbN6L-000000006l7-1kmB;
 Thu, 01 Jan 2026 18:08:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 19:08:41 +0100
Message-ID: <20260101180843.247730-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101180843.247730-1-bernd@kuhls.net>
References: <20260101180843.247730-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290934;
 bh=SIMDBjdpPw53wWLltQEOAKbzv6jUFhQwhTAdctwfiaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=r4stOx+lqj76dsty22cBAErH9U30BpGDY/TOu1isuCe9/Oohmn6sluDczY/HZ5FtT
 7XJvNlzEVMK4roloILO5VGSaAn2O4op9Pfd96os6FF6wd2OFU42pZxQ7p3lCO8rZnn
 FIODR6bnveTf8/Qcy4H7fyLJgfW1NxQ/w5ZBrGmm1APnwuDfvBFOn1SK06oNpwcQ4P
 u7ZkUWt1GIAo5D5e135RMyzOd4F29qRaqm+hfefEW9ljppltXxfJLvS5xuiAc0+SDV
 k/2+lpsiUw6dwgx4ZgceODp0oyAePlaN2z8KMpJLnH/0t1t0/i8lk7STmr0dh96rzr
 xpMb8mOyv25Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=r4stOx+l
Subject: [Buildroot] [PATCH 5/6] package/python-html5lib: fix build with
 python 3.14
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...y-fix-version-parsing-on-Python-3.14.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch

diff --git a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
new file mode 100644
index 0000000000..0147aa1418
--- /dev/null
+++ b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
@@ -0,0 +1,42 @@
+From b90dafff1bf342d34d539098013d0b9f318c7641 Mon Sep 17 00:00:00 2001
+From: Andrew Sukach <andrew@sukach.org>
+Date: Fri, 12 Sep 2025 21:53:31 -0700
+Subject: [PATCH] `setup.py`: fix version parsing on Python 3.14 (ast.Str
+ removed)
+
+Python 3.14 removes the ast.Str node type. String literals now appear
+as ast.Constant(value=str).
+Update the AST check to accept both ast.Str (for older Pythons) and
+ast.Constant with a string value (for Python 3.8+), allowing html5lib to
+build successfully on Python 3.14 while remaining compatible with older
+version.
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/589
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 30ee0575..42ab6f67 100644
+--- a/setup.py
++++ b/setup.py
+@@ -92,9 +92,14 @@ def default_environment():
+     for a in assignments:
+         if (len(a.targets) == 1 and
+                 isinstance(a.targets[0], ast.Name) and
+-                a.targets[0].id == "__version__" and
+-                isinstance(a.value, ast.Str)):
+-            version = a.value.s
++                a.targets[0].id == "__version__"):
++            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
++                version = a.value.s
++            elif (hasattr(ast, "Constant")
++                  and isinstance(a.value, ast.Constant)
++                  and isinstance(a.value.value, str)):
++                version = a.value.value
++assert version is not None
+ 
+ setup(name='html5lib',
+       version=version,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
