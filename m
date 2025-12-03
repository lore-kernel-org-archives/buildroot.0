Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2EED1CDA1
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45FB406FB;
	Wed,  3 Dec 2025 21:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXWEHBp6lL-b; Wed,  3 Dec 2025 21:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E135240E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799196;
	bh=FyNcWrHed7MaDfI/lpdoU49D5uuM/78MGjkJvwvPdeM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmAErGu4XhLR8NzQd5y2q2KxUWBnfu58AMv2i1MmJ6ivR5fr0MoPMcj70R1rEvGNP
	 fmjJH9dWcCCBy21C4Bi/MM4UNNh0upANxyd9hxSlx5O2xVnCyxDxhfGF44LYJxyItP
	 GKs4d7TlNw8PB2ZdeZtqFAONJfjNF1ICpHg0EM3+zIYePjmowWmL/8UVMltyVm+Ezm
	 vbHvetZKwNs6fmvojyxXAn4VNyFYqwyhksdOrTbJnIRRqzWIf856ycakXd/EvJqjXt
	 xKOcYANQqJQyubeU8H4aEoWu+ej68noK8KIoAPHFOwA1VH+3CyrdDD146IFh6/2Hl5
	 3Nbo0QHwbTn3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E135240E60;
	Wed,  3 Dec 2025 21:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F4059D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E683A80C56
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qa0M7cXcd3Bk for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E16A980B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16A980B49
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E16A980B49
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF86FA4C7987;
 Wed,  3 Dec 2025 22:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-2vPV;
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
Date: Wed,  3 Dec 2025 22:46:52 +0100
Message-ID: <20251203214709.2321976-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799141;
 bh=tWjAbIhT4apiAhdGfesGPwK0PMOB/QS4rviHePaB3Bc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sa8wLYg70jQ/1AhxaciFetcGLREU3l+E9s2P58v4rDK7Jk6WwYA8lk5lpapMXCz/R
 0pSqhtpeJ78L940DeQWtKe/EtlHJb8gKayAqwnzN9tAuoH5HU9OCLoRkuqEP94bAkI
 h8NQXMgGXsfXwQYcTqho+OglWCG3qLDHepVNH+iJVWqKqEe+RwTa98YATwUL+1Ciew
 Q9I4nnHTolv3JbORknCUVqG9dIeJXXuzGgBCJga8YgUsqXDTGBXT76koBbM1npvN0o
 DNptdUUffxcz/Fawrp1mhUz9CcL4ALACV7WwaA5ikn8+9MaMlX0NYAwA9cLcYNIamA
 OAa8r1OnDeelg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sa8wLYg7
Subject: [Buildroot] [PATCH/next 04/21] package/double-conversion: fix cmake
 4 compatibility
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
 ...CMake-Raised-required-version-to-3.5.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch

diff --git a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
new file mode 100644
index 0000000000..9d8482d5d2
--- /dev/null
+++ b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
@@ -0,0 +1,27 @@
+From 101e1ba89dc41ceb75090831da97c43a76cd2906 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <mail@heiko-becker.de>
+Date: Thu, 20 Feb 2025 15:20:07 +0100
+Subject: [PATCH] CMake: Raised required version to 3.5 (#240)
+
+CMake >= 4.0.0-rc1 removed compatibility with versions < 3.5 and errors
+out with such versions passed to cmake_minimum_required(). 3.5.0 has
+been released 9 years ago, so I'd assume it's available almost
+everywhere.
+
+Upstream: https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8749ef86..31457723 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(double-conversion VERSION 3.3.0)
+ 
+ option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
