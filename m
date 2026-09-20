Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E207C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDF840DCC;
	Sun, 20 Sep 2026 14:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLMZQYZ9ZY-e; Sun, 20 Sep 2026 14:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6A6140DBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913597;
	b=mY4hpRG3Ea74thR3bm81haV6t/2dNTCL4A2Gm+g+5wNAdwxns4A1PFkWmlTWfYAepNH8
	 805FofMaL+ZV14NLOD46Cm6n27H4ydRLN37IZhm8PRxtx8nWdPgM93rx4sYkmwHoXUN9C
	 Rw6Zw5awOJYI/lVsQfzAAtfixixl1yZwMNa8AiXyHVMdI9AaRsL/xCFvpqE8XJ0OARLpw
	 Fz0LUj3Z6DRbTmB1TY47H1Yz/rWvei3StJ/PR+RNZhStcK7fUkQBd5QzXpKbb5yAWwf5c
	 VAIxkABXuv9xCd6/21b1CYeWMPkFDJf60CNX909/ce0yu/KMRjTPzQoOyG1onzHHePg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=TYie5rZaiJqRSddSi8JJrfqwvPrL+T+2FPVSH8OGfgfVzVtqaez2JMDuZ9H54Kl2P8Ry
	 rF2vuLbh4DFJhT8exQqmSb0bDh4IqTEucurN+KAN0H1WBKRVKpcDolEahyy/9lawYlSzR
	 WEjLAVfb53R02r4f/YUGhHPxIjx20nJ3qiGgQWrE0VqBkh8QAtw04wFDbfroXZFuFX257
	 Z1U6Bsv2k0S2LhU9n/AE85HK+a/R5y0cSEROVDEKcNxLPk6P4/r2b+AaioG8gkc49q3n1
	 f4p23UcC+vT29Z9t3AaJQOhcrAIUMhpPJ7bfB6mIQxkcTx94ftIxgpeP2OVhvZ0i6Tg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913597;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ipbSNWaqGOKINDOaz5lllNUYWGPChw9I8XCLdN7W+7xBkoeGhBfvFV+VO/U/58Qez
	 9qbD+zz599QtTZFEc8qbYrQoWPA/Eu0w9NSd2jiRwmKPBvd6A6NEmCFeJj4j8gvqTi
	 aym8f+FzcnJwzyR6zd7lwmmsbMepVU/aB+chhQMytW0m46qGT4Swej7trsBoaEkHHc
	 xHte4/O5Wo79n/wyKAB+J3XZ/FJ7GRUHb4OU1hInZkEeSZ+7wtpBzda1rGacrI8Ecm
	 3/8psryCShB9gGg8FE3m4kv3N8ZPNxgVjggwHmassQQNvTup4GVojVFauK2nxk+Dhj
	 m42F31Ztnc7Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A6140DBC;
	Sun, 20 Sep 2026 14:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA3453AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBC64400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrIyf35F1IMP for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:13:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8DE6040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913595;
 b=n0B00yE4tjXkor+Lk2Z2XjytIPSuXEQ7kxXmvnYh0sc7xHWteAiUV2Pm2ynns0TlzzM3
 NhlEzL7rSCzDnY8Klo+4mEfnqTdFC55EFrmxSxTRrJw4rG+wBVaaKZv3ML8ifL99kg/W8
 dC8R0GQWBD6vyQHYr0RzYF+bbLBKZbbBAmqar4dw4R37SX+jl7+G65D6JJaOuR+aYQ1YZ
 dm3/cWcAlE4x2afNYROZQ3kPycbmoPT7GZvyZ8SxSbwOSxQkcNCtxHQHOscS09Of67bKq
 8sgBZCYOCyjEeF+uQ0oi2W77WBheEUIcxJVfpb0+y1umc+m5lG22dIxJ5c/IO/fgJBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913595;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=KyWUg8NXqE0KGeEsOlXcCxoziMzefcjs9iZtSBfYsGJHkhcbHbqjaZleZ3QV5jNLjgi0
 Dvr/FlPrE7Hzj/4jfjDDUDwRr5fJP+mGARhdLIiEyabKxy4VqBSyCgR/imKznYWbjFlPE
 YFTGSp3Grox/kQ1ZEhIR8CrO18NCJdCAFeMH1GLmAMbA+jR9Tl0RKcStg0yJ5nUJNN/lm
 0iZBi9+P6oH1uTFtlY6xsu8urZUNFcp/lH1lDuKFcTB3a3PhEtkIpWnrRiEUn4qJZJqr8
 wi5z8IVD2kcBi325M/oTLn37mBNH8y/LnY7wK4vonh63o13Vs/ef80ridf3Jf50je6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sW1fb1pn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sW1fb1pn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE6040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913234;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sW1fb1pnaZX8MAhSDklKmq9MyLe+huXudolc2TtZW6Y3dPYyRDygrzYO3truqZlny
 TmCwQwbaUlO1yG5W615q5yDsVpa7lYwMQN95NPtNjPIuGPdMyU49KcJ1jU/otlgS+w
 L/c3QgkrpfsGxRR3ZCcxntBMaPUumETeTT7MOlwpQ4hpxy4efNbFF3HbAKJEJbYcZp
 Co4R5goJhD5Kl7kEJLrJmMF8Vrzq2aD6Y6PPazG14atuYaZ4/YUDJMUboPVBueOTwb
 bYsaJuwovm0/dd1ajcvUdx6WIhS8sm6yKmyxdLORTJhZV/0xt4xrYC15eA3blJ1htm
 oi3j3dgbHCa7A==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:HIoMuu9sXEJstK273zIu51P/6eHquypMumh2JHkKP98QdtHttZ9h9vXlqT5JrAOatp3CTMsXpGMx7YrIop8skQ9R2EN89/k+elwqgjjwfsD4eP1XFQmfxTjduJGRxIq9y79c26wwFEK+M3F0hDwrbNXADe0lEyj8s5TM4UNU9YOfppU/oPMP2GX6ptNHBIcc3UV1ydMLA6EfdtDVMH2G+Ew5Whe6Xaf+3oSQ1PmrwgMU9KIgkp3aTZa3KCwqq8hPdLmj+T6g7tbpYIczyAIxQwFnhDQFB38064G53xjO8Ln/noDHe32kBdVV7rnMZRqq1CpnMFOkD3L+lh/NKIguEo+vGghDc/WYsY26jNbsB0BHZ9EAyeFYz5tMNzbcYVHNfJQB19sEw9GyC4FMO6wN8UprGSq33Mu1wNqYEjZcaFJpg1hQoi57fmONiikfQ3IbIkZKFq+bFVqsgWAsn84Lfyg2i3FQ7VKTJm+7ZXUMbhXpkSflrrsZpzZGcyuYmj93ublCFOBd/MJr/DEfwjlG+w4gXBK49/U3rQ3O6hYb6gSrbwVvV746QH6wmtt+UmfEC34t6k8Yk7A6QsFSIdsWtuHfGNSFFx500lMrZPrGYVIuRj
 RTnTb6PTGjpTz3yiq4fBtKkQvqiPR8dV/jG2H7ZcPcbtdWI8XjnK5rEONebiEk41ljephAPLCKWcfPGtLL1RxO5pntsgpq+YM3Exmgc41fmfBQLR1IzoQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5553FA4C4801;
 Sun, 20 Sep 2026 16:07:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-3hhh;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:21 +0200
Message-ID: <20260920140605.3005461-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 23/66] package/xtables-addons: bump version
 to 3.31
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
