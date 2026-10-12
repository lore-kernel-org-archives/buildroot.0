Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BCACA9EDE
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B12C80BE8;
	Mon, 12 Oct 2026 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnUxlrZogMo0; Mon, 12 Oct 2026 17:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7308980AA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791827537;
	b=I/qZLd+FI04v6NyQbr0uUC03I9BPzVbY+Sm3ixBtfVoHZ24+4BRhRVjmENDGWcSyCRH1
	 T67+AGjCuXUHqAmdoBPG71uycraq7zp6dJlBMRd1sAN03AjOvQijvgJ+B2v23EsrY1Flg
	 6La6/hC4gRYklx3EhmA5qmRf0zzPTPZyUT4VK4eQ/ktR8JjvX0vg1Qewx+5R3BYK5kYVU
	 ZJqHtp83aMQb8duPrtz2MhupanB+8KTHGzhbdua8alPC5SdYYyakiGzV0gYby1SEJA36z
	 zWvU+FAEEb1SdT5LC6qgzW/Zu3PFdvEwkiLElmCJib5SGSoLcrVBuhBo7w3In3P3oow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791827537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Np/iZGLyRQKV3ZRX3uNZzYT1C9F7KCRh+uCklL0MlXk=;
	b=TPjni58d7e+hyVlwyFWMKwLyleAIb5+tEiQDtc06/0C5MJcq1sAsD6iEvRtdSnUdZCYT
	 ia/THUk3BsDfs4jLCiqcKDYYYsziYHfH8vW/SPlSTeGp/SG+UDcwYmTCwwTSk65SrID4t
	 Irjnx49pwTFxhloZfv/jc9s8IboXGdWNVUurFamovjQkvCa9htwvzUhyM+d3W3vf1n7a0
	 RRYpdVAEWKON3VpdskF4ODfM02gCEcMb3pl8HImpr+WFqLZrTdq0kjhwe67cDJyZbft9w
	 DytQBXl3tlTsmiv0FfbzXP8EtsaT83bRPhpjV3PCMiAJJYdNxakRILGbsCE2zYifPKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791827537;
	bh=Np/iZGLyRQKV3ZRX3uNZzYT1C9F7KCRh+uCklL0MlXk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RfgAejnPkc+ONAkYuzSnAiZ0KWuBt3LKY3xcflppDFDvoIl0hn4x3N22DhJRKb1tS
	 OHb4jvWvTmOtNbCBid+lnSl/qVLuW+SJs91StHrWySByKe/5HJlkBQsvTYZIgFft7K
	 S9ciHfvkLutZQV6jAsgpD+fuRQXJ52XEccs9HUIEy5xO/zCsk7GkF9UBjIbJPAvl5O
	 j7CP+ZFKP0lSn/jf4HAwXVCD3/6OWdlKnqoxoJgFWB+HQM7c9VQqYSENLBYaSZ7n1b
	 2BeAW0mDxdd/W1T38moi//o8+Ur8315zDZHPT+2IU4CV65Qe1p2jHB5k1YIuNakzus
	 wC0fnxJaVIH+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7308980AA6;
	Mon, 12 Oct 2026 17:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A39194
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 17:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B4ED4002B
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 17:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J782rX2AxaQ for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 17:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CD03C400B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791827535;
 b=lSZlGkNZSbWyIC98uChbY1hUxGRjs67yOtbTmuKvQ+ddJ7dTq/VyfrvBfypz8jrPs2N+
 eBg5A0GyujW79/gIZtXskaqsliDgu83du7YOm+uqfoguz4kwMpWN7Ff8DNy/QBRC3LWRS
 OkTc6SxXtBbU5veszKpGbFOMP5L5DysiiBe/XCuYbrklse6MoZTH3a60PzjA8X0ru+sEC
 Di39/FFi35BC8NFvpCuHDyVVNZIMH1c2dhIgxjT+mKL3Q2Ah5Mce538F0sEfqNbLq00Xu
 /oS+ege5OcjKOFoVLu4z9jBLdBH7uKzlaRPKDGssPdhaDxO/+qApe3deu/nZoh9UBRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791827535;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yPcgVFTXEEjFnaMFqlqoDM91fMj+uSjBM5zWwUiFe9s=;
 b=H49FxOupV0e2EPlJuPTNP5Pt2irETVVDl/o4qtgEms77DYtNeJ2Tt0lMFzPKOVZaeGQH
 5woFro+2uOZqcccU6WvzDlc+a9GxM4ZFWjKt6I455OWWK1cFzsgBYGqLACKprV/bbMedo
 1h+bf/scZBmuoLYyGI9xEoD+Bm678dT9q0kg2K0hLsYW6yS8meEJZrAeuN/zYLIdnvo2Z
 E61/y2/ynXkv16zDS0s4r+13zNY8Gc1/Cp9aVYUxz+aFTmaEV0ZIVs/VxScdew/RtiTll
 OKPaffrNLg1AfQwkgIp19P65QgwPOJkP2+eLuEj6GeMOFdkqCjwJ/vuXl+sIOO4wKYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YVygYa4v; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD03C400B3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 17:52:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1wismz05Ik-00floO; Mon, 12
 Oct 2026 19:52:11 +0200
Message-ID: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
Date: Mon, 12 Oct 2026 19:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
References: <20261011203230.2072127-3-fiona.klute@gmx.de>
 <20261012154149.20488-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261012154149.20488-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:oq4T9tmnQWK7Pu6ycqhHVNHt8+PbuvGlqVhLMyr/5Dc2zelLsoS
 vdIjhq9fPiL6NokJxO3Zxq9GCX9ZP5uFF6rXF2PsPjDmFX8EpbtON3msZGq9TD7//ygNBAt
 2qeTuJV3tS+Frets5GddRLfgAIYH88Nmd3lCdZRDZzH8+fO8h4mHG8RyQZoyLgG4hnkQl9A
 Zjvw1ZisN10JkTZfDwH9A==
UI-OutboundReport: notjunk:1;M01:P0:ET7ubdiVvHQ=;capepXvXDeeYLtFuyn1TmEzTH6t
 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
 =
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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

Hi Thomas!

Am 12.10.26 um 17:41 schrieb Thomas Perale:
> I'm thinking again about potential solutions since the issue we brought
> upstream remained silent :-( [1]

Yeah, I checked that too before sending this series. :-(

> Do you have a slack account to give it another try there maybe ? (I don't have
> one sorry)

No, I don't. I guess we could poke that discussion again?

> I think the actual proper solution to this is the following. Given an external
> named "br-external" that has the package "foo" and a "buildroot" config that
> has the "busybox" package enabled:
> 
> ```json
> {
>    "bomFormat": "CycloneDX",
>    "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
>    "specVersion": "1.6",
>    "metadata": {
>      "component": {
>        "bom-ref": "project-name",
>        "type": "firmware",
>        "name": "project-name",
>        "version": "project-version",
>        "components: [
>         {
>           "bom-ref": "buildroot",
>           "name": "buildroot",
>           "version": "2026.08-891-ge17cfc9b3b",
>           "type": "firmware"
>         }, {
>           "bom-ref": "buildroot:br-external",
>           "name": "br-external",
>           "version": "...",
>           "type": "firmware"
>         }
>        ]
>      },
>    },

Moving the Buildroot repository/version info from metadata.component to 
an element of metadata.component.components makes sense, if we want to 
leave metadata.component fields for people to provide info about 
whatever they are building using Buildroot. Then we'd need to provide 
some way to supply that info. But in any case I think that's independent 
of external tree info. :-)

>    "components": [
>      {
>        "type": "library",
>        "bom-ref": "busybox",
>        "name": "busybox",
>        "version": "1.37.0",
>        ...
>      },
>      {
>        "type": "library",
>        "bom-ref": "br-external:foo",
>        "name": "foo",
>        "version": "...",
>        ...
>      },
>    ],
>    "dependencies": [
>      {
>        "ref": "buildroot",
>        "dependsOn": [
>          "busybox"
>          "buildroot:br-external",
>        ]
>      },
>      {
>        "ref": "buildroot:br-external",
>        "dependsOn": [
>          "br-external:foo"
>        ]
>      }
>    ]
> }
> ```
> 
> The metadata section declare the project and its core component (buildroot +
> externals), as its already the case with your patch. And then the dependencies
> express what are stored in which externals, as its already the case for buildroot.
> 
> I actually think that solution makes a lot of sense, even though it's not
> obvious by just looking at a component to understand where it comes from.
> But as we discussed previously nothing seems to fit that requirement in the
> component definition yet...
> 
> Again I wish I could give you a definite answer on how to handle this,
> what do you think about this solution ?
I think dependencies are the wrong approach. I guess you can see an 
external tree as a dependency of the overall build, but recording 
packages provided by an external tree as its dependencies doesn't make 
sense: the external tree *provides* the packages, it does not require 
them. It's about origin of components (packages), not dependency between 
components. If I define a new package in my external tree and it later 
gets merged into Buildroot package dependencies don't change, only the 
origin of that package.

I'm also wary of encoding that origin information in bom-ref, as your 
proposal does for packages. Bom-ref is supposed to be an opaque 
identifier. Nothing against making it human-readable instead of a UUID 
or other random string, but we should not use it to encode information 
that should be machine-readable.

Where we're in agreement is that CycloneDX doesn't really have any 
suitable fields. That is why I used a property (where we can define our 
own), and suggested in my cover letter to register a CycloneDX namespace 
for Buildroot (which implies publishing property definitions). It's not 
as nice as an upstream field for "package repository" or similar, but 
that doesn't exist, and with a registered namespace it'd be 
well-defined, documented, and findable from CycloneDX documentation (and 
it'd let us clean up the current BR_TYPE).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
