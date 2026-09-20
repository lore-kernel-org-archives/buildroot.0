Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA7C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67D160607;
	Sun, 20 Sep 2026 14:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNZ-B8cZWKYc; Sun, 20 Sep 2026 14:13:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C4DF6063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913584;
	b=HKESFu4kGlxyIPKmXEzx/AXdz1uTxEvL0jrLvBB91De5V0jcyq/psS1ygIGF0o1j7LEh
	 sdY9nAg4B6j0o8VDToVTkmYv/5CXLT60oq5QEtP7xqHaX8cB6V6z7TfbjQ6BEPIM4iGrm
	 Kg1BRm18n/wtqsqADou9fimv+NtFM/40Ry8Onl+G/wsVVD372p36NJSLMdUnjdoNnmcyp
	 Y//V9Uzw8W25edrAagTzyFWj39B9B8LDsgBOtZCFWFB7Sxq3buGI45DOy4vrdFg+5HUQ9
	 a6w1gsOjx8OKkKc89uuXYkyWFbK2c6kQHbjAjcps00olaLpKen3hdkFYnaMKgFhPDig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=Zzr79FnVk/FNWrCUvA9H+oUMQcWxcgM+y4k8m0irdxt8bYI0MYA1zPkjeL3km0ACKvG7
	 Gf5U/gljCgQsLIDaV+Xgdk0kyhWtUTyhmkUok7Q9dy4TfffMhO8/2/wpXNdczV/GdOgYL
	 tpZ8fnJK9TXU94Gh055SmD4HyxDT3S6MAAX3VBYONREUtCI5Nor/D+Zz44B99vLLyrdPK
	 AySV1SB2AmZjG/wrIrpme42hPd49aiQ1D8JBUUhkmfl6Dppsb5gg/Hz0zbQ6JAWyPQxpS
	 8HIBPP3HXtnrhN80919xbOKZ+IkY1wc5EKgR97YCtasR7BhPbI8fLsK8QHbPnqDwj0g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913584;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iPyC1UN0T4lkf9L8v+zoI4AGNCR9xONky+XET0P43wVN45yB0Hjp8hRfEph8VPTKK
	 PVIvMKoF4OGtTMxmpBhB6MNygOU8zpjYGfcxhkBieQggI+n+eEhkWBMyxUPSC/P/Wp
	 lDoQiCvo8OFoBIqz5j6Ai5ILdjCrXnrq/h+x4fn6Cy4IiuEy2CKWqxnHZ93T6Xehh1
	 3ETxkPRNVQxWRoMnDmwF96iqEW2xj/uQR6zxNDPzLDEUHOWfBsTJR5vgv1I88Rfguh
	 3aZ5a540Qwyr2+niO6jD7Mkg+gXDvdpMGO5wCom5uUcEwb8XmAGGCXxcp47FtnMy4D
	 FtIY6NxRiTFew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4DF6063F;
	Sun, 20 Sep 2026 14:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77DC8371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D46140022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NRlAHUxn63c for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 53F72400D1
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913581;
 b=gsMWfhq+UK0i0CBvaBP9inKi6MqXwyopgrYLOzJdgwYOtB5GeKTANkijfIGn2PD/jWYX
 jLKZKZwvK9XpkFRoHAbjLuvVwkpjNPA70BzARDqg/wif+dSyeB/jgWeMrhCoMqLrs6Tl9
 xDcIKPLkQdDISH9BeeDZd9cA8qZMweQ+43WbNCZESXW3HAP2vzRJeHcGaVpHsaz4eINGs
 2WZ487yIM/vvVrlmIvTVVLKxY0E8CxjrOH3tEYXZsQ+WaYwwfxBhnRwUH96Ocg4UoQush
 cjCC29wAtQI6nKWBqPlEMR7BVCz7D3W/3ih1xjQLT+q1Yrmt3H7NFn9hRR/FTGKYK8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913581;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=M3HrPbgoBCyTX7ytlnL5DjJ2a1tv+EDr1C9hPYr/YRTU7iXtwENHXGtX/NT0XqjDogVs
 usm2dbqdZYI5x28hemNdLFlvWyO+8HRAemgnelcrAtGA+XYDuVPSBWiKVMXq5I2eud+cB
 1Bwdbz070TAjmeoOYas8DUwgCyZbCIuLjI9C0tVaB/aNqr9sDlPnyBMPP6dO0AroWdlPs
 FvuuDzNRhPaFWU1pPBwyAbgecAJhgeHusSkdrFUzcL7CJb1PxhUGqo4E+mAaTADH5ZBiu
 QaxXhP2aTQGov/yKimP+aQD/cfoagSFRZH4/rBin25KADVXcu8UPJC/ABj3GKVelG/g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="SmiKy/Wp"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SmiKy/Wp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53F72400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913233;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SmiKy/WpkbgSPS3LjD0hE5L/LXf9/ULVWpSbjH3VVOrtLJTVnXT0n0Lzpurx6Bw9Y
 po/WNrZuM9pOQS18/wPImHzH0hocOmhqA3FOtplaC1CLayTZametA28s3XEqLfosfU
 WGp7QF18NCTaeLeb7uFDzupSXxThw6A3mLHLHNiP4/oiLdWlj+uuJjPdPURZNpPQCu
 fKGkTVNYCTbmH83UsWmsfP9iwyUPJ9/3k/Ze75moCNsvRMaLtTzyC7Jpb1kXfaHBmx
 mqAPmpdkoJYoiQVI1NfibLIOQZjCyoa1fJs8pPFgo7XgeZeq2o7VyuRWyffag3EvZw
 5X1066851QvNw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:FqDn+21X1ADL1VQVK2gSAHSIvGV+ioBc4yseb6u6rwGTVVau8+TdvkHmXnFaA+IemcK+SOOp6t3PhOgMU0yq55uPnYxa0GI9MZ35+vICz2IWJOOSIRVf7spe1elnvuIZpF740JeDZqLILHH3+fTp18wMUSo0OdPs8Bz1eHZNqjVBSI8mKwIERhZJhWBTH3RGYu1Lvbrq5wNMOQmEhIBEnlgxoyqCHYM3x7JTqlm/szHJCrz6V53/n0jSqcDOTYAAQ1dfBWfdiCRvCBaE49Y/2uPce/WOX2TgvEETWrGv4SCAbPXg+Mk0f38qnVnTq0/ZcMukj1Cw16R+RK7OoV7Gi0HXpxd0cPMgEEnx3OdfmziGCxwlgtQTWf0s/4mq75S/yfPefwl39tSESBbnha/XQ8SK0nokMhl9Z8a4BSJS73bDOj88eJSKA46REj4DVLOW2BkTlbFR0JkKF7DuSbLlpPhxCXut64Lqt+Q1yvG0uW9QfYglmsbrPImLGzixXNWwjqU8m+Nm3TRogRhJ4VmgqZ40k6LZdU2kAa9fw6FZ1L/R45ISr2n8pol+rsgcTeQHt+z32tXxJn2APbmEbQMohrxvQV0Lij8aoYH0ER5DDkiAkU
 G3BbkxtKrzBDU1J6EQq072i2DYI0M0gECbnrXHmKdv7Q2L8di4SfR1kaGHz1PqR7T1p7c8JCo3dsBZihNj8EiLRpJHuaOCiz5k6pCpIxivYaWol5IzLA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E84EBA4C486F;
 Sun, 20 Sep 2026 16:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-39x0;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:20 +0200
Message-ID: <20260920140605.3005461-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 22/66] package/xtables-addons: use
 kernel-module infra
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

This package does not need the kernel-module infra because the kernel
module is build by autoconf but the MIPS fix from buildroot commit
1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a is not added to _LINUX_CONFIG_
FIXUPS causing a build error with this defconfig:

  BR2_mips64el=y
  # BR2_MIPS_SOFT_FLOAT is not set
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.156"
  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
  BR2_PACKAGE_XTABLES_ADDONS=y
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

  MODPOST /home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/Module.symvers
ERROR: modpost: "memcmp" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/compat_xtables.ko] undefined!
ERROR: modpost: "register_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "_printk" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_register_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "unregister_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_register_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_unregister_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "kfree" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "free_pages" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_unregister_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
WARNING: modpost: suppressed 342 unresolved symbol warnings because there were too many)

To fix the problem we add the kernel-module infra to the package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/Config.in         | 2 +-
 package/xtables-addons/xtables-addons.mk | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index 36a42c7efc..8943276843 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_XTABLES_ADDONS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # extensions are .so
 	select BR2_PACKAGE_IPTABLES
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Xtables-addons is the successor to patch-o-matic(-ng).
 	  Likewise, it contains extensions that were not, or are not
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index efd8bd98ce..a3174725d0 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -39,4 +39,5 @@ define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
 endef
 
+$(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
