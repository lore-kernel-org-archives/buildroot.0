Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415A1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF04740298;
	Mon,  7 Feb 2022 10:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-P-aPuDpL_r; Mon,  7 Feb 2022 10:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B269640272;
	Mon,  7 Feb 2022 10:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 094641BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBBAB8131A
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="YF1nLTxf";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="Q/Q+VTwf"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuK6-KumNFsJ for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:09:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CFD881318
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:09:31 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 329A7C00BB;
 Mon,  7 Feb 2022 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644228571; bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YF1nLTxfG8AG+nGwe6Mrx3LaImXK2PCV1gBJPnZjVjCD9/2d7bcjMVjDfpp82BHam
 AJh41RHRoaBsYyokauyz3NEfcA4TNqnEvZIhFUf9ZK/XHzaamnExYB4aqtC5lB+ZLp
 ydYtfX2pxa05nTaLLLECNTxm6td9EMK5ibqtOrNiae8VJTwatLq+Mq6nTfVHZrUri6
 DZRkH5qFoPrRqekaS2SjVgr7+MJYMiA6hVvQXp28+f3LrhSt+VNa5qvd8v408RiW6a
 tzo3oQgy0/Yr7Ve0KcLxzsLIF+p5Ygygu24mLFiaMYJcdYGnwJocqtzblzLUerRJYi
 6Ena2gE1DTKsQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id DD2BDA0079;
 Mon,  7 Feb 2022 10:09:30 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E87EE801EE;
 Mon,  7 Feb 2022 10:09:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Q/Q+VTwf";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR1mJDhVBCd7N7+NCqr01AwUiAsrBmNT6dIfLvBXdnBslrmmZE7lqqwdrVrTKsXI+OQDYUZs7Iknyf2YhrD1i2Cxz4PxMKdlIS9QfTwZmUO72Z+B7FoyV4qq7mubBy6Q7aTaps9uQcM9DxflOVFd687T1jN7Trp5lVR+DE2z3q+XVHZOvNENKl2PG6I9HieI0+NB9PcqpyHCaUQRFRPj40RoIw0Bp9qTPWPb0Iorf12ZwRHKWAvxsAxlhPUB6rWeznIU9QqxR9DiTzOZg8Z7qtTxcSKPc9rQk7JG/gD6SVTDlnp1NCwcsRly1qJxi5SP/cRHkxSZp3xDbMdjNIjMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 b=anHyuh8bi3udLNcTtfbpGDPrXAs12129igHcCeSit8j8iFy2OICKfEbkHcdt0OZZrWkIzSRFlD3ex7OUgoDKS+q58Qy4weGZFaonARvhiROJVqNDyj5lCNKgjtv2i7vjK28EfvZRKj1oq2UAxVyT2vLzqvz4UjDTQ7sg3V840mCqLAV911BKA2vuvuAiWxqjun8l+2qhR4UYY32LxFibZTIWMH4AFTh2Flolfl65fuuJ7KRDsY0C6AYx2P8BP+0FJ/S61LdYCUM0RsDQmXKZaSLBqFzyiwyDzJMgj62ct1Cb+MpFXBao8U5KPLV64pzbITTTTEvmbcZY93VuQZF+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 b=Q/Q+VTwftt51KbjxO/yUuCd89oznSRL2cSYwif3qu/19cj3kBpsFhmWcLHe9hJshy7J7rMRdxaefEs4LuwvUEOWIpbpWI8K8j0XcPQAqTSk1rkjK21ZIWrV1Bxk49QBCJ5POOr3LTunbhNdFxX+nCSud8xfReMYAc56uu63U9Cw=
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 10:09:27 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484%11]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 10:09:27 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Sergey Matyukevich
 <geomatsi@gmail.com>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 3/5]
 configs/snps_archs38_hsdk: bump kernel and u-boot versions
Thread-Index: AQHYFnpL76NTXvjwmEqfAFeY7bXl36yH6Ep1
Date: Mon, 7 Feb 2022 10:09:27 +0000
Message-ID: <BN6PR1201MB0228D7CBE4F45E004D4EB3EDA12C9@BN6PR1201MB0228.namprd12.prod.outlook.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <20220131081214.12773-4-geomatsi@gmail.com>
In-Reply-To: <20220131081214.12773-4-geomatsi@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4cce88d-fe57-47c2-f29c-08d9ea21eca6
x-ms-traffictypediagnostic: DM6PR12MB3145:EE_
x-microsoft-antispam-prvs: <DM6PR12MB31453819E16D9FD390334CA8A12C9@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HjpBCspCJrQWUn5ppV5/DWdAeFqsZatIn0F7C2ONuYlX9O9Luhsb6h2x/CyQccgEKjM0DRAssVOPzeuAyOwtp8cJ8s9AT4zWi19CempULLcozKsquSXicStBHfpy+Hbn6zC9Dz2BSmf9WuGUlrOTpbS+r9oTSq9tXMV7lGE74/SRxjLcQ5UW7/bb3cSB64Prys2zgs2mEI43RJ4cZBl97d70sp4hVrPLOlFu04yj3uLAlTbIUoIC28LSVnTNyVhtcnumloohg04TvWqrCrz65GtWqCSeBDiaICGB4+BCOQBJrkbJ3CCPOrc3FyCaKCmiA8Y0/rphsFfM15o6YnYmSwLBzkVPGJUoOVxMegmTYNs4fWbkFbmEGSsjdhgTDewyYvVek2vmVm+RSqiwibjyB7OX8XQA9IRq81p45dyedOerEU6jawVjs/OmoGfj/MLQtt7asPt/5EYc+kYC6jIWvkPk3BZpApl2amDPFNs+lHkYPhwj/bv2HX4Nsg+YNM2hLYVUG7C2vDxQaY1kiBOj6Xpz6BdC0F0pELa96lydSOPJW/m0f5ab9tu+g9V/S8kTlgAJ06cyOgJFdKhLLTfk8/ooP8jZp6LGX+I+tMANbyD4QyBWgNSHQxgscB66wn4xOhOsP82WsKHyGbaV6dM3g0azbRYYeDAr1ZCFykp8BeAMeRpAbH4DNNYQAS++/gh+7mJHSfO3hTuKA5UYqfuVnnSGtURlBX/79JnWEj93UQQFBQY93tvERE0ZQPtWZPjV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0228.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(26005)(186003)(107886003)(91956017)(86362001)(7696005)(9686003)(2906002)(66556008)(5660300002)(33656002)(558084003)(52536014)(4326008)(66476007)(66946007)(8676002)(38100700002)(66446008)(71200400001)(64756008)(122000001)(8936002)(316002)(76116006)(110136005)(38070700005)(54906003)(508600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tCdyuKEZQAqcitu6K3hh/YROwrRfeji2gK4y2tpXGbQT4f6Ogdz1eamoCo?=
 =?iso-8859-1?Q?ko/dRKoFjCoY9+5RyljwWrtsKNsxpqQgQ0exUV3Q/4d2Qn0G1lZqHRrkYU?=
 =?iso-8859-1?Q?btlKp2EDrzHz7P1+VTpRzu/lQGkTHpzamkuDf0GscxNMwtLa8lo5KyR5GY?=
 =?iso-8859-1?Q?LEBnSApqSpdP9G0yZWteFleRUYFA8HlOVEhxICSdxMYNSy4++uYH9y8ppY?=
 =?iso-8859-1?Q?DfTcoOKv+Q41XXsVvl6lItQSEos8Motu3LFb/1f8OSAEFJJ3SPHjbRZdjx?=
 =?iso-8859-1?Q?nyEnlfatefPZmjNQx4yeKoaKX+7/lcn3de2vetqax8UWoMZmmf5akjBzdR?=
 =?iso-8859-1?Q?cXJ0Das/RJBxprMAe1VIXHS9kWzjiPFZV+8ly0cqdcDs85I37c4o+c84n0?=
 =?iso-8859-1?Q?2biIpLuBSGyw9pf1y/0JhQcK+TTlFg3nPE6C++VbyMJa7qzt9mlTMgN+QV?=
 =?iso-8859-1?Q?Q2NIzp8uD/WANZcw5GkXnkdhWlmk4Bj6C9YYFXo10Hbt3DIHa/QNCVtSEV?=
 =?iso-8859-1?Q?jdvYr5VboQEoNrWbyFJTt2o0rUL7xg9vuToZJsLw7UMVPK/Os+1BLmVlp+?=
 =?iso-8859-1?Q?mSqs2t1QQR1WlzxACr1dtQsEl/Hf1qMNIkOlk+43i9DvYsXFDgYR/Nc9Ci?=
 =?iso-8859-1?Q?9EecOswvCZhrhxwIpLirBhA8SNoWpDvR8cVXQwgTvwWpf/6I4RxqC135pk?=
 =?iso-8859-1?Q?1uREMcvtOjXyOYJGsHhcPv5r1y+E0EZQSeqFfhH1a/ObcwbUddAz/cKe6S?=
 =?iso-8859-1?Q?BUUO/1oxQg695FqvXAp+zQhDB8GHu8ncOo8nSq448NAMnPGWzpTZgORVfy?=
 =?iso-8859-1?Q?FNFMAap4uIqMnOUsL+ectJ46y7I+zQSyJk2VftjTSeCoZcxuIItpenqA6d?=
 =?iso-8859-1?Q?wlDNI22GQcm+3adGuUcncN+agClTilmWXaahafjfL3kW5hGC3DpLT0RlDx?=
 =?iso-8859-1?Q?xire84mNzg0AYPDRbZG7wIkhuhmYLGAy0uLRn/Y2BAAWWY5exwaXvokLte?=
 =?iso-8859-1?Q?XXy72r8T9NAgIok3vPZohK/skeILe8hOsJEDb1/zy8TiAbdWqSYqoLzAKr?=
 =?iso-8859-1?Q?cEu2YXLrBNdj1B1Tx8hdk7N6ahwo56thqs+/zqEU6gT1HkNAvG8zttYLKt?=
 =?iso-8859-1?Q?5hJfs41DST0nf4bcwk2DYXyFMd5TkwXZG43hfX9kztLrB5izLLbkcQGhPt?=
 =?iso-8859-1?Q?uI8WMNDd0AJfpye+kNhos8ANvIuyd9vj4zsTjvXtun90CnUNF4mFznpe6d?=
 =?iso-8859-1?Q?BL71IrDbuoKdPecPIrho0jFMHiMcIOL4J+LYUwwMGB4ljPLafCQ748XEOa?=
 =?iso-8859-1?Q?59ac1xZnQczrYkQ928xi5SxOCS1YRSqVEZ+vuqn/lsIALxT6GLhuCNLCSX?=
 =?iso-8859-1?Q?odI/+cJDfII4VYw3WIqcd/O4y7H4c3awuw6rlmKuUngc+H0iNnyUCVA54i?=
 =?iso-8859-1?Q?jdHgV8v3v4h/MxAfwheNSzgTzbsy84tAGgb9irOvuIaRIz/JN/gAhTPmho?=
 =?iso-8859-1?Q?XWxGJbFaQtC2lD3AatjfOZogHa6t0dHD9ON9uXuH7JmQ3Y9FhB80E+tJzG?=
 =?iso-8859-1?Q?HuPZI2izFZqd8qCqNwZKvTp3NOWE8azeQ7TIjMdYWcgJib2bsi2b/rPyMU?=
 =?iso-8859-1?Q?HQZJMuhB6gFXsAfUC/vzTphE87qZ3i8qWrDtZ3ef0+QJl65A/w8bn45g?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cce88d-fe57-47c2-f29c-08d9ea21eca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 10:09:27.3570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWAwTRr+bekcbxRcj/CrGYwRJF5REubT/u4epUe+1azshV44vEiHDfgp9oWSZN1lPA4u0Y0R//sJ64qaDefOog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 3/5]
 configs/snps_archs38_hsdk: bump kernel and u-boot versions
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

> Bump versions:
> - use U-Boot 2022.01
> - use Linux kernel v5.16
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
