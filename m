Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E6C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0503F40514;
	Wed, 16 Sep 2026 18:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQ32c8CmkJXN; Wed, 16 Sep 2026 18:47:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23D77404F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584474;
	b=iEUOjxm0WJpNt743a2Yk5J0OukWlIAEV5L8mHd4mp3dePTx9/uQD/ikmLYcqocYYZNxt
	 upwcGzgJKpm3zmY9ZlGqoEKVnWLQHBW2rp0A0GupgpmUZtUhs5SiHakLSP2RkDAWan2DB
	 VUibJC2XKX/urNOatRluMWqcEkBnHFf29K64S1IkVGPw27f+vD0tczxXbjQwTvzDxU2W0
	 L9cbP6MqkKLko5msI6ozaOsue7g6476oLhHkbLxlQc819Ty24oaVQLCkX7stGyJwy0I+D
	 k8EuyGGEiPL8F+6dYLYInGvPMze5rPDLKyOdYhGwwo9diJf6xS6hpRtfQLHi1midlGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kmzXtGCfXqYInXNbsfvpluw3m/UaSY7BLC3qRkCMKes=;
	b=bfs0UKfXaeu6vlbL+uReXuvkuyTS8rp2uUtzj2olah6i2QmxzVi7q4dm6McD079oQphr
	 c8CybV6qH2PbUOPfR9jsx+p5wNRjWXG6ACqI+4boZWpj7FTEC6+rh3SrCR6ckNx+uRfh9
	 X8D4gDcJs0jhJO8SoSaEeRHJeKonYaW1gCXeHQypko99q9Xvb64KS1jCyp58ghk0dTdtN
	 rgoP4JTsUXuqSMuNF4puq8iF+2qUVDcJ8IeDwfn6kskeGjI6spdbnYjpO7rOnpxYgaI4q
	 ygrxBhobWHihNp+wEPMdCuDW+TCDZ0dA9VX59AhmrNMW3b33I1XCjSOtywF3EfZT6wQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584474;
	bh=kmzXtGCfXqYInXNbsfvpluw3m/UaSY7BLC3qRkCMKes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SUcPqyotcEDiVXXdqL0dtXY97JCuOHBM6w064K90LoRpaIGJ/D6dO95RSikPU3P0r
	 u1eAn5kqyVLSFJW6ygxgD44MR5yq0EbmQad5WWCdoq+Vuu+3ctNTDaEkabcS8KQb9h
	 oi/LtG+Xddb0FxcGU2upxttcrvySdqumfT0iy/+m3IT7sx4x+C0ilrpBUQ1b26G+eO
	 /ikoXyto83u68JTbRwq/tzxYFeBfe60n53eWcaMCcgM2VcbBCd2GpTlf8a6k/zBRNw
	 L7skiz0THXifMEgLQLgumyftXcbnq0z9Qf2WcEV+4NMH0zdD4y9FMzMxHjSZDZn6z7
	 nKqh2otbQ5VDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D77404F4;
	Wed, 16 Sep 2026 18:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3E724D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E96B3404F4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bkiujC5loem for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:47:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 46567404EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584471;
 b=M2Pk90cE2jl+XsMRb8vi2wlBMs6C4PqXfoiuVYC4gTJRv8gz59CocH90yUrFgh+AhA3C
 hK0tL+qHb4gmi965GLGbdiRzZEYAgNYi0VMOPgVFXV1sRlwbpy48WIepmARZU3YQaVkMN
 t+tpQ0JOmi6oy+JpB5cHKiJQte5qK6j3c+eCxg3w+N3O80IOvfkOEY4H+IfyC4uoYry9v
 2G5qAGCYpRXMgPbEC2a8vJwhTJgEacBkkzyuto/+R0Njwn/Lw5GSjB2HcxkRZXpHF1m1Y
 UFUof33Xmk8afXol4UFO5IEfX7vdNkZqmn8gjVFHDDVqHmamKuRJ/FKmFBWVeWuBwlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584471;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OrueIJ4F21GxU/H7axSRgEeIPBCMbw47jsz/Iy6TUHY=;
 b=dq9Wwsl1SuI9JI49BWSTU1Dy853O5qI9a+4n688CoiGKJPG/PykRZ3ZfPNUhOgZZk5MC
 a+XFdMH1ylmPJ1BHXHCooAHVrCc1qZs/+zDDb1h4jpACNrXIXzMQBhyGyOhNZWpB7nHCi
 2z4RHwpnxVMEYvLtMB3YkjD+E83BgRCLR+FqahTFcxa28mexbIHiV+F1tyQpdTeWqmMj7
 eITcMBQgwVV4Qk03uIEGqmzPm9tw9Z8Ty+vSXK1JwL1brv0eYRltyaP6GxZIn3iQWDSQm
 q2YBdcq/py91lKFzrcxKgHPaBfN4hYPKLqqPrWVvURrESmgJ1GV9FwK+eTWeouxa41Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46567404EE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:47:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFDA9960CB; Wed, 16 Sep 2026 18:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:46:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 251a80dd9d5322d15afb8ffd5766ce879c478331
X-Git-Newrev: 5c730e8e0461a159658be808cc56e5bb57fd5a71
X-Patchwork-Hint: ignore
Message-Id: <20260916184644.BFDA9960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espflash: bump to version 4.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c730e8e0461a159658be808cc56e5bb57fd5a71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/esp-rs/espflash/releases/tag/v4.6.0

Update the Config.in help text to match the list of supported
target devices, since espflash now also supports ESP32-H4 and
ESP32-S31.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/espflash/Config.in     | 4 ++--
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/espflash/Config.in b/package/espflash/Config.in
index 3b08bacafc..b9d7784133 100644
--- a/package/espflash/Config.in
+++ b/package/espflash/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_ESPFLASH
 	help
 	  Serial flasher utilities for Espressif devices, based
 	  loosely on esptool.py. Supports the ESP32,
-	  ESP32-C2/C3/C5/C6/C61, ESP32-H2, ESP32-P4, and
-	  ESP32-S2/S3.
+	  ESP32-C2/C3/C5/C6/C61, ESP32-H2/H4, ESP32-P4, and
+	  ESP32-S2/S3/S31.
 
 	  https://github.com/esp-rs/espflash
 
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index b64717cc50..d26bb63142 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  95f052a272832d40cd69b9f62003c475ce6625f4002f751f3275ddd3344f899c  espflash-4.5.0-cargo6.tar.gz
+sha256  7be8c0737fba604ae0801c68bd5425d89e78f369bfe2d1a73ff568d5a55a7e27  espflash-4.6.0-cargo6.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index 6dfb815002..219d02d7cd 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 4.5.0
+ESPFLASH_VERSION = 4.6.0
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
