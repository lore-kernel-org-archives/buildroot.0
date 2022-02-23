Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F89360BFB;
	Wed, 23 Feb 2022 11:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYRbQlNvpAtk; Wed, 23 Feb 2022 11:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A419860B52;
	Wed, 23 Feb 2022 11:02:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A872D1BF3FF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0EE84037A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYBdTAetsXpq for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:02:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D4F740267
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl6LO1JqL3C1sIeYE9WA/kLyaZLkJBr5iUKsCreB5m9X1ZCpfREGraqKQEmTsBL/fIvOfj+IOXjvpCXHr9zkysj9b+RIeA45LGOfP+qrgo6LRsAqMRESJZwvTlaeHydEpC5+rcOP6iXeu5iIpYddD9n04tPigbIdmJfqzzEli8RFl7BjT7exreWEBRU+S8UNczLcVPHNG6yx8NFT2T2p11/cXU/kDvkinpHwfmu21vxXwWHFpS6WHId3IchFegCVz6xUKKsSiCJmue2E4E5bTjd6eg12OrYHf5SbtkxzUg5jl3TiPgoVm7kFLo3DcjiIg/XGzm6RJevy/wD5Z7Zllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm+9AvSFu3GTa5+6PoYoIsx3si8hukLfVHgL8v98jnc=;
 b=a48FnaMMRFgn5GMkCLLTIb1FZxGyUEgXfRHMNKBVJVw7uQ9rCe83zKIfHFhC3ZCwFE+zo/a/lCKq9R8KMgeFlzOMSsyxn5ZlYnZujiRWHd+dkuJTF1OZ+g+IjwD1pTSAPw/2FHOu6LKBbve847+2oISVY36iE9VoAOgga2NgHXa9Wo5l2q4FbKDjKz8EvBQ+5kr1yoSs5X6LkW/Y83SD5f+6ajRIfhZanylQuYMvZivB5UMjEFMc9gowDsoDZ2QqOxXZRnb5tioRr9m8jK3ohbrUQV+/ZHFgZUDpSqDKoRJ/kEJ8Yi7wOk4GfIfiHv8DkTCQa7ZDv2FVYbwl34fkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm+9AvSFu3GTa5+6PoYoIsx3si8hukLfVHgL8v98jnc=;
 b=Th7cWs4rFgamKerZzB99/nQ9sA69dZ9p+DV78czA7nDiCHrwcMCcZ80BbSsnp6S0XKjJZtv7u15GM5b4Ewr8QikjjL6jtDhLbijwPijFPEWjoKCkrbFiLhK0BMc6OwaLVX+yR6Mo7fS6GOxeU6ZFwKnzMHSiyPlYWxJI3/EZCrg=
Received: from PH0PR02MB7750.namprd02.prod.outlook.com (2603:10b6:510:5e::9)
 by MN2PR02MB6016.namprd02.prod.outlook.com (2603:10b6:208:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 11:02:25 +0000
Received: from PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790]) by PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790%9]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 11:02:25 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP7iL0gBEM1XGAAA54UA==
Date: Wed, 23 Feb 2022 11:02:24 +0000
Message-ID: <PH0PR02MB775035975B305CECD5D842F3D73C9@PH0PR02MB7750.namprd02.prod.outlook.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <87pmnsnquv.fsf@dell.be.48ers.dk> <87sfs96gqj.fsf@dell.be.48ers.dk>
In-Reply-To: <87sfs96gqj.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4ce4a3-b9c1-4a10-9401-08d9f6bbf943
x-ms-traffictypediagnostic: MN2PR02MB6016:EE_
x-microsoft-antispam-prvs: <MN2PR02MB60166C6E4CEE6C91A78353B8D73C9@MN2PR02MB6016.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hNUe+Z7/UO8nUe10U9SSdDXlmEb31OeeqfKvYs3UPYuYNeA3dOBvOuk037oJna21S6Ju22JpATdyUEFACFcSKRl56Ye8RFISfBB3nmyjRMA2cYb1d1XHeki8x22KTRJAafwZbqCnSWBb6xXOUOvgend5IU/Zs8VFWCZ6q51i6E9SYQt2G6PlrAIkWH8F97ZWvKNpOSdLWskLx1HiyQD8ml0/Gx2hsjub5jRTYFwborKeoqc3084pSdHw+FuaNWSYyi/u1gQcl1o0u21yVeIzNFUXgQWwyxUHac2R/lK8RMWy9M0W7gvGdf7U7BJIzWMW/6ZKwnioOyfSAES12CtjJABRVaOmwjMy6ZjbITUBRnf/TVpw9mb1eWw76NlSe1XC8Ki+FsmWPM57oQNpmb88gRBN4wG2PfNwGr8l2Sb5dRaFbs7Sxo1ZLffQukwdy9HgWuN4fUw7hkF1J6NRzQQmQ64Zn/IUE3lgZeGDpB/KXSJyn/LkG/2jCeZJiTy2ekl47wYfzwgHvEDYMxWbzYCOsYFTVBR2WE3wCaNoyIJAiQD7q1aQ0wKR0yxL1rmlPib4SbwHnvGH4wfjLDJIbRe5rFupTQ+zkPoXYmNag7vDSZv1wtg5RFDyvBDa8WRXY9rSOUaef+S6Kapj3Bg9W1JnR8esa7mPdzfzhXtO5D/3NxACCNqqhd+mqkmBe60Vq01kPpVd34KoZSaefoZWdvWQJxXRMaPtPmKyCAYjxGUgVC+FifqhBrhgzfmoqT7ZzTvLZ3+EGz0r3ariEstgH3zbqhlEituS4mQOVEkxhsomtkw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7750.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(4326008)(66446008)(33656002)(66946007)(8676002)(186003)(966005)(66476007)(66556008)(76116006)(64756008)(5660300002)(83380400001)(6916009)(8936002)(316002)(52536014)(26005)(6506007)(71200400001)(508600001)(86362001)(38070700005)(55016003)(7696005)(9686003)(122000001)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjhLdmV0c2NGWnFCZ25YNi9LTkxxUmwwVjZpRnBIazdVbEFRc24yeHJ2QVlC?=
 =?utf-8?B?dE5xQk1nYTZKWjBmVWNidmp5Y093MEQ5Wmp6Q3NTK0lvVWVpcitIZ2NhcXlS?=
 =?utf-8?B?RjhHMndteGcxQVVJWmJFVnRraTBHSUJ1RmdCQVBRZHhVK0JvVXRpQm1yVnAr?=
 =?utf-8?B?anJkRXI1V0UzRndwN0c0V21HQWZZdG94MW8yQUdiMjZQdVJDWldwT2UvcXlr?=
 =?utf-8?B?Q2FSbUY0cURxM2FuSXZUR0xyRVhEU3lYTDAxSzlpMzU3WXU3WnlxT1JsdkZo?=
 =?utf-8?B?MDdlNDF5c1NWZzNZN285YnUxRlR2My9pMEtoaHd4NFNva1BYNHVTd0RXYkoy?=
 =?utf-8?B?cXpvelNpSzdsNVVEU2NVSUlPUnRwckpDUzI5NXRTUmpVUDkrbHhNbTVINGpS?=
 =?utf-8?B?YlhVYkxTVytiK1VpY3Z5Sml5d3dOMzJVRytjdHBaeExMYnRvVVdXbEowQTdK?=
 =?utf-8?B?bFkxdlgrV3E2SVRZN2FEMVdQb3UvUFBnS3RUaEZabFFmWWM2ci8vcE00djBq?=
 =?utf-8?B?K0hhekV4MjF2ZllSL0dRQVIrT3ZuNi9mMTRabDVnWHVKK3YvU0ZiTlpVK3Y0?=
 =?utf-8?B?M0svM3B2T2kzY1RGT0R6bTRqSnloSzM2K0ZzNmlTdmM4TFZYOCtwUC9Bc1lx?=
 =?utf-8?B?TUxRVFVuMzdQN1J6SnpBOUVYbFNBcE5VdlZUREpsNU1TSm1DQmFla0Zac1JX?=
 =?utf-8?B?VUV6M2dGeXhkVitaK3hDWG5PUU12TUQvQXJ5aHdKbXE4MVNnVDBsRlpua3pE?=
 =?utf-8?B?OG8vTXYwRTFVSy9VUWRBc2JweFI0MTBzUWZURS9CRDdrbm9LSlpZcnhFTWpk?=
 =?utf-8?B?VVpVdzRLQk1wVi9YOEJua1IwYVFXSWNIaHVNYmJFdUhHc0lQK01HbVRhLy9F?=
 =?utf-8?B?aGFUQnMwZUFoWXdxVVVMbnc2V2VJQ3ZBYkx5bW0yMGUyZWkyaXBKdDJwSTd2?=
 =?utf-8?B?Njc4czdPbHo5RStieS80akQ4eStNVWx5SzZ5NWtBeTNXcGJuYjNFL24wWHJ0?=
 =?utf-8?B?NGc3L3FjZW5BVFVROG5HT2FBM3BvRDNicnQ4TElPQ2tHMEZENHQzNWlObzJu?=
 =?utf-8?B?UXdad2xvZDN3OWZ4R01Ta3NTNXhxY2NWT1dVZU1jcDNMMnErM0pXT2J0MlZG?=
 =?utf-8?B?ODR3WEEydG1pWmN3c3FBWEdGcGVocG1WazIvR0pFdjQ1QVE2R2pwRGo4N2FG?=
 =?utf-8?B?WHdPUXZRejlzRER0NGV2VlkybGphUkgzMnA3dzN3bkN1ZlZWZ2xGTWpMUnBs?=
 =?utf-8?B?WVdOekJjS0E0MzNWdktqWVptcjVoOGJYSUhLVmE4ZXZUMWNuVkY5ZkQ5MDZY?=
 =?utf-8?B?QjFlSDBkbDlkc3dOZE1WYUFVN2Fic0F5NDd6ZytDSWlqWHZIenJNWGwrZzY2?=
 =?utf-8?B?ZHlQZDllVnBicHZDTStuSGNNVktBV1FUbHYvM0dBNExwRlROQlVmLy84OUZ0?=
 =?utf-8?B?dW9iQUNKY1hTTm5vSnlVYjBxV2huVnJmUG11eGN2VERzaUhFNnFYcDA3V3ls?=
 =?utf-8?B?VVIrcU5MaWZpNHdhRGUxLzVCaEtueFpKVlJ5STI4Nm85Skk1S0RLY08zamI0?=
 =?utf-8?B?VkJLaEhDVnBxL1ZvODQ1dXBreS9HUVdUSDZTay95T1lyUjZjeWQ5d003U2VU?=
 =?utf-8?B?Q2t0NWRrZmdVN011OVRPMVowZjB6eU5aRUtnOGYvRmgyQ2srcDFmazcwZWJU?=
 =?utf-8?B?SkthN3hjUjBkejkwVm8veW0ycHR1RDJ4bi8xSTVLTVJ0eE9Kcy9XSENiOVh6?=
 =?utf-8?B?MGh1VWJ0NFpPb2FDOHVZVnVsWUQ5VWRVN1NPcndUZXNhbVhtNTJDdG1RSExo?=
 =?utf-8?B?eVFGNUlvdlQvTjRlYS83QTFTNVhvUTBYS1ROMVMvQ1hYRGxJYU9LbE1ENjlT?=
 =?utf-8?B?YnIyeGlub3VqSElHd2ZOVkVmL0pOMGZCbDhiclBWZ3YwdGQ3b2hVWnJteWlX?=
 =?utf-8?B?Z1NsOUlGNzV5djU0UENGY2pOYTVvTWMycGNsT0ttR25UYVdGNUdzUnd4VXd5?=
 =?utf-8?B?ZXd1d0ZjeWd3Y0VrV1RJekdRdTNXQ2MzdFFHS1NPeWZ5UmhDU2U4QkF5a0hD?=
 =?utf-8?B?dGdvNFFZK3dHdW1CQzJqQWdjdlpGNlVaVlZkZ0VTM0UvU1M0RzAzLytQNVNK?=
 =?utf-8?B?eFZBT2YwV1owQnZFNXh1NzRoNzNKdUQ1OFFSYmsrUFl5bStUdStVMmlKaUFM?=
 =?utf-8?B?ZFE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7750.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4ce4a3-b9c1-4a10-9401-08d9f6bbf943
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 11:02:24.9658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rfMqsCUCBMNGQGUZyDL5xKUKz9MXb57XTjLfXoBaMvUFbw8nyLBRC/Zdcwj4ufctgobFozFVeQRJuItKuB8qQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6016
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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

Hi Peter,

> Hmm, did you test this on a zcu106 board?

> I just got access to a zcu106 rev 1.0 board and gave it a try here, and see nothing on either of the serial ports.

> Looking at the u-boot configuration I see that xilinx_zynqmp_virt_defconfig sets:

> CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu100-revC"

> Which seems to have a different uart and pinmuxing setup. Changing that to zynqmp-zcu106-revA it does boot (but complains here and there).

> This is the first time I use a zcu106, so maybe I am missing something, but I don't understand how it can work for you with the zcu100 DTB?

Thank you for catching this.  I will take care of getting this corrected with a follow up patch.

The way zynqmp_virt_defconfig works is described on our wiki page below:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841973/Build+U-Boot

The reason why this was working for me is because I had the DEVICE_TREE environment variable set when building.

make distclean
make xilinx_zynqmp_virt_defconfig
export DEVICE_TREE="zynqmp-zcu106-revA"
make

What is the proper way for setting an environment variable with buildroot?  Should I add this as a pre-build script in each defconfig?

Best regards,
Neal Frager
Xilinx

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
