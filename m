Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A018CC6B1D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF5660783;
	Wed, 14 Oct 2026 10:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0qCbBKIKedF; Wed, 14 Oct 2026 10:25:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A46486078C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791973533;
	b=hBFWZDFKexv3l7883tVclOczaJzreVrLw3DBCMNYtI8YhOwgq5AAUmFwb5TV+zKLezqu
	 c3CwrxbviGIsER1EwWVxXna20D2kKJ3SvLnouZEgoDnaiwQnN8swYe9qhI6ANaA1cYxM5
	 vjhrEzrhhXXrSGFSe6W3xfdkBLren7e1nukeSFEeF1IUsQQwmEhMXpbeQI0Dr19kmpMUP
	 WdhPu2HmETXPlcT2tJn/NFKy+dPUcKMboz2CDXrOeYsHdBvRSvdH52/ySk/oz0AzMbyae
	 zH8xakrZRnISX7ka+PHMlzAu3U4hVSxi86gwpI+9mCx8klTDrcSYYHi/8EX6X2doz/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791973533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=YrOfLtPSk4wdtXaTM28pMK3HyyCSpZBIQEmxoOYfpUE=;
	b=rQJMJAqRkUZT8u2uLtlxGmNIM0xaBAOj9fNdsjcQlkD94O36JbAl/eaFe8uTKCPc/AXe
	 eSiBM+F5q0e/Ud9eliBVzCcY6xv5oFj9UWAni8TZzk7BPHBBWdWtKQDxDnMTBL1q2UlqA
	 DRkMkwzPbnFyk4WF6ZzcWWILcV4fwzM1gT1DFKRlRD5tikWyQWz4US23yhxECoUCwrcz+
	 e9bxjsfQnM5bJK23b3cAvWBGhfnnGvJbBqjBOtGa8P4fIxb2tPBdvkK5E43odsWKGU7Ht
	 wyVvg9f0V9ZeLvavgVNMVY3oeitHb4hZ+JNU3hh0Zt02zBTVf9ACFkV4Ot7Mitjzu3Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791973533;
	bh=YrOfLtPSk4wdtXaTM28pMK3HyyCSpZBIQEmxoOYfpUE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Dz4ikPXUBBh2RkqLvS8PAlr0oxqPB48VEKLNY582aX+tysYKNZyIH1PDaG9zqH+xE
	 b1yyRsvLIwmrPyKVwSxIccbZroCiXy3BwSUirAne+/1TCkwXEr08N1HPuGodcLc3O+
	 p2EX825JPZGEUKlXKhZgn5LkvH18FV5TKNtjBDzPDNYkcXQHkh7hlYNN4mdCmVyXsi
	 QSz8HVmTQCaz5M90IGKkU1VcOkyWe10sCZNCY9oSDPHT1i3qsnw25IiJHhzLxk9xRO
	 Yp+59xno2DmbyJzW8V0EqRk7+x4FZXrgrzBw33a73VZ6a3HE99F7vCFLSGYgWgVby+
	 2ZfBH3xLQE0fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46486078C;
	Wed, 14 Oct 2026 10:25:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E95482AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEF4E6078C
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOpaxY2Y_ULT for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 10:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFDE36076B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791973532;
 b=li8WFdDQ7RaLSeDUzwCzE6jn6vyOlPd18RV7De6pMk0SYg7jEYG4i38P+Ofb4CY1kPFn
 O6N5tcBg+/iVidSoJdIzjg4HxQAh4pcDADKuE407mfnFKCCUKTsNAeh/BtbYXfjT8fJGb
 pl3gZEz54xRjMrch3d0dsQ0SYK6OrOZ7/JCakgPixzMuMT2og5zl4EJaP8RXC9zrzbOb8
 SIdchbXBQsQkeotiBbhVqQWj3IqfffGXLPJkhnaAUgJjqZps2XGWIVUABJ2aytcv3teaG
 E0NKqUiy/2pOySgcezAmNO9SdkQqiZq5bu/avYa2KC9tijr6V2WAV2MZtFj4j9KIdAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791973532;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=it9Tpq1E4/NLMmmJZDnYMUsu+vHkydpeojPMgbpZQIk=;
 b=pWj491r6LIeYgZu2jmc9QD5za9Ffd/cXUb1kmRi+NFEiZ1hcDRGzfAlkNrmBOj1vGmdf
 bIwxWvpRgJSumRFw8NJaAx/SccIDKUQoBokEFqjq2FK8ERD3TzAyJV3daaFAhWC4Tw7VE
 54J5hivdnJGRnYqLPjPxqS8kGMl40qtEcRO3sPtBQ3trd65R6dTGXziWtuzpIt5HcwOrv
 cMbt731hWOltPEpnaAZ33jCgDKj9aU10c/PcpJfTkBCBL+sn+av+0GV7SlQN4OJ3NRAz9
 LTuDCwpbALXPvU8C39H32G3Pr4EAy1OuFPThRy/otggyH07EaXG9snfxawG0RIw8RvQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="MFYe/Qg8"; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFDE36076B
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:25:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1wQjvM1c9W-017xqv; Wed, 14
 Oct 2026 12:25:26 +0200
Message-ID: <a84c070e-1798-41c2-9d7e-2d4748476629@gmx.de>
Date: Wed, 14 Oct 2026 12:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
 <20261013232940.2690456-9-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261013232940.2690456-9-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:mR75W/EtwSKkhM2C30fKVimulBRPgtNphL408xMtxkDDH/DLcVY
 50Zpzf7PZAwV06GHKTe+aG8Rst0KlAEv1TIX/DfnubWVzE2Y2+isJeCC1gyjsKbuJHxomrc
 vELtUeRayuhSPtvnbBcc21OHCbIp2bpjPaEVOO5/5UxTYYZLU0CbkQljWzc/ERGT+KUlua/
 /8HfyXeS1X9ft2lWt4ofg==
UI-OutboundReport: notjunk:1;M01:P0:990pTw54PbA=;q5UM3pq/7xPvieO9diUu0MBw/pe
 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
 Ax9bhHMIIrPSaHCJ9dXmwUKZBWNILQ38
Subject: Re: [Buildroot] [PATCH 9/9] boot/uboot: add
 host-python-pkg-resources dependency for binman
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

thank you for looking at this problem!

Am 14.10.26 um 01:29 schrieb James Hilliard:
> Binman in older U-Boot versions imports pkg_resources to find entry
> modules and read the missing-blob help text. Setuptools 82 no longer
> provides this module.
> 
> Depend on the standalone host package when Binman is enabled, so older
> U-Boot releases and vendor trees continue to work after setuptools is
> updated.

I'd rather have this optional (like the existing 
BR2_TARGET_UBOOT_NEEDS_* options, unless you can find a simple way to 
make it conditional on U-Boot version < 2025.10). Sure, with a config 
option defconfigs with old U-Boot would have to be fixed, but otherwise 
recent U-Boot versions have to pull in pkg_resources and its 
dependencies even though they don't need it (if using binman).

Best regards,
Fiona

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   boot/uboot/uboot.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 96b8cd0d2e..1f98f1b268 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -304,6 +304,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
>   # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
>   UBOOT_DEPENDENCIES += \
>   	host-python-jsonschema \
> +	host-python-pkg-resources \
>   	host-python-pyyaml \
>   	host-python-yamllint
>   UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
