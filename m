Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B5EC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80096066E;
	Sat, 19 Sep 2026 16:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRIZ90aeGrp6; Sat, 19 Sep 2026 16:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0516160673
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833959;
	b=kRpbgoaFvyn28AGkbyawyMg2UjHDsh6MifJcTdfHreLUhcx6Bo1Us0ZYJBhaQ0wzKSMB
	 so7MvPTjGkK4718d5Ddeku3Jo972MtAgw3MULx3fWTQYrgYAerNfixIMzfV+iKh43Br6j
	 YiLHwPp5ipZjBzqmK6bGY0Ip8zEyw6DfaSP7wXWmsOHYrlr24qwgqp+CCZC0S7yfsCyo8
	 kvvf1nLUGjt/4tpRYhFEHw0oizGK1LG+Bw5CZ6mSnL3aLYi/MRS1GF9lFY/N8LzL5S9Hm
	 oqLD7H2ODbHQ3koQZXVSoItT7Y0tYTRTG8PNSNokTUMObTTZ2YP5MR1ZGeohf8ufjAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=lI3RfUHNrRL3tuJpbJBDqnWs9DYoc1NHj8xGF47qo3h5Q0o2vNcuqMhmqrfUIju1GEOx
	 9/k9COW89DTqca+w0MhVIyCtu1XmcvCTTR201k51i6ff9/jVRtUUbJXXv7GtLRF2AvtuY
	 3W0r/ofOtXgXd7Dbh/xzZj8jEpNGzPg/4vusNt1HIanTo/A0oILLxVKLvzX0lgQG1Pu2i
	 Q5F55fIJn0WvmmjU3t6moQc6jVgB2tW4rXoBt4rA1c1SyXBkGNt645ro71cg7BILZ0Erq
	 iXOe+zQQar/rKsL+q5ZhPo8yMeSopDqqybKhu9cnHy/jKxInktQqqECU4X7Qo59b2tA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833959;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yij10XGXln6JDnrIqhN84fEYWN2VxvDH4INsWSm6Z3U+lj/7aEWZyxF1MLy2SW13S
	 /abhVBdPOLOV2XF4Su4hg08n4LMC/PiJqLYHRZgW2/UM6S2Y1NLOnjjLwo/Oulwkb4
	 WusDm/S1K6ESkMzHkOU1Wssx+19U0JfkRbRC34YGhAt9l+EGbx07Edxeq3+iJGDfyt
	 mSSyBsoPU+oh/bVaK1bBhegHrjG2mpiR2XVjDqbigGG85IJvkIspucexpfpMKKpNgE
	 zkOKGEuVbaBwkSzK7uIdVXvAG5L3ol+pLcXB7JkTyvjRjvHRGikUIkoy+TiP/kUk0l
	 QBNMqBoDFT4EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0516160673;
	Sat, 19 Sep 2026 16:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50BC637A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 426EE8113E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgkE9-EONHaI for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 161C6810F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833956;
 b=Wk+vcOVR4edv06Gn5N2GPH3h6eod+PNMvk2pvqyQvutj5cnIozTgxfMSM54Bp+gM9Qfg
 /9baxTpDotTXt1OjZTsYVoREDar1f9wN8K4e90t2uROnXzbmu6i0zlIFqvFA4zlt/hmR9
 0hdAu0bwOHvVzG4nex/uiuSnGVDmdxMDagUgi8XPvuqNahgh6O6MJkLJ5CtkUJlfpthh2
 3TvonHr7F3enLBglERK/JstFiHu1lGsPDXhZ1vsqAWQyt2wml3pI5EK0GsDWCSFdV/bLJ
 y62AuEK1NAUDThk+UwLCgOIrtHZCoFz+b6Mwhkr6bPHDQJJ0hUcAyrcnp4RZiUXM2EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833956;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=mRA424oR1SDrP6DpxMBacYMBaDB59hG5nb+NHb2luutukSaOJV113bAGshvV1LmgSZgV
 IfYj6WPmyaVHRrL2HMeb1FvbU5jXaHPjPJZDeNzuvPW9/zXxhouhVpWz3AswCkqNjXVKf
 T9wUQ6fLEcg85rv/sTRkxt9nMJrR+l3L/qygX5fO/tbBetpHuHX4WwghDeWe6cRMkWe4A
 HTY/aLSVoABgbFZGsD+oYLLBR9dl+m+QQEB9Z7AQ/1reV8BDmN1S2AN2YXlBqJQCLN3YM
 etuaoORmkzpqydMbfhbM8XNGOkLAFX9SP3L51OISCowLmtiPmn+xiKTrhMlTNZt0Zng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DFAe3Ny3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DFAe3Ny3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 161C6810F2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833547;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DFAe3Ny36eDcf8q0oXIFLPxgHGOkesHN7UR+MfZnH/IxU1GS3FEYv53ho4gMpay4z
 qdZNKUTWj3AB67YQmpWYiN+G1Mi3cQILG7QZX7apUrp6UE/vOysY/5NWJ0ww8ZBqU6
 KBRoM/rq+MPu/Z3+ydH893c+Sd6JNid5DnRAAeFlEYEzt8wv4eY9IMPh39Dk356VZ3
 cbqDvK0Ugmv8OE2P1euzIYtTUz+K3TlREfO0xK21EBWddY6Srb93CNpxcSmzru7DxE
 dPu+0TaHQxW0ks4nnMROjIxw14kVWKTtBUaJKD6Ne7nUBOxmDo4vakHHKWsI+VlhCv
 QLhj4KcCQRhpw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:2aqmV3ctXWSozzmlehslQ4BZy2dRRZ8WUkNIJiBuqKbcNDk7BZupXuGMq+yAQ4B/pXrGV3eG0y1ZFBck63aVMf178n1IOHmYWFG8GeQ/5sSyEsVNevog9EsDBLawAp32slfOhnAB1e+pchnrNkwWZmWJ4on+iUQmrHoFm8YWi3+1E1l5YQJaenLuUpGilEboA6SJsaBe0COsIAzd/IKp7wwDkeO4BY6A/QYMf2uNIfeAsug6y666GJFAXIwJBLdGRVaGrRsGCf8ufq/B4DqdyGMoAporA7yi062tc7scCr6G6hFcd+V5Nko6HGsgZfbu5M0Mn7wOKjDDz1r3NVs1666JBjPlCZVpvgIvWHgKYilybco9A2iaXhz89aONgVS8r0eHvjOS6V365+idCm0UCYlWUQKoIUS7vGpaOdkJrw9aFP1XrLs7gMS48izcp0PY9u0SObjAGz2CDE4usri8Omm9ppKVAjyk7bYVOdO6jl1wLa7jpGlDpnJSbq+Aw+RE4hU1DxVaKXaOEK0Vl58qFWbsRITaCPufW3CdKg8O1viogKG0rwd4iRbvbqAEsigRmIdX3wFkH8eYAt43srDVOISWIJpo3D0CNjCNB30MR2B7t9
 7LK0eDR9edv2QeysoRIZ8Emlk7RzrXfJJNy9e3gOUjh81C1t6l+ylDhKktiWUAaeUiY2wNT3CxgHbz9R55RDn6/z8zn8M81seaP4wjHIfGg9/zAWQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE72FA4C46F1;
 Sat, 19 Sep 2026 17:59:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-0aPF;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:56 +0200
Message-ID: <20260919155845.5776-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 31/77] package/xtables-addons: bump version
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
