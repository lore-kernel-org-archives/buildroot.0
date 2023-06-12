Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C7C7EE25
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 11:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD2381F2F;
	Mon, 12 Jun 2023 11:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD2381F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgJPTTl1s-gv; Mon, 12 Jun 2023 11:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263BA81ED2;
	Mon, 12 Jun 2023 11:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263BA81ED2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E78DD1BF2FD
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B386981ED2
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B386981ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDDzn06lDLx3 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 11:50:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32F581EBC
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F32F581EBC
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 11:50:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVlLC1O3nb2Ni55uLjbvCC+VTc3lOs/98yzaz4bh5liSq/n6D2CcMBrdPrSGrO/TXEelrhDYK4TJin91n51BkrRge1hcL4lneUK7pQN6qVZk50w+YEtCBX7h0N3tES7fdBTpLAXOuAG8qC36+1WgZDKtQG+LoTSNtFFGIwtuEplXzzHxk7GyhQMd2bj5uz5R9owUobKs2wZHtExzVdm0Mdh05i+zG1gq4/8KsogYS4eebz7Ve1NBpc88GygJNECAW3LrkTwLysuP4Ts5PtS52IaTu6BvhEO2mkZHe6+jhIoHX4PSrw9MrR0Uz2p47udoU07o4v/ynwLfEa3saBN6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DErz7eOUL8McXimGJBZNNazos7kMMmInftCjosl17Fo=;
 b=f/2grIB+0EoULO9K9+MAldxpGwqsafLIv9tVwfzbsaBXS2ygvUAZM/Bc0mIohxLT0b3EA/hIt2Z12lvTfYn61IqQoirYVVHMxdhVi4QWOqOgsA5UTaU4gGFpnWQ7V/A1MPM2PLZ6YlkcJg6Gb1xWhIOWIJXqcGhmHwKtZCba/f6TE+nP9kzWTJzi1sJnsApei3+S3OZpu1jwKunOHsWXM/HaOLXJHXhLsfdOBbw2d943vESekleLmK/7Gi9p9oOALMPkYjsSYUy+8+UVOQ/DW4wsGFVl7scJNe/AMmcab9S5K/Y5XY4DOWyFoa0RpvvW2Lmge8EnkPmd4gBiTPoiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 11:50:51 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 11:50:51 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: bump to
 xilinx-v2023.1
Thread-Index: AQHZksaZFCVAWnI47EqP2NwiPG9OOa973r4AgAtD4rA=
Date: Mon, 12 Jun 2023 11:50:51 +0000
Message-ID: <CH2PR12MB5004C15C6AD75D9FE8146470F054A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230530071558.24994-1-neal.frager@amd.com>
 <20230605094842.40205d99@booty>
In-Reply-To: <20230605094842.40205d99@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB8015:EE_
x-ms-office365-filtering-correlation-id: b8ced737-c9fd-4a0b-ee74-08db6b3b4583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L5TXjw3u3Mw/S8JEsO5wHY5b3Xzw2i/qHoChh/DcO7ivqMhrOvN+ftQ+ug7C3fnloecdAE3CwVuu4HJhB3R/JI1U9kFM5ZMkuyzTaX4V4MFH131jzoDc27CAwbiX0giCvJ9wZk8rOQeVopWHlWfly1pvqxLERoDJT0X/km4wexFGMglvyla6SK0jK/bJBcJuobq6rbNhUv/6c4OuVF+FrNFiKx7Xyd85cyIYmvm9ooeWjN6Zj9h/aPgDizHr/tZdXfI0No1Rfdof6DlhwIqthTcVfC5a62h0B03RA8jZOrRsjWFF2efNg4tvwuqAUdQoh3ujAbmPTVgoKd8T8J4SVB4JD/u5mMEm4QXWU9YmOyqm7B8js1hQyXKXqmlCL7QvkqDYcaEk3HMmCtKWO9PVt8kwBELDl/T7vkVqoToqAB2RidFFD1AHOm0Ua2z0uatqdaFvzrZpHCKhbgvvo+u4cmMtXeAkWwI1E8w8ZlZAPpHOowdaBn6AxMbTixFzIEcMEBhAJlNuzwaxdE3Xd5rKlVll6VS3KdefwjGRjx1sShBcRCofzunSAOUYKuWBZT/P+hXO6ztMxCPU4gyrWNZh6JCwrktLoPgGhua/LB2aBHBiF9ksL4dZmEWAItx3pO5k
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(71200400001)(478600001)(7696005)(66946007)(66446008)(122000001)(66556008)(4744005)(2906002)(76116006)(64756008)(66476007)(38100700002)(5660300002)(8936002)(52536014)(38070700005)(54906003)(8676002)(316002)(86362001)(4326008)(6916009)(55016003)(41300700001)(33656002)(6506007)(26005)(9686003)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S9w+glw9VIuzLmYyGogudB6MTgzEVzN/o5QIO7pcNj40nfLUvsExJZjA0ayN?=
 =?us-ascii?Q?wxqERDXQwRuqGM9YtnnRRnMEs8eeMbSgyM9AHm8GBbiwWJ0xhYmLt9Gt/hAj?=
 =?us-ascii?Q?9Xwc6TvMBuLBTJd85uZSTRZZ5TpnnGouR6B1KPqhHp/AHvYd09IiIy72x6+s?=
 =?us-ascii?Q?K/tdQA6aEDro5stGyYlXInokg+q3xuEAnOuUsyB+GAH18Bejx9g1BXRotSkE?=
 =?us-ascii?Q?eb7uV3aVv79XGYccq3QtD4Xc/6KwDeJoyeFJkkQ3SSmvC+U+fYDZ8+3dgMrE?=
 =?us-ascii?Q?rYPZaeSnpkQ59pyawL/lKabfM5mJ7wWJLQ++ZK9/v6W4SPXlblOo5mMlqeR2?=
 =?us-ascii?Q?jO1XHT194ZhH9YDZD9g8YQljGIXVupVSNQd1NNFygS9xGeT+2IWswFwhVK+5?=
 =?us-ascii?Q?MrGi8d6isp+cw8Tj4N1sT+zH6ud6CQGpuYsid6TnPJQDrUU2Qn76U4ywFKVB?=
 =?us-ascii?Q?w5EmOHnQndn1JLAZ84/bqAnSTL0BkboiXBbNIqJH4Wli8nWqvKYFw+OXrqBx?=
 =?us-ascii?Q?9HIyAUKiNFqxGeMUdHh7Uzvek1+PYkSTV63ohrxZpeenaUmh/7L5K6auhEBw?=
 =?us-ascii?Q?QLjyVJHhE06vkQRtYZlpez0YBZpwLLSD342HgepAiyLyDiWH+nMlbeY1yVA5?=
 =?us-ascii?Q?ih6SRbjdr6fJ/Ep/LBW8mWIsVy5E/49F7gy2KAflLdQk+/G9oZadABBVhNYM?=
 =?us-ascii?Q?NorFkcV4lV3i7JlFpWNEJkmKrQI+WUVnhsgPeX7BdWXWjY2Xjo9Jd9BHPuxU?=
 =?us-ascii?Q?7eV4tSXoXV1aDAiEwtHX9MXEf2rV+J8Gu8A6hsAx/1eogpYoE/ei6VVad7cw?=
 =?us-ascii?Q?Jh53fBOWXIXcaPjNK3EOIJfoG2dCKPVAAuermvcNQWLOEQ5Nif8YIR4W7fgu?=
 =?us-ascii?Q?onfQZCOJkPB69HakJGuWZpsDKiovpMOkL9+fI49SZFXq/BjT6UHQxyNX8jJx?=
 =?us-ascii?Q?1lyRGR2ZdB8Y+W8zP0pUW+2Ku459txHJVg6udGlFCFueAUX1e3Baw/yx9WCV?=
 =?us-ascii?Q?xL1Des2Qi05NNO7oq8dcubKx6526XAbUXNx9wh69EAmxPwb4kqwlxqXAQGTk?=
 =?us-ascii?Q?KNnh9zs60ysr5IRsilHjZr3mjbcJMZFb/9xb8O5kX8iemJ7/TTo8S9Xc/eWp?=
 =?us-ascii?Q?huvJsLF9yPNvmULp42UJpzrLqn2j2knW1FHXhFWTBOPnQAShZIv5JkQJzqW7?=
 =?us-ascii?Q?S8ul/WPPHhZHyt9VtrZ425tt40PY41a0kDGZS6tzn+BrEgBgIcyeriligEGb?=
 =?us-ascii?Q?TItHZlT5GK/VhgmHqUbyUpfkP0sTNg7px2Nz0amhR8ZCEriZxBXf+WYeRBuA?=
 =?us-ascii?Q?+Hyovx32olnLICrypJIsbz/XzHoNfHqt/ATUyB5Y4eBWMAFT5KqEGPZMqcAr?=
 =?us-ascii?Q?sXs83MN2QpiwrUl/tVBrNeNN6M5ZmdexO8hpNB+BEXI76aOh6OPhJXnDQVsM?=
 =?us-ascii?Q?UhQNWghPsHHKDysL8mWZepcPFInVbkY42xCvuq1AsSzIHyKvM3GwcG6sZ1yq?=
 =?us-ascii?Q?YJ74EoqixnOs9M1t+CSz/SC/cLhduYznuoMTVQwh3l6c+E8d05eSKYijoZU0?=
 =?us-ascii?Q?IyGOaWwKV6uIHcFTSqs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ced737-c9fd-4a0b-ee74-08db6b3b4583
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 11:50:51.6166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gKFZKa+j7uXW9b/Em36Q1n+qjKauQs6n3975wk9jSFzY4+OB3vXYRV18BN8MWDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DErz7eOUL8McXimGJBZNNazos7kMMmInftCjosl17Fo=;
 b=2CxwaCSX/zqHz1KzuWaV7piQiHPn6rH9t23BM0gqd29rKZLLJgyny4YzAmw+LDjn9nLfWCj2oTdqcQaXmojHSaAM6NvJu+D3YMHtiOM4YfwtOaeTVvJdjtJ42qrM4toS9DLWiuj5U7vFhLT1cnIJOP68WoRdjHVpDjVI85yXmCc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2CxwaCSX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2023.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2023.1 which 
> includes the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - ATF v2.8
> - PMUFW xilinx_v2023.1
> - Updated pm_cfg_obj.c from Vitis v2023.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just a gentle reminder regarding this patch.

Best regards,
Neal Frager
AMD 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
