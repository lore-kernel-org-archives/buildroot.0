Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34308C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 995F440B35;
	Fri,  4 Sep 2026 20:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naoIudoUfY7F; Fri,  4 Sep 2026 20:34:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9DA2840B38
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788554066;
	b=SAOU1fInozyO7dLMT7lM9g/eVTFihiyU/jKkqUcr0c5db24pL1bq8PBdtEFAcOAc7y3E
	 YHGPSX8vMEgOJKWsLqDGkQfzOtnWqAMgyBvmCJWVwS+lVQYo8+ZQUAKZmTnxHkjuyM5YL
	 pBJsCOSImSK8HJOF8hKJHXNqShjxkLey97B7wSi95sMUdPRRjFOFHwQVZApLuqFPCLV5K
	 eFJU0Cfc8uFRlmmHjaiccCTXyxogPe8l6VMrSRwlcqpH0Enia48EKzFU64jQXLuc2W0iD
	 Bo46H7EHgQoobuhae+flafXuG53zj3iINErfIsirWQ7TEpCcGtFqAiM2h59brP28pyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788554066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rq9MwcBVz3bpVAtDz+YvIEXS0qqukz/OcCBxpV2o35c=;
	b=gTg++Yb+8TMt2xW+CEzKZJuCAzUzMWkIY/lcd46xMhpUhRu0+k65jz1YtqmpmaatKY5b
	 uSiBhxObF0R3eACOA384b+qeR7WZoJT6uxpiOUzD55EAL4B4NbBLzikbI4Ksy8XkgQjqr
	 G/Z7mjqKlXBng0k5GdXXJ9YcaXB/oNq4/X+glX0qww6YwWl/cW9EhrPHkYaDokCz8lRCo
	 orvXWzLKHxAYmaH1skd9f5JiDMoplo27G+/idUCmUBKyvnyUDDorIUJD4kcNHbdtHgSkU
	 WDz/LVRA2RkPL4yLAhHz7CJMIbWC5IRmlXrVBWJvBr6ScEFHP2NcdvROCq/Hz5Tueaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788554066;
	bh=rq9MwcBVz3bpVAtDz+YvIEXS0qqukz/OcCBxpV2o35c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=XtVVIhn6TGGdUOee3olTQnWpQeFX9x+O2RV61RpYMo9v//8bHTfcOSAUDv0e5yaXT
	 Rv4EW1V2TMF3yu9bQzOx9wuvgKZaYlJagkac3WdVGOqZwXx5MDi3PgWEvT4yflvs8k
	 balJ9UJFg8oA3pYdl4FFJRFwlQAwbdHtrurWHMgylSwUKL+EepnzX/o0YG4GnfSBqe
	 /7+MQ4LlkByBWh4QSI/dVNA19OGFNC8W5y+VZ5EsoeuvXDjPmhjG/9Vx8u/ZmQnRaU
	 otOa8J890auwPYsnh7B7MuAeRnPS8k6bXRuopwieZ3hGCXnzYLtcZm5wtrVAGEIM7F
	 hFTPTKqRAKTtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA2840B38;
	Fri,  4 Sep 2026 20:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B2D6463
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 711FF40B38
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eww6D_XnnMkJ for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 20:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F016640B35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788554064;
 b=YfrmhA9o3TGjHnSvygOQ4q6c2Zh38dCdHhxdni6/PDDP4CuiktYtJBclWDm9+zqRwZI+
 ZU5WdAY6wzj0GrBG3tAp1AudyBIayOKrUaG2n+Sgwk5lak5CtQbQ+jPKY5PfZlVVvbMhO
 uXOJ0sMnaiTB+VuH+0C5Y5YXH5uR3+4VXPpn3Rs6VOlVApz57HHIbHuKlK00R6Q1ywpJb
 e3JNGswZwZckDSObvy3AScOx370z6IgS58feslSj2CKxk2oy8Pu7bwsIZMiI8q+Su0w3i
 d633WLuIq3cxsNg09Y0BaNqdQe0qBfelEGkpsO8gHs+RJ23FgTqKFn0q+aGDJApxUaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788554064;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=LNuWYWfe+uVS2gUtwMflwvvaJiOEw7D6hn2uWESy0EI=;
 b=IBGH4cgHxm4ebgQ7wdfllZfzZJGRQQrCJrt4BepVH7kWxSu42tu7mwEa9SHpivYT5cnT
 IX/AVgK7qzyalJMJWxBTCymUplW9AvhjcnnCocUppn4MASQWOrlAONdo22FS/fPjjPVxx
 7Cs/ePiAtG8oOZuhrZkMJPxsS3cmJsjfkcpQOVF0iV4XeDewygaG1FcIeqriHSHxA8hFp
 Eq9nbQZM9cLQi1BNp3+CVFpitT6F5cKG2CM7xfacmo1N21acwp7vBqtYuWX6uQDVXVx3C
 /LtxqJn7EcjZaSE6WtkctVVVJiwvK1z4/R2Gp/LZaZw/kH12CC4kajjXoEnuVa8G74w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NhPtS2ni; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F016640B35
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:34:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4Jqb-1x2JUz42s5-008Rn4; Fri, 04
 Sep 2026 22:34:21 +0200
Message-ID: <e86ff0fc-c356-4c38-9579-f61e5a8eda79@gmx.de>
Date: Fri, 4 Sep 2026 22:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Bachmann <martin.bachmann@designwerk.com>,
 buildroot <buildroot@buildroot.org>
References: <ZR0P278MB0869478C4CE596433FD9E8F98B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZR0P278MB0869478C4CE596433FD9E8F98B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
X-Provags-ID: V03:K1:C4xNpBOGUPRWe1eDUCfQYEQqQfn+4qjDlyHRYoMyrtsjPcvqYiv
 lnxwhLu3FdviwF8ggyB+mZR6xqNUK31P5Qz/DxoDHIbx+Op5j8j0MV+DZ6v2qZZx2V7I4nO
 9v+xg8OXI8Gu9t0pHJZOdNmsGbIXsBpvioFcVATLOYGW/PoGr51vc+od13e56Sx6DgSrH7H
 JZfovLhbbI3BO/rI/bTnA==
UI-OutboundReport: notjunk:1;M01:P0:1/QuW+jYcD0=;tQLer0FCkaSOLa68LGAWXNjC4tH
 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
 dQTZAOEqJwhK5FIDRcufilRWxA==
Subject: Re: [Buildroot] [PATCH 3/3] package/fontconfig: fix license
 information
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

Am 06.03.26 um 15:12 schrieb Martin Bachmann:
> Fontconfig is licensed under the MIT license. This is confirmed by the upstream repository on gitlab (https://gitlab.freedesktop.org/fontconfig/fontconfig), as well as the metadata used by other distributions like OpenEmbedded.

It's a variant of the MIT license, but not the exact one. The license at 
the top of COPYING mostly matches MIT-CMU [1] (there's an extra 
suitability disclaimer, but that mostly just restates part of the 
all-caps one), MIT-Modern-Variant [2] appears below.

So as far as I can see, "MIT-CMU, MIT-Modern-Variant" would be correct. 
Could you fix that?

Best regards,
Fiona


[1] https://spdx.org/licenses/MIT-CMU.html
[2] https://spdx.org/licenses/MIT-Modern-Variant.html

> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
> ---
>   package/fontconfig/fontconfig.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index 639f6ed51d..198b9a0ffc 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -12,7 +12,7 @@ FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
>   	$(TARGET_NLS_DEPENDENCIES)
>   HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf \
>   	host-gperf host-gettext
> -FONTCONFIG_LICENSE = fontconfig license
> +FONTCONFIG_LICENSE = MIT
>   FONTCONFIG_LICENSE_FILES = COPYING
>   FONTCONFIG_CPE_ID_VALID = YES
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
