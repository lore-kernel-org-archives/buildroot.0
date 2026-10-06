Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEA5CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 243E480EBE;
	Tue,  6 Oct 2026 16:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5L6y9MgtXvjs; Tue,  6 Oct 2026 16:34:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C13980EBC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304452;
	b=syUCKteggWz7o9ESwVkziMuN+7rDbbivP4MxahYYQyr5k0+zc8bEcxM0iosvnEjKLN66
	 ZdNZZKvkrz4rWvAicWc+t9FpnU6YPWoP8PnFQwzi8hhg9cuszQSUpjDuxExBB7wtsC25g
	 DpEdjyFEB4rLev1393ACY4x4yUYcc8YQLVwdfn1hYJp27v9IL2BZanHxO/XgPJJwSioYp
	 QYEDp24fBavuialO+yMoV8lZ3kQpGR89r/SU3aHdaeFWv2u3qu48Cftt6vUFkF9rW8zp3
	 X+aiFFUqdbnk2bAC3PD2/3Aqkb59l/H9DTQ2WWGYQIFmU6Vnae7NxVRQRL7zexgWcjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=fUVZYmI0kIOePOC6MFyVPVDdkpnSFbcnHMpUNF+hBD4PrBmWA/fvvlMDG1IeErI+lM1q
	 2qaMFJgjn0vBv1WyVY+0Ee0SYQ5RhCtg/dZoFOkV98OyBM5sT/Y/Kw9iQbdJxadyRiEaL
	 wgzUPBl+mBpzVKWbzVMpnRit8e/0mDGdg67D8ju2m3MTDoWuoqhaCBeLXy9rtMRiL6bRj
	 jyRtNWqdU442rKY1oehlpCEpHldrqeEOOG+3xDCFdR/3/h1DjJ0F+CaYnhdM6FT2rhuYT
	 lXsaXHj+dLnY7MKGi/q9gcxzgmEVwjA/7zdFmgt/uZNyl/0l2YrhAgwfhiwxBbZbqJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304452;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsCce8Nl8NobzWsSgZkIzLX7znBmR3y1+emKUQBoZY6osCZJiucV8IS+AIZDdQRjt
	 yTMIVm3qaUZ2pBfq1htEj8RISKlWG6QyX+W1OtbjXQ7TdDfypKAn/AsjVciqcR5QnG
	 Xa8CdJDfEqJLLn/pvnO+DXHLmiiGLHQQfpu03wUsOmpt1Ny3Ek5Mk9eni8/QGzA5Nh
	 /I0H5Bp3ydRhJR4p6QFfLZS8ZYYKhzgf2zulSomXWQfgpWfLFkdl0HjjvrTlMvX+vr
	 GdfWQeAM4tuEWMFd3HNvFksAgcXwlNmO+welQ3x7YAU98oD4cp2GQpqS2d8+fbB6US
	 Xd/ELQBXyx+og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C13980EBC;
	Tue,  6 Oct 2026 16:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58D96356
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA0C402C6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrHYtNY7Btev for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 22765402AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304305;
 b=bWc8bv8W/QmtOUMAwhKB9Syb6oSMVerByOIYOvzDR4By2QSBi3OcFgs0QD2RGGuu3xAl
 kZdid0toPnt3kcHeyMYl0+EswM4kU3yzBI+zfvtN/CTzwTw43CfIOQ20BXvAbrO/pdr40
 Sxm47f66i+UD3q3W5uGMZpa8cbrhuoAw8bpmCNeVZf5mEx4Jrn9RoEOI2h9DcaTyAEFjs
 m5bLzOYKHNAUg5Y7vbBliOwXvHVp37inG+AcqVIo1xVaFLPE17KmId1VUeGUNFLWShkEm
 yQ08/9Jgg7B4KqsOdbsxqYZHiNkhBKePSLqwhpJo/NavvAunZaiqQHTuI46L6KD9xRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304305;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=SNpIjgDKQwVX8HBlgCCuUocJUoww2T58coXfY6b9Jdgov8V0x9uM+OsnEVE/cajZATwP
 9BJK8Tq14saBcEX+QP/rDlNpGyWq649Jadxjj/SoQSeY5zMGdBM4CGTzWL2VyLCc1mudd
 YM7EtroYl6XFk57JYooPb48FF/De5JeN+wrUQ20HITl9XfHaAWgIFeKdjOLJdXTkb0phP
 GFwol6kAwkxq3wuGBgTXAxk8TJRB9wNJH03m3b+SGJzzH42G/CH3JgUzdYHudZqhhrJ2C
 shAL5pO2+Jl6UjWJl6dUwixH3xxZ3QrwXH/hybQk++vyxRk8u+U6gBA0ZgaZ73udj+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zuaiv+bq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Zuaiv+bq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22765402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303708;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Zuaiv+bqRAB5BKzASxt8iNdHz8ysWRd1cC+ugKy5NkHtHfVv2YHo19ip5TCbsgGUJ
 lpGdr9ldSyY5EWUkRfZS3j/Hil3LaZt2qMh9G62BH+c1egF7thTQDqt1lenNZbaNLL
 TpbF9HFOK8RRGW6Mh1Y7+9SbPIDyMl3AwtkGRuALyX7qWTbHKe9v0VbeUExzVl1r71
 HcYUVHdKfNsZgYpW+dhh379McT3xrXns/0aFCgNYFvp5oR4NizZNjEn4huk7Iyl299
 3O0GgA8rwH4kaWAFJs0ZQuauFWGgPZVDMKkkLqlUuecbM0VU8S5GR5R7QQbjh3+Jh3
 4SXZdXJIqfyMw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 3QnQeobOjG5to0Dd0Ofilc+vhb03jJ27zCF5M1wfloQ2nAMTkJOQ35r32zUie94wB+LrrzHFUJY
 ZultNKI3P5A6idM8c5+CPENq1GgC+3sHog/MUWEpI1n9gtQXOSuETqOU6K/QcYZviD8k2oDnhm8
 XHVmsKa4Rt2CfCd5qBT2JN1agbm0fqCi9SEwe0Sk48JKVuLZqU0Qc1uBzmIKtbGKVwawU5yCHkA
 Tj1KNv4W2fpzuH7EJEL1dTxWGRbs6pjqEMllH36DgJP2z3XgVhGmi46TCWeF/bRzH2REb7J9wpH
 DFSzCLv2aDMZWuwrxUj0d8H3STHnAJRMzy2zBfmUYecyqKQo28TfcFc4DCTSGgo1y98VKIddYiD
 nxBHp3e5VBSjIdPwq0dsIlNjKcmZZwNHmWjxCm0E4LBVbRo22swHHyNJIAl18RqUGeHKMcudFPR
 m+tvqeNxkQt2TZq53KiY0Tngcys7gdFJysEjdUtAArp8Fe+/em3IBgY1k8CBkcHI6Lx4l3lCKgL
 qX9PpDkuf1OECK4Y0Pwh7KnsMKam61SgFljaKiIdBrqWmd1Y7SLqguULJd+HIaz3Bs5nBElscYO
 p3fQqEjzoRm5ff3mt7uOPigFJSdkYaDU7qDnKpyCkvxe2mxPng==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3C1CA4C54E3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-2A14
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:08 +0200
Message-ID: <20261006162106.3439373-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 27/84] package/xtables-addons: bump version
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
