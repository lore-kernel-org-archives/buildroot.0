Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B89BC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5961D60E56;
	Fri, 18 Sep 2026 18:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxPY33UbsE6A; Fri, 18 Sep 2026 18:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7810360E43
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757483;
	b=PFYoxxtoGIAiEqDycUJ7WQoli5aH4DSAujlVegUmSY5vDmSrEk8YKb0H3iD2yjp8SwjS
	 TEID1FS665ZIy7S/deyP1xjWYUlsSNGXY0pbaghPBDhZdW3iX+l4Wwi5TUdQmdqfRk8Uh
	 ZxpqSviuvSpt568/hRnZT4cveuHhclAUdil9li+teDL9fe7ZuQd0o1e1ggLtQwWeCL6Bw
	 A9PlTjjZ8/wIJe9KebYAYlvJtCqLb9b3+f+arkpbFNiFb/UOKtoHnWSVm4zT63gX2W924
	 gDmD37UcBuXlvz6FYFSTZka5CcMYV8IKgY7pAYgDAb9C9lvPKwb9RyRbwjsOjpw5mLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757483;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=la1rqSycrTQoYaN3oNgeQ2Gp8lozo16Wx8wa3hqobamLyG/72u8V5R+MhKSwzcYoQQ+i
	 OMVyDNJmJnbsb2gCgq1zVumvaFyEgodvrRORj2Pc2uMLfsD6J6Ufomfi5hT5wfEyJCHSA
	 pMIo/PRz74OYLDJ0pzIUu/eoPAxEQlG7iCL3amHo5zMWjqAdcAhYCe3IlLm2PMV9NxZ90
	 paorgNQ9J6Kuir1nKJkA4dPAuBNARZCazhcI1J3S7n3PGJN6fSz5QkLZFvFcvhPjAhahC
	 ekhxvVcKzXEGAdNTiyyJW8RMnUaSN7g1dtdOkxjPU/mMdl9JzAeNyEXydHBzxzSx21A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757483;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=myi0JKnhzqV81JhgLfPuH3JF68JNaO3RrFnbdHXeTuQuEt7BKUUZZrZgBhcbb4vMy
	 2Tp4b3LcTuky7uleV3NBURhqWaxWHqw9/2ZP4UGCf0t7YPkcNBAshNCNeogX7Yx59z
	 IZXaMTYhkbphYIvHp4Ls+C2Ng03CULmb9ChYTJvy13yyGKrxYeBBaTBH+7GvXeWieW
	 BPUUFYDHqkn7TYLfdHiFXuQ/1ZgycNsoP5EsN0FuFioXE1JIEEQ9tMHkVUzjWxDtrs
	 lVEvgnCGq0uVuMcNyGF4QfcRbj5CnCGFrXNplfVLBp1NzwZyF/kbiulM7+NS0FQPmT
	 enJytrIW2UZtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7810360E43;
	Fri, 18 Sep 2026 18:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E473B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C021A812FD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zWjuItriXG4 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:51:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D794D812FC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757481;
 b=N93jhpF2lN0RwQtBhifYDZq/LB/xJ3LK3FCxVjXD7/NxkE3+QjHOkpfIEgKrglA7ra/l
 ZzI3ro2cDsHYT2urlqthjNWkcXKnkGlEhCDSRACi02MG3ICYE8jr4zlIUJcxYoj508qY/
 T1HUT4vkZZOoeuvzsHEpt9ERczGejvBzYczw0pdrnDcduZSEDA0ELKCmDa6FWXVcjPrce
 Dhb/bhb3Y4YiKEd9bJJHKhqJDDNOZZPndP0bwj7a20wh6NvezgT1U49jqzqBtUjdE/aMr
 RDKA+cMWwiOeEOeZx3n9p+arIO50VodvPSP3S8LV6r/CTrt7F4rFdPVdQx/gHo0LImw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757481;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=HwggYmkeaLchy/d7M0c3/Ibk/wcur7eheSdy0XwAAjznfM5yii5WPHXYJnbxWUBHeISw
 Q0rQ4wdaeETGDvzpZ/SaRYjJp6HAFBAevNqLuGCgRRodj0UoSU4n9BcBAidn7c9SFiBpG
 LD37ChrWpPmiwU/sV6oeKnzfe3q7qgGE40dQnGdk6WaxzBve9xKh+69ydrn5HZ7cziYmN
 wtsjFlEKzVL3PF0KS3VDSu2VWs5o+ejdwtZOkXeDZwJohvA2aGDcezY5Xgt4SB5rAqAFL
 OmC7Ysitio9llQMcZaoHUsFDtZcwRGET1ZXfnt+c7CmA/nLADQMz5c6cfqcrlEfVe7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j8EHwR3P; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=j8EHwR3P
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D794D812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756936;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j8EHwR3PSAtlvIXREQjwHVf7Aq4pLBydl4WE5w+U3n0MS3xKbxGgDRA+2ElBamimR
 Dvsn6P9v+X/Jik2Y7gPuyFPrX33/np2MlGtLMw7zxJWr+OkwzxrZ3dwV5HkpUjK5a5
 VHH6hR+MgWrPLrLzFs6A3XZG+dMgnM9Z+tNvsHfqk6ZzMtoFo6BDQm2lnup21p0DTH
 kgmMKd44ikGlumnAng6p195BWlEBUdp9oosCXc45mii+NUwkES/s6tahfWS/n/RDFL
 s7Duc4vylANTbDChAcvxduHkAkgKpxMSUovGieApvmS8s1gWWYKkT1+pmN+kB9EHua
 0tpkQr20kpbqw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:hOJU5BjwlTMUBjCwi6zrd1vqdrVXzcObXMsZ8Egz5n0IOOeRdSpuUzot39THWu3TIfY8/BrxdUX1YmaafFlSwZR9tqkg81C2aoWhYw0iTBn7sig635waQUOhD4kxl8TauOlZThDX2Bms+jHeFG9szoMJl7DKixxyIoKViV6BCqHCLL/cDTNIeTzOjH5IfehltaQ2T9u4gfEJoTE1qXuGq4oxYq78NdP2W911KOlCaMUwp3Lpbw6OARublT13LF3bT9e8t8rek/N9zQKUcCmntFQ+8YZQspo4FOSNo4NOaZzQD279+MbCUHzPzYgxqJbgP9xd9q4J0Ojui+snv/fMu5CBv+ndpllJbJAWhtam/XVvQ0TMG1Rrbhr4IxR69F0hj+0L8jRulxi3DGzVw//5lhnKfBAsLrWoEvooQ/3E5gmby8x/uEvdJRzKgDwN3T+zNE0oRmvbKvDWf+fX1FGjlgewdkjKYUo/bazIYS0Rt+/it4ePK7c7zzSm1L1A1hWTJU4hOMwv6FW2b5XWZfs6XR+cFURtiNCT1Lfb3o3lh3ThmqDWQtE4x3swAtXgNSdYobgv69Vz+4IIjl6UABm82VT6A61bNRYs6eUp2jpw490Dkd
 Cb7wUt6xsIyiAjWVDMXzSW2EsPtFiRnuoty24W7GaVtjtkXCVWZJ6uGAOY/rj413epq+kX+HA=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85DFBA4C4732;
 Fri, 18 Sep 2026 20:42:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-0fOK;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:56 +0200
Message-ID: <20260918184140.3631274-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 34/77] package/ca-certificates: Replace c_rehash
 with openssl rehash
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
