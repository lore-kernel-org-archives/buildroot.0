Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC6C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD2240DF2;
	Sun, 20 Sep 2026 17:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NEZld8M4md9; Sun, 20 Sep 2026 17:15:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A261F40EF7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924528;
	b=JhNWuerEq5A1WiZ+Yq0+ADb4YnWIJyt89MJys/ZdWpwh3kuTBOfywbP+Y+Xl8b69dT82
	 qSvPARE+UZDio5od5blmU0f5kr6kCUd3R5XIY90TvG+vXcb5HK4cbXwBDxedl/+P2FfBx
	 yyki5lBXpQZJhDU7LxA8+M2NQhNzpbmTs3FwONq6wW9tJL//5Tz5v1ZMDGv1DurgPLc6R
	 rjEK6SEGt/NDW35S7TQwAMqBVgc5LQPt1kcIGlHCGVf4xFjIpCvzE1SbBRAvltBjwRYqJ
	 HtpMcFWC2Vlo99kc7zoJFshpwRccufxhHM+G8AGLBrwlwmI1x5F5ejYmmuqdhn4D0QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=NQGiH8fUgsei4SneEaldH2ShJRy2OxvBfza8cXr0c/bQhHsNvWR67zVgoLRQVTORh8hi
	 qYPm0I2ttY2q8Wi90yG5rA6Uih1T/3WRWsYMvpu1kHJkNi2O+3nlrvOG8XPKCPnZvuw2H
	 7SkemMLLu8k4kMn2vW3jAGYLu6KrOhw6JWwSn1bjsu51Dd59svdyormJIS49W4GmguWe/
	 Yx4sJ+iedcmAZuogQgjTYyPIUWmNpHOc02DKD1oSXvbSNPToy3tj9SHLS1v0m+jSfxu40
	 EvQw6cVp/P5sSDuRRpGxB7NOR1ltOZQyFAv4utVQBt3nb5jjacGLHwh6iJPDzFsNMgA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924528;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q5ynhCdsg0vJ3zilLbq/OPl27BjVycKze8NgFKXCEzFwLoKiKkxZENNYnS8PtQzlR
	 AueCcMJkLS+O+FDb01JpZtRp80DFAiT2LR4hmqTkTHmeQnLiJI+oUfFkOSv/I2nmE+
	 jugfHDKJ36QRTh2HKOj1kosu/04l7+xpXOCuhzYqcB0kwpLYjs5GWRm8ws/bD5J+eU
	 jgvXojWSN6cSWfC2f0HvICw5BTwt3MzfQLvVQoTUcXI2s48aCF8eg7Fcfaf2yC2HNN
	 mdCZnwsyJsm0HxxWdfU/qc7xhYVZ8TO3BYWcbv//e8Gdoa3KjlqTSwRAxK7bAf9WhY
	 KstaDegO8ANEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A261F40EF7;
	Sun, 20 Sep 2026 17:15:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87EDE3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859754007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqJL8wuD6Gaf for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:15:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 92CA840022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924527;
 b=Ep4r3leWOMq2YDTCjRoZ2S355vcczgq0qmJdN5r7VOj/qHcMrXw8i+dubHBw27w0XlNi
 svKjR6E0ewFrWsAeRYJuYiGB/E71G+KVrYZcIkgL69Lo1eeMgB+lI1FgPLDQ/5wGj4Dc6
 NPYBt2j/4CIDdcgNkSZIxJjoyIbV+oTxtoPO9viEQR5WrP874XV1u9odLwy5HorFot04C
 gVs27agzlqD4q1uk5h4B/eXgDK82zaZA9zsMqbYHGEdWx1pUuEJnr36aCKoWNbra1qYtS
 veDzKfZdtz1JkhjhsvXQdclnqTo1zXdX51azq+f61h4yKGIT6NJ7niLGHeVrHZ8zVnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924527;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=iUOEQOIBj8bATtJ7luwwg/JS2txhOEo/qOlWttcuI8rEfZxThyPjBNCBnS5tUEJA5+zH
 INpcnn5noZOkg6h6mQUXJ3IyqCIS/zXXfiTXhxHu8bHMsuyWr+sLuZIK9j5CENG/5quou
 lYl4BFrVFUVo3oT5g82gpGrrLRJOEgDQJ0Js9ISJqmWLswrEDI+rdYHWevF5fj/5C9Wjq
 dz/eb3WO2koPkp2mLG/Sg7xv6TRh53WOe/xn8xxLx53OQRwUmsqXEDSnC7XesLr3C5N0W
 kvr7YSs0AfYMYWw51DnNGv4ulKS/dhrEDocuY3KxSSsk7Id8vxjYAtvHGmYHsg8JAGw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R6r1Drze; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=R6r1Drze
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92CA840022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924153;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R6r1DrzejJpBUIP6uiXQMkIhgpndxslSZN/MWr8MxMBQBr/iytMbD8L0kd/bsnHbc
 vo655pIR/Ym7tUJFaQSpBz+GZs4DK/OebpmeRU8E32RSbKmEEpnr5Ulvq+CQ1b+a2H
 66sZd+3CjAPGxD2TPZqpCK7CFQU1fDEiinOebLqkQ+QzyNSpX2bXlSJc3jFwzFwDjo
 gaBO2+YkdvEGchfaYy8dZa7WqUrjJBNLuVV6cSD2wh7PbX/McU80V/K1CP5d197zQD
 nmpaeOHpp1C7Q/nwRqbHZ7pvr7fJEz0HF6qx5OXCGuoGo5prjroxXZ3Tv9Hjpek6kp
 rp+U9V0rP97Ow==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:opZTAyqV/SEra9WKj6OsiBKAKGzWJYe4IBwbf53WnwCA5H0JA6G/AyD/PWWI/2VPNJVNh+reAa5nebsCNMWGJo0//EPr1SyLYM6YQG3+RrfLMbRAVhBR6mE436JwSfJuvnvMRRuCvSLr3zHZGtB6j/Oqd/Qx+jMixG0oTTfHRBcbxY1iGAlko0mNl5XLec9n7ud/TWkV3KshXNIqXEeB9RdofecuHGdaAx4Jlro4OoEA4pcJD0GbUtO8WVwuzk0BrVREjVWq4sGCO52unBpXMdJfDJAE6E3Ap2AT2ZUmXEN21DDG4H6aE4ozF0fO+jl6qR4n05MWAUQMvrSnn5J6qCNfkCC4PRkFqXm7jn3pdlKCn8n13mVgZoYBwIbbWGh+n4UEd5n4B1OshfDl7v9ZhlVhGebFU4gTrEdMPiqNZsczzVBbRuq0ZLS6LzwC8tA/RS718zHd9wSvkG9e6rYZ6wNdLdlNZT75vMeg9YlxHLH1USYoNHf3iNCpDEXxYDMjDzTZzZXJj2IXElHqU/1OU53KRFnNTTt4uWMjOCjhFS4xWW01/G3EjO+B28iZRW+01cgJ7lJ1MbMxC6HTCDQUj/iOsqJBKCIqr3dTyq6hrfE8/g
 Cj1GXgM1PaeXlaeKmsmV2ravglJb2S99GanIvGpS0T+fwnCXRpkos4U+aasEu07g+8acnp6BsWYXMylPEOPLrc4z0YOYCJ+MSbdrlYYaoGWIHS4HN/
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC0ABA4C4886;
 Sun, 20 Sep 2026 19:09:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-2tEl;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:29 +0200
Message-ID: <20260920170815.240247-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v5 22/67] package/xtables-addons: use
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
