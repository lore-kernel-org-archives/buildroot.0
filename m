Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B97AC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 06:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C548406E;
	Wed, 24 May 2023 06:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C548406E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ul32c6HZa3J; Wed, 24 May 2023 06:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBCB8402B;
	Wed, 24 May 2023 06:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBCB8402B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C211D1BF377
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C8404206A
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 06:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8404206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4Pmdh7Rzw4n for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 06:00:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851FE42057
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 851FE42057
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:00:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyzvpgcLc737Yj1kmRazZvRjfKFuhnCEURXsPW11eRNhKlyn95RDjrBnxHQSGQe+MSnpw3fqkxAmdIkZo6gcbS6FqUy7g3NKy9V4I4dhJ4PR0QkrFA9C38ukghimcVG17CqXo/XG3ja33GbZZrxtDcF3p0BINuvzWiX4E7DeX/rzvtUdjJcqee/D2C55R9J249STsVVKkWE+INW8XSg7VHWoRMVlblLeTF1Z37t48hR/07TWxmDeL0VfupIrrdXAQgrtB7TP3Str2+WMZmT8xwBvcSdpsHTLSHt0NGXW/c54qHppw2FKoC4pc6aKIbph2AtgBPorR1eLZ4CehDvp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TX5AWYCOwveLit/z1z8C9jUQwxgLteb6aJcMBzz970=;
 b=WVmlb1UBNF5uLqvGUsw+EILY8ykZDNCM0BxXiMkoksbhy5XApafbtNEfUwuLiwMfjLnnMSKt4/a1ntm5uuy1rrxIplCwzWaBTvYumbfXyvtEQfxaIUbv/IZLVd77/d770n9oYCL/TM+XzmxQmsR2iZeNXFo9TgLyCsUvqZSjgONWpbL2IpyNMB6OvtPvzoPGHkwIdGHQAZ8l0kmLx3jt1Dq9Ik8wIkfsYD0ke3KVcadgNLkCFTVBi5ebPLzDf8SRI+G1FvyEjuF7x31feGotTn4NxKcJdJaLlVSq5GQMiA2XGp8pMuLDLFP2O/Pr/SMnt6MKDLrkao//smJfPJOtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by PAXPR08MB7527.eurprd08.prod.outlook.com (2603:10a6:102:24d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 06:00:47 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178%3]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 06:00:47 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] R: [PATCH 1/1] package/libwebsockets: added option
 to (re-)enable external poll loop support
Thread-Index: AQHZjZOH0Bwkf56G1Eqm4tojdB+O/q9o7Miy
Date: Wed, 24 May 2023 06:00:47 +0000
Message-ID: <AS8PR08MB6870B939A5DA48452F35198381419@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <20230521170834.GA621937@scaer>
 <AS8PR08MB68702A3AC3BC40C1DDF695FE81439@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <20230523162749.GI621937@scaer>
In-Reply-To: <20230523162749.GI621937@scaer>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|PAXPR08MB7527:EE_
x-ms-office365-filtering-correlation-id: 37378521-1d65-4fb3-c4e8-08db5c1c3844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T6Xt1YxsJ8vmHIiOFQblTXYJUkJ/k/BhtNqd9UNoJ9UbjhmKMeAoFeafxtNqzWh2si5iaZVztVWLVx8xw7ovBJR//+HXvRKoa9V3TKxzZE7mmuWqoAWaWlIZ02my0fDBVRz/KcfGbn+xZoRPsFevdV+gC3T9aJRbbvrMJ1ArN+kVj7vjMhlDjSdom/w/RDkZ0QqyVA+ozupfuXg4mBgdoFiUo79Br5SM6OUvmjJL3YD9AxwDgkAPwsSzKa+CA+d33kaMqQZ6xmdVS/BIYWNhO7J8tsgI7w1FqewkUXVh5lcOaEeJIAiChWheWTI2oP+iKTkMz51wyL6gILgJA30zmYy36d4ngBdx9SgXTL3fKkNZpT8wvR67czA64TUl3imM4dHnphz0s27d7OMmK3z2tktkWW8RTpyKVwXPaGNQiNqBMN8d5qi59Fn/quwrrI+72HCEAmcbjjiQO4xlAzh5BUyecU02DQc2IfEPRqntPcacxwTQ51ZOSKKDlYUJxPa/R7KG9OYbMz2Rk/Rmos2rQcroIu2KDqiNScG4ZFZPRBrBD9yIA1MIIfJjFq1hYxnot8whrIUqGfUSx+AfzbaafRJrShcRUBMl32qhLhthvSzr0SguvD2SXf2uDwcD1WJk34VqAkRJKvFtVFTKYS4rp261zP2GwomfANL3eNmYLZo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(451199021)(55016003)(33656002)(38100700002)(26005)(122000001)(186003)(9686003)(6506007)(83380400001)(2906002)(41300700001)(6916009)(7696005)(316002)(71200400001)(966005)(478600001)(66446008)(66556008)(66946007)(66476007)(76116006)(91956017)(64756008)(4326008)(45080400002)(38070700005)(86362001)(8936002)(66899021)(8676002)(5660300002)(52536014)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?I77cvPiltn3NMYYfGBHs1JZkaQ4uzLCF27bdY97vS/pzp1sLwfq21LuUms?=
 =?iso-8859-1?Q?MPSnBtQOkyoSYmI2WWCRGPJ2nASTm6UY9XO/b1zNt+4ADP0cHg2bm5V4Lf?=
 =?iso-8859-1?Q?6Mut9z/l4qYn8SFTHqVX1zWiTqt/Eul6KEszQeHcOTQeslllKVJKED2a9w?=
 =?iso-8859-1?Q?TIIPOgqh6WISJxCy8EBTr77KBajXVIphmp3NS0g/zG7C86u7PV6NKGLp4b?=
 =?iso-8859-1?Q?hfKCjizv7KV1xA3gFJedKFYy3sw7kGC5XLienQ7uN/6BqbEXMucUX2Y28N?=
 =?iso-8859-1?Q?ebODvz4KZGXzlC4TWBeomqexcGQS/xpdidc/GSBIFZc6V9vT9qcMLTVFtq?=
 =?iso-8859-1?Q?V7TnhmDTKlP7vZEcCGRU/vNfw7e0hqbtg4wlSJqN/5Q4iz14+Jc8cEwVPI?=
 =?iso-8859-1?Q?Pt1qIYHrZGMVPgCsGeMp4qT1T/8lUWrTa10Pau0q+OJsjYQNcvUuSqK5Jc?=
 =?iso-8859-1?Q?X8KxDOiAy7OgSAYyjfizUyt6xR6t0E8UJctrIzcSG129xV6n7OMXST6KrN?=
 =?iso-8859-1?Q?zRgTOXgmKQPl6IoiwpLpDFNWJ+MMs+xziI+yK57BONHKMNIyHqYfdL4aOC?=
 =?iso-8859-1?Q?loxTvqLdiRhOqKcbirQsgJjMNZyFKHwR/Atj7HyrJnfNtGGwpFCNscRDKE?=
 =?iso-8859-1?Q?rBPUjH8tsb27Jb9ENyinB+OkJ0ZLv1TpnFWc4vuHTDTlnUH/Wd7cP8hA3H?=
 =?iso-8859-1?Q?wOtQPU5FElUZD9DZsh8PZTbunExdasKQhfwKwgUdkKcw2WJen6vm07Wib7?=
 =?iso-8859-1?Q?kw3q0EqeFfmdYBnVZrw5Lv9jz5s/BMwVxGC3NQs5KzhzH1nBIxXZJzxJ3h?=
 =?iso-8859-1?Q?ooT25j/OR9xrBGMXf179Epx7j9vvICJ6X/OdNDs19iNBHlrObxpbCH0BXd?=
 =?iso-8859-1?Q?MFVOb6EfyHKB70gbJj4tZvFAyD61yHwAVQPR+5d2wwDcOBGPu/4C1MRV4g?=
 =?iso-8859-1?Q?EffMuQccUm4bM2udxw6X8BUUhVeGeux1oUBXcvPpyRs1D2fqeEouxbjds6?=
 =?iso-8859-1?Q?Rw5NjFb0/qbVGO1UWaE6+VtgvjyaZG6sbSHmjVisbQwQbHfpdD/Fq6aPYq?=
 =?iso-8859-1?Q?BKARHE5Rk93dJauTk32n8y8LpclAYVm/FQLbEYPSF/ISG3P2Y9tIBSHxEM?=
 =?iso-8859-1?Q?ybLldtEuYpvOVg6OMsvzIz2tLL8H0sgWIrR45oxiLEHVEl0ORz/pid6IwS?=
 =?iso-8859-1?Q?n4wDWhszR23QWu6c5Zd+7mdMdxzIQK8Gn9bvPCzcMdtTWdzev1f2J/LuGh?=
 =?iso-8859-1?Q?1H6gHeRfpR0chEVc+dJt9aczO0zdQWJIiMLi/aPStTsmPv7s1fLAOOnN9w?=
 =?iso-8859-1?Q?qtt9GwCoQ+HWfYw4gJOfjoqoVBVrlFA71ofwlmFB3g4pKFQKUxJRZa0hJd?=
 =?iso-8859-1?Q?MGPZf+9rhiqfROgLmxJy6YicHAGA4HAWYwtATZx+E4c/ZpOyNnJ1KgnXhr?=
 =?iso-8859-1?Q?sqTQrXtXb8urjcOrOAh5MWQfCGidpYPtvEvw5NX9a+EICTIlMNXnLUmnjp?=
 =?iso-8859-1?Q?gBrML2vf/6Mm62h8nKyX5q0HrF8gSSPNotD3laEc/v3KVgHy206f54l3Lk?=
 =?iso-8859-1?Q?sEt/GvQ8klPqXxORRRalgJ1ZTPXX3BBmf+HAHFerJfpX8IEtIa0usJXHlO?=
 =?iso-8859-1?Q?HPBnyEnybEpzzAtYqlCa9PtWkZMgGxjXl5?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37378521-1d65-4fb3-c4e8-08db5c1c3844
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 06:00:47.5768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPep8eqfMdNKetN8yqIVnf/RIZoD/gN/5XU/ljlucZdmYsWP6rrAxV4QHa86pRvViHzbgS6WmMfdflsWZXsmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TX5AWYCOwveLit/z1z8C9jUQwxgLteb6aJcMBzz970=;
 b=VPDsxwK9Nz1Sys3K4/Q4rWtkU8kEshyCXq3xDWG91NnLFk51f6Jx8a9FfWaENoek+opu0+uDJkDLovKzsZfkx14k+RhoTKc/nV2Qy2q1gmsRcRDypTZsEpWGFSns07V9DfejhV9/x2nsFSsWCGx3LOY/3A0zkWL0gMu1Gp2+7P0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=VPDsxwK9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: R: [PATCH 1/1] package/libwebsockets: added option
 to (re-)enable external poll loop support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Will you submit an updated patch (default to y, and select from
> mosquitto) ?

Yes. Would you prefer a single patch dealing with both libwebsockets
and mosquitto, or rather a serie with two patches, one for libwebsockets
and the other for mosquitto? The latter sounds more correct to me, but
I can do either way.

Regards,
Luca

________________________________________
Da: Yann E. MORIN <yann.morin.1998@free.fr>
Inviato: marted=EC 23 maggio 2023 18:27
A: Pesce Luca
Cc: buildroot@buildroot.org
Oggetto: Re: [Buildroot] R: [PATCH 1/1] package/libwebsockets: added option=
 to (re-)enable external poll loop support

Luca, All,

On 2023-05-22 06:34 +0000, Pesce Luca via buildroot spake thusly:
> > Da: Yann E. MORIN <yann.morin.1998@free.fr>
> >On 2023-05-19 16:45 +0200, Luca Pesce via buildroot spake thusly:
> >> Since version 3.2.0, libwebsockets does not compile its external loop =
support
> >> code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile o=
ption,
> >> which defaults to OFF.
> >> Applications relying on that support need to turn that option on, so l=
et's
> >> add it to the package.
> >So, as I understand it, before 3.2.0, this was unconditionally compiled
> >in, right?
> > If so, for backward compatibility, should we default this new option to
> > 'y' ?
> Well, it is not clear to me why in libwebsockets >=3D 3.2.0 the new optio=
n defaults
> to OFF, but it is hinting to something not so broadly used - the comment
> of the commit which introduced that change says something:
> https://github.com/warmcat/libwebsockets/commit/d3021980194991d175388115a=
65a4265bd155f36
>
> So, I would say that the default should be n, and then let users enable i=
t only if needed.
> Maybe the help text in the Config.in may remind that this support was unc=
onditionally
> compiled in for version < 3.2.0.

Our policy is not to change the default behaviour if at all possible, so
I think this new symbol should default to 'y' (with a comment that
states "legacy"):

    default y  # legacy, was previously always enabled

> >> For example, when libwebsockets in enabled, mosquitto broker is built =
with
> >> websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be =
on -
> >> otherwise, it gives compile-time warning hinting to unusable websocket=
 support:
> >>Then, should mosquitto also select this new option?
> It could, yes. It is not a compile-time requirement, but rather a run-tim=
e one.

Then yes, mosquitto should select it (otherwise there is a performance
regression).

[--SNIP--]
> >> +     help
> >> +       Enable external poll loop support code.
> > I am not sure I understood this "external poll loop support". Does it
> > mean that the loop must be handle by the application itself, rather than
> > bey libwebsocket?
> The library can be run on either its own internal loop (default behaviour=
) or
> by having its fds incorporated on an external one (so, the application ow=
n loop),
> using an application-provided callback. The latter is now under the
> aforementioned cmake option (see the cited commit above).

ACK, thansks for the clarification.

Will you submit an updated patch (default to y, and select from
mosquitto) ?

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.----------------=
----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
