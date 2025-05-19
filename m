Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F400C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4081E3B;
	Mon, 19 May 2025 16:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jc9ID8sL8hT; Mon, 19 May 2025 16:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881E981E3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881E981E3C;
	Mon, 19 May 2025 16:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E9DE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9FC840DB1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xGS2kvhOeof for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62c;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8885740C79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8885740C79
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8885740C79
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFd/SQ97fyR3/MFR5+rUmIDDR6MJkzueAK5jrJWh+FxMdWdphIzB6qOTn3NdRUQuVTCSXtVsZT09Rw8/T0qszAB+fUEXApT1zXhQB+IIyTN3fqX+XzohmeG+eRqRXFC74PeXiBcyJH6ECgTcruvua4G93Jklg/UgoH+uvBlywnVAPn+ucdNGGnWYOntHrGJq7B7IdF2DC9muVhMv/PO3Se16Ax5sgyagak0dg5XN0cn5rXVv8ZzLMlND+liK6nm5HKnprif2tLjwhz3qrlz44SjU+PQX4I4xBUjWfy8nBjOcFlkUOac1NS3hDgHCCS7BKwGXzfc74eyeETK883+CNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uALkaS3wBNXx8MuQ2KYo9YJyVloUJiKLayPA7qSw2pM=;
 b=kvw1wRO6LuVphv9CnU5rM3y1Z5uTPWd+kS06UUVt8z5ZSw0vw4Mo0aiB1ybmc3ggwI6tYSX8SKM8ut50/32KWAGnIfABq/imnrG4LfGJ/eH2Mpv/reEvGcaf0fNANxc2pSJiwO4YM2mVXBbjLfCM3wTLWp/sXk6yJT7+6oDiI1L6ERCtn9hclzTrEzoVoQAQogzjzte3Tqx79HaxXF9ocV4+C0Ys1pDr2baNWp9N4ZArHQjgLqp2DbDrw2fzyU4bt+jDRLId8KEtskR7gxou0P+DzNgSoMIQwr85v48s3kRRMqaNZurVhT1XVFaEbGfBUTZWbwFr+03DjueQUP5jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 16:02:33 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 16:02:33 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v5 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbqRtChc7/MKRTuEqmyDdbX7oR5rPVKqCAgAANBoCABR0cgIAABQ+A
Date: Mon, 19 May 2025 16:02:33 +0000
Message-ID: <SA1PR12MB56153F6805BA3F497D3400CEF09CA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
 <20250516104213.0ed78643@booty>
 <SA1PR12MB5615919365719A06F37E3ED7F093A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250519173419.322a530a@booty>
In-Reply-To: <20250519173419.322a530a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=179a2d0e-26f4-46b0-b409-ac783929186c;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-19T15:52:25Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|IA0PR12MB8326:EE_
x-ms-office365-filtering-correlation-id: 21a3a31c-a29f-4381-ee11-08dd96ee9112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V93Ug+0loqmQEzSlSRtrXbfvSV6pm2s6fv08wGBTG/iD00gtRQpgFM3dzXv4?=
 =?us-ascii?Q?owQIT+sqTeXFAecIGotRZH+RGx7OgXaemboGhyJVOGJJxEjVSgAUfDHH+zUy?=
 =?us-ascii?Q?JSb+Yy8Dtk7GGeoEU+Vwgne5pHpWI9460Pg6Mj3GmBhv0WRq6c1vtLFZvFyK?=
 =?us-ascii?Q?pRqVAaVA6t9nz5uVWzc9QQ6Mq7lpe+M1ukz9mm2+WgH8NuIg02gpdzsge4Zs?=
 =?us-ascii?Q?AtUPPccdX9SFWeEbJLtQf5/HMvUsFaBZfjQ73Eh0fUOmQ0Y+MVqE8ugiEtJf?=
 =?us-ascii?Q?9IZBDJle59gJc9fhs1gkHpN6GiG7TOiW5/sw70U5ODZW6lLPxAxmx9qOf77N?=
 =?us-ascii?Q?JUOvMVK27LK+uf+eqKxaM3vHgdMNTcos9JSa9wBN/qwx25xwIIq2ltukEApU?=
 =?us-ascii?Q?Yi54Peds1JAK8M0PkUMfyKJsxF39VLJSOawHpKGAOUE5JdJYvcN7Iw/O2b1R?=
 =?us-ascii?Q?do2jOlpHW3GPpdwIPZUPZQWG3T08G/GpNW/POYU/bUDKspk9WKsh4ncrcyfD?=
 =?us-ascii?Q?T48N8xMqKyPGEJzOYSi54N8lV4skxY8zXZHUY6X/g+tFQk9ENa+bo4FROT1m?=
 =?us-ascii?Q?/UUBMq0LviBkpO/2a+f3XiIE6dmduUlr5cqwW0APHn86j6pyrksTekelBQ0v?=
 =?us-ascii?Q?ekIHld4MptDZsy1hMu/m0FJXILHeuKoTHmyAIwd/8FKVZ6fcg9a+TlQ2N1l1?=
 =?us-ascii?Q?mHbWgYj8Ri+uTFcmeSICPNOzuAUC9SgzjT1UDGQqQ6nH3ASIsCQMVG6/ibP7?=
 =?us-ascii?Q?H0bK6TREflrLy1Psf9daayrVcGcnTk8F1UX7KfgFTclgWRfkEPDu6AbRo//k?=
 =?us-ascii?Q?v56Z49DTA4LrdQu1R0hgyUSNHiDYwFhIiVY0ASADK10V8ngjM9v3x8QXF58d?=
 =?us-ascii?Q?9LwQX/RMp/jVHPrOo/0hj/AmgMRhM+NEe2YJX6Lo8EyDR6McvCtMxELZXrc9?=
 =?us-ascii?Q?Le6KpKBqd1TGcXL8fVmfwMHWFLHrhbz9VHrznjijQRwvUiyeDFS9Hpzfwr91?=
 =?us-ascii?Q?VxtFH2WGIF25KzHLIHc1TGJYl7SXdsHk+n5noYzLATeFJImTPQ9PJkErFEFC?=
 =?us-ascii?Q?2lhVwlsQ6ZtrTA0yLCnd32mfX5cNVGxVcYdiJmo0y8yqanLY5UhXWgaqigfT?=
 =?us-ascii?Q?CDPOs15zWz4K4mZctsdxQNIBXotaaLFGRDn8PhzD1tcIejDIkr1n8jO4q6g3?=
 =?us-ascii?Q?2FnsWK+BRvkjV8JUmRMADembY8MH/M2+Zy4EUCazwZLpuIGvH9Ab5pdf2l3W?=
 =?us-ascii?Q?yIsIpvx69Q7twBbIInwdwrRyA1djCoXt5JaC7Se8c5TUzYRy/A5d1uQE/fKO?=
 =?us-ascii?Q?rx2HKMw9BNVAeAYrZqU/f0SUkpz9pd5s95kcz1TbNds565NrJ5Nxn1Inbt21?=
 =?us-ascii?Q?2qpH32f5TqVunspbcN/0PQpMAsWoBn7/GhU0fWNxtZ8oC6d8+thHFnRWp9C1?=
 =?us-ascii?Q?8EtBCOx6BWxFkzuz74pjYv+gsc+PCIvQwJcZXPeqBi4xuU3TSfi8RYBR9ti1?=
 =?us-ascii?Q?cKErRAp66S9ho3n8dLWQ7TEoOdIMqPU8tOd6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o7jIfOPMaXXceYjSnmnXUvKaBJqzqA+CBffTZiZMLuIKmHK18wiaAl/ZFgSh?=
 =?us-ascii?Q?DQ7dDhElSvDXmh2zatEmcaq9Ji8rzEfOoKH3dEgiMnVQPZ8RHzKYJHORmxl5?=
 =?us-ascii?Q?tUCPE1t5ePPywC16cVVutRhGYf+aFbc9Yz6hn5D8737j1LsIicmGZayEzdNB?=
 =?us-ascii?Q?j3e/ET9ZKWxVEs8ft2V81WEyS7t2JFPmseokVUhvSiIIhyiZPckydjgu9BJi?=
 =?us-ascii?Q?GjoXr+vTDAXglljhSoPFwDOV3fDiQwkoydv19ZuULfRUrxIgH4Q/M4rcuJy+?=
 =?us-ascii?Q?V33KxYgwig0KD4nqx8IxeihZ8aLeEIJsmaxUs6T0jUgMv5+0UtOhQ3eUChec?=
 =?us-ascii?Q?tdlfZSbFkX0bLz+5dyJ/1COHW4WGnR8Vz23Y4fTwqcARe4HFi9DwoYuOZNp5?=
 =?us-ascii?Q?SY6CuIw/ucVLHFBS3cbB2ol85aR1mHwJJZ08xW7Yf1BITbK4ad01d0jJX9cA?=
 =?us-ascii?Q?yrAdlSyYJx5n8IuBzJUWCuKZxqqdbRMNUWg6WZemw0XSvwuq8MK0ZJSzhanY?=
 =?us-ascii?Q?JwfXfxW/IzCs7Jbs1knApmups3iAU87uU43YBKfgMEJ4IPFqY1VRLGl/Oyu1?=
 =?us-ascii?Q?+1fG/ECIABYviZ+YinazazfyDzwBz5qDcHGl87HehmEMGE6obJceVm5FnHg+?=
 =?us-ascii?Q?C1lUwZHU/Wt04O50gF2eafdH9HIQYkr10OcMpE/eMpnJnVLqQd85MyLJI1MY?=
 =?us-ascii?Q?GETSvvza8C9IcIR9QUyt2o4A7YANI6CvOssFYMeI9KN8cnmfHGaer6opZWYK?=
 =?us-ascii?Q?5vfE92E/YTDCPis07KbjFKgASRw/hvy9KI64f1Kh9Trp9Tut+TcN90IwVEAz?=
 =?us-ascii?Q?T8xEyzaRMzPPMRieBTjNtm8RF2sXrhTZOsB7Hd/dk6iITcIWvKL/FQRZJJtg?=
 =?us-ascii?Q?wPTkkP+hLNhUo/I2qcCow832tGBp8kBeFdeoD6TFNAVCLlxtgPNGdfqDtd/T?=
 =?us-ascii?Q?RdNNIvLCE/X+wboKxWkcSrb1abUp0zvg5oWLN/LuBuQBb6AnxQ2t4ZFNQnrv?=
 =?us-ascii?Q?QYkLOK/hU0uygqXnCOf4keLWNduROB0ABMq+/CT5OAr7OWmmibvy1s7NIi3E?=
 =?us-ascii?Q?yxSGZ5zbdTs6Yo9YeomnyZviaxTIymVBztJoZZ6ps7REdn4O8Cem9r9CdvSe?=
 =?us-ascii?Q?PgbhuJoc01uwwDPAr80elmWU6xk193DOcNNbWDrKc8c27zSrphimc9/ae8Kn?=
 =?us-ascii?Q?xgS9TM7KA4ai9mZwcQJN1/JOAI1sNfQHVMx2oRYdGqutkBy3lyc9vAO46raN?=
 =?us-ascii?Q?x0q8fjVzrE3iknx9hFVmH0uFAKEArRZamYUAI1zxFBSb2ZNTDp6JQC+V9mNl?=
 =?us-ascii?Q?+B6Z9a77lu12hI6JhGF4H2+k/HjkeYXNQFwBYoa7HXM4Aza/UhWuJB//ECdB?=
 =?us-ascii?Q?UDFbKW5tS/xzqwjytEaQKA1sPH5WIXtHpV32ljENhg2qjoKwtyRJxK4tvPjj?=
 =?us-ascii?Q?rEJo9g9ikK3Ko8OIku5QwGmcRKameklJNSdkC5bS50tuAYvF1IwWe9T0SjaT?=
 =?us-ascii?Q?+ELUVqX9ljlq74cS+H2OwbiJwp/uFuTqws7uQrzoEAEMsilx59q15qqJRTNc?=
 =?us-ascii?Q?Pt4O/k7JEmX9TIZXWJA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a3a31c-a29f-4381-ee11-08dd96ee9112
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 16:02:33.6182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0CVBVSdiLOedEO19SNMCGwcVGs40L9kUEMScjZyCy/0/xf5GicTAWujNZ7ypBVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uALkaS3wBNXx8MuQ2KYo9YJyVloUJiKLayPA7qSw2pM=;
 b=DYucB3a0PS6wRKsJYPrnxEU4UpJ1F2mt5EQEvi0F2WdwRlSdOSWRvwaQtYeiGDxIEZI6jLQdSmBU/g4xNgflKCUcyYdrTj1KqXTabXqO6XB5WYQa+iCpv0WubHhyOlVUCJE6DXLx8T3287PFGl2Lbg2s2+Kp//qm91+r5/GDfY8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DYucB3a0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

>
> > This patch renames the bare-metal toolchain vendor used by the
> > xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> > other toolchains built by Buildroot.
> >
> > To build the Microblaze applications available with the xilinx-embeddedsw
> > package, the following config is now needed:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> >
> > This change keeps backwards compatibility for users already using the
> > following architecture tuple:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> >
> > Either vendor name is now valid, but the documentation will describe using
> > the Buildroot vendor name.
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - xilinx-embeddedsw is now backwards compatible with either vendor name
> > V2->V3:
> > - split patch into series
> > V3->V4:
> > - rebase patch
> > V4->V5:
> > - add deprecation warning for microblazeel-xilinx-elf tuple
> > ---
> >  boot/xilinx-embeddedsw/Config.in            |  3 ++-
> >  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
> >  2 files changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > index a27253d594..31b12baaf2 100644
> > --- a/boot/xilinx-embeddedsw/Config.in
> > +++ b/boot/xilinx-embeddedsw/Config.in
> > @@ -1,4 +1,5 @@
> > -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> > +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> > +     depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> >       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> >
> >  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> > diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > index 7d4fcf8b8f..6e37dc48bd 100644
> > --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
> >  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
> >  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
> >
> > +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> > +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> > +     will soon be deprecated!)
> > +$(warning Please migrate to new bare-metal toolchain config below)
>
> > A warning is not very visible, so it won't be very effective. You
> > should really use the same logic that Config.in.legacy uses: error out,
> > and clearly state how to migrate, practically. E.g. (untested):
>
> > $(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
> > $(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
>
> If I do this, then it means that users must switch immediately to the new
> microblazeel-buildroot-elf tuple definition.  My thought about the warning was
> that either tuple would be valid for awhile before deprecating the old one.

> I understand your idea, and I'm sorry I didn't realize from the
> beginning and changed my mind only after testing accurately the series.

> However I think a warning will be unnoticed my many users, and others
> might just be lazy and ignore it for as long as they can. So basically
> they would never update their defconfigs until forced to do so.

> It may look a rough attitude, but it's pragmatic, and it is what
> happens with Config.in.legacy IIUC: an old symbol is not accepted
> starting at a given Buildroot release, but an easy upgrade path is
> provided for at least one year after that release. So users upgrading
> regularly enough will:

>  1) upgrade to newer Buildroot release
>  2) have a build failure with instructions on how to update
>  3) update their defconfig
>  4) build successfully
>  5) be happy

> Note the "with instructions on how to update" at step 2. This is a
> prerequisite to step 5. :-)

Hi Luca,

I agree with your strategy of #2 leading to #5, so I will go ahead with
deprecating the xilinx vendor name with this patch set.

However, to add the new buildroot vendor name, I have a chicken and
egg issue.  If I deprecate the xilinx vendor name while adding the buildroot
vendor name, it will cause all the zynqmp defconfigs to have build failures.

Would you be ok of my patch set doing the following?

Patch 1: Add buildroot vendor name with warning messages.
Patch 2: Update toolchain-bare-metal help details.
Patch 3: Migrate zynqmp defconfigs to new buildroot vendor.
Patch 4: Change warning messages to error messages.

Basically, the dual-vendor name support will only exist after applying the
first 3 patches.  So you could say, the warning period will be really short!

What do you think of this solution?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
