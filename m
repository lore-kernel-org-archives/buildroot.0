Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346E4C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 10:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0004C40C8F;
	Sat,  5 Sep 2026 10:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdSGXU1m2wnz; Sat,  5 Sep 2026 10:42:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0B25540BED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788604925;
	b=eUc/lby6ynjFRjh5cq5oUuCtrbxCoUvojUshFY4qNcuZns4DhvgNeE1pTBMkobKGMZhZ
	 6ppuVT078TzlXDf35FQntJYaHX85CrNlpXaqKl2AXnMVqNHhRWPJ6XRHQzwzQ/sPjG7FV
	 ZHoIyYejirxgZfzIancW0JZDkAGXzmZtxwKjPUMrANXLmOlC1OIphx2beRhTyHxByrKJj
	 bbekfj88X+h6amSpysTMgHp38gEAmKmbGdigwwrqWDOPvq2GvXsNuCKlQ66yz6LHgqqDg
	 eb6gjISaHvq0oxCFFN03JiFZqHWEZ/T+i3HjPuRD3aKFmDICR9QyzCer1zjF4R5r5Ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788604925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=iZMQsTWVbKwRnVp4c9amKl3m8FSst81tG+RsPWrqj54=;
	b=phUQZ5+SK0hXaRzlEZS3ZrAiqCrN4dq9S3f60C8Nie/iiKW3/5skx68Cok8y7pujDq2Q
	 F6kshsmrscpDF7cd5X/CtVaxsJf6Y5Hh1tgSpK9HDVwJnNqdQdjb75ycYdiPkhc8o1joz
	 Hc01fNIOsex8Nhfhl8x9/+ynww08kSwEkzhknYoGHB3OEtmHfhGG9O01ALocaI05VJKLf
	 otfs7apXK7Op4CfUXs9TtjXufm9rY5uGlZP/IqTk5M63H5iKLQl95yHwvajkC3irxSlXD
	 ETLGPr0rJL3xdrvWvyVGbrlmOwGjIz2eGFD6DdKCTQoMBbMPhWN2Fl7W7WsCq/oTCnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788604925;
	bh=iZMQsTWVbKwRnVp4c9amKl3m8FSst81tG+RsPWrqj54=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bmcLzT0x7jLSbm6Rrz1gDZaahbDox2JrR99MECSBos56ShlWL7Da/HnK2rRwN2+OT
	 wKDVv6IzQLA3dPKf/OmFM4Z4s2e34c3shF9gMEY8Tq+joIj8Es5Edk8JYERjWRo7X4
	 d0rhk8qZZc83IfRWJoYNKryH+mwENrBG4rblmEWmurinMqyfVQl+0nBqz778b5FMea
	 KrJ2ubhJLHKbW7eJ/DndZFjO4BWgm0VbCho6kewXhjvqwtbwHnLP0ISN5HQuA8mXxj
	 Kzf/wqNv/OdI6jhcRLFLZYlz+KkKcw+NOB4LFWv1MPbohnVvkmtWjv3vlvjqaVU0Zi
	 GBm1pOx3dsdSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B25540BED;
	Sat,  5 Sep 2026 10:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77091B88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744BA60BF1
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzjqiv2cVQAl for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 10:42:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C59260626
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788604922;
 b=ApPu1TgwOiIhl3DZe7ny/RY08XVzXFUWlM7/IiomFwcQ1LZlUdWPPsVG4QsaDA8wsEXN
 7/s1H26DkdQem8Td4O5PtJje2QtiH5S7OlZRrR3vuD4dmjfFebiFt9cKERpJMJJDvfVvN
 vo6Tf8MxQ+vaWygaornhnhpQIr4DH5etEArQjmVYxDkZ/3nHQfhJpINNfoTJOKRBaMIbM
 /1gdOvywGdeweKk6TC+YdUM370u9Eea1x34JZ7dlzNQPBiUKarFLFSYJsRlDf7NH3BSRu
 DyNfx9cVCsPq+nnEk2Kcr3+KEQg/hxllvUNU2TpdSdXVhHezd7gGB/aOwtvHVaOOy5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788604922;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=mOwJZICTw0CY5WqBXfDb/zb5QQ5+2HEY3SKtV1YlidQ=;
 b=Q17sQ0oDGm528l9nzkiTzEbEq51Hfc/CdmNR1uiCN4zxfj1tZlEHkKW2T5G7DJO52JEJ
 PBLWQUYm75wnzQUOU7JhcoWFzeCXD7vT0Zkldn4WohafssHPKon7GMGGtc4vCWtiUmvwZ
 GWaRHM3jmKrh/pfYMawgzBnuDchlAxd40ukGKfqAxB5l11gs3y8Y8Efwbbugwt1aAX+AD
 Q1idryhL+UC6PaNRy9bBuviuYgHtjPuRdWMyh65BGbBGGQB9m4GfidXgE/dv51eiTT+c9
 NlyhBzys3ptSNVudrpJigfKJL7/Dgfd0vJW+NUYVAq0EvQvDasgGU3OaXcbILG4HuSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CMIF8Uul; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C59260626
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1xQ5BQ3miR-00II7B; Sat, 05
 Sep 2026 12:41:56 +0200
Message-ID: <5012bd24-f357-44a5-bd8d-9dcdda1a6b71@gmx.de>
Date: Sat, 5 Sep 2026 12:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20260905062120.377049-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260905062120.377049-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:92GBChhtpVa/ASgFfMq5e28oBMArrajogwZjQWh1HsaicxsQ02n
 Ubo+rwefG+eXgdWDHK1YNDm/dOS0ystaDAMq1XTVr7MRDJJtjFBzMBkZIPX0jO39ddoQWZR
 RivnFaVfMuo43R2uW00KFfZ6QbMkrCO3fNvqL8RBn81p3MLM6UUbmrVHOoqO0vVal5cHAyV
 uarzRHW+oOzfu81B6EUdg==
UI-OutboundReport: notjunk:1;M01:P0:Z2fZLSPPIP0=;hTSAEUUf7lM8q0l1lbN7T8S+dBn
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump version
 to 2.15.4
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

Am 05.09.26 um 08:21 schrieb Bernd Kuhls:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.news
> 
> Fixes the following security issues:
> 
> - xmlregexp: Prevent out-of-bounds read in NXT macro
> - fix: add missing overflow checks in dict.c, uri.c, and valid.c
> - xmlregexp: Calc string length after null checking
> - xpointer: Check overflow in xmlXPtrEvalXPtrPart
> - xmlIO: Check for int overflow before calling writecallback
> - fix(xinclude): propagate parseFlags in xmlXIncludeProcess and
>    xmlXIncludeProcessTree
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/f81b17dfe4e6a1093d390aaa6e7f910687ced420
> 
>   package/libxml2/libxml2.hash | 4 ++--
>   package/libxml2/libxml2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 849d70cbb5..d21fa53c08 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
> -sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.sha256sum
> +sha256  98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821  libxml2-2.15.4.tar.xz
>   # License files, locally calculated
>   sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index c1b5c4033c..3ca57f1d37 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBXML2_VERSION_MAJOR = 2.15
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
>   LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>   LIBXML2_SITE = \
>   	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
