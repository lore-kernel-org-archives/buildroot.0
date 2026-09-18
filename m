Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF52C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 027CE40CCF;
	Fri, 18 Sep 2026 18:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAqIbc-kABGv; Fri, 18 Sep 2026 18:51:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 409B540CC9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757470;
	b=N3mYGIOMjVGXu2gyZX25pby1si7NsCUc5e1S66cmdbgyiyg3vX3J8TWISLWd/6U7Rlvy
	 Mc7+vCQVrb0aTPdMUuUC8oPcqZxXH8UylOomV18hUPaxqx4JKdyLvVk6HHo9vW8HGReTh
	 ESPxD7alT70GKcakFsnXrnjFfhGeyx7oWj2Eje5iO/BVtBJ4WFDovxV3g9hEn+1okfZWR
	 0lbIyDR99RbY51E+KGOH3gW4zGZPGMMID01qvtx6qi8JC8Q7AqaRDS1hzqSeZc7OTLJ0R
	 5phNwc0heiL6QGCC9YDvOa2kEVfiykSwqA9eeQkHaeyRWuAj8jLmpjzRB08yxdlnUiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=kw5DyZoF/5MmlqNOwkVYxAGvUM6tROJUNHV+qUMMHW5Vsz4I3DvnpUyF7OETTywoFbT0
	 2FRigP36OQLmEzIa8jQQTffEJFmzlXQdB+8tVYqOJfRyyRkEKDbG//VQk1wZfGR094s7X
	 luOkcRFIWY4JrLkMWeUr+qgK6MduLzyRjHKmFmlQOipsD1oWxatAc+z9k9GTBU9hCoI+p
	 GsCZg+mpgHuaEX5STDDqXTpMYfWbzkHz8WQD1lX/j8ChalLw9QC3QVUUWljivtK02mNPL
	 SNkoe8DMxdz0UHJo4qq34DIvSZsx9BR+0Ce8i/Eip4a4x70Oafnkac8uheyiypDCbxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757470;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fah5fLG/5AR/SMw+TxCESm+OJ0T1RSlL6ZS2LTgz3eHfF9YnrV8yqXU7fZkn38Q/H
	 h4uiumXCqoog4e+gGS1vVFePi+tognLzcnUe/3Qkskn7niXwQ46Mai5eU9L4CYKCXN
	 YvvWV+IgOZLkvWjX4wgmDzlcTct7HZN9rixtKHra5YvRI5dg6NRCmWvOV3tYBWe7Wg
	 SF1zF7rCa1glwGXb1Wu00HJmR2tM3V7gchAVSLmVflI7uzOChTHNhOriRUeFNOG3hl
	 6TMqxGfs6/0L/5965t4CUt3ijv7bAe+n5oCOtp7pgyE/V4BxrA51/lSZmLFMWvvIIN
	 ylNlVBP5XXo7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409B540CC9;
	Fri, 18 Sep 2026 18:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9844B237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E28F60E36
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ewNJy4RQIML for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:51:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A97D960E43
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757467;
 b=WidaSVIY+xAZLOTf0NsJudVHlfjjxMHYn5Sq52+cx2lcw62/vfQASaveP9T9I8UOk4BU
 hU98g65u85FpzXQn0slwJY/GcWHjv6/pv6tp3EIwhcuz37WakmJRab7Vm+IW7ksP8ahIY
 D7+XrSt8DKcdhEfH15ta4PH7C/+nnycN2/sPhv7w/mQgQty8CcQkoMmWYHP7ASiBUiuEl
 jEBl+5il2eViTk62TpLuvyI2HdnhQEf+0SG01/mLL2rJt5zjcPOITXXCr1z0oaMnzfmA0
 8auU2Z4jYVs/a/I9pPzUEddXLj+CiC4PVCQY4v9NLImRG0f+Ugu+snOF1beLYgZmxsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757467;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=JEwzaVHU30aQBYeaH9IaCme3NTYZ0jyMb/kcUWmbZCw8ggYfoyqEQgKKcKwgMHXs8D/z
 s1lArVw1MWpgvIrN8ZyPNopaNV2VfYQVAol44CWao715xwnC+pc+f3wSSWhBshXkr05gb
 WNnhDrPKgM1ShOM5Xh5K3n/CXBgcxON5OhC+450ub3gis2gV6Vl76iZAYKVoPUFZClTXk
 Vd2V7MiYAMMVE6o0zPCbU/+EQHlVkYhu5UjXxiOVlkg3X+UsUYGcm/YgBzH6Z/xkh3GCK
 /No5Yfqou5E/X6AOzGSVSjjRLy67/8RQCV/OvWk4DeWRNPPMFFlDjbJkzXTm5EMeblA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Kx0XN4My; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Kx0XN4My
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A97D960E43
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756936;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Kx0XN4MyxR04OWm4Aa1IV2Op5E3VfR9WRWYU5+5JuTDugitlvlgAZgzkspE9g2C5Z
 dVyiIaXgxp3YdJenk/e3UNZXJC3wFsiQgY77UUahDkxwGZ8+2ZvTSYJzfg/XWqUHOZ
 N4WIRcqu/7s8lSMgLlCpEFN2cNLwTqQHSAdaBQwHLfqSCHetg/TaraH/ihIJCsJOa+
 EBUK4xOs8R4x1SjztEfn2zn9MlJMSVf9l3l66IKw1DNNPc3ujzk+YcgRy9DOpR6dKt
 DeP3uRNuRbufZvGUYLTZvJfsSok+pqfEVceMnsodS7hJsdgDQqIR9dilQ0ce2FHt5g
 h+7MRKe8MEBvA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:gw4YxQcwOQI+vfA9yTaPQ8JHcfAiP4v7p/AqGHlY2ZaVExlNdCZ+PwGdshjV8rX1uHKA2GhHDQEJOyDeNLsOaGToXRSPA5HHsuAScJsMI83B0U7vI65x/P7YchwBwqDxKGEn19hKNpBKCyCOr/LMLuiBVopm5BPdzG2bE0Ku67H6hAM5+8WHAUl5x8MCFWzk5whYn67yuW2MxT1l25rxY1rY1PY4IgSMoTD+bgwgwEvUvfgQCVkhpooiNl6sW9PC+njJfC5iFbRyT7UOokCR6BixrsC5ID3XYsXBfek0SMVgTKTygPWhHEXiCcj+VpJY2s6cbJwxVI1j/Ts+R1mao3Xioy+5V93oc8iedD9uhSg+DBtBCOmVya6Mv8bCdnzga7T+EDI/ZY13LNJtOfICjZQg0AY73PBtUrSC5SSOzcf+zbFu4OeAF/A7Sxx6Ztlc3lXCipu08Q4uburkknMrP1b4i9Cfk+Gt+J+vhAdlrHPk5a+yELHTssI42Geq4+HIjC3by0Zsv/p9Lqct2/nptFmPaiNJFzmCME0EvtC16YvE17JbnsCIrmYyKJ4I7MwPKyJQwyXt3KYiQwNS1zskwqZWQmMbcYfXezmCATRFamk0qU
 6DlVwr/sv8KrdKZONs1d0O0Gkoaec4QaFxnvK/i0oZsPyjaJ4U+WEGvEDJn9U72QYKrq+d2+Um
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 189EBA4C4731;
 Fri, 18 Sep 2026 20:42:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-0GeF;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:55 +0200
Message-ID: <20260918184140.3631274-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 33/77] package/boinc: Fix build with OpenSSL
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
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
