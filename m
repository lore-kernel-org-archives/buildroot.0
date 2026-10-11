Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC53CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CF860611;
	Sun, 11 Oct 2026 13:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6SahZ38HErC; Sun, 11 Oct 2026 13:05:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 23D9F6060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723920;
	b=WBPK5IZCMhAusebNwXewIuHPT+iTAyPl0sBd6dBXvJMvderIu2U8rspa5TKQZQvHl+Nz
	 rkgBZ+HhJ5GRtMv+SfWnXkgyzTyT8t1h6jSRssC3LrWu6l9GwrFSBgkwsS5Vj83n6IALl
	 wUmoO/lzZTDAV56088GtyeVeeG/ZeIPsFMWq2wH6Cx/gEaA+iqrucWPkyzAAXgSzGbYpo
	 uuy/SDExb21Vtcum9bDu5o9vtHAnN8vrIOaDpzMy3Qpb2qKz+ALSb888Z6xJ/Caaszrmi
	 2QkVFjVCPQn+OzLnpjMVtC4sf8KkXup51gXNlaBVO1MqKvgfOu+UlJgC10Cw+SRlKcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=LGgAVxMh4pDGyyYYDXbBGhVIUgwTGTTn8XsJ19BHMayjnmZ9wusjVMbtclXxV84awG+t
	 fDKToOTrNvILz9dNKeXgvLDhxiMoN/GhhuIq8YowSheiYV4Vw1IN0EWAtjOlfu9+P+WsR
	 2joX1ZK4VP8EixWDKC+ocdV7Qvur+p1sSTw3wfQiQA6W7vGyJtyHgji1oCZX2nOaGxHm+
	 o6Zn3ZZMCGsm7MwMQLXGiy4TnawJmHrnKd+Bh4S1glUYQLuzbzoLX0/IcuT7wr7RkYfbz
	 IHMrjotqpqvAGHjpNkSizRr6wGrM79uwIuEo45k3iKwm77ROBIy2hobHy/OIoubJI5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723920;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdznXQHdTRHqlM1n+uiS2KpnytogZ5ZJTHeW368ngnKBdZ+E0RmraHodHYsBO81ds
	 JV34hencm27w+dSSA06BvsMrdmCbXGNCvqQ1vTrDGFLfV3Zs1R91E9kvUUjZRrerAN
	 n1xrAX/aJqTzXiW/Nrnnvj9QkazG1H1F4neqXRtZ8nI4ufMcVvvgIqA/4BVS/xMiOu
	 2JDnTYOqeX8f0k1ASCe4MApK9SDA1o4uuVGrNrVinehBkE0FPhStOHxFkgzrPCQ+sU
	 0D4td9ydZ/xzU02MXlNbdUAjNnQC8nJ5ngrVlUaBfhCYK7X6XHhm8RaHI67pquZxWp
	 r3IXa/3/fpWRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D9F6060E;
	Sun, 11 Oct 2026 13:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90512111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76980405D2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYfK6-t97ORa for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0BCD40585
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723918;
 b=fAHTYkKqKNMXUD3384n2r88/jxizxE3k3FoEkkX2ujORondX9sijH8nIflNHvHjhJ1j2
 mNz/iz4+6EaAoPEPSiAMf4/CRhHMSUsgEgChXTvqyD8XQN1l0hCnNBYab9mlNNRyIu5TY
 nagGQKYGb6m7u9pI/Y9xZxPoTaCfyMdFyjEnP8Z5swiECNtl7sv18tdjjR2PiZ8KqJDMI
 wKRW5cz2rIzn6h46k/10zARuHgRlzmAly08gvGaJ3I2fo1aROi5Soh+vZa63qIFEGVm6D
 ixPG7Ieg46u8Aw+fFaRCmNxwmCjJT6/WDYSL/q2q5rnjBQiyTOO1pMh34mqTZ9nO0gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723918;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=CZ4XgEEG/FJ1zrsNQ6RG90zDrYveVeMh/1mi1ZkqewYsvR9kgL/EHfwpiOidjWankoNN
 ZgeyBWKDQVCBChD/guyJOOZCNQqhFdttPH19SqsPoQv4EUQafsTX6XTsWYY/y5g1wC3aw
 tQdy9e50/ocLXdIcWQnEWXT2OE/5NvAZSCemd8db4rVgRCh5jZFTJlE/khjWSqeLCsl3m
 e43mIVvfBwVq5pSPBP0DjP4hj/EU/AaPN0geQcNNFY02PjXHCdPEDWWGftZKaOpCXYzDl
 z9WbAvZLMKK2gyOqy/WECdhphdo+TTuMV2fbSCqzU1SYfNrtqoraneESVLJhlSPAanA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jKGnKyNL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jKGnKyNL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0BCD40585
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jKGnKyNLkvZSNlvHVAf/jIOVbA9hy1emG6AoAWpmchEaSgttx+B9BwwtT+5Nlc6jk
 pZ5WUHkVb7EJRfh+n/XNAH0sFk/bfM/BljA5jT9GuXyUH8q5v7NUIURbT0p0Wl5arI
 8ZhQkeeAZWRYRFk46Hz29Tzq2EVUHtHUuP8qoUxoehFLtZkCuoFyXntB+qzqQ7ClUS
 e0CoyxG47AkyoeCXNKCLtkkZDKB4KtqxMU9lQBW4e5OMBNwUvk7sd5RXB/26HvK6qT
 UcHDv2kqeruhNQJTPM8jsHTtSvSNXS48EQqVobZ1rjB2PwG02426P0ePorr4uAN4Ld
 kikY6IELbIOiw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 iyQe0dQNthyPVVZ/Lwk+mJq70eMKvvdVECPl0GVgU3nqamJNsZnF+pc3H4j1DfWFAq+0oaGcM4O
 EtIqAUnvPoLD7DWdki3R1fjLjICfaWYRGykVp4Xa/sPaJqZvHuBgV9V/lul5EEsqEPCT3qRqwCU
 ZxAFnKqYzvomV79vr7IDvDph1ASJ2oedv4/vddediZiUEfppL0JvkrRRC4LFYUqBufGz9eT9kJW
 sXOSkVKFghd7RRBayn6ToM1iKxBT5B6P09UHkjA/uKxymv+17gf/XUGRY0hr4EfJyJm40NNX64u
 ADgvEKf1KT73occIc+CWiH7SVOn5zXrMtk8NDiDyATdtVCyvUBfCAes+3/WrwZK2GSvTvTVbuZ0
 0loX5jJFwaF8NermFi4V/oH4beNdGiH3Wp7BZyeDNQNGE++g2bHjucG4gaDrHI/G0gG7102Wqxo
 a6siOqFZFiNevpdBKaUAR1noXuVJkvOSkuNOLCFt4O5Dy1q2QkvviDqI7pBu21zQW+MCrbC5Gnj
 tJkm7z0q4pLE3LHoRlV9P/uDHGNsyKHrcxJ1pzwHm5ujhF1wkV2UEJ4zWG6JY3Iw03y7tNaeJWF
 8ijAztfzGKdrd0iTBqV6WJ4GFbAkVHTkIoAG3uYE/9wk7B/oJg==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13F04A4C585E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-0Zb7
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:26 +0200
Message-ID: <20261011130058.3443432-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 21/52] package/xtables-addons: use
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
