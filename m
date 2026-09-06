Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B468C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 14:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B49B80BD1;
	Sun,  6 Sep 2026 14:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aas8hUwYJiA9; Sun,  6 Sep 2026 14:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9E27A80BCD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788703701;
	b=KjerNUKKC61rRuqhOh5duQDmi39BAKc2Zd+Lt8PxoYrQsol7rYEDKAmTCMWxIEhl/BmD
	 5Xj4Dq4s2ECpWj+CTlIjcQUHWpzOE7sOqTcT4gUd2bZ6n/u7fZ+2T2D3162fjUIiAf4fV
	 sCHTiBJVKZ5q8pLsR4GV2wzztYMWbiuGm4f+yRv28QZYgYsg+nuFejU5LtulDAEjaLyT2
	 c5a/7Klb0wjqf6gn7Tip6+puecmYlhiXYCjRRmXfPLVI4204JOLYCb+SUMMG5flNTCS+j
	 Ib80lSFG/73ckFycaYzzhQyDDl3cTi+vo4Xk111bOE2rle0Z8lmEpamsmjcM/AUajRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788703701;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Cc:Date:Message-ID:MIME-Version:
	 X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=z/wRhBET/osxO9DLqyXqndWNjUMi+OerEi3C66g1pU4=;
	b=pfIO+KurfRphzP7N9uQLXx0edcGmTJsmoTGVuhA3XLOsFlg+6QoTYMiMDv9mdSycaLE9
	 gVm0ZH4vytxoDk8ssGjLIUv+6wp06HISwP530oJlo84sjVt81zuMG3tSUqTuShsopoUPS
	 D6rie2zZ4vzO8TpL4WdLTpztlwZWjeb34bkvSl7TSVugIuW/+CRwr9LKYB4YP4mMVmQRa
	 75vcSqY9s/QcjzQkETV1LYDHEP/jrrmyDQ736OP/yySt6BB2nncjp6yKRCfSGmcC5ISxQ
	 pyPoMXOcMtF1hp1O4u1q3BUea3LNdZr+hBrmGPU2xr4SUBVVk+iw/OkEgyTuHUuP2FA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788703701;
	bh=z/wRhBET/osxO9DLqyXqndWNjUMi+OerEi3C66g1pU4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=syxGGJMyIXYrK6u7CDriJlXYaW8etJ/Vhb0/ikQMAzGCzPP1US++asBupUgIoAGam
	 XA/O40cTyylzlS/UNq6yVGuEkLGXLrUjlJYjnPzKESUxi3eU8zhaGDEGKZ+NJfYy/S
	 +L9mHuHqRXFdQCersLrJgtmMytUQNnYVVkdMjr9eVLb8D8ld//JrG1ulvumHG39YTR
	 PiU4f+COZHTc0Qu2bwIy+zEJbkbvcgADmxqF6GsUQgtPN98qYwi2zE8ithOCX/ty06
	 rPeMFRmSJYW57P9KADyjyXW3W3AjbiqvwYIw+t8cEVljYlWF/Z3Iq3i9xkHsxsPpFQ
	 CjzJYP8J6C0+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E27A80BCD;
	Sun,  6 Sep 2026 14:08:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6789CF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 14:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDB7405F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 14:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c04iyHWdO1RM for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 14:08:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EF86F405EF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:67c:2050:0:465::102"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788703697;
 b=ClFsQyk+ZYTy3ajHJUjNuMpljQXKyAGgvZCy88bojU7l35vgMptBZ7OzD2t684TykVTX
 pd9Wyu9dtwma+vWf1C1DdOwfQLd4xndYz6zIFefalyQAC9+zwNsmANQHZy4oz35FQrUH6
 bSnuHARjfnqAZyUGiqKR28Vudc3jF2miBD/vOKQ65+zkjuo2QDjEYFfDh6YOlQv+H11cA
 sL1YbPxQsd8z8sW+DNzjMFFtpGtyvkiyP4WhyQrCasYz+kMwCHCy8bbcK0yJvn2NmhUJH
 PgkstYlxrQr1grrrV0FzqMCA4pWmGRE73OpYsLFYSSXf6zvNqG9erMJXx8+1Kc/NYEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788703697;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:MIME-Version:Content-Transfer-Encoding:
 X-Rspamd-Queue-Id;
 bh=07KRoHBiGl0A+H0FQ1ZNnAwNnuxH7Eg/M8mnrwmQGiM=;
 b=mDXspzvqj7efZ5TrIbMnU21/137RI3XBpxLZRiCBWkjqy9OTcmW1Fur3f77GCbUKoi+Q
 sVnGPsc/imxMBuOZS7a6G3ujCIpV3qLSeK2JQ188A62p6k9bJn1gC0TkgnvbY8FjSHXJ0
 QeTixOCPHanchXP8uu9Sm9xVvt1zUCsOxU5phwLBzJSkrJowROeEke1XG8GrtpgaN1m80
 tek+70XHYiS/NelbvgpgStrMfn8hLiPatOhVcfDjUx+QwDXSQcxBNOwc016Zm4Y51qj2Q
 EqLo7Mdmprsggr3XZgmePnHd7wGZtZBQic6aS+TwssNxeMN3cVGi8X+GxNkOv5Z5WcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=t-voltmer.net; 
 dkim=pass header.d=t-voltmer.net header.i=@t-voltmer.net header.a=rsa-sha256
 header.s=MBO0001 header.b=cQwtBTzc; 
 arc=none smtp.remote-ip="2001:67c:2050:0:465::102"
X-Greylist: delayed 338 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 06 Sep 2026 14:08:16 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=t-voltmer.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=t-voltmer.net header.i=@t-voltmer.net
 header.a=rsa-sha256 header.s=MBO0001 header.b=cQwtBTzc
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF86F405EF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 14:08:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hdBjK0GZHzKryL;
 Sun, 06 Sep 2026 16:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-voltmer.net;
 s=MBO0001; t=1788703349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=07KRoHBiGl0A+H0FQ1ZNnAwNnuxH7Eg/M8mnrwmQGiM=;
 b=cQwtBTzcYJ5l5TKULr26uYiUcJwA34IiW/lWaTuvAPCiImIyrAaFAlUUposqDKJycn4Ftx
 HUIeB/LBbkStHywrAK7PUIjn58nyDDDizsKoLscSGyV9tPFxjCioF8L5eYvPvsaPyrcPWq
 jLSUnT8xT/DAK85BXCicduSHosntZ33pmI/LWV9ASVHKZJEvgWRgBpeSXP0PNt0ZAAwqOH
 Fj6B47nwuIPwGFHNjR5XJ+Tl1pvApilEz06VXS7BUgB2T5fWd/Rt3nPIStcqHFaQi6QDSL
 W6MdCbSktk2KYFuZQZjTICplUOX05XATKz2ui+6ERov3jwNj/hmnt+VgYk6FUw==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of mail@t-voltmer.net designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=mail@t-voltmer.net
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Cc: Torben Voltmer <mail@t-voltmer.net>
Date: Sun,  6 Sep 2026 13:59:12 +0000
Message-ID: <20260906135918.63327-1-mail@t-voltmer.net>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4hdBjK0GZHzKryL
Subject: [Buildroot] [PATCH] package/espflash: bump to version 4.5.0
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

For release notes, see:
https://github.com/esp-rs/espflash/releases/tag/v4.1.0
https://github.com/esp-rs/espflash/releases/tag/v4.2.0
https://github.com/esp-rs/espflash/releases/tag/v4.3.0
https://github.com/esp-rs/espflash/releases/tag/v4.4.0
https://github.com/esp-rs/espflash/releases/tag/v4.5.0

Update the Config.in help text to match the list of supported
target devices, since espflash now also supports ESP32-C5 and ESP32-C61.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
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
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
