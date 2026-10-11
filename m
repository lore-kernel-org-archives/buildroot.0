Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA4CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF85940595;
	Sun, 11 Oct 2026 13:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGc_LBf8WTc6; Sun, 11 Oct 2026 13:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 05F3C406BE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724143;
	b=V9wTR1m2rbITgh7m4SSu27JD2DMBIff0+4B0iJ/2zv0jg+o9NsIhL3U/+vQBhxoIcuyf
	 faogvzIWcJTm3CFwLnZT/CR9gAEBj+zekHLX4wK3Hn4CLW8PV4qXP8ZFcAaLmDzhN6VIB
	 qATdobuPw7xDifO6UXNYSof15PcllTcxPGrkorqul2Q0O5QBTrjcIFMxGRhEzQBD6K3xW
	 u3l8nCXMMRo+kSJFzuO7+OgRpiI2HfOC0XayeTRbXNHShTXDvaSxB5Lx7nZdCjkcnPHoZ
	 mYaSYwIIz9bisVlxcVEDe0GwsDZJtxktQX2zLL6Inh2C8vDkWtwfBfuv+ucl0D1F2qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	b=Q9k0SE5bzWV0emqXOYEUnbyV/T0rtOaFc0pH1ZHaga7IPIb3wlPjFaJnNYoN/cOScEAc
	 8PC4YhdkL/7fhpXXO73eQeHFLmpl2/LNNKpe6OwMDYysteuA373bDWk9jmnnk0YXUOtkB
	 gze5k9AESRai4Ajvkg+Qq3Dvbf1Yygy3nNSYcHhMug7RmgdANbrZbXcizKLI+Iu0eWn1D
	 XYy5iZ2ol8XFJqFTH7ZBY4afNBVrBJFHFX2deqfGtZ/c17uxlRoYgmmV5DuB6en/Tm3N1
	 wXLn9XaXMyAqkPXqxDxvT5LNgAXIgeYNUONNCjYTH2Sf+7CR/7BCL75x6LGFeuP5ncA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724143;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lByZSCznobBLJGhCbV0Lfkk+njmCVZie1q+03somAaBL3BCHQT+tJsJ7dVAUZHVm6
	 +9ZuwanDPls11RZKpXcyJJ+NaA45mBD2DrrkwAsLz7XqgQ7iDS7DcSb2tKrwef9ELj
	 YBdYeVHdtjx8RbxF2GRp1hrdaz5pun5b8i09hRRK0GzNpQdT/phBr4CsxvUDx40ZXj
	 VjKpgcQLAfPivBf9yoTL1Irr9/A+sR/t1pLZ4aodpJIGzgufineeK1tpcwciGE2MWM
	 uWpTkI9USwg7Ra3lkM3fi0oUHqSOwiAA1pM+VR0Jbd9RHXP4Xktq430mxAvfcfigzp
	 dAoxE0X6sxZNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05F3C406BE;
	Sun, 11 Oct 2026 13:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B19194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A60B80D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcJixeiAugEf for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53D5F80DA9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724141;
 b=RJzno4vib3z0D8bWxoP8BdGHui/fwVzrljAiJ2c8zWeZ1vYd92AbEJBIQ42rYFiuBxMU
 uMJV6vFACS4fP17DC7ScHpr/v0f5yqCrglv9uxGZotqX2o3eWaKSXqm+r9GLt4iqfCFeM
 q7rHmDePbmx57XttA1wJxJdjyyGB5j+EE/w1q9H554YNK6/8cArJ/Blczb/G/26YbKnVV
 r2dDHoNjKGeyUnGk+BIdPrY/aRppn+9IKf3Zp4gKKzdUtjlkHdlfhlap5XBR4cupuqoH5
 8M4ZbURe07nEZf7wM6O0q60vPUFRweh6apBtQQ33ONWAZTK8/jTbpxnsiPimyUaZd6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724141;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 b=griTqYvFnMgiosD+k7EPuXnXGKPbNUes8AGza6TmcKRMCArywtMRXIFqEwkT+PPLN0w5
 jV8UmuM9//GXoVw+DlUA2aWMZzrwjaBGd/6DgsSaGMWfHAGKxwlzdK7pql5f2fF8vJzRI
 ScbeICb3zJcrxY2w3RTmDQwecaIve7uGxlry5WDRRkbCcpYwr7Hh5tX42ndETuhNCoSxZ
 Bln7RQYWjjKTHg/siS62A08zknEB+6YO70quGFAHt5ztKFnbsSrbZI8bAZ8P3vXVoHX/a
 i8lgjjUvrD7BjS2ou+9nPRwOMTjJWKwEGWhS/zVj3vD2aA09CHmpg7CK4nuYtbXxcRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AbBMR6WE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AbBMR6WE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53D5F80DA9
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AbBMR6WEwxAr+7jrzfKnylVtpNQ3uKp1/oND+4t7XisZ0Kx/SRg3MKPDhX4Iih/6h
 /U4NhtfGokowd+fjY2ULUkCxpLLo7J/qLCvXSKSqvrjZg3IrubxTaEV+fk2K14D2+m
 AxLfGYIiP9okLQckwVY+jGNzwcsicPGDndvU4T4IpxuFc5MQXyhdhq/65hMNHk/NSK
 oZ3SA8FK95zVIWgzGfix/cJ4mRNDHhE3kKNoti2hUTh0tHueUNHryrf0WzEka8MXtt
 VqAIEL70lCdir0Wg9m2K7f8L7PgzTDIGqAPUamsgvOqxiL9qPb5x5OsBJFgyUBtSE7
 LS5scjzkDE+Qw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 /SuG8dvmYr+3C5uvhYPsmkenmbmXkzzC8LsO08n/R69H87T208ZU9mMs5bZud/HAHOZxH5EoZFS
 rkgAXl0Q7I/Q+SpHKEuGb85cGdAucwk4RlUX9UbKFChBEtOL0McItiZuGbKCu01ftuPFOG9Aph7
 INQMu59nKkDZAn1hP/ZvyBf+TaZeCd5SJVzHBrYk5osZ8B7LQ2Hv1+vmuItsLe3Uk7wxPaqjjJi
 qHVgATola0PBn7eRbo8MtJlTJ13ofnqdseJHu+4bYBE6VtE2BLzSBY+6qQPgOv80FoCUhP53ehz
 hxb+FWqrov20MvLRq5wNBBY+CmzjhzgPFTXhpmo1rjHFZPT4rtekiUFV7izU85keXxNDApk3H/a
 0awSIaQwbNMkTpgtSwreO86/PxDrbFsoHB1qfQlcHPb9I8gvlvPoWxJeiM/sYKQB2OfXdedjOXJ
 9q6RcSHZHQClLRxPjgODSrshCNyDnRyM6moU30UQ/ibHBieTBVscYLJ4tYhGB3iSBUgsu5dYlk5
 xQDQn1n1NDXVR6cBvwP3zq7p8ylLClM0RJ8fbHdWCl4qGfqJNlVcxeBhTOSArwhT5DCzW3MWC2o
 ojlfkqI=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C38FA4C5845
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-0mGG
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:41 +0200
Message-ID: <20261011130058.3443432-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 36/52] package/kodi-imagedecoder-*: mass
 version bump to Piers
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
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index f8bd74d0b2..9c821cd331 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4502522c6e71439114a57cf51f444e38b32c7f786636ca6c361c94aaf5ffe066  kodi-imagedecoder-heif-21.0.3-Omega.tar.gz
+sha256  186539681e6067fa24ed3c0f526301224de30edbbda24e347af3d79569603cdd  kodi-imagedecoder-heif-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 5114dad72b..66bbdb832b 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 21.0.3-Omega
+KODI_IMAGEDECODER_HEIF_VERSION = 22.1.3-Piers
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 98adf46a9b..0b724e9383 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
+sha256  ee4692563acff8fce4d77ffd629778d9df3cb516825b7a74ffc80f25d902f419  kodi-imagedecoder-raw-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 989742a901..ce5514cfcd 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
+KODI_IMAGEDECODER_RAW_VERSION = 22.1.1-Piers
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
