Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC17C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACA7606D6;
	Sun, 27 Sep 2026 10:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVTj0vWnzoer; Sun, 27 Sep 2026 10:57:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3411560698
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506629;
	b=PqngvVxnpKh0fQcE4mSufIdNeh/VFiPei3CJFT5UnshQeapNSBT2PIEwZiQIi1+x798W
	 WUmh4/ukq8C8VrOqdY0tDDDVfJJVQHXn5FXSxihlM3mv91MLR5ef47GAal43MD7NagJ9P
	 0Awwzr3jXyf5pyXPNOb4GPhwOJzLX4DOJJubdXh9UIbGE95iRf1zECtbJGFQ9JXUtm+UT
	 7nsbzYPH/jYlC7vUJB/h34WhjzpGnhWMeOHBpYYWpavKId8a0NtmvFS1rIxPZ2AkLI0mG
	 77iJpdwzoqUv40R1eS4lnBLGorSi6WhO16YIjGmV2BdKP0MsFbg+ll22q/p0w1cZ0YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=pI3RRznuPHBJmJLCx5aGMuUxrzwtmUcVFbQ30So9lzBSRmg4pGDktI4PNQMCTdyysgtY
	 Wt/cweZo6JAQO4VHMtmlY2wVmukHYzkSWuwtWFnNgfS0ANCV2xwkGhBh9wx2bPfS6EjPq
	 NlD7C/cWQOVLFoVjKXdOrxVoeUnCEX/UOULOopCkxdxLdrgmIBqnyUQp5BoViTb30ke/R
	 lTZjZcTeGPIC0KHWTDSkQvQLlyZwyphSACUvmIBvObxYeg+rBeOzogEDP8AHZvAN85Q3Q
	 ULByJFpy6rKbFX51bk4qWATeJvV9r9Y727wx6BWeL+vCXR5dpQcZTxsZEXFBjT58ZQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506629;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d21fEzYYLEDyMTQBI4z6qEqiJjLpE31LxXRI/WFB8mIL5z2KTWqVtgjRyb+p2alLE
	 x8/+fFXo7MS3vA4+WDEaNlLuRs8LsJ2nkur6FVNnnwGw1RW4CB2Pux2w7+C+jWn1JJ
	 +IpmdzoqFS9JgwjWhjbzJRqFIRGOXw25TP0BJENyPG/9JmtpZm2jh7zZngdIE5VrYt
	 GfKa0DcZNXb7e+xAwdrE3kuvxMiAXISAHWpRzNVp/TxYcXfGxWK1/8JvTDv6mYHqNp
	 B5+2j38vFk3gCkbIr3djg9KEiPDEu4pPj/LOfBOwrn3t0zKXexBhSJ5nSVphJ4O+nV
	 cjbK0CzztwPRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3411560698;
	Sun, 27 Sep 2026 10:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF853335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C154B40B0D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91G3iiQZhRxU for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DEA2D40CCF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506627;
 b=bcxEZYjBaS1hSigz5x3zviTHxl2VcdFs+wt29lkq7I+UkmSCX3nFpYzI+v3S6QdqHA0l
 o/71qiPIs1b1OFDC/yK1HHFrzoE+O1HL90zIniWucVosfYYaAQt/Bc+uNmJx5Hsqasa+l
 Op2BqpRAZdMfndealnv7m9QO4UZFsVhHnLHglPY8wqwXwXH2lhxaC7cAEJk+Yg7F9Ue9m
 TcYG6ervcHvBGJgXUudRl1kEEveamKkBj2prrEIBRMi5ID/w6+GcgaEWuDd+qUxt4+noN
 90Qo/kSlNt0dRwgdWmuD0oQd0g1P1UGivC00VXfBsEkySpyzvGaWHTWpbzh9NAlusTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506627;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=WNFre3MgnjCW3s5liQo/tveWKQJUUDgkMGfZlozcLJ8nHr9GAFWGOrvssAmKMkJEGHVq
 0iFMpwC8c6QeM9TNLT2UMzI+gR3gJjeYxkdQ3IhV16axkcpB70APh4+Gza7c397w+TQhR
 LNI0NddaOimV12XeoE0vHmvN5zQXNNyffaUZxHfRC1imOVW1Bzi8opPSary5o1PNYRu0Q
 kwt3fp06qzM2ni7++Sjoy4hmS+TsKmz0YYd9TfyrNFuvBvmQphVqhq2AR7YMiFvNh55kh
 /EtnGVk+oWnMepgRZxNOxZ+JrjX99f/P8J03zIQcjrbkVz2ZZdfODImiT7E5x3E/SZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="f/1EOlyt"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=f/1EOlyt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEA2D40CCF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505864;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f/1EOlyt3NvylumZsuP8SzZVqBP4ZDPAi6PxVguVORHCnvouYHs3ebkB4qwpm/5rm
 F7AKECmIWofpPu1poHiwKmhl+mGJ3x0SGz15CpDpjxn0LzLgNyC2MnWm48BccfRk/e
 rb6pGQzptHykaxtMmHblzYr9BATirkeFjZsegCFdiOarYDPi9Ye0pv+srbRW/HcqGs
 YJnYJTuZRA5ok58HxFkHHqlNfx2L67R59rqYVNcOWYn0VyjZXNlcVQotm3q/0/v+gx
 9A5+onHVvNW75epUXZghP8U+STOjma91rrN/VV+InnzGA9hbqhkA1ldjvMtke8YIzG
 gyhkMmndlqS4A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 lcAoGLI19KMTq1HC1JETwe3zqrndwNJuLwtwST1qRu4oJQmg2KYqawOZfBDKKQ+LsOTZ42KEemC
 PJqKjxVrR+jotD6DSjAaIbKyRiWYrNJap+ZkRbakXtcOH/qLJIN2ylDAtTY+bIezM8QgfXg8ntV
 20yP2IZBNO7vc9WepemE4BqUgA6cMTGBnL5ZgLtknUybwo4uWGJuWDZk57WuBWPtYC94fAxBwww
 ikKUsdVhhDUfyd4jf5+/cvhMrV0GJFtCPjLr3lHj07l+9DnWA+k+XzXpQTcAZjc7A/AewbwIKDp
 8lQIuH6R2r7ZCzgMCwmHVJkRSlkrzqDoaQzjvtzd/cvibYvDyUOZrlA6wRCzKg5pK0krfqEx9GN
 SCZEwaUysPVzkgX9C1ncin1ebcInjYL4S5ZfuYovUVu8ugzhCy4hR+446evaj6B7I/l3iCd9jWO
 rzzTfF9/VBZuIQfPHnySEnhnnjMDRaT9uHwdnBt5UIf+pfROZJlJq2+6ZK5+b/e9aoacE6dtf8g
 583Tmyj1xvY30zUWyuhAu4ucB099dKBYTY93mChFAiQ8Ki7+4g3xMJe3NG07GbWdj2bgbG0ox2Y
 3tI49WOt93u+tMI0/VQnu/nRAsAfpxNZPI7/zXrLCECkK3W08Q/25oo53yDjl05Mb3IT5PvXyAJ
 mKziixvKP5Bzu/3WJr04=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F1F9A4C5078;
 Sun, 27 Sep 2026 12:44:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-09Gk;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:20 +0200
Message-ID: <20260927104301.1801638-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 42/82] package/ecryptfs-utils: remove OpenSSL
 support
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..aed1cae2a0 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
