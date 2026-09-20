Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D005C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467524081E;
	Sun, 20 Sep 2026 14:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TItP6AjC2vTt; Sun, 20 Sep 2026 14:49:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 56E4B40836
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915740;
	b=O19o+OLzxOeNTsq2Q1xv3orNKykCoLvIlDAVFSoMtjCUr3317PBAu6zRtnTNRsr0eYkg
	 xFJAckmXDvZjt+HIWAAzaKVSTqLuld77NmqT8l42ndrHn1yqyr31mQhldYtqdVatsgOzo
	 Pjp5JpWkoUQz8x95ITD4k/H8EM+az9g++0oFDhKau4p+AJmD8Izt8apmnNt8RvjynN9ni
	 5phgmciUYf9acn5Ap4Zy3NM8KCNOetP5XIAph74UbWl8x1U1RLxdbzpuy8gAX63V/Jrys
	 NET1/M+iaDWy2oPRspzD93cnq9P68DKGKLJyVYdIWWPp31AtoryPNjlZoZrV5i5LKfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915740;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=rUoXNs841KcZ2T+EM8dBJkqTyq5feO1q7Ay4QjDF+ZzAWg8/Bk3nhApkxMw0cgtW33DU
	 5sHKSEGzidQg7pEG7k54pk+cS6yrbSSGBsxRIakhxXSBgqNMB+Mq4LNKx0ZiPZyCvSor6
	 yMBjeM9Mt1DYo9FClmuVwntvgyLKm5FYHWEUHEUrOROwTGElMv8CKQB+ZJCdVr5b41f4+
	 GuhPv9jE+ezR31evIGg8ymi49p8RDP1XDBB3DNLysV484agdYXwO1f7Zzo15ZFBsrIxcz
	 4cTk20O1oTh8W3zRyurwVzLmF4l74ilS2hrS3RmDZOEbybJL9RVkOZgXJ7XM+ksxFFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IfXs+j+F;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915740;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYAWTPDc6gknPt515gXE55lJ6SfWNzNwKmahQUHJS9w+tkbtuMX8iGdxQh4oSYJl1
	 lPN2O1bYkkRa9EHA+DDkx1M1yufKOhKAEQkVac3XiZwkmrzQhMMX/VfiSE5wykROLm
	 CNWYKczJmVFYNKqo1YHGDhzts32RuRHjWyJoKx+w07QHAfyPC1Mxec481ZCQAIxIgG
	 m7zx/3A5viyWEFb5NhBwPfIeVTMfOEwd4gZtnmgnTDgU00Fi7LqkaeAcn5runj1GHs
	 +zlWfuZHY9TflYCpcwAW/Tj+jS+dZXfdYYGG9BXIg0pNL4g9UMXanVjhtqlMuY3OlS
	 +xgLTluWwy6eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E4B40836;
	Sun, 20 Sep 2026 14:49:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 568EB24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53E7540836
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvcVriZBnHze for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:48:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 29D704081E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915738;
 b=czItg31npkGGc0p+gUTcdggiLIJKSYM/tET8rBv/pxLQg8SrMeCSPL+HB3iyojbWhKUI
 rv+Y16R0aMA636xd9PsIEUNfVNQSMbQTkFK+qLGTigERHVoMM+C88fEOj+ETGg3QtxYPz
 bnZ+Y40V1Tu1sP2LXg5SrJAMhlzB888nC8oykaEGbJmKxuCbewKXLaHxMrv3Dg/A9GY7S
 WTCN+ASZvV+OutMYnmtb1gPHq0z7yXp+wgPvpZKDWt2DtD43nPz0p9qZVFfHKBtWc1aTD
 zoN/xHi0aqqDrf7mQA5k7Ysea5k7dppsSVPbMg+M2MXQZxzLZq20LYh2ghh+QcQdVow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915738;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=j0Edggtmwv2ZTDEvrzC0KMfgYOxlY8MpYmydkRNqOuDIg+9HplOKhJx53e5ABeDs/YNo
 /QzGtc747It6pLVECBTg3c+Kr1UwjJsUZ8KCEvUD4sk2XfpcvxDIIi5bm5PLfYpyMLWqc
 7GQClvXy6uCnQ12IZ9OiCpjS1uVL9dU3HkFmVLQpPyn4SbLjLHxUI2jphND9VOggMghnC
 i7n4VI2cNN9aL4L8HU1tCsvtncJWDWXOek1iU+Urf3PDiYDk+VylbhXR5cLtat+dV4Dkj
 qgzAuAffA72i/8mO6isgewNv7jtrUy2vFN/LbLuH3Sdg3cnmKTEAftqzjO9PrfsHYnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IfXs+j+F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IfXs+j+F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D704081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IfXs+j+F/kcqhWmbLTZXs9++tlF1pm+Y4iOKTzUD6G48PgJRh0rBsecvSuyG97IJb
 DaAuMyyr3+/krjDMQDWfYHTxzvQAAzq70BIVBM1K9T8BDbUdshn0584UeIaZ/gAP3U
 ReSskSWOUji0qhsiD5zAtU51NaWCu7W4Mv142I1zVjIYhgRdIaBVxBj8ev4BFCzNWu
 FBwfn46S89bo/3jG8yO+1wSfpIEV22tXc6hbyyd+pV/j4IU7Chj2nF0rIHCvpfeMvZ
 /CPkW23atTnIC57vXwxXPtzJB9o5HgFDMZTOIlQQndU6aiXhgfd0o87n9Sb0ZR7Ke1
 9x+cf4qSWgNpQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:ZICn5fLXBuN8OPXN9LTygA1L0EMdrlDIMqZ9xEuNqg2li31OTOf7cn5M7MIZoavZCv48ddQaqHqcMdEJ66EwmybNTvbxSno4HSGPpuj/R9+vuJ8W9V3fklvuP1S8tTDbhsMgTToI2QNdoTMOgNZCaAuIGPlPHKAPFI3LDQ/iUHcL3h6PHCnm1Id8Itt4mR+mlUhM7NcWHNjgZ0zt+tWXdK6BGL1SWA+rYNgaqZOasDdnTPEHExnwp+usHfRJ3bUGwmA9pEfmY9AsBY7Zb5SDiO3dC2iPK6Gm8bikOW97AwRvtTd/p2h3pWlL8gYPTvAlonpcZWFr662RmfDdEMqhCNA1a2fMQygO5WubH6Tc3a6OIZLoBd8kyxXoScNhENNLzmYZ1LXuONlndQdZbDwHKIQkGWIWdRrnoPY3fmLY6bLuOFAU5CShiPAqHtQmr0u+L/aopb8B8fwPJVqVg48mGusz4SHlwINGVMZW9J1JdHqZm23b8qt/3YbJj3ADQ+E6J3aJ+cLkpXTsN6OFKK2bRgQ9BNIuvhDQbjuiSUMlJvddP+cviQ5u/bNg72KQs5NcuOCfPWaYSmO1BexhUP9t8rRJNj5JLuYpkmltDff65V5uwu
 eOYpW8JCmjd0hGlNflwoXxypuutg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4423AA4C4875
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-3R1G
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:44 +0200
Message-ID: <20260920144428.3009612-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 23/66] package/xtables-addons: bump version
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
