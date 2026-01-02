Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89662FA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5A9810DF;
	Fri,  2 Jan 2026 15:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pr7w5BPnmoW7; Fri,  2 Jan 2026 15:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CFA0810A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367650;
	bh=6r5KOLqsA7PDpG8JmNY2ll+HTHK/Gyl5XOlDsoJclHA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QLl4TgCnPBCyaa2B4PDYiKSwMR8pCUAcIi97hPn/Nv66tQiY0ntliR5kav7EXv2j4
	 EnVCng9GBDCL6dOOhKA6Kmq5Gpzts61zmlHxMwNsFPFCZb+yIxUjrGs8WiNCfnRzi/
	 xXk/ZbQBEb9hC/TCroBOxiWicIWDVNtRPazWEgtuptPPWQ8Hdaiw1muRihZr0qOK3F
	 gtNU7c1gL2eUfX2toR/zStOTiUcpyh7o5MXJTc6TvrcAw0NHC9d/CBsW1wsK62Q8ej
	 hKrQ4URRoDeo6wY8JaMgSANWKd0uFg4b0aLOPrmjynpISQaLbdd6J3uXkDL5m3EWKf
	 PIYyuJscuak1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFA0810A6;
	Fri,  2 Jan 2026 15:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D18019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77984041B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki7h8z9x0IJU for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2E7B400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2E7B400C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2E7B400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EC6DA4C2CA3;
 Fri,  2 Jan 2026 16:26:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37006)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbh2z-000000004IY-07l9;
 Fri, 02 Jan 2026 15:26:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:26:34 +0100
Message-ID: <20260102152635.924052-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102152635.924052-1-bernd@kuhls.net>
References: <20260102152635.924052-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767367601;
 bh=SIMDBjdpPw53wWLltQEOAKbzv6jUFhQwhTAdctwfiaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n+6Kd3ZMNDnnxeyKo/0SzLb3sIfH4ImfwoMfmBVhJMP8HnFhTAA+w4HdCkU0xcyft
 H4gUWYrkgkolAemRYGaUC9XYde/uwRTegm3S0/jgWyOx6F0Q0kHaPhqXZf3F79O0Va
 ROXZfdAF6As+l0jS1X7oUE9jAz/HxniRF2rQs4Lt9DhDSpWF4WTeptcrpuFBsk7QbZ
 Tih7WcZ1RTJm/t4e18kbIGjwQ4S43XLPH02Pm/fuWutzNZEZV5gIT+WssVIpB6FHT2
 uJOPNdhNG6u7EKvQ+evIGU4uuNEmTeXNRUvJWdCB546l6Swa8EgG1MYeRFx6kLeXmq
 HsoswYij2x4+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=n+6Kd3ZM
Subject: [Buildroot] [PATCH v3 5/6] package/python-html5lib: fix build with
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
