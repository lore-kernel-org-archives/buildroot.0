Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83DD1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF20460A5D;
	Wed,  3 Dec 2025 22:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5dD1wbZcPZu; Wed,  3 Dec 2025 22:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2BF60E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799208;
	bh=6RgoD0HRJfK7ekbtN+i1qCINulBE/7WwpT268d3BZWk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=or7FIbubP4Cshst0mfNr9aXj4B6fAAKhNvT9dixx8lKOq2fliBtDuVbVXg4eCs9Vd
	 cRcXKjbY5lQppaARRNSA0LyO5zzim8XXD2kB0yiO5EL9eKN8PJahtdDqLM3QIKbTPn
	 hN3hp/BjO/1Y2IHUWN23wB8OdBe2fYLkCq9X0Ozd65IdziKYcn54oVFfp+4Lfhs8E3
	 Zwzqh/NV6dzhNBmUiiWKUcae+K71cV1P0McytMuctY5xsGrFxE2xoGUkBZeQ7x9iLh
	 iozL+D0olkpjixL0EXPNHNnX0GjtUOBWTNV8tgi064AWJQkoTedRs3hBhoQBiAukUz
	 SFmkDaLIC7Spg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2BF60E1B;
	Wed,  3 Dec 2025 22:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 327E4D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187FD61222
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlfjGEv47d7p for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E9F760E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9F760E1B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E9F760E1B
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2AACA4C7988;
 Wed,  3 Dec 2025 22:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-0K0D;
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
Date: Wed,  3 Dec 2025 22:46:57 +0100
Message-ID: <20251203214709.2321976-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799142;
 bh=vK9Z1F7IMl4oKdX0N9u8NSxdl+UkVIHrlK8F5XNgaSI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o0ila/H5Vlb23turixT1toxndMFIaXzj7RqJEdpMF9IuZSWCwWeycNR6mLcyE58MJ
 6s8twzUylmcY4bhouK9/60XS8XJ9mB28en1PS0yCF1u8hDQAlDsBzhjPS9HLwDYUwp
 NWVIUkLES/7iaRBMY5MmY3rBt5OkH5W4SCz/IA5WWJkk521tW5AfFxGYJ9prnjupMV
 z1Nr9EmbMRMGeMqmGugRuQh0w+Pp798W3mLxumDlwaezf83+ZnaGM9ERWQhS2+YZXS
 PGsOqwTgxWzXX3EfZ586O6JO3EFmrBSK+Or15KuOHxk2uY4isZKdpj3oU1yoCk3Mvo
 SZhPX6fWwooVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=o0ila/H5
Subject: [Buildroot] [PATCH/next 09/21] package/json-c: fix cmake 4
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

Fixes:
https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Allow-build-with-cmake-4.0.0.patch   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/json-c/0001-Allow-build-with-cmake-4.0.0.patch

diff --git a/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
new file mode 100644
index 0000000000..c9c957885f
--- /dev/null
+++ b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
@@ -0,0 +1,25 @@
+From 42864e12b0d7af01b1cf989d6da9e9a4477775a1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 23:14:48 +1100
+Subject: [PATCH] Allow build with cmake 4.0.0
+
+Update the min version to match parent CMakeLists.txt 3.9...3.12
+
+Upstream: https://github.com/json-c/json-c/commit/42864e12b0d7af01b1cf989d6da9e9a4477775a1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ apps/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
+index f7c9dec633..ef2271d131 100644
+--- a/apps/CMakeLists.txt
++++ b/apps/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-cmake_minimum_required(VERSION 2.8)  # see ../CMakeLists.txt for why 2.8
++cmake_minimum_required(VERSION 3.9...3.12)
+ 
+ if(POLICY CMP0075)
+     cmake_policy(SET CMP0075 NEW)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
