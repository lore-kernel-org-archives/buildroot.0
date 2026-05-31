Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5115ECD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2844161C13;
	Sun, 31 May 2026 06:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7Vn02qbn3LO; Sun, 31 May 2026 06:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB62861BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208757;
	bh=/k7xRsrqNZlCazTzCcnzsu1s33C6tvuHpqqJdD4C0l4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBhm0h0VBJnitfKkQDW7ZB6XzZJjNMsEDRJ8+x5oAq6LdkFaOoOMFOnN95hp5vSEk
	 7nxuwid0ahieYIiAm7Q8ifoqnxjYO9JpszJjPrbp9t+hmORU9uLOxfx/igbreMwflD
	 kLZlAb5z1t5YSH/A6tYQtM5feyOjaggbS6kfmX+w4Lzd7RT4333JM0B7WFJ0S5GKH3
	 Aj87RncbeqZ3/xtdsuUfhA6z8lYzXIFRxp88qd39aD9T9bKs+TeYlnSTJ+P7ei8YNj
	 r0rhUrOdyn4mxy9pVhF0hDZnzX9cIRukvS4OsevTkxbvD5LmMtYKJkj2HDS/ePfd1m
	 SB5XbGL0ok65A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB62861BDA;
	Sun, 31 May 2026 06:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C8AB257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2230E40438
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K6clebA586O for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0860F40422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0860F40422
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0860F40422
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3A10A4C3914;
 Sun, 31 May 2026 08:25:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZby-000000000BO-3q10;
 Sun, 31 May 2026 06:25:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 31 May 2026 08:25:25 +0200
Message-ID: <20260531062526.7792-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531062526.7792-1-bernd@kuhls.net>
References: <20260531062526.7792-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208726;
 bh=F+FbtvRxOjFTTSYY5BzXP0guqhYxOCU5y5SYQdhNZy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DhthSSQGaudpVHPzPeD/zwbG69ddh2g10BSlBsvNRV+AjiAb6qdyKpR5Rr9f8Y8gJ
 2yitslSv5BGHsnjSi/Ve12hM+MC13cWP1NlPg2c1ZlioWM/4mxW+8oOX2gygNhOCaG
 DRSQpFNOo75BPiqBfVXOurGOP+Br6eA6nrqUxSh+Khult+53FljKSs2+O7JT/h3osk
 mrhqlMPX3dDIt//1HEB9yf74w8AH8DABRjJZ9Z2EIduy41VXYJO9KGS7WIzj/8YRLD
 MrQ3Q/wTUNMMoM6cIQpWomUpzQX7VUFWj5rHWjnfdBPDfqmnSTQ1nRAr57+zu86szE
 qvU2T5h7rSa5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DhthSSQG
Subject: [Buildroot] [PATCH/next v2 3/4] package/wireplumber: bump version
 to 0.5.14
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

https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.14/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1329a1307b2caeb989b90f52289d2decfc4f6ce1

 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index a254b68cca..b180d9d2be 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
+sha256  2807a9d1e97075ba10f8b7b8156e31175817d620fa7fc84442b5474123eff5db  wireplumber-0.5.14.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 8818662059..2fc9098108 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.10
+WIREPLUMBER_VERSION = 0.5.14
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
