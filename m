Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62FEC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F97780C10;
	Sun,  6 Sep 2026 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeEo0XeEn8Qh; Sun,  6 Sep 2026 16:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F1FA80BD4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788713596;
	b=cvoXORJEsz9buT6A+WeGSSf4hUanX2Utl+L3Z6+WFGtNte3Sm5gs7UI/2wCy2toob9ma
	 xlzNaIgyd8101IYX+nqgwpOo5UwqZSp99xBvQZ3r0B6YVLvCT53lDcMS8zNiBWaAh1VaU
	 6KXZHVsVa9JNLxiI+8kGI131A9aSFWFIR7ZHKFfZduYgR4jkny0u/2UD0FsznDoMtMICQ
	 Ik9TARpNt3wOYZYSnzOjs972BsJjuZBxkircvcK/y4yLntcqOaOLqUuCkaiEJMxc8heQl
	 GINQXz6J5ilZzdFfYH4CGpKPAg6lSU1s6brD1+zyuD4p2sG3EKrOZ1v3xmk42EciCUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788713596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=14HFxYlZdqgKlL7HpNtKs2gYgm6fkOEX9EQNOw/nhT0=;
	b=ozz2EAAKBA4/5djmmaqOmUD1E6/78IsStW8GyjfMMyoykleCQmdayrEbh+BNms33U+HK
	 WL4RJ0PXd3NttkInSHjTKpZgk6Cvh/NsGn/rJhSK2CSVRPE8zPVu1R0N4LmtHrad6QtCw
	 s2fbiJK8KOKybBapm42KHJU5FDgU+Rh9io+ZTA/ur7C5HxkdHfmrvP8t9+1PMdDjuDZWi
	 AJQckNnOf+0mmdUY+RGVlX0Emxs9/cu2neuGH0/vn5LYQuecnJ7d65E9dFa/H+Di1BL3U
	 BTAKvYhrYeT4b2q0O3VOUwf5CqkFOdjmGQadUUBu0owYfHVRekpMNbchlsw24cx/dfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788713596;
	bh=14HFxYlZdqgKlL7HpNtKs2gYgm6fkOEX9EQNOw/nhT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YGxqITa8SagRyjXhlT0EveLw/N7Yj3PACuO9nKJjigCWXf0OR1ZfPCjF1SwKPf0Vv
	 RREmsEU7QFPT9K5YL9IJpuZYih8OWEw4M3Bj0wLip22MiBH4h6rfv+DzPRcseAWql/
	 SIWiRHnFr1CSaAIdbw8gIbtWPtx8vbPDa+KGGwrZTQl+sHOC7mufdSQZZUsohKSQw9
	 F/b5MeBaLm/N/Gk0xYEA+5p6wkjl3drJu0TxGDsKBfEvLP+WI3iWcx9djHJ05EAKNI
	 m+isggGqW9cmefNv4g67NG+yUwL9mveYoA5V1TToP2LUPFGBWfe6o1l1Y2/lI6rZtu
	 hy6zpBWgewNJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1FA80BD4;
	Sun,  6 Sep 2026 16:53:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 864B42C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE14400F9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtaAp3gYOHW9 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:53:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E003F400E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788713590;
 b=i5D5Z6FWKauBKqR31TQ/Es5DGlKynp+XMai3xRnViKBV6JdA7pAz7xDuNPITdPP+AifW
 8oZWr9Kdv+PANaM4boJcEWK36XEyUhGckox6Pg98LHIaQ8QzjDopGq+7eBFg7RO2xmN9D
 P93aMKQG89D5Um8dQkqv+T+JpCUOEUg/bYhSu+BO7iUzT6pXWvmIECQwrRRFhPOzkDPM3
 MtPZAUcZWrlr4ugtSx1F3bGVoPEcQJ70LaqbFszr5SI5h9f+c5InjwTtJdiWRv6ZlELoG
 fYEbfFmbyXQWm4/sFuY1yhUsVzc5SE775RV2iREXwEwzp0+JFB1U+kFeEnUk0a5vAoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788713590;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/7SVEJgp/38kBIrouXbO7iCSZbF82ESXCgFMLfLIC5c=;
 b=opgPIQ/tIniIhqM6KIezwCq/0DWBHJmLZZ1AXGDSp5+m4mPGUfyS0PvhaiAD9Z4uAuGC
 RX1v4h6mwu5ua5UfebWlCjB0kElb34VDfF1Y31Rbfl8ehvGa8gM27rjXhr5w785kVdVXI
 3GPHQtou1ogr9NSj1HL7+gM77jFq+vaM5ZccaweCjQW29rGPA33+bD0xp/7FKAMkMSgsf
 4nwlIud50ih3QN27iblMhJMRLQTuv2doNsuOVnnfshP2YdNGVG5AJFOwJYE/hpDeHUUeP
 +gz47Xo41lWQ8Nj5FmBCGl7LbO4IIQs2pgpPeUS58W9ElMU0q76iS+oimUiF6EwfudA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E003F400E7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A35D952A0; Sun,  6 Sep 2026 16:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 18:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0718179694b407cb93f1603cdf845997dac7345
X-Git-Newrev: 490c380155e564fbe9cd346681f078da3f911ce1
X-Patchwork-Hint: ignore
Message-Id: <20260906165209.5A35D952A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espflash: bump to version 4.5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/490c380155e564fbe9cd346681f078da3f911ce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/esp-rs/espflash/releases/tag/v4.1.0
https://github.com/esp-rs/espflash/releases/tag/v4.2.0
https://github.com/esp-rs/espflash/releases/tag/v4.3.0
https://github.com/esp-rs/espflash/releases/tag/v4.4.0
https://github.com/esp-rs/espflash/releases/tag/v4.5.0

Update the Config.in help text to match the list of supported
target devices, since espflash now also supports ESP32-C5 and ESP32-C61.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/espflash/Config.in     | 3 ++-
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/espflash/Config.in b/package/espflash/Config.in
index a445101269..3b08bacafc 100644
--- a/package/espflash/Config.in
+++ b/package/espflash/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_ESPFLASH
 	help
 	  Serial flasher utilities for Espressif devices, based
 	  loosely on esptool.py. Supports the ESP32,
-	  ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
+	  ESP32-C2/C3/C5/C6/C61, ESP32-H2, ESP32-P4, and
+	  ESP32-S2/S3.
 
 	  https://github.com/esp-rs/espflash
 
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index bcd24a0167..b64717cc50 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  10f2ed2db01359cbc7316cb694731a6a307a639d5698e14506b6b52483d36163  espflash-4.0.1-cargo6.tar.gz
+sha256  95f052a272832d40cd69b9f62003c475ce6625f4002f751f3275ddd3344f899c  espflash-4.5.0-cargo6.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index da15535670..6dfb815002 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 4.0.1
+ESPFLASH_VERSION = 4.5.0
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
