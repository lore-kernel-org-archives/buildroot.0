Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F71C5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F41408D1;
	Thu,  6 Aug 2026 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAMli1ojZC1s; Thu,  6 Aug 2026 22:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD1A408D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053777;
	bh=xko3SeUeS1q+jpOXwVuhd9dstDN4E86iBlfWAox0AuM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GqlGaiXKTGtko9fdH3ffy8eQT46bQJOVA4+KW+hHC3p7mQ35qWA2WlpUrUfoRJ8L2
	 P97pJS/y6k71+40LzIzS8Y7nRj80i3GKwXD5MniXqkQ3Uja3yz38wbzpFnky1dszzm
	 1P58RNICZIgcTOn2WYwTUWlbSmB3r59ZwXMDKyYVNP6zabJgCFF1rPfqM55Ix2iJkh
	 ydIZaJoMHemd+HAeZn+XbGs03pJdoPgKfFtQjNyVe/bOFhtiu4dWUVJOTuUiALGKj0
	 DqdVwoMB2M0OxxsLGO/6vfy1Ew51jyyz0hs4xXWVbrtfVULnQ5qe9X2fnhN3k0F+NU
	 /WiPs1VFpS42A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD1A408D5;
	Thu,  6 Aug 2026 22:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC4D392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D6AD4024C
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSNaA6CMd8n7 for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E68340118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E68340118
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E68340118
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMuX-1wVud116kT-00TmDQ; Fri, 07
 Aug 2026 00:02:50 +0200
Message-ID: <4e7e2723-d512-442e-8705-f2005d1f09dc@gmx.de>
Date: Fri, 7 Aug 2026 00:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com
References: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:9VA7XHgeLnquNgvuVJtBYpfuco5Z5T9ODRMz2zAj26YRBqkb2cf
 TRZSgqPlrSATraLDdyT2iwrDSmfcz6xjBBBtB7aXlbmfipxL0jG7cfT/ZbeOBSxiLIyziYb
 VJPduVEZQXZiY+O+JecYOjaqpDnd13J3zfscVmGPX8kirbhIfEwTDGPNS+w7HwYOhV8eaqQ
 cL/W6/1l4e3MSXQ7TU2Xg==
UI-OutboundReport: notjunk:1;M01:P0:uBgGZyZBi10=;+yuCSFu7dQ7utj91e64uEGqPI3A
 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
 pz+29mxi/U7NX7krByTzn8TgyTkeUpJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786053770; x=1786658570; i=fiona.klute@gmx.de;
 bh=ZV+jhA2eTZ2KA/9kRkjRP0IK/tVpss/daXL+pRrD2lY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BSweHXVaKRatzMX61Dd2GiTH/0urNcF758WMJqWm+r9cfZnFGPxdChy9tDY1Spfv
 pvOmVt0WraKKTEUqwybiXfdN8s34ABUnyyBSJuMB1Ra1xg4+5qJdd/ExwtxJpyiEH
 We7bWl8W1ucAsnP/A/vSNCeODUKwqy9Wx/F42L0YfH9qdDtndIzIO/rcPdMdnaQzL
 smLmubvG9+1lDApCXXP7bxvb0Ky8Unfm78qhLD65Bfsot3JyWIUbkKNatloDAla1q
 xHTAmi8OSOjv/QXFhXfqoMCymEu+7rHG9sfs2LLV2MJgc0D7/V+uoRKLrMwjHeqC2
 PLRRsnsto/Rf62v6kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BSweHXVa
Subject: Re: [Buildroot] [PATCH 1/3] Revert "configs/stm32f769_disco_sd: fix
 boot failure after uClibc bump"
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

Am 05.08.26 um 14:42 schrieb Dario Binacchi:
> This reverts commit dd67de1bd3374a75ab1845ef29e3ad3c3bed2aac.
> 
> The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
> zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
> 35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
> binaries").
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thank you!

> ---
>   board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config | 2 --
>   configs/stm32f769_disco_sd_defconfig                            | 1 -
>   2 files changed, 3 deletions(-)
>   delete mode 100644 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
> 
> diff --git a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
> deleted file mode 100644
> index fb8fa9ee01c3..000000000000
> --- a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# MALLOC is not set
> -MALLOC_SIMPLE=y
> diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
> index 602d3e8018ae..a025bd780270 100644
> --- a/configs/stm32f769_disco_sd_defconfig
> +++ b/configs/stm32f769_disco_sd_defconfig
> @@ -1,7 +1,6 @@
>   BR2_arm=y
>   BR2_cortex_m7=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config"
>   BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
