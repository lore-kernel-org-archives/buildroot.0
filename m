Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C875BEED631
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987C9404B1;
	Thu,  1 Jan 2026 18:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rokJg9b8_9O0; Thu,  1 Jan 2026 18:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D8D404A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290988;
	bh=SOtupSFC15k+9n0hnHBPfjpGq7w00yX/ETHOapcShQ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YzSROiXaAqMoSltSk22KbVr7cfZ3Uvfd/Wwo1/SsEhyCcxZ8XQFiJjPofxbCVTwUs
	 MzHVO0s6asjerpMFFyJgik1/jvxwn8c0ULyTDCqZw2/zMNmZLOkbnedoJtflYL6sfb
	 Y49yrrnzXktfoVSXHGR0oK3F14ygZ7VPSpq36C7Zdr4n4dDUqlGFXwdbPj9V/O+BGK
	 8gtcaJCY/HUtvnteM9zDRuHpvCB/8a2IsfhZbWnRpljzHByghxyYrahUlwPSXjZuB0
	 UojAyPKPOg+DvFrixUA753wFiBeNTJFy+tgV2zrstMQTUf4hu/CxyALMey4ZMs+gKi
	 6paKuiiugHJMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D8D404A0;
	Thu,  1 Jan 2026 18:09:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD941206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A453880EAD
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMon_pcB05ux for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:09:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9109B80EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9109B80EA5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9109B80EA5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:09:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25872A4C2EE7;
 Thu,  1 Jan 2026 19:08:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41084)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbN6L-000000006l7-1PZb;
 Thu, 01 Jan 2026 18:08:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 19:08:40 +0100
Message-ID: <20260101180843.247730-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101180843.247730-1-bernd@kuhls.net>
References: <20260101180843.247730-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290934;
 bh=H6NeKNPcxyUajOvu1vgV2go/LME6h93+ugOEF6EPOxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZvNrtYPF/wwggMMNKhcypTRsXXXa4nDL3DAjKDy1gX+ERtxxSs3Jjz8bz4C+PLrFI
 QwgADNb+Y29Nso+WrW4Hqrg2Za8Flh85Uvi6x+oHq8D9T+Y6+bptRAChxvVXZ59wqs
 x0K5fhJFbJG7xF721JHfayAEMOAR4ayjbfCpaFGlmg5FuuDRnUzKsgGQCUU0BMGbsf
 EIzrqH7lZqOXa9xHsTxcRXpwayJDESDz4VrTmXMjSxyCsZXH+elJxwZkpKy5vn3wZI
 LPQlYFcsFcF45cC386gBYG0xfuKqWMDrmhXXSZH7vWoUwl8YLqqKdpRSN/Js9FRO8c
 X0SawGtr5bD/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZvNrtYPF
Subject: [Buildroot] [PATCH 4/6] package/python-aiohttp-sse: fix build with
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
 .../0001-Fix-build-with-python-3.14.patch     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch

diff --git a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
new file mode 100644
index 0000000000..76b595c7de
--- /dev/null
+++ b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
@@ -0,0 +1,35 @@
+From 7a649de6561ec181208a9c4fa712aed614a224d4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 8 Dec 2025 18:03:03 +0100
+Subject: [PATCH] Fix build with python 3.14
+
+ast.Str was deprecated in python 3.12 and removed in 3.14. It inherited
+from ast.Constant, `Str.s` was equivalent to `Constant.value`, so we can
+use the latter on both old and newer python versions.
+
+Patch was inspired by
+https://hg-edge.mozilla.org/mozilla-central/rev/dbf9702ed87e
+
+Upstream: https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 6843260..fa41025 100644
+--- a/setup.py
++++ b/setup.py
+@@ -25,7 +25,7 @@ class VersionFinder(ast.NodeVisitor):
+     def visit_Assign(self, node):
+         if not self.version:
+             if node.targets[0].id == "__version__":
+-                self.version = node.value.s
++                self.version = node.value.value
+ 
+ 
+ def read_version():
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
