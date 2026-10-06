Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1AECA6006
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF5E60886;
	Tue,  6 Oct 2026 16:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbRpJD0uusf3; Tue,  6 Oct 2026 16:34:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C3B160A8A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304450;
	b=M/f+HGxAMZV2wbykHf0KNOGqiqDImm1J6nehi4vC9W8qSKWI30sUvmtgrfmstx5aO3de
	 nL0VXmnyENCCcdJxCMy23wzXy5kJDkNulaSMKVXBMVzuBy4Qrmhqv9gVXhHyfH/KOhvFd
	 /6o8S0E3BnnATOLyZq3l5MpBMtXCV8/jl9+mwh0256Em9i9JndEuGs1lneUYyA0XAs/Vm
	 eb6iJF6hHCC6ENed9kDCDLmp1HAEBkeLeIvZspiWHqaki01b1F5kqCNRyImoThBfmgzvZ
	 kXErtk50OeD+AYV9iac80WG3ENtKsnmkKJMZQ2KpGSTq/kBmXqRhUFKfjeqEzrchS8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=tL3DxscaSIzZAci74FSlCo5pjSscTtwlVZfDEzb5I1l9NRj1BhWCpEEAVSMy2BDpQUtU
	 WNFKhL9MAtJly2VXiV+E0UP1XXmRGPp1NL2yxJ50zvzmueKM1NKIxSckgG5GYnMeS9vvq
	 pToTpzj6a0pBtAeGpd5VRQQj7lYpM5hR+SU8TJqr5h+y71tzv7EyVXsQ/BEBNA8SSjWnA
	 x0abIDQpLzzE8WbeUhW12r5cpDqE2sG0H9Lr3giJYBrBEcTzK7O7ye0ls8dvaPG9eMNA+
	 qBqEIxC4D3Fmfrv6ZORKQoVRov9MFpuvhKAh9Cn1GINlUKS0XpmDPHJYvNhmTd9j8Vw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304450;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3JWZoSev76pUBZuTgl340RmER02qwymTkKusht1BVtRbSeW47ed5gjVk4ZaH+L5+
	 CM7rUsNwsvbsK0ERhA2I16eV8zKABTPkBpkbR9G42MVeJFhWy2w8FYM6ZHUwXpp3p0
	 WUTcdx3/8G3A0DB19a/c649+H5vDlgT7OUsbc++0fczho6RhkEW3XpTnpR3GIGVRco
	 13fusnjRUDSy10Uy+8aSGMI8pADTjFMS/P+a4aQ4ge0778HHQ9BoUPvkac5FNY6p67
	 OlW7/eBA/QqI8mXs/+11SVJEMLNG9ijQd2uM1bQJa6ekhhgMSerD0tfGmXCEA3Ewyw
	 Bx1TC4CKHLEeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3B160A8A;
	Tue,  6 Oct 2026 16:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AACB4317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C9A1402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-uHvddMkWoF for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CA2D94009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304293;
 b=KhZ5SSMmbAwg4GUfXcI2KVxo95r0x5lqMVLUO8vWKMrLYj4rAdj3DDIy6fOMYIE9booN
 dKZjLz/vCalY8KAZQTccBNTs5VdEjby/Dls4sAnZu4+97fQTJETDRRRv4wP7SAjx8BahR
 /NJcolbaSPqYYiZItOfR2hckySgwIG7GLOcqPD82h4gQ7TJm5KPPlZnBWc+jlHXoccUQL
 fvfwDD3fP03PFe4FwcVPeC+79aNsLfjI7PYkMeKOew4x2O0RgEff45E6J4ZQlOHUMxfOs
 J+h3IL9pVxdpWX863/aWvn0vyX6vBu4YFapoH+RJjvL3f3/EfpHaSeh9ztBxvnNv2Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304293;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=UdvTO0h16me/IAnDuyYk2TV6GzfOxN5sqNemkJLhCLtW1+bZJPYYR0WI1sT/c2Xq/hqd
 d4vW8BInNXIKlEyMu1K3vUq1aMc5V+X9cGH5fz668XST7Uec6BO5dHqZOQN3pZta2kWgn
 LOtCGfbGj/aFFnFPYq8B356ApRgqcxexG8c4H+QNBcUgPv85qJ+ZB27PpLJtb374UFn3G
 gM4nAsEymdawLtpndy4y/mOagzPVdb355au7bBDZ9ktoJytdn76yAAWEV+0nSe0mO/jUF
 lCPVrfmUo2j6/vnRHtLcmaiSI/3h6wSdK+7SJ1JamK3iTNDWGRIUr3TpTmufBebSxYA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=suym2XvL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=suym2XvL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA2D94009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303708;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=suym2XvLnp+wHwi1HWb8zLsrsYL+T96uQLVtbTZO1HZODa7A7J2jjwtSy2ulxT9RS
 Pc4AtD3CeJ65f7UZAQOVFtJsZxf1yyt7RzPJ0JsANLLat1BFOqJYIXL2J4H7gvP/FR
 Xpkp3FergJ5z5UobRC56EIC7+bYWnciUwFJRFN70j/yoD22kZDY8aA5lzxwFCW+lmt
 q1lc7Qb0GmZQDWSsp51P+RHXbS1I9VXyP2IZ9QtqH+WtS+epGwh+O7LdeAAydJo1JE
 Jr5Blt8d7T/u7ESEiNtrlqJJAf8vDLBZnS0oSOY7F/aWlrDQj0AXIGSx6nlSPeERDF
 M/rz0GS4YImrA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 0EjwNGxsh/A+0gN599CgSGN6pn89trD5DEcGJQy3Q9UUR46Ba6i272xZm2Gp0+jpfDI9Trn55Qs
 dHKyiKdff42PYQHnH7BteSrB83aXbH4EMuGrHLouHZFSr6TGC1EBLZObAYYwI0wLEZRMV5zfXvv
 SUOO7lZtzgRtIOJIwCCV6H0sjIGXpVRQsIS1K391axJVKGsjbOpKNkFAnJLQ3a6SBqL71l5uN+m
 8VkVl05VJbbpM324It2KOOICwsdb9EP64OAfzWzE9qAjF2avrW4O+beTkFFWbJZJNjkXKDTmrYu
 ofYlE59i+c3fpHrulbGygoCipMw8KVHXZi3JYUF8NPrzMPzlIBW9XSGGn/MlnugP2C/s8ZTltAO
 //tYkh0Z/0WkMKVA9QBrVDrV7dGrT6LRWydYTOIFlPA9NC5TEfc4hIGYsxqb2ZF/PKZto/1WLXo
 Hzo3AufGXIFxwCa2c5xiy5AnOd0syn+8BYG67xrL5n35iGFi2sgRZG44YXUv1teBiisFgkL4GAB
 uutXlPL9ozREuVXutYBDT1g/iAkWE9u2H2Q8Sc6Qy+YgzymwTZC7zNykVc6LsAS54tbNLyKZU7N
 qlZ4SjURHv2NLUKBB5uaARyYMEYWq8+cvLUczN8ikrXzcjjtRg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D033DA4C54E0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-1kUw
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:07 +0200
Message-ID: <20261006162106.3439373-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 26/84] package/xtables-addons: use
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
