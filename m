Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D6C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A76540CCA;
	Fri, 18 Sep 2026 18:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du6tDBx4gaIh; Fri, 18 Sep 2026 18:49:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4598240CC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757382;
	b=YyHtScf4Y4U2DPGKCKa73yVcCUmDEuUmCvi3pZRws1ucYEazK+3x+ud7UtX27ro5ozho
	 Ru19XcbeMT1hygC+yy/XdDyQ6mwGBBZlEMIFhw2HYKdzRFSWCAbHOROmH2DSFUwbhofGG
	 rPXlpokeUQsjQpbnjbrN3EmjpFqDPuFvkdnTXjR6qPiO93lybVO4PXl+V1/EkF105y+w8
	 z1GJh3AlGI3uQRkgkpiyPUDoG0FIdBcgWZFHNOBecnI4Cw2bh//kJCJyH3PA1IerBxPj7
	 pRp4lP6X25YMKE6uiVumbnia7hHdSPo2vRhS0NtTqZqDCkbLnkgem8qVJ7uk9nxrZzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=fECG4jbVEa3rmqme4iHHJitd9dR8lNDRHGp1dYhF5hliTj7D6yT2iW2RWG1GhzJEVHaX
	 5pwT+d/TtntENUbrxmHeSKvofxDcOyvrrOIGR/JIdcOYaV2oM9A7n9WoeeETUoORSGwtH
	 MrZCE7dS0QP6gZBCYfzKlApN4nVE80deGnvMt+YfpHRJBeiVLzD3ZBS0ilEPLoQYsixpT
	 r6B6aisdqnHOuyGiz0W+xKeVFV7vEDHf1rEUZjTAi5VAIO8R11E/aV6pK4BprC8JWD7et
	 MVlBEJ/uwC/CDe+VRXi9GaWYaSDGhsp5DF8wZew/RbKBtf0I6F6YHRafbqSzBC2zQTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YfNfuZFL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757382;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cnx8Vp8+KrjXGNk6qRgGBbB14f9RjjxczdompuQDmyC0HmTmyDy/KwS+RxkMhkSH5
	 Ffzermd7BywbRuG8ROrt03YuqRtMDEQpfbLmGjOxKrdpBRELMnbSY9/jE4v4mRM4Wa
	 bge+zQgZdMV3Qd2IhJ8DT5TAtp6CLD/jDvebjYJTha0w6ptG6xPxW679o/96J9+EAq
	 9OWQNKmRMqIbjzIAg8c7TMdPkKykX71FSrFXHI7q6EhAhyPfTd0y9qxoN19M1+BXQ5
	 zWzExcUri9khFplOr1+RDrz3BW8o3UY8A8fav6LTwSpUg9tlBjwE1mqmlqrCT2+fzb
	 526K1O038Xqzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4598240CC4;
	Fri, 18 Sep 2026 18:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7866E3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EE2E40CC4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jgq352COcdVJ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:49:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E7E340AE1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757379;
 b=TozKda06atF7L4i76aRolS+dVNu/BWUD7j5iaLJVOudT/btAB9MZlozJ2QtHeYvDk5e1
 +WHnhk3wbaghntECWP6LRnvW20jez2IYZJ6mtcMLpsdFVYmu8WVTu0dd3+hmEjIlxfJMZ
 K8NT/kaw1vrZWASoED/VqFB5KusDenque/gEz5Mo2KAgZikRKSYSEPL4cenkk9wut3adY
 zYhp1CuFDhD3Wlyr8qbVZnBSzuoc/k9+jNhnFIdqk/B9IHqFJqHmsvdUW90p15tOIid5f
 Bxn4IMlP4a3WBGDZzqm6v7I8vdGbhWTPaUSKR8qFzShSTzwzj5qwTNvHb7i2gEk6r3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757379;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=O4S1vy4oAQNIPanWhqpG5SXZDYMpgGMWlQ2CLSyUV0zAF4OMxUTvnxOmm6ktkiGOnW22
 hEDd4sc+g3u2qwtN/3AP+uDEeAacDU3IBpyuxN8xdf1GafhheFbTVyHpbJt3jk3GyAKf1
 /gngCJAcbRXxOfV8ZYXpyFcsustIvazjfjGEG5eH9oa+BudTnXkBM6T1s1Qha9+Y5dQmI
 OndvIMJ3IZzsmfE7Bxdnh+DxMfhoiJFXZ2LQvD5YyQCC0yuqg239I06j5C2j9TDmVD5o1
 Cm2EQbPMKTBO/BGEiFvC4hcpNMturQyz1pBaWVUYGi1XtCY7uTh2kj/ca2FWrdHwKZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YfNfuZFL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YfNfuZFL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E7E340AE1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756932;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YfNfuZFLub/bajdoIW1vOb77e5pggBIzr57+drRX7Y69txbf60jdPuMUHqQfjdpWU
 G8gU9r9j7sLpCxxQ7AkMD0Zim7+cBSAl12s8zup+h5V6QZL7wPy5iyIAl6nrVFSqTM
 9hvQcBzE4Q44gDUxy5G+PbSM7UaClhTYFhY/ZXIfnPD+lmBlfCEomt7TujD4jyrnlm
 xYhHzRMnBMKEs9Evp5W4HkINTyAckhHRxewPvBNl3aA9Etpkqr/MPDZGm9vvAbBic5
 +lHOfFYQqi/93DRTUYckv8PTr4xj8XHaaka/rK++joG1lPHexusDG7nRVWq24at+Uz
 qwUWZoBoi5eEw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:VvZga0iN0ZsQqcdX2Rg4OlHbV2hdKCLjUhpXiPUGO3lleiBuNZq3zbr8c97RHeP6jfUxql82ZtFHYUHjLiU9TIu57IwyWULtXKTGsOg04HNuI+LG843VbhUwaOEPdXLtk2Q89qQZgidw8SYq6ox0EmDTi5EcX2Xfzfeei/SYmuAgLjVv9IzOzbF2aZbWbTX+KJiNoC4Xw3YpBZ0mrjaSqokQ/GszEfGDyShKiSOeAX7cPbKE5WkiOObM/qlCamycRJWfcAcznDsh0GQULUPDRcpP3a11KlW1odzxB3eeLhj+lAkusCBHSBshvTBGQYj20orkxJaUizhQ3f+S5rMso+dlNTD8l6yKBlLZiaVrsf1itDRRLTmZN4wUwp9/yinj/egOsRHstdOzv8aOz+79CuMVfSbPvA/vaz85JJNRY9DMriEHiweMgexiOjP6ndX/iOYtgoQKEVHsnd/OvFnmqtK6nu7yCSljKhVx/YaxqBlV127wvqbf22J9J3L+L2M2Q6TJd40ZNTMVV779HlFPxiZWUyRitlddXuTg7UOUsATZfIrTHhplC+G+QYJR5uM4Q0eF6HQdeFLWU9Io1JwM9ouTNt+fcPPGvFBmNhhAhKIxDX
 9UXqci4jvrMcl9cbkuz5F6QNy5psDRRZapAPOgYKSQyWnn1XX+DnZYof9LV13MVQRIkVMdx48AfMlKpJUU7DqyeFoUNM5DkrzFEbMnrf1WaJ4MMfRvdQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DC4AA4C4726;
 Fri, 18 Sep 2026 20:42:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWt-000000007cB-0US0;
 Fri, 18 Sep 2026 18:41:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:48 +0200
Message-ID: <20260918184140.3631274-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 26/77] package/xtables-addons: use kernel-module
 infra
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
