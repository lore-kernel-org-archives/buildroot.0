Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F2EFA3741
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8064C40629;
	Fri,  2 Jan 2026 14:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhRWG1OXcu8u; Fri,  2 Jan 2026 14:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0EA940631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767362970;
	bh=6r5KOLqsA7PDpG8JmNY2ll+HTHK/Gyl5XOlDsoJclHA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SLUc6916d/4STS6hh0ojTpUy5kUaupQRSCNKhx4jc+SNfacg0Rr1hMeh6A8rtp1mj
	 uDBMB2ZsjMvZ2G8B7StS7c2OHx0SFiiXHRHm6uBZSH8Vlxl7fyUwxcqfAwuZfVRDsa
	 xfJK2qtJqh0OX28kih8Xs+zqXfdymRxtdjQwlYSirwcigpudAKB43pzNG36ZCec1/H
	 KrBMKiyWgqXb1pKo3pNA+ig28vwBOW2XtIQQHYiHGn6Qhpi+giKKu9UT+p33st8rDF
	 tOC9bO6zUdzKBYNm1k7cZA1LY297w/6MKnQB90UkHjR9K4cA6mr9eZnfg2oTbcp/Fl
	 cKiqiDqcwc6jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0EA940631;
	Fri,  2 Jan 2026 14:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 570BA351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB0440631
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmiuIa0BJUuv for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3121340629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3121340629
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3121340629
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:09:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B522AA4C3246;
 Fri,  2 Jan 2026 15:08:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfp2-000000006rb-2xwU;
 Fri, 02 Jan 2026 14:08:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:08:03 +0100
Message-ID: <20260102140805.166641-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102140805.166641-1-bernd@kuhls.net>
References: <20260102140805.166641-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767362894;
 bh=SIMDBjdpPw53wWLltQEOAKbzv6jUFhQwhTAdctwfiaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Z0bBY3y8CXtlK5jelEEZlLn6awc68bCi04jXBokIOsW/WIQnE3A667P6SpiDpZEY+
 /D79GBq+3lhT1or3h3Kda877/5CYwAqJ/sSSNRoOS1SK98FZHK6AX5pSXHIttPuNT7
 7kHYMu/5zixVKTpaR7DtQigtUBZLP+aHVsBOL/PvWPM3GHa4l1I0HpVyYDoGRHtjJc
 LHlLFgVf91WzKx9jeOmgV9JaehPFevtyHUDTontpxkdsag2OOn1LeeQ5bxf6jQMlj3
 5nlTTJFX9xKbPJNhOWdCZXByWHXk7tKFL0HnVq0GASe+Pyzt1DJOIAAxS5B5S76nJ8
 VwQXD6tMeOqcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Z0bBY3y8
Subject: [Buildroot] [PATCH v2 5/6] package/python-html5lib: fix build with
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
