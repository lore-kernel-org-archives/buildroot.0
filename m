Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB32C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E00941599;
	Wed, 23 Feb 2022 17:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehAfqHKlNkjm; Wed, 23 Feb 2022 17:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7138C4156F;
	Wed, 23 Feb 2022 17:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7346D1BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615AC60F7E
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwSrKsQ6oXG1 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2F2D60F96
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmXk6q7rFWhtJXPYpoAcHS745Uw+BZBSoljFwaVg4eDc4BkBGMOmuAZVVeJuEoN8H+TxWHTBOgBZJzGIGg7I0KdIq4ZH860lFfmoc7aj722Gwj2n2Bpbhqr8TZm5fKlO7iDS7EPBeGEJXSjpWawRHEDOZmmrKnpZyOBLHtrbWn4DijmLXCkJh9THRSRxxUpy47vNnkRnpsA1hFZzUrXQ2TVdk5PhGTOEmsiQuLI6uKjDRJdlpHP0viZUXI7lkEjyNSDJampMkVX7frTAJnnzV/D2BAcPYJoZ8k2CanjUZNFpm+R7AymgLDvNsXiEcVsZ27D0kebmzbM9AljSCTOprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM8v1VlHw06nL6UOsCD3P40iXua9LGO9F16ETbTI5n8=;
 b=fNguf7JFdkNe8XuwE+aMIVt43YagF3PG2R1ygMTkDRKrHZzXohK0sW0zM/+hqOUunlVFp1BSO8wpNjR24Z/XG4xtedL9x+0ZvPH9m90ciw2zoucO/O3seV8vCB+9XhjsG2ySLPky9DVE5T/UjewDh50m16f/Jus/cDVXd7fFr/9mBE71Xp8viLFAOPJKsKMMnbpL+dPPEaGtzVzHcxZxGJfYnguLvt8z5KOXchgHk8OG17+OtJRS72KKJ6d5CjC3bc/wR1i8eMqQTDC4qTDLRqE+jwTKjwfloXfQ3PHc9eJlRxcd4L2ACaG8sDQycSAQsKZo6zskl3qenGk1XwIUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM8v1VlHw06nL6UOsCD3P40iXua9LGO9F16ETbTI5n8=;
 b=Kjsbf8HKSQFvmp89flCGb8OhBd1iEEmVxU685Rj9kjPICfpRiWz9wp+n5lv9hyz7zsI6cE930/fxDDLr1JprM4pEnle8OLKgh8Uo32Nq/po7hVDZrFdA4buK64zxkNdpyGHMmZZI+cDW7/N/jF8Lh2xtTXLCih4VSO5aRSedjBc=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CO1PR02MB8379.namprd02.prod.outlook.com (2603:10b6:303:152::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 17:17:38 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 17:17:38 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKLQagJosdMgR7E+1YH+HJPodRayhMSOQgAAsksaAAAKkIA==
Date: Wed, 23 Feb 2022 17:17:37 +0000
Message-ID: <SJ0PR02MB775844FFF4322F57412A1CE1D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <878ru15x9p.fsf@dell.be.48ers.dk>
In-Reply-To: <878ru15x9p.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2be72c04-3fda-4015-ecf2-08d9f6f0642c
x-ms-traffictypediagnostic: CO1PR02MB8379:EE_
x-microsoft-antispam-prvs: <CO1PR02MB837982D532AEA1A92C52457ED73C9@CO1PR02MB8379.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rZJaaWvNRgBMxPxBy8Qi6ayp4/XHnTQLz3mx6ORWMqo3DQ6lv/B6j9g/IR0pSbsl5slrU5bz2SpJhb4EN58TxlzKFhvBbamfYxqe8ymFrika/G0nZqnKsh/rZPvj5Zp6wYU2Weh6xdTTfmQIRwo32/kJYBMIJjKujjVbN90+lLpwy3RosCGlwKB1peO/UoaM5FE6+mf6zgXNin5Nkh+0ftcFYL149OZOC0xyCZD8jbCqVQDtZmxSKlzP6aHzcZJCzMiY2kjC6BO1y6eMbTRUz670UTyimSKp/vrxEILcO3lpHtrudvAp+Aa/E9e+taYCv4Dzg19DXAxbQW76RYxZAiTlM/pR+hCBu46M+e8lYFltuDUd60Yl3NCoVYaegjX8vi0c7GlKR2mynEFgamBNeZXKfF+0LUv+uZkbC8439iF4KNSMaGdAAQ8/W1BeFIJzImqhdIU5gg/53p0VgZnmQtSLTiTOIEKYbtfaGMYBNYDMZVoFVOaC2faOYW4xaBH+tg30AEXrE5RuUtTjmK43gj6q5i5Vb3Yl/BJ14dZKjCeNEdJBD7u2pXiotjuHCnbb8eqmoDexsox6R7cfBunK/3BaIl/fAeww/gbZCO/ARJhieE7h5sENb5aWqW2V3giK0YtbAygF+1SXwJM2jjlP340GZo17DaSlYLa5MlTfrvKpsdjUCsoBpP2nZQa5HSg7IBIgEL+hPJewJbQ/pcN+Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(83380400001)(33656002)(4326008)(6916009)(54906003)(55016003)(26005)(76116006)(122000001)(186003)(66946007)(6506007)(2906002)(66446008)(38070700005)(66476007)(64756008)(7696005)(66556008)(71200400001)(8936002)(316002)(4744005)(86362001)(508600001)(9686003)(38100700002)(5660300002)(107886003)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A7id7io0S4YPw/KuqvkuqFDTUa2p7svHdPo/+kXbxt/ljfKwdLUT88HX2sGM?=
 =?us-ascii?Q?624Pn00uH5xl3h4K+9grHFEM/pmwLvtx3S2ABIkNd9J8iJzW8LmRJgqk1PxO?=
 =?us-ascii?Q?6A6uoJbrrNS11xOz60c/AZPleFZmV/60XMu+7GjqPYn108bApwz0PgJtTyBd?=
 =?us-ascii?Q?YVHZ7ZA1VYOgXLxRoDbed5z0THWk2K263CycAfo/MhCOQcffwVUw7a7cdz/F?=
 =?us-ascii?Q?e6dWMwyd6BYsTIIZwA5+svvssL5X9oPkOYKZXowngn3Cufc2sVh9V5M7hJTn?=
 =?us-ascii?Q?KzCOnRoRP3ia7IRZHyq8tuXLqZ8g7rql+g1Si5g8cWjSDY6NfLj8o54hg6//?=
 =?us-ascii?Q?bLfe7izoSl7X36w4Mk6iipYalKsH2Ggp3k7yzoqxTLy2LEGKyWtMwF7/D7BR?=
 =?us-ascii?Q?Gi5QUnVSlUNAMBPpmmbhyvjkA+bcFStFDAhhjERGo3V7HZOBAeEgCVrAufax?=
 =?us-ascii?Q?OQSsNZnVZx11lVol5yOff885f6tG4ccZg5QqIwJrza9Hi2BqwbrBjONRaYti?=
 =?us-ascii?Q?LQhq5PvbRZMBKlv9w3jUkSYIO4ecc5OwK+npm7eREkBoyiAyy6Vp45C3ZJPk?=
 =?us-ascii?Q?tH3vKX+39U/i11s2TienPQo1UjjhFlF8xwlMnypCnZvQ0pu1YGP+CxeBc/iy?=
 =?us-ascii?Q?EtsRn7gLT/xDdi4nh26dA5TeABaXD2IKqH7u8Utg/mcl/ZNQiutmR1pdgVvq?=
 =?us-ascii?Q?kNiEVtFoeWWO3LKIbvoTDO6RZMaiO9OKHjAQ1vGoSOd9Kwpn64bE4ok/Pxxo?=
 =?us-ascii?Q?1O19e+xxfJyvPGORsFaCnLm2YJPYPAEKpa81lyS5ao6KsjI6Oe+atLMMM3UH?=
 =?us-ascii?Q?KFDT9yShklau0OmwGtiNntd1q0w1J5XvaT2XEtAGKRe1n6gtbFUNRhyMBzHf?=
 =?us-ascii?Q?POvtLSpWn7gu6NtyUUd+5g78GKmn4eX1G/sTkcNSFyQBlDrJ2zTkcwnSsKUT?=
 =?us-ascii?Q?9r7bOC76zGsPsAXxDHmBmWSozXJRNuC3OFidwqqhCljFGwfpJ8N+m4Wjox0K?=
 =?us-ascii?Q?dPej42Swa4EQ7yLzZDn/hSzlM0ceYpECks2CDh5qxk9/phpJNEGN9r4zcZTD?=
 =?us-ascii?Q?yk66STtofB0KSCQvnoxIyG/odNAVYLEPYg73sVeMMH0VcC7xg88uYwH0G0lt?=
 =?us-ascii?Q?ISUmbMkTUoxdg+bHZVz80Wh3zKTS4n1bdZKx++bE2GyGegqZt1VWM1xPxOyg?=
 =?us-ascii?Q?YYDVTwlF4tSEf0woFxjKZQY0aL0qlc1qDDGPpS0pylsXYwlpBmmmvlbVVjRl?=
 =?us-ascii?Q?Yc6csd2ihxxhuorhaKylHGqXtSiRS3rRLDRxiT9jnChFzIew+WqNfugvvX9u?=
 =?us-ascii?Q?UZX6uPOPmR/npc+ztW6UJRdlA81O9BBNJuxw4ojyyZEJb2q/OLeOXzD/3I3n?=
 =?us-ascii?Q?7c9981h3IdRkTXLh1J7pYH3ZyKcAHZP0Az8S7de/qpAgJ1r2jcnvSgkW0vYF?=
 =?us-ascii?Q?my0NW/yXUxIM2HsyYm7uay/aUKhuBoEbPk34nfu83jVaeiu7fWrJz0NS/Zdk?=
 =?us-ascii?Q?IUe15lKF2PooKeVovGHBV2qSmSYbRHO72+O7y+kQHB656ATFNRGTfL6Fftom?=
 =?us-ascii?Q?bOEN6y9scZ4GA3ANQilelbTHO1ehLDE+XKiKWMxdDy6YZ7ivnsImAiJEnVEO?=
 =?us-ascii?Q?GA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be72c04-3fda-4015-ecf2-08d9f6f0642c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 17:17:37.8823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5e5drtUcYpT3AobD3uJ8+KByNKubJWyoO1CR9LxtCbW9UbSijwXm22qMuKWMTFat2BZLkq9yngzE9slAjjWLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8379
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Luca,

> Are you sure you are using a clean Buildroot tree? It works here with your patch applied.

> Easiest way to check is to just do something like:

> make O=output-test zynqmp_zcu106_defconfig make O=output-test uboot-menuconfig

> And then scroll down to 'Device Tree Control' and verify that you have:

> (zynqmp-zcu106-revA) Default Device Tree for DT control

That is good news that it works on your end.  I have just started a fully clean build to verify.  Once complete, I will submit a second version of the patch removing the version bumps and unnecessary blank lines.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
