Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41431C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F1040DD0;
	Sun, 20 Sep 2026 17:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUeOJe85-GlM; Sun, 20 Sep 2026 17:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2068440DC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924193;
	b=Nj7Vw6y/qiY18WokLEV4oQqD0FiJOhwrx3Kl6WkgZutmC49DSaUuP/siiq941+/4t95S
	 3S3kgSBfZ1+hCk2lX9oIBrvBGY9m3Vt4L0wAvTrrOkv+xIdOG1kI0+hGYfDYSNp/1HCbZ
	 kZudnPAEOcvpu3oUL+d7FAep7+dZilKpxSYE9UVbFhDinNCUnllFi1JPohxaffOSkGgqp
	 2jyS+oDHvAX3Avv3dj6o8nDdriAwAXC0O5Hcae/mMqkvWWqnRAbK1Pg4xOu5BDD6mJZ7Y
	 d7ggw9qLUr/NI4iUT2VwvdI28lel8yQIP4pM8+oev6GMhx9sz3nAVhgSod/74SLSDEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=bfX2ofJQFm+3ZfvJqu70S3sSxdsEYb02hctgEqbAPWXsj9HeDpf1VD/en6UKVFxqaWTR
	 W+JzyicXAo5W1IgQu477XzZklk4ZtvIFUKpM/f+N+783qwOCoo18Ly5qMHzEHMz0ChIxP
	 1e6NZSPYGhgotEuX+pl2kfRQTWO+OBLi9H2iR1QHCiwGer1n2EqjHCKBY/9HcHSpgzYkU
	 Ku9ygLHuNh6DMKCDmYF0SlNxAb3gOrk/TsNhHn6DTjfq7cE+me21yRTy/Rg11CU65AUJi
	 vLK/53bt/hTamn2CGQ08q2PvoBVNvFg+h4mGk/3K0BGDK60c38E5BQ/BIwL6LgrT74g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924193;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QHjhXvB3+/g9o8cT6Ig/org5ONJV/O1XXMrq9soLrxBNU9fSq2zQ+cpLETwA52ura
	 i+whPth4zax33nk3hZaAr3KVV1PXKRVKWlX4jExXZXxK+mRGfTCSXwnVrNNi16TJ6U
	 ILshE8TMgVELQisbeUhJSopxUIKI72/X3OenOQqnhFUKVb0vX77fmDIORzC4JtJxfn
	 D03BZywEG7traKrgUH6lbBLS4QYhnS0k7DnPJXVNHZg0n9hlKUe6adkJgloFUoWemR
	 DGKrsSfvV4QZpXOxwGGKdVKaQrdqU+xDRJRrROD4oCpbqCGV45rgY8gd50BKV3dsYG
	 zgG6mc2BaVB7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2068440DC0;
	Sun, 20 Sep 2026 17:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6853DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6150E4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1csaOdec0vvg for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5412B40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924190;
 b=MJcEXRpAZorXXL8UNyQ5Uh6zcsTrGGgE6efQloTVPtOtNkj8FiGnJu1ID9kqcn7pOf3F
 f5FouZ9PgZoRjkRr1KvLzIV6oBQdEBPLUCZdcBrM4Cw6AHCWFaIQfsTfaZ321ht40tbaS
 wJmoYckBP8dK0jXgrgA017FBl2DcpOjKM8zd98keBZ2aYZpOaXcltchSZzyTAOjKddeGq
 zdwmtEH87kgkws8LrHTpjz953ZE0/p01mRHO0WXLHJbdyACtriMQRCJ2omzhDZmuXCk6m
 0Sie0lR2lcyeSJXVzS2D8WPMOUZp0o51tqjsxyt/Z91VsBcm8nUM1tyA+snqlgLVnyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924190;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=NW9CWHInwq9YL0TDPHqBQ1OOYE+zvBxJa4hE0V4wnGOzHsH9nMdXe2ELEz5kuxQKlt4w
 162GXxHqHPylGtzSUyLCNRE5qatSYabALXLUpB00Hea6gxaDCcnM7o7g3I3CTXbDbNn/o
 T51fA9TpfN+FtUK8xpbl1lOdmBPz+nNemX6N9M3l780CqoeUGU/sqBM+ucQVh0+QPLJLV
 0eoGEOVEZZ22o+ikCBC1u0yxUVwhZzGtZ/vT1/eUBkgYoQgZVjoZa5whqa8hJTPisuJh1
 R1b4LFASTfSxzHc3NMOT7xQeFu6ahNzFtIZviVYTlG8eT1SnVwsrigPPK+d2vmbg1Eg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HGOgxxkL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HGOgxxkL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5412B40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924098;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HGOgxxkLMr19lR3IhijEEMOIi5HFt2Mx+ewZsFB2iP+liQdkG79WC12mDwkotgEVU
 2k/ls5tg5647r+xm4lzaa6mCwH5UUVwMscUIpNvjXydHlOf+cVOtNnaAfr/A7r8Byz
 sOhSF8IKuJwdBE3g5s7OKLLCRH/ta9Nobv+ICf1vwW6zhiFAFZ0jDQElAAuHcxGcmV
 TW8ax1CR0yoyK7WKoacbrPjHh3kcRJbiExCw4ktpUvwwsxR+/S1iBwfLY4SF+gWBXI
 VgVnZcXjkNZK/zEq+WQ1r/3wOrapg9DnRPqkadsGsppnDOz2e4iFH7aNyl8cXN5z1W
 1uU/G4xAT7W+Q==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:DWAwUmjDBbai2+YNmYOq5ksMCaHKUVIvGY8wTECYzMYZ3xgwiltW3Lo+7xyLDFUTTMYyAt9XW3CjIvIZiOB3J8Nj7xfIOHa9K3/SwRfmqUCRhVydnELD7m8ASClsIDXaHM26oRkHCQ+JJ2bgd+gQBvFlAj1GT4H7f1wq8KP6uexl+3Vm58yRRBzzG2H+3e0CkOs1yyvai8HeE9wZoygK1ggAyx9LmHjxR8fwOVPDPez9uopCixu9lbM2xrV/U4QgHqgi2xo11Jb9BnEh5gvUSbQCoWlh/pm4Fjtkwy3EF5sR4nVWBqLMIfy2MC0jJuPwS3leIS849nLYZ7klShWSP2zqXBfCnm5GiFEd1QRiJB5RDFY6hjSHb6lZp56onhkB8To6zfdutFU8UX7DrYRf32h68KKNuPT5N9e9uOPio0LuUBUYAl4QkHRb/di0r7asx8ieLFmftRpdZJuAUODEz2rgUBlqt3ljGlH01JxnUFPZlTMbDUILduTrAIBW/8d1/w+f2yp9p91hxUfXbRn+LR8QiOlX+tHYhoOM0XkTFb6RirBIT/U7WtY6/0AnG6DgKR5a4M7bQv8ROFH+kA3f9LchxxJGQctG+pyLsqvmGz77eM
 v71wdRpl4k5c1XxpafSVROIpDrV2CNYCcMcIf50SMTprJaXdiNRBg8bouVr6jdY2HO+M7uRkF8I7CMp0oqbyYFhYbR5NJVghDspJ222ACfK2fqzg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8CA8A4C486A;
 Sun, 20 Sep 2026 19:08:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1W-000000000o7-1FRk;
 Sun, 20 Sep 2026 17:08:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:14 +0200
Message-ID: <20260920170815.240247-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 07/67] package/asterisk: bump version to
 22.11.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
