Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1865CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 12:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE8A42E2B;
	Thu, 19 Oct 2023 12:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE8A42E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEOYu8Dy0QaH; Thu, 19 Oct 2023 12:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9BB42E29;
	Thu, 19 Oct 2023 12:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9BB42E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED951BF48D
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 12:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D2C404C1
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 12:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D2C404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfAWQcTcinwv for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 12:59:40 +0000 (UTC)
X-Greylist: delayed 163832 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Oct 2023 12:59:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E3C7400BF
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0725.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::725])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E3C7400BF
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 12:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=UiW6UIIvnlGH04dIX/J509+7tP/tv0oTTVlLUQ6mKZJCwPulA+Bn/l7ItpgCYo638FRbK4gmUJ3QwHlCMCU84owacK03Rfg6yFBiTP8K+vQFsz3xQ9Ocw5TQo29MuyKMNKgbmJDv+ZdKLDBunlmBQvro5uI5e5yyAKdC6HL1Nzfy8ek1LPX+eDvmYD4es+3+MQYumI/syxjfpqsZfbjaF5pT9dchUhsW+acNdqYcyy6ln345BsXsVwro8EL2SOsYFweY3Sk2szGlxZlZUtU6lHYBMSKGaSYCmuRpydT9MQ6W2Rt2KHkb9UtdAn0/fZQhuX5zF/ipMC7Xoi20NCdV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMOd90u67nWZlVrEpJciHWvM3w/amoFk7YIJXf1GusE=;
 b=WjwGfHBPEjztxZZ5JybfkV6yJ73XuX3ugqnWuAi/eFhnqwrDVggGCE7DrTFQTOGCXHN1OdlQT0DBNFjtn3Gx731fyYmjE1MFwH9gqOSpSjhHKmQvkhjzQfN6IVuG+r0Ze+mm3NCwSpY5bMdVCMkitqKwST4wCcc5d4O2X+Az/2uXOaGY1llFWitzYdhYZR5ElMWSvrPgmEX47DMF/WKF17ZbqYPwQGgWC5bU3ws3IEaCrX3DHYfpwyGJvHtqwpbTiWt16urh3NiyThJy5Y/N6WTlywC7fYpzp0pqLz7KlEYOP0idltaifY1sUoVBu5AL6DDchVyVrLx7++YwSZg/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.45; Thu, 19 Oct
 2023 12:59:35 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835%4]) with mapi id 15.20.6838.045; Thu, 19 Oct 2023
 12:59:35 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
Thread-Index: AQHaAd1DJypFnfSS5kqbg78thqvvqbBQubSAgABW2/A=
Date: Thu, 19 Oct 2023 12:59:35 +0000
Message-ID: <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
In-Reply-To: <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1049:EE_
x-ms-office365-filtering-correlation-id: b7aab47f-bea0-4da6-72de-08dbd0a33eae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HrMr+vubRNT1axMkiRvSVkzb/R5cE2IapPBoA7F2Q9ghi/hG8T3KyU8zP1EIHeAw6IgRaiu+POPAlxzWTW+/5wnNMeNbg01wRO+9V9tLEPJQRN3JT1zuxJSf54s9S11blGa8Ml8dyeDey9+CeANG2mL7OFwdyrPqSslcBmkzeryUKBPKFx3hGV3nh+y0VXuFDPCXd71LY5uS4GYgujVa5Q8jEZ6nfdAWWqnlSxuG6qLygBL/XOwkqsFun7axvhBf9oKEoG25+b/SSH55GUmVQcDjE/BkA5LvxMTRH8PSoll+UrFvdVjNZM/cjPW6Z2H2UU3vJuW9wR6UEB8h0/8R0HuKgepcQC2JQ1vQ+7oLUWBm+0AVMkUd3sh4tkhap95o/8D72IZeR5Pcqd0lGL3V6MLc/qSerQciswsVVubGmW9JmfITZ92s7NfX3X6ij9jkEHiSxXy0LgpVRcn6VQhlRvABgRvvy1tkyo1dLY3Qtwe35v+grZPZ0vcaqM3SJroT5YI0RDPiWjJM7uTYGoNIabBE6uItS72rQ6b7PO97rtbIo1c7HdfGsDDP/QlofPcm+4KieIlWXdqSUr0iDJnYaDrXeYBRVGpKZuoxDIye5/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39830400003)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(122000001)(66899024)(38100700002)(55016003)(38070700005)(33656002)(41320700001)(86362001)(2906002)(508600001)(966005)(8676002)(52536014)(53546011)(71200400001)(4001150100001)(26005)(9686003)(5660300002)(8936002)(41300700001)(66446008)(66946007)(66476007)(66556008)(64756008)(76116006)(7696005)(110136005)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: NbpEwyIpus73QwfytVv5VsqXAVUC2yPY3cdcoZwj1UeSKyX4OtvIA4EPfzezFe/yG7Rlu9rO+C3g/dGJH8pIPMHkf+bWre5lD/oqd7UFTGGkQIIfDgOOtaPhwIvmDdzVlelPODFxFy+dYs9yXtQ55FRev3Z+N9X9vZob2tX8UFQ/QVy4n6k82w8m6cblfDAF8PL6YEL62WMxvkaMjYYfIG6TW2BMZzTiRBIwa6WFu9BAAMB2PBJxqagtQNjTfYAxrYxLUD8wQRucKG9LW0+JrMUn1NDEOx1ASx9BvsxQSfwCSsDHEqYjGqT46wSA+LQYJwXDSg+DdOPH+07dUxJQeGK3ff2kHQhTa5JTDith9Uirb7U2RqSOrq0Z7BjiIpp099i4BIZuw609v8vlR+l1apMgD+TDukEtJ3s3KTl+SyY=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aab47f-bea0-4da6-72de-08dbd0a33eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 12:59:35.2779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMOd90u67nWZlVrEpJciHWvM3w/amoFk7YIJXf1GusE=;
 b=LE6kZvD3TPR98bwgFy+Yv+l1AEFt8GgWFVfsuAcUGxRCiVthwgEEi2cdJxit9KzH27X2Ifv6dPKIzYUv7mDssNOUiICnwrkqwRL2Hzv6WfeBcPrtc2NMyB5SlrUhX0YGMBoFjgsVAdVwL6wZ/h0FW6P0sbhWSPqo0io1WX+WrF4fMZOBqcTVjfkFPIXoo3dDStBQRkBLGzoKgvO2Qz9m4HMySRM8i72UYlAYq4jh7ow4qtKm7vxGPa/9t2rts9Xyyz/xInvpV82UBXLbFCpM+JizZsCFN1mr6GFg75+A8CcHk1ekqoL7/uhgUu/Ri4ftD5P/d6z1JSsouPhoaZEcnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=LE6kZvD3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

All

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Edgar
> Bonet
> Sent: Thursday, October 19, 2023 2:35 AM
> To: buildroot@buildroot.org
> Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
> 
> Hello!
> 
> On 2023-10-18, about whether the API-breaking libgpiod v2 should be an
> upgrade or a new package, Arnout Vandecappelle wrote:
> > If it's like "mostly it will still work, but there are a few functions
> > that you need to replace with a new variant", then the proper approach
> > is indeed to fix the packages that fail to build. [...]
> >
> > For bigger API changes [...] we indeed need a new package libgpiod2.
> 
> I've watched a talk by Bartosz Golaszewski about the new libgpiod,[1] then
> started looking at the documentation of this new API.[2] My feeling is that
> this is a quite extensive rewrite. A program wanting to support both the v1
> and the v2 APIs would need quite a bit of conditional compilation.
> 

Correct, the soname changed from .2 to .3, but the library wasn't renamed to libgpiod1
and the header was not relocated to distinguish it from the original version.

> Besides, I could not find in the header a macro designed to explicitly tell the
> API version, although some macros, that are defined only in v1, could be

I noticed this as well. There's a _function_ but not a define. 

I was considering  checking the version with pkg-config at configure time since the
version is exposed by the pc file and then setting a define used for conditional compiles.

But yes, it would require extensive modification due to the rewrite of the library, but
all upstream packages are going to have to deal with it at some point since the kernel's
GPIO_CDEV_V1 interface is deprecated and won't be supported forever.

libgpiod 2.x also requires Linux v5.10+ since it uses uAPI v2.

> used for this purpose. E.g.:
> 
>     #ifdef GPIOD_LINE_BULK_MAX_LINES
>     # define USE_GPIOD_API_V1
>     #else
>     # define USE_GPIOD_API_V2
>     #endif
> 
> Regards,
> 
> Edgar.
> 
> [1] https://lpc.events/event/16/contributions/1247/
> [2] https://libgpiod.readthedocs.io/en/latest/modules.html
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
