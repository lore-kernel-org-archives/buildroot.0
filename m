Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF81C9831C
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 10:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F7E40998;
	Sat, 17 Jan 2026 10:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaiFdw1e1p7A; Sat, 17 Jan 2026 10:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F74640802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768645591;
	bh=SI5ZW3xG0mmLDY4cEC0bc0xGKJAHU4/dFl/lFgdqtGo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gzH/6XHC37Ham9BAk2cbca8lnzV4i0gPaQn8uLelzgKpDOKHPey5uttLI8iw/V6PX
	 cnmMe5MYZtPr7ILvN17czCuq5nSN3Z0P5jLnywuivkFOFBnfUsxX2L1VO9+eXKIheF
	 ocf+Je0GeL9I2hSK2twyFYgNQkilLRtmZQAeJlAyhHIQN0/3vpljumShHU70z28Chh
	 SF58UbWxJM51NnCWyZNwfo0BSq4A/Y7gdgZel54Mt0TgYW27Mo7XwidRXj6YGeJ5t4
	 pnUolCPjU+cF68tk+Lr9AxTyNpGXPsZieZDGRB37c7ZTuJl3DAk7at9LUgSsQU1sf0
	 DWdogQ3bnjQoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F74640802;
	Sat, 17 Jan 2026 10:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E8F2CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBBD340802
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71PuqZxL61H2 for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 10:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EA8E407C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA8E407C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EA8E407C4
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:26:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc04.dip0.t-ipconnect.de [84.161.188.4])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48E05A4C398B
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 11:26:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47216)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vh3Ve-000000005yi-1wCm
 for buildroot@buildroot.org; Sat, 17 Jan 2026 10:26:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 17 Jan 2026 11:26:22 +0100
Message-ID: <20260117102622.51274-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768645583;
 bh=ZfnJ3VeEiRRpZKs6K6Ws0EHikzLg0Y2YADpdzSC4i78=;
 h=From:To:Subject:Date:From;
 b=A24WEDJPrjLh8KD/Rw2fY88qqxxyHFYluqlP6SbcxLe4xZLdyTLw/ubKqX0OtnSUB
 4mhDiVKFa5ZAlUt0hjm9aocS7meyNdtbIGASE4YPGdW862GFOllMufhhqHlAMTgZms
 P2kYdWA+XoSZKHf2suVYW8DJPWptK/dgDszUiynHP/h5sy4YmJKJu/L69dQBYMWX+Y
 FZkMgImm5xifS/OWpwAotjytgDv5CBSX9WbbqEYgHKrxpi20hbrkNJz1650kS9NhFP
 WZaVFcK52K0Iy/eEyBfRAdDZmWRq7IwADsZ0rnYks/Aq0Wtym1qFnesCtGg0x9wcPJ
 t+mp/tUjvM1RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=A24WEDJP
Subject: [Buildroot] [PATCH 1/1] package/openobex: fix build with cmake 4
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
https://autobuild.buildroot.net/results/258/2589f75f7415cd1a2fd7cf83c6166c900b03cce0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please note that the patch contains crlf line endings.

 .../0001-Fix-FTBFS-with-CMake-4.patch         | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/openobex/0001-Fix-FTBFS-with-CMake-4.patch

diff --git a/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
new file mode 100644
index 0000000000..9ceee93474
--- /dev/null
+++ b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
@@ -0,0 +1,29 @@
+From bfd33e3ebf1fe253542b9ea2b6e034c8ce30866d Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Sat, 17 Jan 2026 11:14:15 +0100
+Subject: [PATCH] Fix FTBFS with CMake 4
+
+Bug-Debian: https://bugs.debian.org/1113178
+
+Downloaded from https://sources.debian.org/src/libopenobex/1.7.2-2.3/debian/patches/cmake-4.patch
+
+Upstream: https://gitlab.com/openobex/mainline/-/merge_requests/3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 813f900..b237f93 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required ( VERSION 3.1 FATAL_ERROR )
++cmake_minimum_required ( VERSION 3.5 FATAL_ERROR )
+ 
+ project ( openobex
+   LANGUAGES C
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
