Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC126E677ED
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 16:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4845140715;
	Mon, 22 Dec 2025 16:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGj4M2qPNp0q; Mon, 22 Dec 2025 16:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A624940653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766420827;
	bh=cHUUXY5peIPVNQ8r1jYmOx213ABUrTiYJ7fRS1iz4bo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIKqmWpmNeeIv+RlbLg568v7WRvUXA+MRbjcaO4EiXpKiEoh86iX+UcRkcVbrAaIk
	 Uoxz3PzcTQZLEH4r1b1EzBp3uxka8ULs1wGEOgYceK8c7HRbidxhWbhNFASmS14wwL
	 9q0VOGp091kXq9869s4cjcYj7q42UR4uO94S8NrIIYiN3YdYCD1zsipTrh7O3Zbd1J
	 Sp9G3me9NZqG6/LQKwYGe9ZLRl7UyT2IaNBPQrwdYtPG6uJc/20zUPkk9dhIYr0F5a
	 Rfk60hDbVvQ3WmNdnV6FYKd6KBLNqdY9hXBOfXUwu/bLGOSeBbB2zbXR058x54Hk8o
	 EMOCql2PPpZAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A624940653;
	Mon, 22 Dec 2025 16:27:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ADFC195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CCDC40630
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXATMWcKCJXR for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 16:27:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDB6B4071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB6B4071A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDB6B4071A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.109]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlXA-1wHThT1Pkc-00qeUP; Mon, 22
 Dec 2025 17:27:01 +0100
Message-ID: <75c78f36-b97d-43bb-a864-115c8a4544fe@gmx.de>
Date: Mon, 22 Dec 2025 17:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20251221223441.185169-1-bernd@kuhls.net>
 <20251221223441.185169-16-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251221223441.185169-16-bernd@kuhls.net>
X-Provags-ID: V03:K1:DoS/0ZWxEUzj8KnwDOCrZiqVxeTu/wu3iPH85ryUN/jdYwVi3Qf
 WCcsLxEIS4rR6Rz+0knnr/uygObSCEtFo+rlcLqVq0f9CnmEfyFMACovhCfWj+0GxkQR98U
 klDoJbKaidUMJ0QT42dRUte8V94kCrdoTtwLybuLjLdRAN1r930Jl0H1TQJrASVUT5qT7od
 YrjNxqm/8RehQDDMW/yqQ==
UI-OutboundReport: notjunk:1;M01:P0:fd4/ufzaCUQ=;asFmIBqkIpTKIQRiM+rvAEdIBtJ
 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
 fI/2d3SE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1766420821; x=1767025621; i=fiona.klute@gmx.de;
 bh=wAPSP4zIkgI2bJjIHNseZjgxfBpYZNT9kn27gIfQzoQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rVhnLxUrsNrglVCTZYNEMyCuT8hzZ4ib2j1CjC7IsnAPvc6YoXcK7eSO9wTQppGN
 g5PJ92HLIV+m2eZRQ8DDJTKpXV1Hbm4BKGcqgW31lvU0R0sEIhSopGK8F3yMO9dCO
 hqbK5zP3JxUkM8Kg/1HH7nm6KC5BNMl9irxojpprHTCErqnYdxlYgwUzcWv3Czl+G
 oS/LJmJJ8qqi6lyeWLk9s3kgFrOf1L/isCjLWw2H595Dwo4N8tDW8+OLfgxZCt7mX
 AxE/iGcK/t6An05mKcGnd1F7wGkec9SDfi2rWUN+xX13ot17rcB02CyVWEiSRohTy
 Q5+7T3nNWC6n3ydOiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rVhnLxUr
Subject: Re: [Buildroot] [PATCH v2 16/23] package/python-pyasynchat: update
 tarball URL
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

Am 21.12.25 um 23:34 schrieb Bernd Kuhls:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Thanks!

> ---
>   package/python-pyasynchat/python-pyasynchat.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
> index 6fb460cee1..2c503ea71b 100644
> --- a/package/python-pyasynchat/python-pyasynchat.mk
> +++ b/package/python-pyasynchat/python-pyasynchat.mk
> @@ -6,7 +6,7 @@
>   
>   PYTHON_PYASYNCHAT_VERSION = 1.0.4
>   PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
> -PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
> +PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
>   PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
>   PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
>   PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
