Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193AD1CDA1
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A7C40C30;
	Wed,  3 Dec 2025 21:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArPj1mV18bbn; Wed,  3 Dec 2025 21:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F234405D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799159;
	bh=P2hSNEf/LtSvIS/AM/3HbK5TAaYxIFm0KWJtnTzhIXI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZiEDVdKb7BkOxiyURno6ztHYccQ7h8hfds7N1U8bl+DbQ+vxZku2DFeoxBTfjfj0
	 SlNb1mo8dDNlju0Zj/ANxNZgMTt28edn2QcCSaFp6x4hVH4z3V0mYdvQkm0Bumb+ov
	 WSv4G8ZjIjMJbIOZFyvynx3iiijSj9PQzyazudE+ZstnlZ0PNsNZ3loDifEpDc/Vgn
	 tvyl7xRJDW19h9bLg3At8cUoCydvQ+i2RzC1Iy/gl6NP+0hZS44sxWYDd6slEfdLP6
	 7bYlARSuBshqoone5d3khECj2tUUxmWJqNWgmB/P+ZyKMGozIxM05bKhgrQgeaR6Vk
	 NMridyoTvmH0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F234405D0;
	Wed,  3 Dec 2025 21:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32D3ED3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB7AB60DC3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb5-7dfSrYZq for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A7A360DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7A360DD0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A7A360DD0
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FBA5A4C7984;
 Wed,  3 Dec 2025 22:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-3Y4U;
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
Date: Wed,  3 Dec 2025 22:46:54 +0100
Message-ID: <20251203214709.2321976-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799141;
 bh=bf/gS+bSrJw5ZlzwescpLcTOWDSakRGlUbrdkxS7By4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=suSLWuUIwbH1hNMWHRuHyS0r/2hcsCkTpFsGKD1IFUcCPaggK8nbKSJMF24RqiJ6F
 GsBOMSPTyF+lUZjFivWecKHlRI1qCLx+Pqd/f4/0DmUGAJV9xCGyFe0Gs1e9tJgDT2
 +A80jaGPz2jgx0akfX0fqmzJPAOPtUj9ZH/fvf4fNWR6cZRxKmO01DAB/jmXGWkBIM
 dtfgwQhg3GzktnaeaMwAmgmphdvQYONkGM9SVGGPMPHPN6pgHU9egBekXEz2nF1ZiX
 q9xV5Qi0QY+HEIzcZE2qgWWuQuD5w6dptAxmuh/SJ7SId1tw56dESE7biZHRItDGTv
 /VIQjibdGs6lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=suSLWuUI
Subject: [Buildroot] [PATCH/next 06/21] package/flare-engine: fix cmake 4
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
 .../0001-Minimum-CMake-version-3.5.patch      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/flare-engine/0001-Minimum-CMake-version-3.5.patch

diff --git a/package/flare-engine/0001-Minimum-CMake-version-3.5.patch b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
new file mode 100644
index 0000000000..ca7c1d500c
--- /dev/null
+++ b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
@@ -0,0 +1,26 @@
+From 9500379f886484382bba2f893faf49865de9f2c0 Mon Sep 17 00:00:00 2001
+From: Justin Jacobs <jajdorkster@gmail.com>
+Date: Sat, 5 Apr 2025 18:27:55 -0400
+Subject: [PATCH] Minimum CMake version = 3.5
+
+From the CMake 4.0 release notes:
+> Compatibility with versions of CMake older than 3.5 has been removed.
+
+Upstream: https://github.com/flareteam/flare-engine/commit/9500379f886484382bba2f893faf49865de9f2c0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 897c19c3d..def8121c4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ Project (Flare)
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ Set (PACKAGE "FLARE")
+ Set (VERSION "1.14")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
