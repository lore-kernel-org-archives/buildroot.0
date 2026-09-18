Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF102C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2D540D15;
	Fri, 18 Sep 2026 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5doCjev6SNy; Fri, 18 Sep 2026 18:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A62FA40BA2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757800;
	b=DdQsCwuv4B8Zna/ZM6n+HnaotGcmcSZOe3xTARW0CWDgqk2Apr5Kp7wGsBVOTTpWYGWb
	 BS83NoQyIE7hwCY2Nbak+lhGbw6I5HUKeINwaCFMQs26e9ukeN6KAzKqb5I5Knxa3DMCs
	 xbpwJ0QqvwvRkcaZpyFUaGQxlVnUELOg578KVfiAnmhCgIT0y4tpfvim/tM17KZnPCNfw
	 gaodpxT1FQe7O/llHviSwqBHStSCI0qxyWcIaufXWcwAE8M7s4Wi8k/0eJ0im6BLTRpA9
	 jgQrUcLHb3CTO8lZS3kIz+0iLi58brWsds8HDSpQUWlj8GrWYJ/JR1Zf5kz9egEVAOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=mRiZhLvlK7zR9V+1MYMXh9pIvEmA70Gh2I/8vRRI2KrTPhQvxOiuyYoNTdU/K5RNOxGo
	 6a8AjQg62PDpCBDDkiVUQL+Vin8bEisW4CuJ7wf/UgxcNn8uFlLezQVadLv4HhW8RMh5s
	 rVNQ5cBzohIUANtB566qyzuOUxym1OCtct+S+RwmzTlO5XuBaJNVFQThAlVQ41Rz0RBQ0
	 c6SvqxhJBKp0I5EU1kEovqfR3Qqh3j71QNwHzFRVLJHLNGmITr/Y09bEb6zjKQ/HZQ5m6
	 ZQXqWtNUfpPSS2S1tlmD7bu14LTIanPofV0qQ0VUhggMuj+H5yq0jgfC3+YlEz0vn9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757800;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A+ZWJsDKzCKXkPhjiL0sOcjf09KNd2xKe8Rei4KREbwzdCQGbLLb2cTzfgLbMzLM5
	 m8Tf8eDQ6z+IWZTHGThsv0XNf6STupr8YeEMyJztEj207o8NrzzvqJsj6kxO//fXU7
	 bMJ6z+ttCmPmF/rFYrWEmGg+G4FjY8Qx4M6VI1gaSKCQbMS1bD+2qcvw6YQwQkYtQn
	 ziH0/wtDiYUHxneZJbXC8hOY6DHM4hpVwO/84sPTu3fZlqxaof8x0rbTLsEPhkTM3z
	 8fKzSVT+7AFU76jBZLM+gyROzz5wADGNTeLTtgiLjjSBJgNQux5HAItUH+vAtlM5Oz
	 f1Ax4g0KJehWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62FA40BA2;
	Fri, 18 Sep 2026 18:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4691613D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CF81812FE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcqK-DxqHkYH for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:56:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5069781303
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757798;
 b=VQ28P+/Gn4HkyS08+QRYbbJegrm0i+57sjSbagAXaTegY7j1/CgcKwIAKjpD597xtKy3
 9S1+j4wRjJHRxOvTpbXL3HpFrkc9Qnf0I7tsShbafzsSAfk1Gq0nItnEd+L7SUzdg/Rbl
 94qaOMBPs/ldHmonSg0AexmOLBflIPme+b+D/BbT0aYzJE4Yw6w5c1OcUj7LaV2HeBRuD
 oQgr672sOB9PLi69cT8JPEjXPL4IuNpNgrKDpAFE/a2Yd+6K1WotitL2BMjaEaHa77kTL
 u0pAueg7L6bT1YIVRiZ59WK/oQfwK/eQbwEOTQFeeCi97v7/hBhp8Ddxwdh0d5AVoKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757798;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=FPDiPMI3ymOhdX365QELYgFafPeHZTgDs0lIFu3FoL3+OHYHBlmNlzl+58oAs5Gz+N15
 MU8CyESq/YYqpL0VMNefH6bOyRIM7a/kmiVE2yPO5PPnUxYF4rGgZdDwpl8gjzgqLZRpX
 PaiksC/6sS9nQAfX57DewCopzGYa1R5Kr4SfXyJ+q/ncUvd8xIXGMcEv7RGP6o2Uf+CC6
 f+4breQyb/Wj3qcJjdXEQfA+AmiqnyESDPEy+/hNzF3ZD01tgo9eNAXVSBw1eg2vfnXB/
 6/dSrkwmdBUv2LGdLolizEODL2h71UqY3AsXhZ+CKFzXteD+acHO14w5e+rLHpAHSNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jISRibnE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jISRibnE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5069781303
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756950;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jISRibnEBB+yjrAkLpO4I7FI8/mYQ2XDe/eVDwOKZvzke206kHPEegMT1Zr4UDTWF
 xcvP7GPabByqOrum+7n84jAxQ2sZe4h/4KHt0BCm1PlSy2jopVL8LcDQKD6x/soBIl
 +r1o0r+q/2p6ZxWcZ/gUfCFxxbiFvF717ADtMOsu8O9FFtau91gXxWTUobqb1wCJOA
 /6iZ0phetFVr0qP2PYArZBZWyByNQbJs50ffbFiPdiMu5rlBHNsR5mTa1yM5bZd4CX
 Xt+PBX51nMbCQnhAkhvJm1DO5ju/INqkLoubypp/lawKbx/v9gehJmWIH1/rXAv8WT
 mG5Z4uKNbfZgg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:tcGLKEY1DyQg5omMSickZ0U5Ffj4FjzgvnhABCg1hMWklSqIBwbz7B2bWdWE3z7r/lRBw1z38cMaTyY7lzN52UkKiXLiT6k9CVTnIiVDHKAWgDNA4h49qpH6P54cBdKXPD/fGTYeLvDuhEUPqPtjdt2KROmrbcHuCZkYurog4YJxznOywsDS7xDp2uIUWEz75ukestrJKGouULVxsKVU3hY6UnExPXsYs+IQteXjE21MDmD2Y4k94fFNXAWPF635B0ydYOEYbWyxeix4YnCyxsWgK0n99O79sBSDvkLaIaw87tlarqNkvgHT/xGNMefXweGwdhwLrtoLfILfuRJI0VURvXBTQovrg8EvsqPRj0BeGfhM4Dyj89PkN/qspY4lSDRDi5T4Po3JLgBgNTBhCcmKO5kr5ucZpgPcmDNKeBLUW09fUIQfG14QPmGP3yOf6wSyLRhQDNSbyT3WJfs7TBUU4aacJUPWzF6FEBfx9FDWd8dNCya9vL6jZaA86SwTlRxbWr2soX+3P1cSBM73ILGqgfRWPluQkr2kRKSHtVE8TqLmbTsxmEX6yC5DEbZRxuUleto+X8d1G89/ksxUrP3L08ShJEyWlUoBGu4w1LUrx2
 lo6Acz5c879G9LKucDvkzdUJgZZNBwr8QnG+TPditrfO4Hd/oOfVl2Ejz8HZ49Ngysxl8UTV7BXkxdqlCAfGrBbRCTSck6uPwxz/2yu2GoG5asA0og
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFD50A4C4755;
 Fri, 18 Sep 2026 20:42:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX1-000000007cB-0B0b;
 Fri, 18 Sep 2026 18:41:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:25 +0200
Message-ID: <20260918184140.3631274-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 63/77] package/socat: Add support for OpenSSL
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
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
