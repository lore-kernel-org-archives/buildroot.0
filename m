Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5741DC43602
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 08:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1C13408E1;
	Sat,  4 Jul 2026 08:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjIyb4pK60UQ; Sat,  4 Jul 2026 08:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A97C408E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783155165;
	bh=eXIj5pBM8mz8xMLumur4Kxox3TAFzpC0MZVUyabfzHs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UqSp4JeK6XeP4NSWoj2bv2OVKHMbuCL7Hs4n9l6SFSnqgg2KgFA4YWCZiYLjwz3jI
	 rvtFPLWF0hUoIEwtVXupe5/Z1f5clrt0yYDMQ4gC7jxUppDoNozK8kl826v02zuFSy
	 lqJvSis2j62avNrQriuQqlWtePQw+LM234H2orkoZsAk4NvigA9PgyaYIY/to2UP1/
	 4qSWVzl68/inUpUFS6zcRS8P0yU5gU1VpqUbYwxRI69rP8IxaigoePqLNvT71WxZRU
	 8x41hPls+MRE7w/deBHyn+R/QD1SxNDdEQIun+PQibknoAqEPjQVBe6VUDcNiieu4h
	 DsnwuvBuLc6RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A97C408E4;
	Sat,  4 Jul 2026 08:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA0D316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B322F4005F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiYiO39NW0cT for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 08:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2A2D400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A2D400B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2A2D400B0
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71843A4C0FC3
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:52:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53940)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfw76-000000001Nv-0X9r
 for buildroot@buildroot.org; Sat, 04 Jul 2026 08:52:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Jul 2026 10:52:39 +0200
Message-ID: <20260704085239.2901837-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704085239.2901837-1-bernd@kuhls.net>
References: <20260704085239.2901837-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783155160;
 bh=D2Nava1x74iQOaYtnGARRLeJg8UiX5CeooOyeU2g7OY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LAjlIP0uNwWropKQdhBRgcd7g+Vce7EWOjjij5FiwpxgnvnVa2aklh734nmH8cmYx
 lwWBVeMpZ+lHgl2PlPtbSAx6EQyqnNh25XoSgffdU73z+dmIj1LMx0JnqAGEUk9BHB
 TcpQCZDEVK2Zab1iLVM8JAi5HVPbxX/Fri6zZnhSygNQ5x25ZDXcsDFQ+8i2X5RLCq
 vY1HoMdifRy161DbnEwpPKg4KsVNDDueMlmj7xp8nRofyC/AA0Mdd5nC220nmY4EyI
 FmUcmg5J95CjcyAU/P9AozZ3B7VQj2BpJK0Uxpq1lV7yqCEz2KaIA1lBUCeV6S92oH
 lyhAnCvlf86WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LAjlIP0u
Subject: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.24.4
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

https://www.samba.org/samba/history/samba-4.24.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/00a09b88bb7905e5daf558adf59cbb13a05e05dc

 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 83e77f039b..7c44ed747a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.3.tar.asc
-sha256  4a5e0ed1ea192b798c873d9957c50a5767c10c2767cccb00d56ecc427e94f8e9  samba-4.24.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.4.tar.asc
+sha256  df2c51ab4361ec626ab9988e5946efcca8465bc7afae834291d5558468265ff8  samba-4.24.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 006fbff6c5..d481f9d417 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.3
+SAMBA4_VERSION = 4.24.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
