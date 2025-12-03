Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D761ED1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F37406FB;
	Wed,  3 Dec 2025 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSj4XX9Cqdfa; Wed,  3 Dec 2025 22:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE7E407D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799256;
	bh=WV6kWDR/nfKtNLeGuBR8HwI/B1jb/7Q8Y/OcPhazW5g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lg3e/KxcwEj0g45RmnYwkGwcVciXlHG+3+abAn0fgVGrJmsoVqxAg3/TmaVPlUW+o
	 xuIZbR2Y9URcW+Chc5tU1Pmipmep8swzUmBnEagdimSvNfH6G7q8mjaBOPwuhl1i4h
	 tB6eAqlfM6K7tw3kckD4CG1t5H4qIwPjDd62n5eB75lvakHM+Zd081K3iJQYJ8gj04
	 VVojSlqZNYu9WyqpezPEyqVjIHxlme8s6mP4y4IyY2UubJJIpyMzOpAQ1PGUCPICHw
	 TWb2eLKcVxlLRefqcQDVuPUvyTcnIMVUlB7FWzb+BvvHzaZCxBCvwYzZ0DwIoWxlO3
	 s9nJLZeoGK4Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE7E407D9;
	Wed,  3 Dec 2025 22:00:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB8F8D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDBA1407D9
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCgbWMIVNohe for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC9A0406FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9A0406FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC9A0406FB
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8113A4C798C;
 Wed,  3 Dec 2025 22:59:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-1JNi;
 Wed, 03 Dec 2025 21:47:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:47:00 +0100
Message-ID: <20251203214709.2321976-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799142;
 bh=kdGyB3vsNUQCgfSOjcBglfufPkmEwPFcvV/xmsAbbAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IVm30EwupDiV2ot+zkR7gjszZEq19yIhOvSc0Yw9MFPcut3NRvzlJz0iOjSEfNwnT
 zcSZhoYLCXjeoFhyNcR1AkK0T7yYAdxTUYEovyQ0BL21qOUpEs+YvNNwFoBnANVlYa
 JK2qfLYCcHcDB7pRw79M5klSLqv2RijKcuBK3dQFKaRr10kMwkeKCBCJReLlDcBUo2
 zh+csj6F6vAFS9Z6b2Kfp9q8IAY2pGCBsY3Z5eSxqSmw5AQpXCRxetJKk0przVAZYj
 Uu9NjIsbg778/FIRC4N19vbCdTv5AP55v8oyKiYE0jK69+8DaUeo7QnZUh+7tLwJuj
 AtNgt7826uz7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IVm30Ewu
Subject: [Buildroot] [PATCH/next 12/21] package/libmatroska: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-drop-CMake-older-than-3.5.patch      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libmatroska/0001-drop-CMake-older-than-3.5.patch

diff --git a/package/libmatroska/0001-drop-CMake-older-than-3.5.patch b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..25e09ed7bc
--- /dev/null
+++ b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From dc80e194e93e6f0e25c8ad3e015d83aca2a99e10 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:38:00 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2/libmatroska 2.
+
+Upstream: https://github.com/Matroska-Org/libmatroska/commit/dc80e194e93e6f0e25c8ad3e015d83aca2a99e10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.7.1]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 221c8ac6..97b392e0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(matroska VERSION 1.7.1)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
