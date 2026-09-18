Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B0BC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E263460E36;
	Fri, 18 Sep 2026 18:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wIx0VJPgTPu; Fri, 18 Sep 2026 18:49:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DAC9760E2E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757369;
	b=iPI83VppsCoBr5f3nhoq62OxfxIH20gIB90hrMzkfRi8YYDWiQjm0hFigcySBsS0Fyim
	 wZMH1i7kF/WJ/HmH3Y599dhMiZt1pPT2O8SpB1SaGb1tHyD8THP35yrVjYdoqYifZG6k4
	 naSiPDE6H2a6eIjKSP4Vw/joGaVQwTxFRzg7+NFlNPvJ108g0ObhSnBwbOhximRNs7XMz
	 Nm8IOLfBPmlNeoVN5uHr3SD0eoi8d0xxBJ+m2OiU75XCDuIHb4RDyFLnqWIBcC9P4Z2h+
	 VGedxZvDmp236uQfhNJ27vr2Ybq2iZKTB+c03PCiuX7F89JqLu/YVz12eRyar7h8XYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=pMpYW0fAyW3PE7xY6PCZi0Q3RxtQcyG+qo+L+I1NwBdp/tF4P8lICqzqT9vrqbX1t5o0
	 QSaN+dkjHDpG5WEE1YhKbNaLaR8A7bh1+WWpK/C8YC3UG+YeT4vPc6PRwqt0lbkzP8iEF
	 OZKAeu4Z2fJk4UWeKdW2vRNfFCmuWUWMOIUwfagl3x1/uiBCi9oapual6gOUZQuH4a+8J
	 gdwh4KrMRkCJJIhtXpV4UQfXiBzFPOQ5NJRXFt2ulRBh1/10AqxSomjT+Z9QeUyx+n7+g
	 SrlzPOU3EcUJNo+4Xs9GaDJKbByJRXeAxs68wTUfDYaod1y4iCA/L+fFCGJtvwnp/7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dsWAOtYy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757368;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J6VkYfUzuRMwfW5vC3ayNa1yKRumRwqxpAUAn9w64QtnNGiUwIkTjpXmPnH3XK8s7
	 VluyuMtCj4wV3mh5IV5+4aU+KPebB7vjkzIH0Ku2R1UPew4bQhsnDUP74KRUiJjfSN
	 WJRAxRak804dT8Tb/aglZXQX8tmaW272MYYTG80hN25V60KrT4XX1upzv7qzLLWmls
	 BIaWzKCHeQw6rDRJsCrXyA7J8T0NxVS89H87WpDH/Tfewszg9YSNG0+maJqppgbzOt
	 ZAmfRGHSomUYOafAjF6oRFxub+F7xl7L8D2KBw1udybAOEc02Ha61z3h9yLc4R3Nk4
	 VwxvBFwBqWHSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC9760E2E;
	Fri, 18 Sep 2026 18:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D25C93B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C443460E2E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQTnnM5vYbUC for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:49:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DD70960E25
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757367;
 b=P3fV403ipgPjaYyfUNc6XWzDjDXGEDGeEYinkjY3j+n9X0aXnjLMys04g8kG14ch5+wZ
 dKZNsiBjxnoo8SgTA6PZJ3NHKhENytUWZJaX+Cl9pL+NCKhDrfo1Qnf8vzxVwhge2bfjE
 voWs2lXSk4P8eainzEgU+dNWNML5eZ4P/1zpzxPnY2O03Rtg3L0OiVTGIxpwHiq9qU8pQ
 qLYo7Pj42l1Mb5QnU5Np10Y+gfIQ4/92XO8yBsH9EVbu77WwrJCMByffGDP4kwZB1vaRf
 XkdqwBdy9GBCTXRYfjednJ9KNxULPL0IEJaJ1UC0seAQgfh0hZ2t8tn+/V4Uye4dIIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757367;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=W5fjdjwg2tBZ7916L510bkj7T9GQd8NlMM4Vflk2NzcAnjHRKWj+9fA9l5Oe0MeQ9PIM
 6ZPCoULtPhcOM3r5sKlPlWn895reS0LeoKLlboO7+covi7K4n2/1gJ89O4bfsEu3wgIFI
 ACkh1Zm60QeAJfqIXdVcMBrhr50+e/uTD0HQifFLuSCfAdQMtMTupULuw0Jl6aBn7WKjE
 Mz9YVgIZp4MPEZy72iTPQSsFvjt5WihpD+FvQEXCQLxMfaGFBiWvqTalheixkdGyW8zi7
 xBg4Wf4tAaOEy6/TJY/dIETChIQ2d6V/LwPcupNBfmlWfSg+2Cvu7e7bJ4B2x1Ic07A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dsWAOtYy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dsWAOtYy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD70960E25
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756932;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dsWAOtYyEC51VmueX6ZQLmXO+VNOoZON4T5x8F1SK8cai13dGrv3jWphIVaqAhYLA
 Ez0ozqEFa95BlBmAUw4ISohnb3GjnPnemof7VDefh9rJpqtUDmUKy2erFyYyCPOM6t
 LTZ5+iYGaAgdZy1tNkWYDWWI2v4biryCiAlN4o/oFgftDj4bSYiABc74p5sV9CW0Hk
 MVilYQR7hhxKF2DlZYLQvUlkkOCE7of5JszWYcJ2t1p9wpURD/MkmbFeUNnTDiUF7X
 kV0Qd/2Sq3XHxCbjq93DS4+9burAYlzEhPqwfexLDnCNNqsRrZHO5qKu/Rti7RityB
 3KN0+AI56+TUQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:+yEjfzTeBAbf3fTLJFEIxAL4z7gSpjiSA9q7cNaUr0iyVj+n8McLhfPchUYCQTKiaYSRRtdnvyqpm8U5edUZjZaDn0LgjnYUFPJlLMQizlwpWB+C8NDr0RJ9MHT6rQZNkEJqrMU9HpRhg8Gc4ugwBfsPCqbzsHtDKMaXxNuNU7SHZQ1ukTiyQV56G0q5pclinv3dZXot6QktdQvpv2w6x+2c+lswGPGNk8QvdpueNxJ2JGSQ+Vh4HCquUmxK2sA+pINXTxB/U1VK0PGZbN8loHlC3Qqfrw5idzOKWtbdXe9aCe1vh7u+F1nfJVdTA5HBu3MfM4WRTTb6MJCRdQDo4CUFmZaH8PYTclYZ2cUOx0DKmXu8YZLlmebxeOHrpA0JaUlJy8ULDrAHN9ofB64K44W9E2FrsyWzhO1hICQt4PJ0ryLIeZa+vVGXSZdOkWXuJ5F5YKjKYH05eW4oQ1ZJnkgLg8fE6MuOBwHNz6kL/GLY5Lwcj17yWIIF9d00YHfwBWRNpKPGwMMET+H8MRRgp23Dblv0xAwaEXSp5C9NZ0UjYHLJA1HzgRlggzOieCcX07FYXNIG2zIkZUnzIst4HGO4oUKoS+sxtXDF2uy1Sl0ovG
 ymXinQiG5C6pNAcmt2/+Ila12IAMSmlXiyp2LcjW0u1a/TbQtABRB92wsWqNrXpynFT9R5B/8y2AWi7wC9AmbyYz4K3UOgDU/rfFLdeqv46Ni7kVtax80=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E69DFA4C45CD;
 Fri, 18 Sep 2026 20:42:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWt-000000007cB-10lF;
 Fri, 18 Sep 2026 18:41:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:49 +0200
Message-ID: <20260918184140.3631274-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 27/77] package/xtables-addons: bump version to
 3.31
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

https://codeberg.org/jengelh/xtables-addons/src/tag/v3.31/doc/changelog.rst

Upstream switched tarball format to zst.

Enabled CONFIG_NETFILTER_XT_MATCH_STRING in kernel config to provide the
new upstream dependency CONFIG_TEXTSEARCH_BM:
https://codeberg.org/jengelh/xtables-addons/commit/6b7c62d83ea1b589c3115d959867e0fcbfcf74ea

Enabled CONFIG_XFRM_USER to fix build errors detected by the Gitlab
pipelines:

  ERROR: modpost: "crypto_alloc_shash" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_setkey" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_init" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_finup" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_destroy_tfm" [pknock/xt_pknock.ko] undefined!

Upstream uses these functions for > 10 years so recent changes in the
Linux kernel dependency handling are responsible for the build errors.

Enabled CONFIG_{INET, NET} to fix a build error detected by the Gitlab
pipelines for bootlin-powerpc-e500mc-uclibc:

In file included from pknock/xt_pknock.c:31:
./pknock/../compat_xtables.h:19:9: warning: #warning You need
 CONFIG_NF_CONNTRACK. [-Wcpp]
   19 | #       warning You need CONFIG_NF_CONNTRACK.

ACCOUNT/xt_ACCOUNT.c:1179:10: error: 'struct nf_sockopt_ops' has no
 member named 'set_optmin'
 1179 |         .set_optmin = IPT_SO_SET_ACCOUNT_HANDLE_FREE,

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 7bdbbb8578..a77ac1a230 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
+sha256  e22efc25b7bbb3436d1b7cdc309b1857ea933f7e5c7d88fbe6951a1e3e582a80  xtables-addons-3.31.tar.zst
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index a3174725d0..9f70518fed 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.24
-XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
+XTABLES_ADDONS_VERSION = 3.31
+XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.zst
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPL-2.0+
@@ -33,10 +33,14 @@ endef
 XTABLES_ADDONS_POST_INSTALL_TARGET_HOOKS += XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_STRING)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
 endef
 
 $(eval $(kernel-module))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
