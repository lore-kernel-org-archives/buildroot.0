Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A30C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 07:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2624460A4C;
	Wed,  3 Apr 2024 07:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5rIfgyzvXCF; Wed,  3 Apr 2024 07:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E8F60D5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E8F60D5D;
	Wed,  3 Apr 2024 07:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E307F1BF36A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 07:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDD6D415BA
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 07:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYoMuAySzFdl for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 07:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::700;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EB20405E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB20405E2
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::700])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EB20405E2
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 07:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtCJcYosy+Az89dnwxFn6mMEN5umG9lKk8cwtpGdxo0F8CB1JCYYo2zhSJzT52f7o8ca10DqCA/rHcY4FYTxyVuNab1h+u+QJwYxKKAnQ1zw5t4qegfKjtcwjPOnZ2NsYSPJT99Z2ki8RVZXkm4SJRl1/uVm3uAD78ugyrkG5Br4g+cJ1k89KBamhivoT7KZP3KUxGsxB1svlhpDlJlWWXmkVhz9nRtGlmDc3cXaAsh0Mf5YPGCYGvt2wabU+bcdCKPkTnmq453HWTH/NMl+dDkDPF6T4UuQh5hCCTJKXmfoPOMsRSMr6vcXrkyMRvU6NfLy/AlBG4G9LFgbJvA5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9fQEm9ffzS7xypJOKZbc2i/shW4k6wuN1M6RFmPo58=;
 b=Pw5gIGOgbJ4T75Dn+lvLw9cHhWpCczm4fuUG+4MpSyk9PImQ7idfvZ2iuMJe6mp2dfn24T/A4OuA0g/CIwVXOEtupSk0TAvLbac6o/S081VhSfzRG5GKBne74I9MSVVS7eGpvupgG+7BBNr4hKPyh0XpA0IMXTck44fAlwo8bePG+tnMb8P1qtygJVCuEj2tgYjgOmBHzAFrWq7ChKwH2Qttqv0YLC9GyrHuwOPmJ0MIZ+ts1ecRVJtXSm5Trw0lEI+S6MFAnYKbAneFbOxXlqnyI+Fs5R11gsNyE35qRN4pjsRObFss6bIzhzuBGgd7W14TqRusg6MhADMQN95e/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 07:21:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 07:21:10 +0000
To: "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [PATCH v11 1/6] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHabgdsbJU4KQHfH0ygy96cgtM5wLEuZ8yAgCfq5FA=
Date: Wed, 3 Apr 2024 07:21:10 +0000
Message-ID: <CH2PR12MB50048BD7DCC1F5AE371EBDECF03D2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240308224525.56790208@booty>
In-Reply-To: <20240308224525.56790208@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ2PR12MB8739:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Acdc3lIkj5Rlkziu9+H6GjGBJm8t03DD6voyb8aCJakzAQiQumD582BHsG3OGQ//qHvfJ0jx46FEaCs60jCA8CPjNwEy/l3NqPVefIKHC+15orcHvEnETsfmOpeOR/Q8TtL+IFUAJ18sw6YPJpbPJDZf83kyYHE/ZhXblP0WrhiCffblWDwE3B4NL+b0I8mgD2pQifIsI7Zy5wpOjj03xjbt9zJWT0nNri8ALxCg1B8Q9trJ52CLdAJ5dm4gy7qhGEM9JfugfQLW374NGIBIJo49xrND6W7+oZ3IHr2klOuc6FdQd451LqtZWkd/ygOaDbBzI345sVGydl6r3G0a1gL7RLaZtWDhslPW9iydJoESoACRGvM+FwoLIKyMf5oIMlwGvyxDaIRrynaJnhxMievhEBSjqL3xXcMCzaffiAdbphXZCgvQe1vYIgxsveC4x+3ulqMA3Vp3rA5vv0ttij4xHbwBs0ksZruWR5oKyTgMQHeLP3hXRyGJ+mR7NKcVl1raa99ejeKVDfIrhUdvKGHRNK233KsO76lYv9GKbPGyXgK/OYfGAkphZ/ruMzK7j9+2S/69QMsFH+4nNp6z+9a7HJjzB5iE4UTalPCvftduYa+9KPpIeO5vVfPWiNYehvjVzgz/rteic/M3aqz2sMPZH2COzI2Bv9HywK6EZzg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UjSvRjZxbpUz9UatQBhrzoDjLA/DKXxKlAzoRFUvcMfZ3hCG/1b9b/19456z?=
 =?us-ascii?Q?pooDoDAd5hLKrFpU6ShqN6DaLym4k6yL/eViNfYB0OOjPCJ/NSEWVYIcvnWc?=
 =?us-ascii?Q?CQG/yxVJ0M70TgrCvrVMAyfL05jPTgGd9F3LPNCzs1/yWnXB0AZ/bO5crtPY?=
 =?us-ascii?Q?G7cSN5VCAj9D6SEz8q441WDjFVTUIfZOKC0SMux6y3Eg+1nD88FeF504aXGa?=
 =?us-ascii?Q?aPaZHSrILWMkYJNdPL9c2cSnu4d4+SdkmYJ2zAm10vXfZ0sOItZKtxK3l+p+?=
 =?us-ascii?Q?k7yUBzirXIroiuuk/we9s6MO2vgNPR3khVvgjCARxKv9398Nr0vThTbaHftY?=
 =?us-ascii?Q?4H31AY9qKZvSLYhJBT7dCGdljL5HtgfE2+54lPPeITWflF1C6bK0AQkQw4hW?=
 =?us-ascii?Q?oaxAm0i1piDvv7CCqPaZymfqZZlUy0IXmWjL4ZsAUSWrTapUkBmj88gjqxZ+?=
 =?us-ascii?Q?UkuoG1YGWjUPfbsYzFSSInJZJ0LSsGnxVBlKwP4NhqbdscZAhBykUONu2fNi?=
 =?us-ascii?Q?b6qLXYc8K6K/WJWv2KasK0a+ZXK3GriML2EOZOv/cPT5Ya219tSn9crsMlhU?=
 =?us-ascii?Q?NW9nYalWtfe1RSHz6B48l/zqwdy3QbS38PFJNaHaphpYe2+T/CsqQs4Es0Jm?=
 =?us-ascii?Q?JYZDhR3ANR2lVKBnwDycmNRmfj9HakRHwoWs1GGVPBXhtSxPYUBWst9VqYTr?=
 =?us-ascii?Q?FjJ5E6yPkb3EhSdHdF/KW4PUpMTB8CuJDX9uO4pnB5c15PHOaCOSW6r1mhIg?=
 =?us-ascii?Q?AHhnIoM0Sk+hsOXeEuc9yA+LiNkT9JaW6lTviwG3rO0W7IwVCdK5oBqoI4qR?=
 =?us-ascii?Q?jW5i7rnbVIbbaK+drZEEzTRy58O4w+ivhJk88etxlJuItmwhc7sSAFNaRHry?=
 =?us-ascii?Q?7RrC9fQgI+he4Ddie99wpuzdPRurjHLHpmvdQQjq3hsX4HF8UGD3BjGtYslm?=
 =?us-ascii?Q?5R8l0Jd5OCBpK0QnVBZkaz5C6oVQOz0fldZCbm2207ClFw+ce5hPLe1+QgDD?=
 =?us-ascii?Q?Kjzre7u1+OTBIVZoqQoMtj/DjCz3HQ5qY4i976a/UYM9b6zzJsijtG+nvqUn?=
 =?us-ascii?Q?KkcdHxE3wiTvyJWnIO3QrdtdiiPziCRI1r9BQnh1jBXD31/uMNr7Ly4ttHMx?=
 =?us-ascii?Q?tZq7tEHqx2mBmUV7XxCPjmgl4MQrQD338/mQYnC+yPIxujouuTQVWSA5WIzk?=
 =?us-ascii?Q?gf1SI1ULxSaERbYCIOiIoJQhbzvzg71z3eLuv+mhN6ytUW0eJxBfriHyqAFe?=
 =?us-ascii?Q?pK4siS3alkykdjWZOA65exAOV4DVMNAukt9B93EcmkJo/dStHURuVK7mefml?=
 =?us-ascii?Q?a3567nrm9y1j6stTZfqcfxWXzNCbsFuxQvfIVh8m+7NF3tjkGkmPKaFKY+nZ?=
 =?us-ascii?Q?K4CsXN9CK66H1SpKzysM4cqDsDmb/35on+ge5ahVy/MsNcNVsA4v4eYJXdcG?=
 =?us-ascii?Q?ixKQNdmKE2Oav9TNkKGZQHM0NYQwwmddO6TKrQZIrHHvkrsQF+cRuR4Gan50?=
 =?us-ascii?Q?kRbhqgrW7liS/MlXRp8Lgy7n/XU8q2vbRB4cJH+42vv6FCYelNZHS4G0Vvxd?=
 =?us-ascii?Q?fsUQWHIgeevq84E92gPqax8EYE3cXyy7D9D87iZ8afHGRa3LA2jGDCbwEeBh?=
 =?us-ascii?Q?uyiD2Tn096U39TArRY1f1bc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ad8000-a040-494e-a5ee-08dc53aea2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 07:21:10.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCKP9llXqle5pC9AKtGqcY60jG1DZRz23FwKKwOUdXb5d2RTkS9zvOUe4TRbiqzQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9fQEm9ffzS7xypJOKZbc2i/shW4k6wuN1M6RFmPo58=;
 b=Fc5Q64i8dpJ8+oyp/YvMpMvbp5vGJPkjVxtwGer/VWAyShrCIfEp1VQtVMs22nY+X674TmRow9V5g7G5olmZUB/fKldk9YZDYY6fBXniVcCyoxJGcUTU+vxJiv3b38P9dwkQFaIP7tJ6gQrVFUySOqaDl/Ugv3Orhm8MU7e/mOs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Fc5Q64i8
Subject: Re: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek, 
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> [Tested on Kria KV260 starter kit]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Do you have any thoughts on this patch set?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
