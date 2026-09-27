Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED2CC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9AB140BAB;
	Sun, 27 Sep 2026 10:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIAGr-iZWB6X; Sun, 27 Sep 2026 10:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0D8840BD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506568;
	b=Ho7YXPfGzTGC6stBENu4lo4tW/81/bSRVcfHbGdovCKZbWrW8z3a61SfW9RXt+BvwpTg
	 PKrLPJVJAexn9aMJnDZaH6kYdfZHb04YF8l7nFFbvsA5xzfn7jhZ+8Ghw5u8zTRlqWpa7
	 OxSASAYdURkKPFKAQFl2DatNlClyzTysY+r0qFVSkKv+4hiexoMZ+D2FZuoWPwKTy1Ufo
	 97IwOeNJfSGVUt7Ajf85zNIK9p6bPsBjAUs+H6cox+eUcRel4xEywplB1IwB4u88luWxs
	 ZDugcM0wFWBt0VfieYUhJFmepZmwDyKIVUvG0ZFQeMne619RmqosT/R6TEETMFMAcBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506568;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=Yz70yEtIhj+WGEAPy1yBAtzBwLclB1tljOtC5QtnpSqpFflzs1PmUDVjZ/WjYvhW1WA3
	 mTu4II8DiA/xAzv1MJPivCLEGkZ+p/YNYfv1tyGyssfCq5x+fnRVmzCyCiHzKwkodx83z
	 TwiOzcGAWJZhE7u0z/PrSpsfmVvLIWS3V6zp7m8LxHG81SU7U+gqegnklo9538UbYIxs/
	 FVcgYB7omXgbqNz0vBfRFm/MCEEMVOhHS2V+VaGRL/yG7zlxoeKPdWsTqvsSP1bR8Zssv
	 Mv3pa7+mXYq5ruha1+H9SqbqLSwjKOz8nTPbgpvdkrrpiu5KOmNHxI/APFTYrx4UC5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506568;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pm3MZ4cPRUo6yC0G/Omt01J2/PBAs3O4eqgACBN+kX2P9QjlIBej40WorcZHO/ITI
	 ZuvM4t0s4d4kDZeEryh2VVBVvcKY3dPf6G2mMRPBvIeEO0Q4x9GVQsObHbVhZAJNJ9
	 klrUC1sAEh6vyEqoEvuqQD2fVwSkDQgQbvc9j20mL/E5VHYeafWhpfJJUjN9bPRHmy
	 y0QpZqG6mjAAiFfOwZaZ4ljapKJMJMSnIFb6OagBeP7+UHCsKqQRAgbvFsLOBuEkgD
	 6idDRyWsPYcEgXsAnTf3cADvqB40RWrZmg3wvqcFF4ZWwjGobDt8Ew27nHnVnqkqSw
	 Pt0OoDS7Aj0WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D8840BD5;
	Sun, 27 Sep 2026 10:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C01335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BCEA606CE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dq82uAuKkaJx for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7EC0606C2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506566;
 b=Bjg7eaYvQAN+U7UgnzWqgZlgXSnQMSshNeEIVHxcqZ8Bw/AeygOXglLsF6dxWsGaL9OJ
 OQHiCRTVodkR2gzLQ2zIl7wQ69BPoDCoSSVHWT8UA3t5JbUOAh2/fBvXr0Sp4FAI3HH9G
 fPZZky7qxLTAeMo4GaMejDtjdYkTyNmS7yEHXZClDvq052Qs8GtBkvWeLhzA+w1g6E9+J
 lnt9P1cOL9ORvd4Bp/tYA1V7qydqiPWb2uUVXi6qwp4WC5yqcKSCWJNixpOSujpWE6wDj
 JTbdJ/cQ0dVsjoxcYbd3Nk/KMSeIeG9vSVV1Tl485LRg5L7kIz8MJvyUrbAP7qfBqbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506566;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=c+KWPhUwFq4Mtz21/QLy4qoswTiTv08qpHctFdtWwY1oHcHyL3BbP+vyw9mTE8yMyBdX
 GLuF8ebmJp+SXBH7E8bzUO/8vIDsg6qlqVBZCqrbF6tWZyTiPGhsFU9syFF0/V3NGyGdJ
 d2qJghlHvEF1sccGtBkA3hM/Scz3v8FLW2Bn0XzDKfcY9ycuqBeQM9lWvzv5JJcGtUNX9
 49JwM37efGrfEZnFr3pCcJdvGBNzqm5Iv0B/P8Fy4Q+cW9h8GZ4kRWk0V2Py9FFEL59Tw
 Dd6XpgmvIezPi8OLec0cN0JaiGOziV0msqcWxeOdJuLmOwjmsrpUL+96Z7ippk9zsLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RZM39svT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RZM39svT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7EC0606C2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505860;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RZM39svT1IhmLznoL5JkY55SHcyJNUTzK5ei6t9v3sfHEGdSVc9U5xKh+v+p7jTaX
 wFpukxD09nKGgljl3+cjDsXilMM4pWdL7zNX8Y8kAFqGzv6/PAvA+h2nMLafSsH1Jr
 OxKEGE1GGnEfTVosKG5dZqYFSC/xQBUwhtKtsv4bHrQHMllByJBj/Qpreuf+xCD5s6
 E5aEoearJXzlbvD0bQKREhU1/VyWq3nCBwuGdWBpzh2DnwRmcZxk88gu/vIDixpSGS
 VFk8qqADJNdBYK2u6ofbZTY+p26daU5UP2kx0R4bMXE/R5rfwsGUNsPul/sNU6xW/C
 f/SXKYPCuCh2A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 V41YOwAyx55kBJq7zUESLSpu9eSw/e+/EZEbTNUP1ZvYcNw9XrEKLUyesGXHjqh6IjES4wBp8HC
 9Cq4U4/Tl1meINOUBVdmkfnFQq2gzAjejw5t4c7q/GbkA1bhif0ARHpt8n7aYtBDySAfej1/BOD
 301wU3ms7zD6LDjX3EKUKsTTaDvTQxi2o7QLHW32ByX9FahA0NcuyDiZYHOnbvNY4W3A1i8gXaa
 rr/80ahMO0GFnl9WFuV0I2v7nOrEq8uNK1IjNIbKvYVFs7WVqCoHbNUAglujH5/Uu08UUjH/Ted
 WXcIRb7cZV3S+1s1hOzRbNCPuLm5ufYg9ttLodAU3Udg0P/3sVuZp3p6SVso8PHKttinpQb9he5
 WPc+wh4w6TwT66tF7jeeAyPpSiht8UkEZlGEH6Uue5CKEpm8k0hBH8+ggHESkjnExDxLZdFQbMS
 caTBI93mlC1DcTnm1fIDA4AbmmS0XbZrSLyRAemXyFkyQxtzPC6XqNYIZy21CSI9Br4M3bHpnYd
 r+j1ERdJI0eS37ph09AOIRtN5SVhsXDBtUUF7JSjGcMLmeeuisMVSM2E5DJYlVG8A9Zxo8vlIdp
 p9dyglXEW0IbJzn2D/KhnetZBvL47dmbXCUKqep9vp6D8i7Fw+MUxBpGgzGIhVLa2iOsYFYL2VC
 HgaTTxE0EmS4gQvKXHgKSHYVD/cCbddo6Yi7cZmN7KIfem8nq6Ke3JDxDOmJnOg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BCD77A4C506D;
 Sun, 27 Sep 2026 12:44:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-1X6h;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:14 +0200
Message-ID: <20260927104301.1801638-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 36/82] package/xtables-addons: use
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
