Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA90AD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955EF83C6B;
	Mon,  8 Dec 2025 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgAh9ccZ3ng0; Mon,  8 Dec 2025 20:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F3183B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765225882;
	bh=+9ofZzIvUKf2/mGYUZNyVEYj85m29kz7lYe/FSHo/Vs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rtiuMv1bi78sbtGZnM6U3N6+0iWDlP5toFbko5Dfd430Y+vxUrzkkBzt1ivA3oPoR
	 S2cAi+8f23lbdcnGRLZ7HVFuwam5frw24pE9Bm876IVJRRW2PXEnlytwGlprfXmegk
	 yqRjqtlg32EPMIs3fsUe+ylPR5ToEbGFP3hWi83jsQGQZdAUBVjhy7mFV4wqC7TV7p
	 9pI866eKYmkK5PKfiB8H4FkOgnvL4+o/eeFiN5Ii0r6PAMtF029PK/hQnlBOGFYlSJ
	 va9Oh6ofZRowu5W5+RRZVSfsKhyRAvDc/SbIePlDNOloC9Micw36dg/x8URTiSRlf3
	 +esXUa2CRhjwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F3183B7F;
	Mon,  8 Dec 2025 20:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 489E2E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB83610AD
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otdPsFwf9EGv for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9603E60F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9603E60F5E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9603E60F5E
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:31:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3369BA4C0629
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:31:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34464)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSht4-000000008Ls-2Cd4
 for buildroot@buildroot.org; Mon, 08 Dec 2025 20:31:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Dec 2025 21:31:14 +0100
Message-ID: <20251208203114.3649526-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765225875;
 bh=V8Q8WPdMmmjcAMc+v4Xm5/JVTTYGUVVHzso8lBuK35s=;
 h=From:To:Subject:Date:From;
 b=QjyIDGLKmbCAqu/brgTgOnPDT32KHxIUx3wm3FobpbT0I2f7ygRrDUXYXIIoqPTqE
 6grqT9PnR8SHbeofWtA4uad7uehmz2CMJV/ROuDvORS5JE+oeFkQIUJer+hT4huDwZ
 CjX7s+PaT+sFsP0nowKNBZxOuPeyjA7aQ6GvSAKBP/iojzXOAdZHOPDnIw/KGBcowy
 HH4TVtoTakcPHXALzKQ/kv9p29aQTY7AZf4GuezAj+O+Z8IZs0vmYgZaNAYLnpNLuZ
 J6th1ItoOEOzf0WiqkVyrR5qNQRLGr8rfWpwaFBwOXuipPeJT1g8z0r83hLRMkVoiq
 EsOfKUA9YctGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QjyIDGLK
Subject: [Buildroot] [PATCH 1/1] package/libpng: security bump version to
 1.6.53
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

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.53/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.52/ANNOUNCE

Version 1.6.52 fixed CVE-2025-66293 (high severity).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index fc4aeba85a..1e57e1dc33 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
-sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
+sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
 # Locally computed:
-sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
+sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e78115146b..7b66f17bbf 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.51
+LIBPNG_VERSION = 1.6.53
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
