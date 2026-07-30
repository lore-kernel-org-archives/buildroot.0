Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B4DC5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 17:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83A581193;
	Thu, 30 Jul 2026 17:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om3Ytfd4dJJ7; Thu, 30 Jul 2026 17:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51C88118A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785433142;
	bh=fCQM0H+gpAi4rJDYgSMiFzXz+Ik0EWvL9SdFYwvI7x0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=EzA8jskudgl20bn5GugiPOvJpPAEPRFiR9fqTl1xFI3yJCqm92hQvxycfNWscfuOl
	 28sssgKD/wU0UtQVUH2WDRior+HpnGLcSlA/1CWKJaWcuHsSsopy1guaUXIac7Zrf3
	 E6B20ec6z1XPlV8W3C72QbJ5zuNgog03x6L5v+8v7k1GAJ45nHFZ+sVDS2M9xxrJbS
	 8lJyPk0GbiJmI1OOeRW5/yV/NbmqOCPaAxopXQsxljmDqR0nVY2F8kKYP6CwRBSp9F
	 uIzWfNv9WH1kqxT5ubrRR2EYzGXgKCBVi3Ud/9QVz3YyPB/6V3UsOY8HxTO+oB36NW
	 5Y4x+g+zfD4Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51C88118A;
	Thu, 30 Jul 2026 17:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B515C26C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6EE360619
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmClBCgk15eA for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 17:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF1DC60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF1DC60639
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF1DC60639
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:38:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHGCu-1wl9833aa0-00Fx75; Thu, 30
 Jul 2026 19:38:55 +0200
Message-ID: <a9efc2ac-ceef-4de5-8780-c0b60d0c5c0d@gmx.de>
Date: Thu, 30 Jul 2026 19:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philippe MONTCHO <philippemontcho@gmail.com>, buildroot@buildroot.org
References: <20260730154631.41203-1-philippemontcho@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260730154631.41203-1-philippemontcho@gmail.com>
X-Provags-ID: V03:K1:iyllNRYcjCAHm/OtyZlCX7zdixVNuPL4O+uqvo5Ygaaerr1p/KO
 Svvpxh8sOzQA8HFFUky8KIXaiIOMNH5rqrA8q4NHbQTRY3q9lWdsid6mfT6NmcBmnK1cEGQ
 mZErKD4KYQ9n6NDRkuKy/Bp029G1KCUwSsdiJJkjYxMabn9AWMF/dnwhJ5cx4T0Ko6fYHVi
 +Td/C3qLu/+LJh8E+e9gw==
UI-OutboundReport: notjunk:1;M01:P0:ZEIdlYvZGlA=;IA1YcYNJYkxG05wigPL4K+r1Z5Q
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785433136; x=1786037936; i=fiona.klute@gmx.de;
 bh=Y55BvZ8NJnQ2kaYsDG2U+eft8g/L2DSBK7ZBKAFy9t0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XDOWTPCT5Om4jHlwkqpOGH06kN+TELDZ0n66ui8q0HLnqkeN42xgBWfMpqPgokqH
 V9x5XOEnRhFb4jjui9QHdL2jaZc2srHsLB3e3buKi/m76o/nrhZg07OlwvBmb/LP3
 X+kzF+7ACkTOXWypCnW/OIEEAR5g/iF1v/9Xw9CfFM3MUszGnqovcKk8wF63ZJWAK
 5fXhqSxvVyBSbaJxrXjGurJKMg8fRhKx2L0T+Q2H9wt0o/ao6o96ojqOsgXwIayJL
 7jezM4b6NX4yLiXD8BHXUh4NYoXubtrGxCLUqTUcp186xRfcYSdQuZsnoDY8xMpTZ
 k28ZFGYCi4ew0G6S2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=XDOWTPCT
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: bump version to
 2026.07
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 30.07.26 um 17:46 schrieb Philippe MONTCHO:
> Release:
> https://git.u-boot-project.org/u-boot/u-boot/-/releases/v2026.07
> 
> Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>

Applied to master, thank you!

> ---
>   package/uboot-tools/uboot-tools.hash | 2 +-
>   package/uboot-tools/uboot-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
> index 6916498256..e992835582 100644
> --- a/package/uboot-tools/uboot-tools.hash
> +++ b/package/uboot-tools/uboot-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
> +sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 6b5554da9b..23062beefe 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UBOOT_TOOLS_VERSION = 2026.04
> +UBOOT_TOOLS_VERSION = 2026.07
>   UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>   UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
>   UBOOT_TOOLS_LICENSE = GPL-2.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
