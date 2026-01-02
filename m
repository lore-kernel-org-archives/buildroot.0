Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9059FA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 16:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41AC40581;
	Fri,  2 Jan 2026 16:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFP98wR43dlj; Fri,  2 Jan 2026 16:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5FBF406AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767371901;
	bh=XXc+hcmbItWprZfHzJ25S6JVlFrxFr4AcaGXNiZw5vo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EZPVxx2xwBlz786z1iTL3Mx6L7+Q1N+pjDYvSCB0ms5vo9DoK/YAFliVKp1XUjGXN
	 mq7cEahPOXP3rpvrchhkBEAgE68rTx14Xn0r1JfiUolLhRu+xKsyHOY1fn09dNUnu2
	 4PidVJmy2ccX/vmW7H8ALTyzNkcpOipSjAmDjYhT/mgMjgdPAczYlezks8N2ynv2vD
	 gkcH58siynjeO3q+f4tr3/uiF5Co9Ex0xDUmmxhz9MWyk4zEfUxyAOV2HlHPD1dk6b
	 QWLKdZGw60vO5i6sXn3wqd322rx1e/ENNRxUBNGUGm3JBy6NsNG7ddysJloi6b95Re
	 fbwePzrR5hbhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5FBF406AA;
	Fri,  2 Jan 2026 16:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F43C351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CFC381156
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-ukOhnb2Qew for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 16:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35B9580D69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B9580D69
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35B9580D69
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:38:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 790FAA4C2A6E;
 Fri,  2 Jan 2026 17:38:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49688)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbiAK-000000000NX-0aq7;
 Fri, 02 Jan 2026 16:38:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Jan 2026 17:38:16 +0100
Message-ID: <20260102163816.1469350-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767371896;
 bh=iVo9LB+sXwF8zcpJA6fId3A3nqR27cCtXPX9UUV3KCY=;
 h=From:To:Cc:Subject:Date:From;
 b=k7CaG4erjK+5awBXUopl20v0fLlpRU8GYuA4WyTPJWZ62ZpuFs+22CBNStC0njksC
 p1ADwQAeTiXDMrhsbP1Zb25mugPnqF0Q4gHeShCxQFU9mKO+5Iftd0dOHaFlrrCkA3
 Z89udG9ASbYMu9IawZjYETeOGOBZhdWhPB3ihvsmb7BedqPAPu512OPk8BOaM/DSg3
 f9VxARBOsAb4rjFnN6tlxrwQmlLMWeEFUrTimoSdbKjT4wsUBx4iOKlb2hq3K51S/P
 YwhXasmpKaZuf9IYv6NvemmUqywS5pksL2iwsh9N3n0ysw4i6udQH/MdVe71wseBpe
 1Zt8jeIQXuHsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=k7CaG4er
Subject: [Buildroot] [PATCH 1/1] package/lensfun: fix build with cmake 4
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

Fixes:
https://autobuild.buildroot.net/results/dce/dced550d78ca4365c6b334d442a4995d6b8dec46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lensfun/0001-cmake4.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/lensfun/0001-cmake4.patch

diff --git a/package/lensfun/0001-cmake4.patch b/package/lensfun/0001-cmake4.patch
new file mode 100644
index 0000000000..d7973f4cb7
--- /dev/null
+++ b/package/lensfun/0001-cmake4.patch
@@ -0,0 +1,29 @@
+From 011de2e85813ff496a85404b30891352555de077 Mon Sep 17 00:00:00 2001
+From: Jonas <git@jonas-ott.de>
+Date: Fri, 17 Feb 2023 18:26:01 +0100
+Subject: [PATCH] cmake: use FindPython3 (#1983)
+
+@jonas-ott Thank you for contributing!
+
+Upstream: https://github.com/lensfun/lensfun/commit/011de2e85813ff496a85404b30891352555de077
+
+[Bernd: partial backport to version 0.3.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt       |  4 ++--
+ apps/CMakeLists.txt  | 55 +++++++++++++++++++++-----------------------
+ tests/CMakeLists.txt |  4 ++--
+ 3 files changed, 30 insertions(+), 33 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5ccb9976d..7bb7a6878 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+-# require at least cmake 2.8.12
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR )
++# require at least cmake 3.12
++CMAKE_MINIMUM_REQUIRED(VERSION 3.12 FATAL_ERROR)
+ 
+ # path for helper modules
+ set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/modules")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
