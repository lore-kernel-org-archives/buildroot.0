Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F214CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223336082B;
	Tue, 29 Sep 2026 18:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqqdNnQzOdGL; Tue, 29 Sep 2026 18:44:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 298E660839
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707472;
	b=MGEVDG1Kt/Yf1l13DOzU+ZCqKmGSz5elQOuSIcy0L6eBh7yqqQ3ooeDB7RhoEKkyrZIG
	 GW2FHFYuG5vImf4doc11/vW4PHCt/agfaEnqal67ZnF8wHQci2zOsW2mml9SU15dKGdY0
	 QRShTyPIi5Ew1pjMeGJTIGbmE5oiMSysENkDE2yMYWf+5ubURYpnL/iACO/jnhs2DzhXc
	 HOzjX7XXAal9C4eoBbx6jXbn6rZDRAdVgm+C3f1Ut7WNjEmZ+OLMMR6b50DT9I5kG1QCZ
	 le4P4EteWGkzjtLraoQjbm11y6TB0WE/1LtbWdU9h3U9OMGy1TJOIKyl03A4SML7xWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=A34X3SDXy7ufo/ZlFlMGStlWbdAIr0fssZZDErGmeGb66b7/ApnMpgymriQsbEghaXCo
	 0stqOASCrAaZzehh0AotwWwSuR4ZGJbNAmxlnY3RKzv2/nYN01FhhZ5sHvpOcD3S7nkb2
	 hReZqfPOigYfOEg1EvBbDF9BKcBZYPy4zCFwFxSzYgnxfQCp/cSfA4pejt3OeD897UEav
	 g2TfGiWjFKXAXsLcjbtLljiE70ZGGz56AiUT/hB8V9RxWRvomiFp4mO8xptXzVqFJ7rXV
	 ds1/kFVfpRKo/QdQOjKJY9kwjWJnNvuk1G/j+aqtRQ1ixU3fWdtCcUj7o6UfnmbIA/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Hbx8wK3B;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707472;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQceG7XBPfjIrHLb6XkkVj7xciWuIcQQCQ4mwVlxryniYtyYAe161jpKUaQkmx+Pn
	 vE5HlrGHNycmKRPhajETXmkgZnCl0yBy+/d53c2Y6zpkmd0sw2ICEsD4FAcEKVVe7F
	 U4aQcyc0TorQhypNdIza0Lg/8rhpmujRMfFus28PDVYyMGCSSCEWM4hOOzqySE3UZs
	 Odlhv7ELnA2i0GJon6e53QgI2I4QVNCigS/1EEAMuKpr5S0gqKqznhLqpSz3+uIdKh
	 SvabLnwPFTjcj8ltXFRriYv0SbmaRbvtEsaBz+gbEGVK46pOv6/onula+Ij5HG5MBB
	 V0QJHtP6eEcbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298E660839;
	Tue, 29 Sep 2026 18:44:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C00323D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1EAC6082B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jwAwimzcWtp for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:44:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1E7060839
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707467;
 b=OwCFoGxvrNAZhJP5qGf5EKY02/uxsKUbGG3A6PpSWF2K1WiIHOlUXlczG0d1D5zZJ4WM
 nX3uUIP8ckYLBh6+vib3LQMfYmw0O+1Lo55/Aq46DSXavAiZerCAHGzt34hdEqudK+tWZ
 dzCqGihj4ruNWGHtFuZPkDdZUnR4KVTzEW7jMd0Qdsg8AHm6qbcu/Eap7SGgTMpAMOKIE
 e9G/cppsOi0prydbLuCJPkLJIt4QN9MrjW7mVGdhUebBMQiVbFF94M9/q0MAChjtZsiON
 tRXWvMLfLksJDDNg0m/UnZPXKSxeCh57V6aTiAPeauKGlQOQGsOUx6ePH2/vRK6Qx3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707467;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=Jzdgwz5uYfzPKYlcxiEhTJhbp8S69T4y5zsZxl9Sytk3jbOLF81i5fb/RjjgVFsclT02
 2tvDp0FDKSak7xTh6jI3o+oNjxlzyF2pqeRzhHJ1oanXKgDegCOwJiLWUVtzPVgudLi5R
 C8zVUdB+y0uyG9MurPz7OojDTrAaNd+ldqMNABtcGqhAIFuKO8Lf46pKHUGjx4GKYIR0Y
 bsqF6d6t/NvNYXAFPnyr2bm39EY2bvVtQi/nk3iSq53wW78wOLMkFPENunoIdfV4lQxux
 t5MYAAJ+WbKs4EvZMQRzazRffd6wmUOzASr/sIbL62NvgQnuzSRHH1Ithvqk88628hA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hbx8wK3B; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Hbx8wK3B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1E7060839
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707028;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Hbx8wK3Bv+sHWFM4+fNn8xQ/T13YLuZqqh1BFDdd/Sd+TLhfRFwuY3Uzxk1eq9zDL
 XN8+b7wjE4mdMydlqdkz9Da+c2MK5oGWDcIENotJOxnaHGaT9UFESxWzEwp6HMNBmg
 NnyUI4bVZlX+R5Sz06K4RCQZaSAWW8npIKKQ+W0XatGICZprVSIloD4UOUtElsKFtk
 OzS3UDN4QzvfvcXJ+hwHSgYVyy1s69MaQ0CFnJlPemCf+FsQ6AhkDilPq1D8q3LHda
 lfUxLWGpFcQQLeDoBAn2bdnvLBXKlkYDR3T+NKG/3HUVBX6Fs9Ee2XkY4xzX9nFfd7
 ur6CtVmwbyZDg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 86OvXXz8x7ez7D7cyb9EMpMEzrjJJ727RFxmP0OH7j3yKXgfXoE+Jx4W6dUuFhlGGsD5KZzROmG
 q/wnxBuhd9+4FPZaGjKO9Fb+O0IVpi5YK75q2mQeRvCz93HbSd33ravSTYQWJvDy7bgtgluMEEb
 vSapGj59Cr+M/s3eLeMRR8r+/VQ2bskvDDisb+9aimEOxlM2HLXwuY5TpVsAzi+vJN5UYOLwNDs
 va0kB3qN5+pmPtkaD4VGPOtWAIDlOcEcDzBFhgF57JhPPvbGUnDBThzVe993HxCPx2l5T27IVdP
 PEnWcCkhKxXjMGbMhrwS4yJ5a14SBVr7xKYXB2JHArdYbf+DOqZ5uKLHqUVccj7C8xFV/1x2zDy
 DxI4JNkPondTI8CPBWrgekNfbXwkDykypjL1SSLmERYub605kRVZeGMkTlEk04g3AwMCSb3oqOC
 2uUVEHs5GF28grBG0QJ7mnL4kRIJ3Kw9EgV2YyW37KPeKfF5oCpulrG32qmUbram0woM2LmGOFl
 TkCuCvQ87V3qE2T9jgXc3sb09NeI0R6cuJCBfkUyklHOiTvgAfKg9InMbgW2aw3uGwZ4Vo+0twQ
 UoitgNkD9Pfz5JeHiJUniQJ/iN19QljYWcpBV8h/YSWEIOZ69g==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1C50A4C51DD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-0EIE
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:30 +0200
Message-ID: <20260929183607.1849293-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 31/66] package/xtables-addons: bump version
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
