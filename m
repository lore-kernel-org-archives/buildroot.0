Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242D6F8809B
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB55780BD1;
	Thu, 16 Apr 2026 07:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JucnB03QFT5; Thu, 16 Apr 2026 07:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E44880BB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776325022;
	bh=G2Lwl9wvz19tW1LZOxPbtzXb7UJvUZIMaXIi8TrHvyg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k2+1+ohVWbnd29kXSko8tfCMg5e7Fosxx5u6bJ1gcLSn5t6FBnfvURtss9e3G6n8K
	 QJcerJyab4vgRGifQsUIMgvXFaC7A5KgwtHAmdb/as4ii01sfcwFOYJ97k47A2pOdC
	 cVH653c9/lifK+tnp/g+WpmrKfIb2Hlkpj1jKlc25/jabdxJropcGZ7AzNBj4htDvX
	 XAkeNJCX20lT+EoV4AW57p1+TN+cn/fS1p6ulh3PvbMAB6GWdtx9+nJblUxl4gKNdx
	 xAmlcEpDE98k/3wNw88rScokQK4VzyJfWObpJZlTcackHy9UmK+oyc9ysXoxvRYcNF
	 VUqlQovuARxAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E44880BB9;
	Thu, 16 Apr 2026 07:37:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A592CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846934017C
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jH7B4bYU_Wc4 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BB19400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB19400EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BB19400EA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:37:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6471FA4C0BEA;
 Thu, 16 Apr 2026 09:36:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57376)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHHV-000000007f6-3yJq;
 Thu, 16 Apr 2026 07:36:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 16 Apr 2026 09:36:57 +0200
Message-ID: <20260416073657.3605628-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776325018;
 bh=Jba4R/BFmNkbwyjdjyf0iYwjMPMvrmTa9IPDr46U9zE=;
 h=From:To:Cc:Subject:Date:From;
 b=SrFmNYx+UzWhP5oszrX7irxl9kvxbI8TGHv3OaersLq4EZ6xZjJ7J2I0rK4i2VZl5
 hAHdeSfArN71UDA/4AyOC2C950GFQdu6M/pt6UkOrqQO7SQbwL0rFCgl3nSyGvNlnN
 z8ZHEUESEHZZVSZtvV7teET0TVD2SD1FPaZDW6kxv5XheLbjGoCRpzkqeDWjgR7a67
 Kf1s9Q5QKDYcHnKD/yscpq0TmIlyO2Y7N9fhc+O2mqX56Cd2lLzYLg85aLr/i1e46w
 XbdjTldfhbHaQeo+aBFUPc3rwezSXFSX1hIhpkXHA5I6epTK0zl0U3QQDYIHsWcAKC
 1vyEti220TpiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SrFmNYx+
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.7
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

https://github.com/libarchive/libarchive/releases/tag/v3.8.7
"Libarchive 3.8.7 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index be357183e2..665259f2b6 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
-sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
+sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 3b8fdbae1e..f11f5d8f6f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.6
+LIBARCHIVE_VERSION = 3.8.7
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
