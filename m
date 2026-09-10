Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC0C88E41
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 21:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FD540B59;
	Thu, 10 Sep 2026 21:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lT1z6CTUDk-D; Thu, 10 Sep 2026 21:11:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E97A240B8A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789074683;
	b=j7qsqgYU2//fIZJw2+3KcoJ0P/fL4RND52/p7Jx8mm45O+4jVMOAllo8af5NiXMhwYs7
	 z7mKeh+F0NrIJhNlGazEFrXNnflhhe8PQqnFu+HufGJKMIzzTGKFjn1BRL5gREsIbPSWS
	 LAmHZDWJ9Twz+/a3516H836SHNf8+1/lv3aZiHCL1pJMzQ5xhdpkKSEf50xvH1NMxivZc
	 Q7lrh1yxAM0lcs6tQAYmKg5mCC1oBP1yBk91sN6iP+1YJTICa+3InlrE1F5C0fGxpoRSd
	 KbhBhaew9HYxZrzxkBFUfRywo0rSjmnVmnXkxuke/T65vwMnvjlfZcuuP35CrD5ao1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789074683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RtIDaZ44NwWWSJbXdErq0zImfAHeuGc09pOWgC+6+1I=;
	b=j6yg+z4+WvQPi8x4OEA7ttjj/gYBY/ANOOFiDfmdNOKGA6+exr/Ski/z9BzUqGevp8L+
	 EKhVNoiKLNn1AdoDI4JFJKWG2WCar9RuJFBlU6s9UWn3TxpCCLnLAFvXL3zO2djqUy8Q8
	 vy6FPpBAQhpM3IQ75I6h2asITcDzq0rKPOjBXLrHOkYgaufhBFElWmnxDeu76CR+ENLFc
	 Q2ml+wKhhBGqKzFL9K2ah2+JUsjCDiDEIVv0NoZQ+GzIcCrulDgEUrFFHwShtwmgTfCzz
	 wuuUKrDyXxli/2piGgMq1G/hmRt6f+jrgvDn/AAlEgkBS9CevKdPLXa0l1JR63Y4u+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789074683;
	bh=RtIDaZ44NwWWSJbXdErq0zImfAHeuGc09pOWgC+6+1I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3PwvwHHmS8wcHdnAXUigjJibFSmwkXT92VmfGikxGbHpo0MZvJcU5+Ox+W8xaL0E
	 vbErOuKY/cDULfI/8nVQrWmjQPoDrxU2ig/DCNLH/JAXPHKrsBJvnd7pIxfB97xfQ/
	 G9zti2ZQyq/Llf8jSwSu0GT2n92MF8acO3EpOoJKidmDVkEjPGhlAMNHCIDaCXCdA9
	 FsV4A0UgCL4PFSRwfvSI55vkLrLCGzb6R/YdkzCM9Fc2lQjxwAvzuqaCeN7xm5fjoi
	 I0NizHAjd/FSm2bMpkJlIw52Uu6amJpUG5vKUKbhEcL2TnFsRDDmA7EWo4UmIUC20I
	 YzgE0FBqEEDyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97A240B8A;
	Thu, 10 Sep 2026 21:11:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3EFA769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68C3403BB
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGXsfKTt3PZa for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 21:11:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D30EB403A9
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789074681;
 b=FKPx8pLleH6wQVCOKUJfMd5SXZSjP1YGjROJTjsFPCsjT+UEyx55Fv/Pham8gxFvpxHp
 7uO3uz4dU8EGGs+bBYBXvO2WEaDtHoAp4REnQYNJkSTaPi/IeTrgGIeIl/RexIEZ2j40d
 5TgyMPI+Tmp+MrFClchdT8wa5xmyLEWCW3i/okylEeCD2JjAgG7dp9VyGr5/3nTg5plBu
 S16Q10dPR1vZfsOofe1lzS4FFOha+Rr9hyq1EpUU+8+MqvmrgGFXwA/L4vchCxcFnXFsG
 xVFn1USkdjNAbN5RDKklcNmEm/0+PlgvfqpxK6ArF+r4U4iSCrafStv6Bet/z5eYxig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789074681;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Vsei8xUyNEMkX/v07owdIrFi+tuLVSxPAtQCZAvk2Vw=;
 b=kcChDiaORpUbAVZaEgu9C5K52b/gs9JAjZH1rJk3I7XZmzBwSSjtvLkEBzYDM8dpQKpw
 H992Pf7RyKGn9mNg9ejpVYuB/Pl4RRFtLXJkfZY/b+7HUm1x2tbybwQ9F/c9zlCombuvZ
 2CiZ1+YdWbmKd6STuxh/akc/8lW8nq1GMqtOSbYFSmyl7WhKlfYOavixomsDlRZ4gj7Wn
 Dt8Fjf+AKz3AJ42j40JayOmvPb9WGqXPWj/Qxq2ZpwR+BO2zU5B6yBkyP3B94ynkLFvc6
 avfFnckPRMdNHHtXQY9TxaaSDEyxcxswgpnPaZtF54IdviB65h8dZx1U1DyjaGXH8mw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RxtXpQjv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RxtXpQjv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D30EB403A9
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789074664;
 bh=Vsei8xUyNEMkX/v07owdIrFi+tuLVSxPAtQCZAvk2Vw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RxtXpQjvUS6o0EOHsiZGAbE3I8+VJJ2fZIZeB2PQzcVP5LHtq0KcGrmZBg1Ts+gfO
 DCJqmDoBwGfRl0Nu/94FFWll7zRA05TpX3Ed1RRGSbtKWchCYFBZKnh3G80BTSdmBm
 o6Fvwy6KGeAV2Z2/+JaM9LZ2tUeObX79TCgFM3tDkjQbSIjzp1asSU0/HIBl0MWxyv
 KWF+vT0ErbfFyTNSh+LsaGflSsg0+cNKF9P9pOz1u3tqs5t3EREMjKvsrdTmb2v06S
 SEoqYgV/KYbmbJ0zlVTpIclt+bITNGAyADDZVF97NdKqu7Le6gB22nxptQizGzW05M
 9QhQGET4CJVoA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40306A4C3D25
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:11:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59782)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4m2x-000000007aF-3OJi
 for buildroot@buildroot.org; Thu, 10 Sep 2026 21:11:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 23:11:03 +0200
Message-ID: <20260910211103.2554103-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910211103.2554103-1-bernd@kuhls.net>
References: <20260910211103.2554103-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/xtables-addons: bump version to 3.31
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
Gitlab pipelines passed
https://gitlab.com/bkuhls/buildroot/-/commits/248d6daa7cf04e09479dd9b1ad2ea434d9b151a4

with these unrelated build errors:

bootlin-aarch64-glibc-old/build/linux-7.2.4/.stamp_dotconfig:
*** C compiler is too old.
***   Your GCC version:    6.3.0
***   Minimum GCC version: 8.1.0

bootlin-m68k-68040-uclibc/build/linux-7.2.4/.stamp_built:
{standard input}: Assembler messages:
{standard input}:107: Error: operands mismatch -- statement `movec
 %d2,%caar' ignored
make[5]: *** [scripts/Makefile.build:289:
 arch/m68k/kernel/sys_m68k.o] Error 1

bootlin-microblazeel-uclibc:
linux/linux.mk:690:
 *** No kernel device tree source specified, check your
 BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 settings.  Stop.

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
