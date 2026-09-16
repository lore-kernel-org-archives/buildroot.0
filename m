Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C95C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C68380DEB;
	Wed, 16 Sep 2026 21:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUbv-F_ouQfh; Wed, 16 Sep 2026 21:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3169080DD3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789593252;
	b=mKfgef8k1gqzBlPrfYFehwaNsDQ3ifQqoe3iCqsMLUXxdqMiCj5KNrmq9yxW1BjiAO6j
	 cuYNdU4i4aEWEsK3r/nS8WI53+4i85pjJ9FxhLs9Xv0UuquqU7AJzeISRq8Q0Inen4nQG
	 7kmv/H43GNfLGpOxFqDPJLIu0KcIsFPWxAjiqYyhrSN9YikXqeXLJCsLkeBo6vyMQ/FQC
	 t4A+51vtv+g/f5fPf6BHg6Q9PAagaWR8r9oMa3jD4fuFCRKPrJvO3dFT6pqoeEadhftwr
	 xvEVEk/VoViVfv2eHxivPQp8BbEDH2olpeKv4iSu6sjYoUEpaqABecdAHaSKjawXzrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789593252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J8GfxAF2c3D04wTErPCKbWMJNsd5nmJxzaBTP4kGUsE=;
	b=T1JWAxDA1o+dZwoRQH9IcedJW5MV7ZuY72tD+fB3b1FmAMWFAZuyUrhZrbXV354rQmqy
	 tLgX/2q/Sr5/eEmLcb3GdVLL1ZSeMUreZ2jexBVHV3dOG94K+c+SNOODDriUa74/Aq4TE
	 ertQ59dNyCvKtSMbFM4Gj8JVMejKDc1iGDF1vYtzjIxOBd7PheSjexCx6Rw55xvvwXjIA
	 1uLcqYVBIuEXVO4ILjh5yy8EIO/kE0Vnbq5Klf5Gd4+vUvskmT9pg01Fr2StqYSlBJHKf
	 YWV2xfOgoXZznmMdNDHj0espLbozNHjILzQ7Fd3nzC7XoKlFNjQrPCUhNIko7PzmX+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789593252;
	bh=J8GfxAF2c3D04wTErPCKbWMJNsd5nmJxzaBTP4kGUsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ooe+jE9OPutn7Q0yIGnvCqpnbUEk3ODtqPDVFUobmk/Wb5KSbuDcqeW6JehRW7iOs
	 A4MCNvzSXKDKKymsiyKf1tU9bq4etoz6/l4jJGACgvkYVFk6xzsrnlLMg/8vZgnT+x
	 C/5f+L7yyqyIE9psC0gFxBZ/kcNuwH2WXECFS5fpRmALgsCD5PJUpx8lFHxmtt9jhF
	 HbU7BtmbVw0mlKm2AmzlPudU7YXjPb8Wkw/DPhACaaOLfOTarfq+DApBalVJSAQbxC
	 NAr2x+Oa6Sdn9AG7Z+pqnvGbW+JXRdZ/coXQKZisyHnbw+3uc6hTZlxYD1FaJQNoJt
	 lK8tz+nuzdrLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3169080DD3;
	Wed, 16 Sep 2026 21:14:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D5A52E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 531576062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITj5qmgP7Lu2 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC82F6062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789593250;
 b=jmSgpRWy6ryEav+KBl7MaJicNwrPBP5yBl+ukTRAKJzfZwXQDlkRsOwNysNA+WMcH4Xb
 xzXUgHjJzecHbkv5ioY/ZVjxR3wSuEnCtg7Me8rP62672gHhdEzdzQO0HFF25fDrhWOgs
 SMDYBSu8nwhH5Jm+byYF+myoRwOhyBA7kV4ETFQ8ga8jZzaosf/DHAnylIbWUnrdw5p0k
 6R/umLLEswpYsIFu+59ZqczP7k5PwDYG1+PTbwZQLpSoX5jOT0Q6KKdGGtDpDLKymvfO2
 mpqHzQZM23uzgcwDRFCZ8owJi9pK6ltGrW6f0Ofm/In7UwH00aQ7MDd1VHta7ptshAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789593250;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BZGjLvdE70WrMkVX5fOHypIyc2+TQrwL9zIU0/LUbjg=;
 b=lvEVMsbqTERG4MzIC3nIc3zCsCpOwIWdls409vGpIp4C0KLM+ORyVynZyEb8PBIrVYQg
 Pd6KLVULMme3LShqabr7I8eN+Y8Z+mamabkfMJIe110+LAmgUG1cK/Ey0+knf717JsS6F
 tyLWCF6Vc+A6uMFaR3Xr7Irvzr7clEiTRCTE5qqYmQNKwvl9msruflcO2PSqK0H0BAri/
 nkr/P4kanUIXiWssER/bHC1aM9wQvLCSwzOuASsYc+Tyhe+f/vrEa8k2DRLgtGpeaIOYI
 jMhvDH3NfAQ/aajgv1fL3PrWKbVdPtkf/6CSoadr9dbI/ine9kxvecmU5U9vTB9a8Rg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC82F6062D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C31A96B1B; Wed, 16 Sep 2026 21:13:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:13:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e34cd7c7e5094f99ee26b24493a9007b646c3f9
X-Git-Newrev: ab8471868eaeb7c55b74eb00756c8d5942319daa
X-Patchwork-Hint: ignore
Message-Id: <20260916211304.2C31A96B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: enable
 additional kernel config option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab8471868eaeb7c55b74eb00756c8d5942319daa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Not all Linux defconfigs have CONFIG_INET enabled and this results in:
  LD [M]  88XXau.o
  MODPOST Module.symvers
ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!

So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.

Fixes:
https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/

Fixes: 003ed345b1c4f1c11feecca68bca37bf871001af ("package/rtl8812au-aircrack-ng: fix build failure due to double defined endianness")
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 1308508e00..7981a382b1 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -25,6 +25,7 @@ RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 
 define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
