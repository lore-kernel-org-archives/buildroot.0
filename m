Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A21D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D6D60B95;
	Sun,  7 Dec 2025 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaXFWAadRhjd; Sun,  7 Dec 2025 14:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0965C606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118738;
	bh=SvlNM+e/pG3eeiZn+xeL3ZZhFm4MJT0ylyweYzDKm0A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TjTeYdrs07c/2lzMLm2+YfqBdFGolaD8Akwz2FZFmCcp0U1qvQos8pVa3e//RMlQu
	 hLwLqExXcozjWq5UHx96HuuR6HU4/tvPglcalAsiJFUFv6OtAd64viXx66G4GHkH+o
	 T1rnNKReFfDQlJF1IbV+y3a+vTri5QS9zjxs341yK2PjgbOsSLrMxekJCZOfK+oMPY
	 p3eZZnLPgmSP6WHn0bAUWzdH4tHP4qRNKyg5IRntx99xSOLnw3ReNrAFF3cD4WkMiw
	 aEkE7n8/WTMaM12Gzn46Cd7GMH3nBoXKSrqRS+6vB0OGdVixXVxoCmE/oJlUy8RZOr
	 BscSDjxTHGfWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0965C606B0;
	Sun,  7 Dec 2025 14:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8241151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F32082233
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uEHTYEfk1CP for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 873F882231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 873F882231
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 873F882231
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1902BA4C09B1;
 Sun,  7 Dec 2025 15:42:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-3I4q;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:24 +0100
Message-ID: <20251207144243.3696572-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118576;
 bh=966c5eetn+33xwDwjjAxUpuUO4ToB7y3raUpELwtsUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bEO+zEPfLH8QXW0mIqPXy8EKNqge3RPZVazjzFGi6q6k0+9LS0BotIa/mHFWPieMC
 tjXJZytyokU9UUhtMIrqgc10o/uoSbZDGzHGbQFU0iEMSNWVMA02ReeDXaX1V8w+gT
 iXNoDiTZHwpnlm/wiEiod6sRSaXhiudt9Ewz0vKypPlcAJWmybomzcBUB9QtCOaxAO
 6zy9RWsrPRHrfuhWjFpNciWNZo67QQZBeAOW/CoelIBfR0/tLfKrM6dPcje/C3sQi9
 SerWpYKm3NJe4Pb1MoREfSysKrWc0o6J9j/T4Ms7CVMCSXEF+5WYdygmFEeOKne8WU
 zvIWFs2UxtVOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bEO+zEPf
Subject: [Buildroot] [PATCH/next 15/33] package/redis-plus-plus: bump
 version to 1.3.15
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.13
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.14
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.15

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 4cdc176025..6148399634 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  26c1e45cdbafe1af4d2cf756957b2268baab6f802b53bcdd435864620e2c03c7  redis-plus-plus-1.3.12.tar.gz
+sha256  e9288fda74f1501c62dd9ab7d6a8dc67de51aa4d5b7c71770baa51987a945941  redis-plus-plus-1.3.15.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 167d8bfa01..0ee9f091fb 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.12
+REDIS_PLUS_PLUS_VERSION = 1.3.15
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
