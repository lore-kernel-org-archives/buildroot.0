Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14509C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D952240BA2;
	Fri, 18 Sep 2026 18:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFKfl4cGyX2L; Fri, 18 Sep 2026 18:55:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 57B7B40CE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757721;
	b=BEfeQPZtOxWTtDJ1F40zocOqxnwNT53aWazLiKOsIBq7AEQ8btgWecWjHpL0UGLXpOpB
	 By2E4KzEgNt2FX2QPe8l4jQKtS9DbngMrNupoFZisu22gP/sYcLxh4eJogo+9KlFwlSWa
	 6d6bSajN44UefOqwHaA/Nv2y2wMYRTfY73A/el4NBBYTrx1LvnQuPGFqd6CuBxEVW5LB8
	 s2EfMDAZcth14D4ehw7tcc9zhH5gZuWG5Juq6GX9mL0QLq40+20xGbyrGX0cK8fXgIh8J
	 Kt5rep+NbxyIe3oSRlL3SY9+Hz9OllsUewx6uM5R1OfLXOBGvWMAysEyETXOJKC2lXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	b=MMET3NcZrGYKR5OYkBc/XgOb5FE7LRTjfL/coKi9QoClESknvz+P9L7B8p23Mj0kuvH3
	 IbYSZvLs8Ic3wiPKeieM3lYXH+XG9rLrSreBiTmtNtqvpl8dIETBQQXKlpIaqmjtm0oYg
	 mYjER14ekKPjGITZ0v2MIGYgUx/SBmb8VPUBGyzw2/wgQP+khZHSlXz3FALjaJXuN7VXU
	 4s97s72j9xgLt06yYV9y5pnaYJjkK50Oc1t+pwB5uwg5tzTTeYTs8yn9KZeOek08d0TcE
	 NnkZGvEa40anM5S+2nCa6gOU8jjoSaWasJ4gJhrpUjBxEWL1E1p/J1U/9itXQz2lqXQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757721;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TpXOIiHl8KiGBe1dcZnFuaz/0j1HYryrUcl6Eo80UexMmRCMTbUJiiQqtaIySOna1
	 K7D1rJusBVLxqSs7PK/MSjEa6RIOT8cupK/MamJx/FR0gwxY2PjtTQyaTb1r4mmXBS
	 MEfkYPwhiFUUVWdageHn3P42lf9pVF3aWewvnVqc4ErM9YxvP0gGGXYNgSleJ5HEO/
	 5+38Jd3TKnlybADTCNieYvQvl0bd9Cy6Mnm807WFOXa3yO1xExOZeh4cK3KUv+KzlE
	 6Zt9CdioB+lpJQdv3eN6/lcUx93LbB8/2TpmSDMlCP+j0fx30lYDbPVG0wXLGdyk8B
	 kkb0gdnI0wdSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B7B40CE7;
	Fri, 18 Sep 2026 18:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81EF713D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FA2881303
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmeyVADNVMXp for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:55:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A854812FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757718;
 b=UmCgpKAePZ8pParhxz5veX2FTTlcOP0f8HkLX03FwFcpBZP5lUnZeQq6q/3KsOJu5fsM
 RSPmFhP5IZhrvHUNQUOosytgfW5QXxpUiyX7aFEvS1DOvzLNZQvrqYn9tmdvyY27OhhGs
 Biy/8119/tPkUlnCgFp8PMLZHP9AC+cr2R10gTePaHyk/o1vADJh32UAarHDClV5VJUN3
 IBjcnbidGAlHgyshe6utgmaqasHbCItxPEH13/zBBhBbha1Ms6NjOrDNZLIbIjdYdyeSR
 TSrsrerQqVpQnPsVpB/nPRRON65vfRZtji3WF4M9Zp56W/hcO3HIMo/A0NXhKMw8kkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757718;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 b=kWDnNoGg6eeEomzlDLhpVze6hxsCONjjWq1lcVobT4SBGN4MzEcWrYfyFUQZ1QUlCdX4
 f6/J2SiVpxSIH9Ftej19UyiQdvc2/UNxL0vDSXHae9KJJApjK9qJPWFhCYwOKp6jzeTiU
 ARYDdSeeANWHYuJhrbGrUHU/tIxRETtojkMqSc9v1pWjqdIGqnqaJRMO6xcV0/pWz15Vr
 FYVfTJGmpGqyPCfynqqrwh4yuApRSvY2SRmNgZz1K+P6A+eEgOoPGbF+doniFt55YQ7Pd
 6VE6Bu2oQtXyEEKrB1HWetx7RdOLxZTQs0YimtO2Ecs6Vk52x83hcnKf6ZvqaRx7/NQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EF35PeJR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EF35PeJR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A854812FE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756946;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EF35PeJRoK2nr3thQXQ3AEf1cp962t8sCOgghKdY3cm6XSQXI7EM2xAotrAlfh6p0
 0iBAZ0pHLHYAAnEoWWy60e59gceESdLkkKEwguENBuE/ePhsDjP925moBmstP/58+d
 5i7WpL03nmiXLl5dHukP1nhZJk2kiVIdvIdCgxx0arj+6GkhOvT3zbl/D9/MlDgifu
 iJEf73w9tvCHbFPf3Fe0zcazkH+MvFnGRJwNvfg/6lSm0OlJrjdcksR+2aGoDZd1pd
 a7SacFKgV2nHJRkb0cTiB6owkgmIa6Ze/rfmpuH22adurKoyn6t8yN33iQRW2+5HYT
 ftZOn8G4Ssl/g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:8OjUtVFzaFX80BRoGpYv73mRVPX07lEfIkrJnPhdtmly/0xIby+gftXgcIPNtuWJ6sp7VI494FlkpHH7+saOd7sWnh9wkPzZhhL//ShWcRRU7H0v03Z1ah3fQohTmb0SzGy9a12Jj37NpBQ3TMdtkUCI7cB1CMFFRzPd8xNAvSQxHh3Ouz94/G2gL+X/e1XE8047CB37HGM7aptFH7GyBdP25yi99NJnVtxDwZ2PDUogAf7ZHMJSeMNFGh9A603ngQAqCK68I1eQcpnYDdi/RxVEv5nUxRKyZQmifUqXMGSexN6QlfxupSVBdv98utOnLaU4FpSCvGeLesZv8hkWC13A017i2ALhgU6DvmIso97M4ILCYqzOAyTfGTwfSylH5IL6D19En4/DORH/I1cRpAsJ5Gscdf1N4HQXLI6XmXIwKHOElrsmBu5sH/nyFgGcJxQj3f16DJFHWjHpZuzy7jsbyYlyQ4dMCGkz769g2j3MR7tCbUzBaV9i1dmBcm5B9HQ5vqiN0S2vDBsaDpgIgn/2Tre+VFbGpYzbA1vq4ni+SfrQ4hDigQU5l/z0F4pUmHBsUhK9ECBtY+MyXo0Hht9YVv2Ka6RgthvJkrVaYTiqa2
 Y0HwUfGZ0vOMZWSgV80jSCrRIy8UrTM/xVOkLNM1Rm7m7k/JuxJAYzvrNIwWmFCdsZ8IdhKZNm
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC014A4C474E;
 Fri, 18 Sep 2026 20:42:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWy-000000007cB-2Ssx;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:17 +0200
Message-ID: <20260918184140.3631274-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 55/77] package/opensc: Add support for OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Changes-for-OpenSSL-4.0.0.patch      | 333 ++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch

diff --git a/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..6039cc3fc0
--- /dev/null
+++ b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
@@ -0,0 +1,333 @@
+From 8ad96adc5fea0cef923a2a679600f3a5c4c5bfce Mon Sep 17 00:00:00 2001
+From: Doug Engert <deengert@gmail.com>
+Date: Wed, 15 Apr 2026 15:10:42 -0500
+Subject: [PATCH] Changes for OpenSSL-4.0.0
+
+Changes to get OpenSC to compile  with OpenSSl-4.0.0
+
+OpenSSL says:
+"Opaque Structures: ASN1_STRING has been made opaque, and further work has been
+done to make X509 structures more memory-efficient and const-correct."
+
+ASN1_STRING was made opaque thus requiring the use of ASN1_STRING_get0_data,
+and ASN1_STRING_length. These routines have been in OpenSSL since 1.1.1
+and are also in libressl.
+
+ASN1_STRING_get0_data returns a const pointer, so the data can not be changed.
+There  are a number of reverse() functions one of which was reversing the
+bytes in a EC pubkey.
+
+Changes not addressed:
+"Global Cleanup: libcrypto no longer uses atexit() for cleanup;
+OPENSSL_cleanup() now runs in a global destructor."
+
+ On branch OpenSSL-4.0.0
+ Changes to be committed:
+	modified:   src/libopensc/cwa-dnie.c
+	modified:   src/pkcs11/openssl.c
+	modified:   src/pkcs15init/pkcs15-oberthur-awp.c
+	modified:   src/tests/p11test/p11test_case_common.c
+	modified:   src/tools/netkey-tool.c
+	modified:   src/tools/pkcs11-tool.c
+	modified:   src/tools/pkcs15-init.c
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/8ad96adc5fea0cef923a2a679600f3a5c4c5bfce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/cwa-dnie.c                |  2 +-
+ src/pkcs11/openssl.c                    | 14 ++++++----
+ src/pkcs15init/pkcs15-oberthur-awp.c    | 16 +++++------
+ src/tests/p11test/p11test_case_common.c | 24 ++++++++--------
+ src/tools/netkey-tool.c                 | 37 +++++++++++++++++--------
+ src/tools/pkcs11-tool.c                 | 22 +++++++--------
+ src/tools/pkcs15-init.c                 |  4 +--
+ 7 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/src/libopensc/cwa-dnie.c b/src/libopensc/cwa-dnie.c
+index 47f3792dad..6020921dbc 100644
+--- a/src/libopensc/cwa-dnie.c
++++ b/src/libopensc/cwa-dnie.c
+@@ -646,7 +646,7 @@ static int dnie_set_channel_data(sc_card_t * card, X509 * icc_intermediate_ca_ce
+ 	dnie_private_data_t *priv_data = GET_DNIE_PRIV_DATA(card);
+ 	LOG_FUNC_CALLED(card->ctx);
+ 
+-	X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
++	const X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
+ 	if (issuer) {
+ 		buf = X509_NAME_oneline(issuer, buf, 0);
+ 		if (!buf) {
+diff --git a/src/pkcs11/openssl.c b/src/pkcs11/openssl.c
+index 0a5d4394a2..a4027339b2 100644
+--- a/src/pkcs11/openssl.c
++++ b/src/pkcs11/openssl.c
+@@ -463,6 +463,7 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 	EC_POINT *P;
+ 	BIGNUM *X, *Y;
+ 	ASN1_OCTET_STRING *octet = NULL;
++	unsigned char *octet_rev = NULL;
+ 	char paramset[2] = "A";
+ 	int r = -1, ret_vrf = 0;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+@@ -516,13 +517,16 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 		if (group && pubkey_len <= LONG_MAX) {
+ 			const unsigned char *p = pubkey;
+ 			octet = d2i_ASN1_OCTET_STRING(NULL, &p, (long)pubkey_len);
++			if (octet)
++				octet_rev = malloc(ASN1_STRING_length(octet));
+ 		}
+-		if (group && octet) {
+-			reverse(octet->data, octet->length);
+-			Y = BN_bin2bn(octet->data, octet->length / 2, NULL);
+-			X = BN_bin2bn((const unsigned char*)octet->data +
+-					octet->length / 2, octet->length / 2, NULL);
++		if (group && octet && octet_rev) {
++			memcpy(octet_rev, ASN1_STRING_get0_data(octet), ASN1_STRING_length(octet));
++			reverse(octet_rev, ASN1_STRING_length(octet));
++			Y = BN_bin2bn(octet_rev, ASN1_STRING_length(octet) / 2, NULL);
++			X = BN_bin2bn(octet_rev + ASN1_STRING_length(octet) / 2, ASN1_STRING_length(octet) / 2, NULL);
+ 			ASN1_OCTET_STRING_free(octet);
++			free(octet_rev);
+ 			P = EC_POINT_new(group);
+ 			if (P && X && Y)
+ 				r = EC_POINT_set_affine_coordinates(group, P, X, Y, NULL);
+diff --git a/src/pkcs15init/pkcs15-oberthur-awp.c b/src/pkcs15init/pkcs15-oberthur-awp.c
+index 22c943127b..fdb06ab6b4 100644
+--- a/src/pkcs15init/pkcs15-oberthur-awp.c
++++ b/src/pkcs15init/pkcs15-oberthur-awp.c
+@@ -51,21 +51,21 @@ awp_get_commonName(X509 *x)
+    	r = X509_NAME_get_index_by_NID(X509_get_subject_name(x),
+ 		   NID_commonName, -1);
+ 	if (r >= 0)   {
+-		X509_NAME_ENTRY *ne;
+-		ASN1_STRING *a_str;
++		const X509_NAME_ENTRY *ne;
++		const ASN1_STRING *a_str;
+ 
+ 		if (!(ne = X509_NAME_get_entry(X509_get_subject_name(x), r)))
+ 			;
+ 		else if (!(a_str = X509_NAME_ENTRY_get_data(ne)))
+ 			;
+-		else if (a_str->type == 0x0C)   {
+-			ret = malloc(a_str->length + 1);
++		else if (ASN1_STRING_type(a_str) == V_ASN1_UTF8STRING) {
++			ret = malloc(ASN1_STRING_length(a_str) + 1);
+ 			if (ret)   {
+-				memcpy(ret, a_str->data, a_str->length);
+-				*(ret + a_str->length) = '\0';
++				memcpy(ret, ASN1_STRING_get0_data(a_str), ASN1_STRING_length(a_str));
++
++				*(ret + ASN1_STRING_length(a_str)) = '\0';
+ 			}
+-		}
+-		else    {
++		} else {
+ 			unsigned char *tmp = NULL;
+ 
+ 			r = ASN1_STRING_to_UTF8(&tmp, a_str);
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
+index 1dd6eaba67..f571cd1598 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -776,34 +776,34 @@ int callback_public_keys(test_certs_t *objects,
+ 			switch (o->key_type) {
+ #ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+-				if (strcmp((char *)curve->data, "edwards25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") == 0) {
+ 					evp_type = EVP_PKEY_ED25519;
+ 					break;
+ #ifdef EVP_PKEY_ED448
+-				} else if (strcmp((char *)curve->data, "edwards448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards448") == 0) {
+ 					evp_type = EVP_PKEY_ED448;
+ 					break;
+ #endif /* EVP_PKEY_ED448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected edwards25519 or edwards448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ #ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+-				if (strcmp((char *)curve->data, "curve25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519") == 0) {
+ 					evp_type = EVP_PKEY_X25519;
+ 					break;
+ #ifdef EVP_PKEY_X448
+-				} else if (strcmp((char *)curve->data, "curve448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve448") == 0) {
+ 					evp_type = EVP_PKEY_X448;
+ 					break;
+ #endif /* EVP_PKEY_X448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected curve25519 or curve448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ 			default:
+@@ -893,14 +893,14 @@ int callback_public_keys(test_certs_t *objects,
+ 			break;
+ #endif
+ 		}
+-		if (os->length != exp_length) {
++		if (ASN1_STRING_length(os) != exp_length) {
+ 			debug_print(" [WARN %s ] Invalid length of EC_POINT value. Got %d, expected %d",
+-					o->id_str, os->length, exp_length);
++					o->id_str, ASN1_STRING_length(os), exp_length);
+ 			return -1;
+ 		}
+ 		key = EVP_PKEY_new_raw_public_key(evp_type, NULL,
+-			(const uint8_t *)os->data,
+-			os->length);
++				(const uint8_t *)ASN1_STRING_get0_data(os),
++				ASN1_STRING_length(os));
+ 		if (key == NULL) {
+ 			debug_print(" [WARN %s ] Out of memory", o->id_str);
+ 			ASN1_STRING_free(os);
+@@ -925,8 +925,8 @@ int callback_public_keys(test_certs_t *objects,
+ 			}
+ 
+ 			if (EVP_PKEY_get_raw_public_key(o->key, pub, &publen) != 1 ||
+-				publen != (size_t)os->length ||
+-				memcmp(pub, os->data, publen) != 0) {
++					publen != (size_t)ASN1_STRING_length(os) ||
++					memcmp(pub, ASN1_STRING_get0_data(os), publen) != 0) {
+ 				debug_print(" [WARN %s ] Got different public"
+ 					"key then from the certificate",
+ 					o->id_str);
+diff --git a/src/tools/netkey-tool.c b/src/tools/netkey-tool.c
+index 23bab2a8ec..683ac182bd 100644
+--- a/src/tools/netkey-tool.c
++++ b/src/tools/netkey-tool.c
+@@ -144,25 +144,38 @@ static void show_certs(sc_card_t *card)
+ 			if(q[4]==6 && q[5]<10 && q[q[5]+6]==0x30 && q[q[5]+7]==0x82) q+=q[5]+6;
+ 			printf(", Len=%d\n", (q[2]<<8)|q[3]);
+ 			if((c=d2i_X509(NULL,&q,f->size))){
+-				char buf2[2000];
+-				if (X509_NAME_get_text_by_NID(X509_get_subject_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++				int idx;
++				const X509_NAME_ENTRY *ne = NULL; /* no free */
++				const ASN1_STRING *a_str = NULL;  /* no free */
++				int out_len = 0;
++				unsigned char *tmp = NULL;
++
++				idx = X509_NAME_get_index_by_NID(X509_get_subject_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_subject_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Subject-CN: %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Subject-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Subject-CN: %s\n", buf2);
+-				if (X509_NAME_get_text_by_NID(X509_get_issuer_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++
++				idx = X509_NAME_get_index_by_NID(X509_get_issuer_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_issuer_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Issuer-CN:  %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Issuer-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Issuer-CN:  %s\n", buf2);
+ 				X509_free(c);
+-			} else {
+-				sc_log_openssl(card->ctx);
+-				printf("  Invalid Certificate-Data\n");
+ 			}
+ 		} else printf(", empty\n");
+ 	}
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index 452ac49617..cfc7486faa 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7389,8 +7389,8 @@ static int read_object(CK_SESSION_HANDLE session)
+ #endif
+ 				point = EC_POINT_new(group);
+ 				if (os) {
+-					a = os->data;
+-					a_len = os->length;
++					a = ASN1_STRING_get0_data(os);
++					a_len = ASN1_STRING_length(os);
+ 					success = EC_POINT_oct2point(group, point, a, a_len, NULL);
+ 				}
+ 				if (!success) { /* Workaround for broken PKCS#11 modules */
+@@ -7464,9 +7464,9 @@ static int read_object(CK_SESSION_HANDLE session)
+ 
+ 					a = params;
+ 					if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)len) != NULL) {
+-						if (strcmp((char *)curve->data, "edwards25519") &&
+-								strcmp((char *)curve->data, "curve25519")) {
+-							util_fatal("Unknown curve name \"%si\"", curve->data);
++						if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") &&
++								strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519")) {
++							util_fatal("Unknown curve name \"%si\"", (char *)ASN1_STRING_get0_data(curve));
+ 						}
+ 						ASN1_PRINTABLESTRING_free(curve);
+ 					} else if (d2i_ASN1_OBJECT(&obj, &a, (long)len) != NULL) {
+@@ -7526,26 +7526,26 @@ static int read_object(CK_SESSION_HANDLE session)
+ 					}
+ 				}
+ 
+-				if (type == CKK_EC_EDWARDS && os->length == BYTES4BITS(256)) /* note extra bit */
++				if (type == CKK_EC_EDWARDS && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_ED25519;
+ #ifdef EVP_PKEY_ED448
+-				else if (type == CKK_EC_EDWARDS && os->length == ED448_KEY_SIZE_BYTES)
++				else if (type == CKK_EC_EDWARDS && len == ED448_KEY_SIZE_BYTES)
+ 					raw_pk = EVP_PKEY_ED448;
+ #endif /* EVP_PKEY_ED448 */
+ #ifdef EVP_PKEY_X25519
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(256)) /* note extra bit */
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_X25519;
+ #endif /*EVP_PKEY_X25519 */
+ #ifdef EVP_PKEY_X448
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(448))
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(448))
+ 					raw_pk = EVP_PKEY_X448;
+ #endif /* EVP_PKEY_X448 */
+ 				else
+ 					util_fatal("Invalid or not supported CKK_EC_EDWARDS or CKK_EC_MONTGOMERY public key");
+ 
+ 				key = EVP_PKEY_new_raw_public_key(raw_pk, NULL,
+-						(const uint8_t *)os->data,
+-						os->length);
++						(const uint8_t *)ASN1_STRING_get0_data(os),
++						ASN1_STRING_length(os));
+ 				ASN1_STRING_free(os);
+ 				if (key == NULL) {
+ 					util_fatal("out of memory");
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index e011232987..b978e0677a 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2593,8 +2593,8 @@ do_read_data_object(const char *name, u8 **out, size_t *outlen, size_t expected)
+ static char *
+ cert_common_name(X509 *x509)
+ {
+-	X509_NAME_ENTRY *ne = NULL;
+-	ASN1_STRING *a_str = NULL;
++	const X509_NAME_ENTRY *ne = NULL;
++	const ASN1_STRING *a_str = NULL;
+ 	char *out = NULL;
+ 	unsigned char *tmp = NULL;
+ 	int idx, out_len = 0;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
