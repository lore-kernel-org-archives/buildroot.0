Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99FDC7EE23
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 06:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 120DD40BDD;
	Mon, 22 May 2023 06:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120DD40BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Z5NYfouhyFa; Mon, 22 May 2023 06:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4EA40BCD;
	Mon, 22 May 2023 06:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4EA40BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06D4C1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 06:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD48B61348
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 06:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD48B61348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n78BuNibe3oi for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 06:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5817361341
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5817361341
 for <buildroot@buildroot.org>; Mon, 22 May 2023 06:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgDq3UIvtybeYY2Mm3BLgbm3WpF46fl9Ct+XFE2C7u63h4jFzehF1pyKLhWTA4VokvVhdOaTeAUAzeJ+RMtR6lTF2hoxYweYpfXESeB89ndRn3egtj6oqzfIPNP0H4Qn98EDAQCBZjQz4xAg7a/igPo1O4XoCknM4MJieLHKgQb80cSh0pYXu3iXkjetvHkbSM24wt6VGSvjne+4fAZFZNCtGe7YLBc2M1SkyH3qwlFeDKEQiHjNja6vQBCpj70GR+qhJXqfZ3BCq9LQhmZsF99Um6wchHc4y7CIF8GK5XPu1mRCSHAwp801n2Kd1P+hORxQMfaE3C8THgUpar184w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXwfjDNxxKvPNTCQh14hSEW7lbQ04rGDDBgPoT+l0KQ=;
 b=AtfpE8Sy3ekdcVxKt+qB8m4mEduHBzSLPkAqnLIsPLmNW019SfMzyNLfWy6Zi32DMQwitK6T4PNRb15J0MXNNUx2SHjuvK139yP6aea3ijQCnpHjjrixWs9C2eT6D3ObdufdmMr5cynJz2vPxWzYwYvWgRI4FjuBDYhFpi8irTl/c2aXfHJ4s71XKd22JrwKuWnzzEOr/ML901ZAwnQFbwmalviy256IM/U3a+FFukoBeEq2/8I8mKLKLEzIfzTS52QfwAl3Foid6WjAXwJF63tHk+mldXaQhr0p+1buRnfNW9hAGU57J3jofGjqoFA8EGCc9jrjB+0W/hVZ2a7omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AS8PR08MB8015.eurprd08.prod.outlook.com (2603:10a6:20b:548::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 06:34:15 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 06:34:15 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/libwebsockets: added option to
 (re-)enable external poll loop support
Thread-Index: AQHZimChtCRKX7Vda0W9UaJNsw1yL69k+P4AgADVhTo=
Date: Mon, 22 May 2023 06:34:15 +0000
Message-ID: <AS8PR08MB68702A3AC3BC40C1DDF695FE81439@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <20230521170834.GA621937@scaer>
In-Reply-To: <20230521170834.GA621937@scaer>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|AS8PR08MB8015:EE_
x-ms-office365-filtering-correlation-id: d29c6e28-1dc8-405c-bc76-08db5a8e9058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w8X39RLCi/0Z6sZ47ccMldBGT0ZcvLyJjhLaZFugGOV3KpD05aIcLUD27z54V93Of3/OJ9VuylHQ0u7++Y2V4iL7kinw5AXmH6iXF/XTMQpALhrDZpvmq6dDULwnPeVZ3E2WB1XqSjD8zKnQFYNyhp73DF/qHiZ3Iyr59vCBWETtFQoq916rUihnsxG8ipOOUANsXxRx8dUECB+XUl6GBVcv6QKqkbGrb3D8bTtY9rHVt7K4rkZmlXXvP70F3Ng1m4ZqOXAT7WzcUhHEx5hfDK/BqxdCasY2QXVfdcXeJxnK1SXxdYD/dQHtFZP/UbteEkfb3cJBKJf3H26JLu/i8pFsKVlQRPfAy/GmxXIew9469EzMGfSDhz8iDyrWJRdfQGr17DRFl1ao1LdB/+s71dYiiVTEEFfJHiRzFtJ6CFuFd79h8uT/1b7UbOAFA8WiR6YmTbygSpvByIGnCGCkAJHXHTO+r7XFX302LjWIErVfO3lRoWZo5KbPYUl/KKMu3jwlJZL+3YNae1l8+Xij6b2kAy5HCSbBeE3wlA9DMkYVv8fLv0CfElxnGtQjDDsV48pr2TPDav9knG06EXs13qFqMvnoGwtys3ynojoN4V6AjY5xPVPt1iLGXnP5J+Ni0nqq6Ux3pfn42clVdFnOvlzqarQTXfevvr+bKuQwOgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(451199021)(8676002)(8936002)(5660300002)(52536014)(83380400001)(186003)(26005)(9686003)(6506007)(86362001)(122000001)(38100700002)(38070700005)(41300700001)(7696005)(45080400002)(33656002)(71200400001)(55016003)(966005)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(91956017)(316002)(6916009)(4326008)(478600001)(2906002)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WrzWQJBRZLLqMCb6a7gSdkH7qfpVsvEFULduBeRCqysaDeWlN7g0WTmY2l?=
 =?iso-8859-1?Q?20/6gZsuzao6dW1Eygowf5T65w4p+dCMQ52m2lVwJLALE5uzv0h/vvz3+Y?=
 =?iso-8859-1?Q?OkOOZmPZO0Xw/q4/il9XZ++t+hzvO8szHcJyTaNZ6FmV74YUfVSF/HusXV?=
 =?iso-8859-1?Q?2jKTJQDwC3f4d2p1u/BM6gZ8WnPxQZwwIsILcQ1LFSEXawdXcw4XqqSIXF?=
 =?iso-8859-1?Q?HupgzUljPywnzlvGGjH23iUU7Wb/bWxictEvFjGTdCHIqWCNw354xxKCBo?=
 =?iso-8859-1?Q?EBF3IwAIxhUykspML+pLZn2KVH9fF79ppdCZUB9Bl2CYyzQmDT5x7etvqP?=
 =?iso-8859-1?Q?hXTmcFYaY/QmcOZnxCAo/dBfvYW9LPfDMt1avQ+kVYJFtfzBOsyhHV6afJ?=
 =?iso-8859-1?Q?WtO+Ic59gZv+oy+nm6Bj4wlO0Gg6CYo/qTCVd/obT62CPnIU5Kofs8/8jT?=
 =?iso-8859-1?Q?hiXLU48w8UORIHBZQcgI6Zincwh31JlRjXmorrIwnr/nz1gdegtU0Skaa/?=
 =?iso-8859-1?Q?GMuq1lHg7TYkykxt2ecrUU985GxVbpQxhUwowQLjQay8ms2lNPc20QcZsv?=
 =?iso-8859-1?Q?jwTbylIR6/FRbkU+fHjYXU9r8j4tSjMoIXS2Dcr8aX/RtnFaDgrvLxnmDX?=
 =?iso-8859-1?Q?/9ZSMjZeo04sWPwHgN+YLZjZt/R/P/a3dv1BDJ5P9MAzRNYIqvkpnk2vht?=
 =?iso-8859-1?Q?447G5pdBuH5iS7BA0ypeZbDh3njlfxbb1X4zXaBjNCKWHGuLHKoi5mcJdG?=
 =?iso-8859-1?Q?ThLE+ctu4uM7WUFQIfvZKfTaAya04Yo4Hg4lFnJZypNJUn7bNS24I6uKn8?=
 =?iso-8859-1?Q?zdiCe2n58ADRJW0erHYX7H32ewH7mj6LXj7u1sWCyJo+BvzxJxaSBfzDsT?=
 =?iso-8859-1?Q?pdMz1Pdw4tFIygVVOddNzUCxyBfl2W/SMTOuHTKcgQqAKTQOlkLFczlOdT?=
 =?iso-8859-1?Q?Pz62HqkuwVsDT6kYsjQm0f7IOOXDBPrGSEPIJD1ReYBw4mb/VsVrRar8u+?=
 =?iso-8859-1?Q?LvNvDt8JpK/OP9gLqilYucB+jEgHTgQmTslXF5ObvJMkLPEZSvd0W5AZge?=
 =?iso-8859-1?Q?HoF8J85KEsbUMB4bNVWWr6d744VCPBmruHuJbBdrhYI+RRbUpv/z2HT7x0?=
 =?iso-8859-1?Q?C8eTy471T+j+xC5WA2Jj1gMEyEdZNswtg1dxtNkxSTKywNn0yIpoBTguMN?=
 =?iso-8859-1?Q?BNhG8yK+Rl959uRY6wvVUTi/xeXne1QwARKAEVDyQjxdDtBYiLS5meHYDh?=
 =?iso-8859-1?Q?SHCSoXUei3xMX3mJ8Hajh8XYstDkvDOmTsL+Voyjj1if80VL/bPtanrqsT?=
 =?iso-8859-1?Q?ZtlITbxOcMPqyHb+8EyjmCaFTiBWnDg0qAXuw5eJrIXmaWRAOe52Fxx0m1?=
 =?iso-8859-1?Q?nLOwRCJqN55Rw0fpa1RS2DEdbcZScUuGuziiL7pCIkzWGKxDFMrow/lugW?=
 =?iso-8859-1?Q?nQ3GtFH0lYlyJZmiGDeJoNZODg+hkmMkeNPBrv8pvaVPauacENI0BVP1bV?=
 =?iso-8859-1?Q?2ptvbDWQP9IW6KmtU3/+lymN5e/nad4qCaLlPAdoHINfb28cKTRt8YzMv9?=
 =?iso-8859-1?Q?k2SOTKYr2oT1fnNuQhOp1QM7fYPLWx9NbMc7KEBw8+OlXDyzqyrmvkC3K+?=
 =?iso-8859-1?Q?qhjXOVrezZAuYq88PaQ4galgmecImffBso?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29c6e28-1dc8-405c-bc76-08db5a8e9058
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 06:34:15.6371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcFZfK4XkYlvt7iCkAv1IHPrYgIuaqc0tpB0qEptBACtqo/tK4XiHymniCDY9LQne41OIz4NG6BefEtasGQZ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXwfjDNxxKvPNTCQh14hSEW7lbQ04rGDDBgPoT+l0KQ=;
 b=VPdULnQyogPfLceCOLMNVHWj3xwTFTd2ArupaHa3tSNyXqHjxTA7+WWyq9fXVhVKpjxkA5ukEELjuztHAtNYqxn14uZRuog1eR8/g/FPCRYnrS6JuMU6qcKTDHHc3pizGXgwP8+pxrGvwvVlKtxfhCFVUtoWRX3MQjv7zTde20A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=VPdULnQy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: [PATCH 1/1] package/libwebsockets: added option to
 (re-)enable external poll loop support
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Da: Yann E. MORIN <yann.morin.1998@free.fr>
> Luca, All,

>On 2023-05-19 16:45 +0200, Luca Pesce via buildroot spake thusly:
>> Since version 3.2.0, libwebsockets does not compile its external loop support
>> code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
>> which defaults to OFF.
>> Applications relying on that support need to turn that option on, so let's
>> add it to the package.

>So, as I understand it, before 3.2.0, this was unconditionally compiled
>in, right?
Yes, indeed.

> If so, for backward compatibility, should we default this new option to
> 'y' ?
Well, it is not clear to me why in libwebsockets >= 3.2.0 the new option defaults
to OFF, but it is hinting to something not so broadly used - the comment
of the commit which introduced that change says something:
https://github.com/warmcat/libwebsockets/commit/d3021980194991d175388115a65a4265bd155f36

So, I would say that the default should be n, and then let users enable it only if needed.
Maybe the help text in the Config.in may remind that this support was unconditionally
compiled in for version < 3.2.0.

>> For example, when libwebsockets in enabled, mosquitto broker is built with
>> websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
>> otherwise, it gives compile-time warning hinting to unusable websocket support:

>>Then, should mosquitto also select this new option?

It could, yes. It is not a compile-time requirement, but rather a run-time one.

>> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
>> ---
>>  package/libwebsockets/Config.in        | 10 ++++++++++
>>  package/libwebsockets/libwebsockets.mk |  4 ++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
>> index d7b529c..1371717 100644
>> --- a/package/libwebsockets/Config.in
>> +++ b/package/libwebsockets/Config.in
>> @@ -9,5 +9,15 @@ config BR2_PACKAGE_LIBWEBSOCKETS
>>
>>         https://libwebsockets.org/
>>
>> +if BR2_PACKAGE_LIBWEBSOCKETS
>> +
>> +config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
>> +     bool "enable external poll loop support"
>> +     default n

> 'n' is the default, so no need to specify it.

Ok.

>> +     help
>> +       Enable external poll loop support code.

> I am not sure I understood this "external poll loop support". Does it
> mean that the loop must be handle by the application itself, rather than
> bey libwebsocket?

The library can be run on either its own internal loop (default behaviour) or
by having its fds incorporated on an external one (so, the application own loop),
using an application-provided callback. The latter is now under the
aforementioned cmake option (see the cited commit above).

Regards,
Luca

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
