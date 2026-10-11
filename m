Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C067CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF26403E0;
	Sun, 11 Oct 2026 13:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMMTXkFjMvq3; Sun, 11 Oct 2026 13:03:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C12EA4046C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723821;
	b=pvsccGmYOxtzhCPIsQ6Wjk6MHEJBKgJbIpYukT/nZRR1oqbySMytP2SUPiXGVSSuHFVC
	 ZmBkNPVag3aX/dIiOh5+91NvC/mjg76ilLZ1UT5V/39AwxNH5eWytFnoHsnILIGImzyT1
	 vXyFJrrMDrXwVULw6nAvB8aK4z3wSoWGTUywD0qj/7fCxVf17PEgVgq9zqntNFUjxEqOO
	 nyGltlUctDNY0kzcEzE1ysu8RMxGvUVmumfUud+GwQbgNiKJXACpaGBO5RjHB3nxhKHry
	 AoJOJXoGbxC1gfoyLGezVlIfNh+QLRX+3JVX+OoTeZ2V4hRp8JKPDKBq+Lqd52reBrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=F40iNoGLO2J/UZzBYP1Jy0Py5BETGSXzJDp48oJ7eX0InK3LWT5KbiHJMtdfUAsjomUa
	 rIv0cdzopAWxdW9XRymP2AuSEW50RomL38+Mc2Pwbdar/v8wEbBGqDpn87KC5iNKgQ0Uz
	 c+MvFWapEcxLts6s2xGHPGnl41wFnoeqFKCmEeouyXudiddCxliUTjO3UDyrAGF+uBesk
	 4gpnQJpBaz8aalo7/2j9Z5hRwt+TVy2gBykUPG/+d+7Vp5P+osU+ecvSzTV0nRCRiiWlX
	 72RAPOuNmOHcA+8dCObQROqhJVgY5kt+fxnetNr8X7FptSWMpgv/elJtZgPuJ94UX5A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723821;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSh9RgV0gUkXbPfzkjp6aGKabRigyiSBEtYOE2pRjaxs0X3etWEuZPwZbn8d0FA+4
	 Mb/BAhlzHMW3+kPBDG1YeAN2oVIbj+toSUNjUt3jEMBabjHnzltz/jV8TiTgcSn/CB
	 ZNW4GJQUKZDosngGAPnzvkN84Fp77sBrg+LQNtAq+nU5HnY0CWrHv8O0M2k5hWSAtg
	 /4jVM7FnY9AdVf7zgUGCYbb3F/2yua2kxGVd9Fx3LE1Bx83xtbxmu1yKDv5ZW8kEJB
	 ynZB8HApcHexzuVtr4RhDHv3CVXgC3s9gyp6R7WqWN2oepe/JVfmQzupIHGODclvTq
	 QgbRh+V/+qzMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C12EA4046C;
	Sun, 11 Oct 2026 13:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC9B1194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE1AA80D6A
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCOAwzA720qq for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:03:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B77D680D1F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723819;
 b=dGO1ONELRrTFr5CBJ+B4mvcPUf+iKtj65x+rsAPd7D6nXyVTFleobToOpJZ3Vsvxc4mT
 MOgwykege3HDfCOnljPoaDPX6/vrGzTlOtu4rScVjcaK+CuVCHBNHI6n8b3ZEzZeQRlnT
 LN85oTqv5CRM/umOS+0gID5vm9UNmDnqktUu43FJj8frPqA6+NavVMBeoBDeLIzecuz4W
 3C/w93UivG06amsGHNeyBXYMpVkcWQIag4y7iaqmiKtb4B5AUO0AUiTK1mc2JLdiIZmgo
 p7nG1YpTZgGh8to75piRYZJ24x3QI9zaECkUibofy21BCtcaU4Za35bgxVOwuUP/b8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723819;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=I9pffz7CYMvRgqBvzUt/NAYCCP+pjygraY9q/FB5PQEkG/hwnmzghPpY3nppSCY+9ClY
 k+up0Vm/TwBBi4r2rycmBPRmpAe896MWegI4Nb0InZ2y1MiTgq/pIE/zj7eTdqAf5yi2C
 yrEJRB7hDx50NiKxMZG06O+S1U+TFecgn1H+eIGSJh1IZ7gNuwcTkjcY83iGB/VFw7VQH
 T/WMi4LPVSROOozPzHoxLlHdro3iyFKS26HGQI7g9sw/YoROv5jk14i0+GaU/QRpuGZHM
 vik09nvgHFJw61tmdBM3/XxrDFZBOoZmZPP6cRMaKkbk8FJiJDat/J7aMlH2Ci6kAwQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HIbZuHbP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HIbZuHbP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B77D680D1F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=HIbZuHbPSB3bSlzAngvzS0Am59IQNU+gph4yjFzaMThJJGJ5dA1bBaWvVBefOfZnU
 5pFcOu6e/5dLMURBydcu9EpOELHVecED2w/lrv7Ddi/OVWOR0U6vvpiQ/TNzIur6jM
 Io8/WgfCflVE+xYjJ/6qn6L9+wYugmsPFxHUMob0OTNtAnOTChMT4SN2Bt86g6alwu
 wSQ0PeSs4J8OSC4pBWkJFH57V+NqsCPf75W69zmvYcjC7tlFIZ9uDmdccW/G8G7S0c
 wk+Bvmyi29H2vqoI228jXCmJxlERCC89YeMdgmhnjgD1ewIbIUn2+mnr2CNqJaqa+F
 C//ZfULDd3tGg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 1dN++bfmgS12c4Vp6j9dLkW2bk/o4INi0LOUBLYZBDlbKoz8EDrJE9+Ac4LLsnPDtyWv3u+yiBU
 pjpcTqxQWyEYfAUY1sWvt8hmqSyjuy0pRkiR59U/sob0s31/ka6SbhWhwzSOOI9l+Zola4MSH8r
 X7OU75iS8UOBdCgW6kjPbeYfcbtgBM1WIT50A/HB0A8KiHOXr5OF1wyAsnNMqZDqy66NchAv9S8
 TGtnm4SdxPDDYytCD4q/6BLx9eO7L1ACeY9teyptWIS0JCVreLLzilNC75md/QXxPQxnFcRp+UW
 xs2/xxRsGa8E3KFA5QwaZ+daexv0yectCPs2YsNlbrjLULprm+DUl3fVLy3KejkTHrvx1TvbgJl
 ivn3l0MyWgASNBKmcaGk+TCoQ4AwOWSxvjrbzLwYTRLsUZa5mXrduESjgD2L/rbWW1WJxmiEvvV
 zaLFvNRVCGQPatp8JKzBuyP5wNkXx5SXnestrMLlsEbYubBemz+ZcSY34qRjKquUCQDmxNS3x/u
 X3bUzrvmUG/DvOEUsLEHJRzTxGtHuKQtWz1O2QikIAq2WdcFwt9/YX2H8Wko1wirWqVnCt1p7yc
 U+i/oDtFmHlT9S/mixD60yGM1ILpZ/6CsdSr0uY6GW8oEYThAA==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F669A4C5851
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-0z1k
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:27 +0200
Message-ID: <20261011130058.3443432-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 22/52] package/xtables-addons: bump version
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
