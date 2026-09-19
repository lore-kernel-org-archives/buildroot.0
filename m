Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF6C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DB740AE5;
	Sat, 19 Sep 2026 16:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYlQhhg-q0I8; Sat, 19 Sep 2026 16:05:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6B5BB40B18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833946;
	b=VuJiA1oUZChYRKiAY0GN1LshxSP0ZmCXtariwf4g4f17IRHF9q4VEpC1Y0INFBMzUlpz
	 l+vaS2rEIjqS9dRCJ1imxdW/7UjcbrTAZuBzHxD4QdUc2g+qGN9scn/SRDy/bw03s1Ais
	 lDw8oAl9DNkMgoWVojNlqiZ8JOErhLOg+wJMKQK7deDzq89eRDmNXuUughfkjhHJ7P17Y
	 2D4VL1Q1dRJXVCiE1iGFHAoEZHA8OdecmTaIieOiUggI2ACYZk9YB/QUDqFpSz5+dk0Cs
	 8znLFMPqc7wFQqoXNiSvElA+AAtvC9vB8syfvFMw3EgHM3qIED5qieRyZ0vDQcBIELQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=nEraGu6NagOGKdvmExLRboWz3AjdUWH1pUf8VL27buc9AYCHKl3M5fJNoos4tnxXf8gC
	 7ccz8tI1js8tJ0f0VobmURdohzoiPjpZp60XdXBQTqL5djkerM7KNw3YR2iY2y4iBJK5o
	 ExlQAucTesph7mBmDnG98sUXLV5biXCYOOhk/ShLbMBg2twblWTnkRtHVPOX5pwlWqExN
	 ulWPTFmBifKPXVy/I6ITFXeo+ZYfFi8+zZUCYbJZKREe/0cw9weyu/X+EctCzOoRoc8+u
	 qVGwp+w9Bu6/bD+MnKMP3gxm7iYPTyFyCiAlL/+y8POfHoeTpTMXPIgIgGn60P/Hx4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hc+7SQLo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833946;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rKMXw61mRsk6V7CZHvfmjNwTDe+zY+DAS6yoyoFZuu0PwAKIYgymV7+R/kbi3r4Al
	 Aa/RJrX5/AuPoIKdoR/xEcT7YWTP1ZkyIxBKfCixE61Ur7mOIBXbVVZM8eim1mC3T0
	 znMrwVe0gk4DUQ+ZENlbfN05xDPn2hcWXEPN6k++VFVhhlEllEudsZxm1aq6IQoej3
	 7MV82hVJNeyHX1aJyjTQgN7HAUxsKbrwikbGzdt4pD55kk3C9jHA6tDYfG+kK/4Yzq
	 l8heqngVog1Bre+27RYADzkwfiNUmcf3IDNouzzxE5AL+BqgBz6BrsW65BlEeANLkP
	 CUWje4m8bAuEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5BB40B18;
	Sat, 19 Sep 2026 16:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 573F524D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D48340B18
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ebtu979S86v for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:05:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7508F40AE5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833944;
 b=i1PbOUroEIsjSewNLbEdUUJIzs00La60LKENaP5aREnIm4vpQIecIqQyx2gqL6LPAP2x
 qpPDB8MJkMiBq8jCMO+bYWghYMoQDe9pgEmj2hsHro5+ErSiWbyzKREuMhF7R9/AUUbSm
 4RKGeUY2TMDhgfDJCNJBNPytnnu04sSFC0G+Yq9Pgx9VrOFeWJtf87huP0Gh8iROh1As6
 4UaZNFF0NdR87P0jLGRIc7eQ9igtTeYx0kiVpjWLEDArSd+avvaNkvWNVIiTQPtoFixLz
 +TsSRVoa0kVJLKdQOWu6YzEOh3gCbYnBZXs6FO4eIjSy3k73eck3IruNTo3jJcLDyvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833944;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=Vq3TsfmrU5lpl+nPV/xl6fMQ4gXxGl6x2DmOtedujoatZOY6+eVj35uMfo4Ff0ow99Rh
 CxUNSodQ5FAKu63/Zqw6IKZo2iyu8VxluBDjhlu1SoTHiK6edGr3i68Qx0t1WurJ01pj/
 ExPSE1KDeWbp5neyJ3jowuqSjWRrxY/7jlqyKQIZsWr1mFQGBxkWiZxjcbWk4biTtWYVf
 VFyAIfh8qy7RwuVOC+B/52frTmp6VdttnmbWC5WzbaBxujDJ/uNWmjbp3AoZ/16TxtvZF
 Ifpot1+171pRYGZVDDnmnye8S4v4qtoVNO+wxbvncXlBXj+9JJ0pIdqRgpkN4UPaTCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hc+7SQLo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hc+7SQLo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7508F40AE5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833547;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hc+7SQLoCLkBgjLxJYiD8PlLxgoHF/yPxTf10HOy5Qdypbt/mcwuz9ZHwNzfi9ida
 7jPq29GByPT+AcJnQRzaJEWmMbtKcqyI6gn4+7MTwdo7H78Wx2blj7jVA6fnyjH4RD
 JekovdzNXHxm7/IaCoqBaGBQo6r+2lrM80BBE5gNXOnFzHkjh2lJpijBPEUQOsc0Gw
 S5PQ+PjmMSfEVWBEh9mugVNkFzVXHLsUBSxTjv0ghsxa0V1xlICTRN+Idp+xzvS7hv
 PxeP7HE84osutrqlOcTBeFuapBQzr5FbL9aQ2AaERUWWukNijSKKcIrd/ec0e3qlE8
 IdTSK5i+XFO4g==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:e3CMQududORwwp1xfkl0NAoVw1ac29J8qXrPYrQhHZ4VRHT8IBsqF4TZca6IhlJXX6QKzePixuA+gEilSUI9FrtO4mxigMPEyzXIQyvWHw0LHbuCMjb5fLeNxJhGM+/9HtKR+59oTrXx4cxOfA8cwWfHVzBsu2ONFhjHJah7AYaorKQThnP2TxDtbnNcnLUNEd8HuHuLo7qp3msoiesFTKOKqsGh5e8j77MwM0y1NeYB3CRAYg+ghNXj4o7xVpb8lGNrbzMZBIWquOK1zeoE8RJTwz8ELr1lGNYbNrYqIGKPI3uN0TzaXMg2i4NxP9A+wOYcs9rSHlqRFvjGLZ9ijM9nS8Myh2VYf9+th23cnZeWPWSfU629qJqfqopzExdfYZyiRQIWV5dlqCjBYKXj7mDs1GpnqyKvvT+mpuPGNFh0I6pwZG+f5GB9UKY7BhEVQBB3I0ipKwoaQA1iQUnAJc3bMpiu1lLcPe/DgzUuQZteR5qcoT7hmYfUy6d0veIl25KgK15nlmiFUFCv++ghV1W+/R5xPYEJRVFPG5tSUNbB4fwWMYEsaMXhPqFzDC9p4OyFiIy/yXTMULEkPaYo8a/A8LRwNR1l9XfPplUcL6GFYE
 DVtBYMWccaowgWt0MN7hiDYu7MaXfj8M2REDq7X8PEnw5DEywIyVdQDeklS0xJuqwP5LCbVTVCuhg2yTIEjOETnIevNwmUKjXHIONrvS0V/obCkg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82A84A4C47C1;
 Sat, 19 Sep 2026 17:59:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-03FD;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:55 +0200
Message-ID: <20260919155845.5776-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 30/77] package/xtables-addons: use
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
