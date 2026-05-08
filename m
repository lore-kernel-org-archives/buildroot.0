Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DF3CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 18:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B6F41EC0;
	Fri,  8 May 2026 18:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG0POzKcFjw4; Fri,  8 May 2026 18:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8038841ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778265817;
	bh=PcxwV6Er26vW9J4rwC9s+6QEPPFOyI42j6VV7AvQ3L8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixBmpsMVg+kWh6hO3bxjiV9HRyBKDKxgc3uy34o5IF2w4+MtDF+Jp0kjJ+Q3aHayT
	 po4WzTBPOHl1ygrrYkFEQmoEbOFA781MG898+boJq+YAiv5xaq7z9uRXe276WwU/Rc
	 wEHK145E24XGk4yjvhtLkTF6quAWKPfRgb0vAqrPBsyPCBxGO856s5lj0MzgbXgEBO
	 ZeoCd4d/auHHg1e0VFW3cpFdZDUwrvdWzCxmKHEjq1xEl7xnK8IErGdkVDItbJ2Z4O
	 aztCuS0t4t96HGgg0pD2niNVgmVXo2fZxbXFhfLcZhRGbdaOoddxoMFgqzonEMlQ+z
	 7SIZIyQ7vyJpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8038841ED3;
	Fri,  8 May 2026 18:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBD74272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCF741EC0
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYjDgzessjix for <buildroot@buildroot.org>;
 Fri,  8 May 2026 18:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D34541EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D34541EC2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D34541EC2
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E22F8A4C2E26
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:43:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLQAb-000000003Wm-3GRp
 for buildroot@buildroot.org; Fri, 08 May 2026 18:43:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  8 May 2026 20:43:28 +0200
Message-ID: <20260508184329.3669575-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508184329.3669575-1-bernd@kuhls.net>
References: <20260508184329.3669575-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778265809;
 bh=QIb2IkdWbFJ4zjNDeMDd1kDtM3CZX2NqBvkKFgpWfnc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vwFXIyWTPI/3E+BUQ2q/j32pn95lCDDyVGBZ+ZOPzJoZqAE9mtJRbTKTv6mfcb2CU
 s970VG+7I5rYfN8vMBZk+vasMng6zpchLIY9OPKXrnDPSI+BzHN9L9S26Ki+XTCI3K
 hAbRbQx0IpNC8oKOtFoVjRa6uVrC95FK879A4i9iAJwQEUUjM+tWXg2e+Qw8Z88xYL
 +xfGhfejG2fUEh/fcgk+7EW5YMMXICtu71leaicnw/M48zq1zPYg3C7pKIP5g+JDrX
 Q68dCfFuwdPNzIy+Dj+IMqPoouFAb471HYu2yvdJqiTKlG/o703gak0ak2b5DZGKqM
 1B7GAQwVaJ8bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vwFXIyWT
Subject: [Buildroot] [PATCH 2/3] package/libks: bump version to 2.0.10
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
 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index de16d0b029..8634b862f2 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8525dd943cf970c860cd2596207c7ba6646c9e1f407e350fc0a39b76af75e625  libks-2.0.5.tar.gz
+sha256  cd0d8504870c2e0e1306e55fd27dede976ab9f3a919487bc10b526576d24d568  libks-2.0.10.tar.gz
 sha256  3aba376a08bf91c95518532e627157f0ee3ab2712d1198463e2b1ac9186dd142  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index 2de6b727dd..4fc3b8f5fc 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 2.0.5
+LIBKS_VERSION = 2.0.10
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
