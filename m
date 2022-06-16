Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A13CCA47A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 08:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0B141A63;
	Thu, 16 Jun 2022 08:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgcLtLmp0buN; Thu, 16 Jun 2022 08:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E247F41A5D;
	Thu, 16 Jun 2022 08:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99A591BF870
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 08:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87E8C41A5E
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLA-wVtXYdfQ for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 08:11:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0DFD41A5D
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 08:11:16 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 004684649E;
 Thu, 16 Jun 2022 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655367075; bh=kXUSfM5XTPa4uUueYRFy8KPPOKgszVnlvxT+Y7XPekQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GYAOfirBt3wLlFfk7HhD+s6+2LO9/TZpVHR7KXS+XhlP+wOOwIB7xzTY6bobi5qnC
 howiTwpZwy+BSUlYP5W7sMGAvAKBGcxjiaL/KdGvX3JxOHsYD5KzgEiIOKESEu/CgO
 sa1FfUTt93XdlvyGthwajSV7UI2ZPU7SnuBaTgvGKBwGtIsspF5NsINxpJXuPexfvL
 ZBoaLfw6OBw93bT7BbBCGRx90n38BpQs2UOgfSqHr0LLmaN0NURJJ5/Wm4rEcK5LQJ
 Pa0SK3txjRsKerrH/QoZ8T98XfEMJ2Oz51Qytz3xFl6t5L3ZBCLhCaPnptzz9AH0A9
 Ypay22QbcsG1g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2553DA008A;
 Thu, 16 Jun 2022 08:11:14 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D3C6640067;
 Thu, 16 Jun 2022 08:11:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bTPdF01g";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVsQT+TYC5rUeXLN9qqbYOZq6NdwVefpDPtZEwoidvtGcwsyRzvJJz8pGw4VWTca7TzubUDs+E98vxaIWAbKqQZdL0hSxIj188gZHDEtOUBgnckhO2tvn2LhZTjvemKeer3VhbpiISovHV14NnlFc4phX2zHM2YdUi0k09gevZNvRAcBol5ukrp41y5+/uVnO9debsjz2Aw25Mgb4sE6kcmf+nzf+V9EUvnN/9+aIISHdsE2bDWmxh/Poumi7hh9CPOF3KNDhj2wMrNpWxfRYurPK+KFRJfpHx/QRiG8MTZq9WKNjtZfhYzHHFYTTm5mmU9VfgiJp6lOeKcODjxGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXUSfM5XTPa4uUueYRFy8KPPOKgszVnlvxT+Y7XPekQ=;
 b=a6RFX29MWTbSDuv8Dd8OV86VRUyw0zhK6MLT+7wDWSK1Yx+9mxT+DD9Vr8SZZKDlVUYCr+TFhMrjQRpH5YglZHrwMmZM7ZPR3n4fiyR8/7WauvPGtkk/R6wN8ToY0LiaHe0bYYosHu/XIKC1YRLz17674rrIgxHK/aj8bJ+BlCMJvvPVUWyVYFqaisox+ZX5Gbu9nqBkcJl+gnJpkeE+oN5J5zqdXgKfW3hrDEJ15DNKXscnIse35bSW2gSq25Cggwcce/3X0elcQCBPXInn413mHnh/oKFKUZhLDiIB0ebXYz3ErZkckjqFLppimOokYXyT6n3Osdb0omSWZ1nGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXUSfM5XTPa4uUueYRFy8KPPOKgszVnlvxT+Y7XPekQ=;
 b=bTPdF01gdWpoKerQIMqJlJwMEt2wt5aaQcHa4hhKJz3OrkA/urPXgpEAYAG8s/u5PsMMeZwc6gWiJQ027NE/J4MBSINW9VYYd4wHDeb19hVlDmzLc5rutTcjg+iZUVbLDrQQdCshiGob0Ni3bEQUcS5MjnrFJvnhZnrdehj/C38=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 08:11:07 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 08:11:07 +0000
X-SNPS-Relay: synopsys.com
To: James Hilliard <james.hilliard1@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Thread-Index: AQHYf9GGNdBPjuX5nkCxwDk0/FmiVK1PJLyAgAEslICAAM35AIAAkluA
Date: Thu, 16 Jun 2022 08:11:07 +0000
Message-ID: <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
In-Reply-To: <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43aad5ea-d598-4650-4f55-08da4f6fc40a
x-ms-traffictypediagnostic: MN2PR12MB4333:EE_
x-microsoft-antispam-prvs: <MN2PR12MB433352A1D99E8C753B676396A6AC9@MN2PR12MB4333.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79l+OcQ1E4BcWn9abofaRjsXcVUU+ORJt9iaT97mG88Oes6CuuDa3TtkY2EyELHtFfDXbtBsK5CsA8WGNNwppF6bZ3ueAy9K8PIbt90yfLI85a+QuZfu+4J11mHyEJSDBX9CBCsTaTgElFZW7rS9R/awheXEBz7REmRYoCcDfLNr7VjmEpC4JDVpC0YeBUHoXAGB+zbPHCUmxOdN6YdtsyMwr3Ypq0b6Is10HbIezbC6621qyH2ql2dghhfYJ6PuuSL+6egzIBrIKm4wYM93w+pAdsOrG55ak52xHQN1wP7eyjxn+FpeA61u3jvcp802jkU5wPMJ5lmi4pmYB/CYhjNVBZwCOXljFcoY/pLpixtt3yuI39VCWNiVf9yZ2Sba2lhhIhmt8LfminqGTd4WohoOC3A4ILhcLJVmOmARXlz8BEvozdmT0jn/vMTNbmksg2b65dFf4Q62hQJUPeEZ6ROgBfSJeEZ5pcJ5Bb3AbH2amHt97PZ/CZrhTsl9NCYlpOIPOIloBcqEzKGIK86rR6FDPRBsUVt2njfAq/oX3dfJ1izajVGTqTiG8cEepbzanKZGLv+8AHCkNtFiScxCM+RAPEqEwZkjK+X6gv9tU1QqNN0zG6/JpCcFSDfh4ngG4kbWo8JV9UiYj60zrKa1JEpUi0fbkNHlUnFUyTWJwy46j4RjWtcLq0XZ8OlEPT8tkS7+geMfSP/lK4yE/Xgqdef80NrzYFZPRLZBGYMmU/HoWs2VWDOSBkMRJe0qP3aA7Om6yI0HMjOErVue8Pt66nMYD1SnvSAuz+RAzTcgMD5SqsxfBG/xsIEypHIAzjVL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(186003)(316002)(966005)(71200400001)(508600001)(2616005)(6486002)(83380400001)(31686004)(36756003)(54906003)(110136005)(76116006)(38070700005)(66446008)(122000001)(66556008)(2906002)(8676002)(4326008)(91956017)(5660300002)(53546011)(6512007)(66476007)(64756008)(31696002)(86362001)(66946007)(38100700002)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dU1QSk16TFQ5cVRlWWNZTjNsMWFHTEJCL25jRkdwOGxPV0pkcFNYUGx4emtH?=
 =?utf-8?B?WksxdGRySXBkTDR0RlM3NE1LR2dMQVN5eCtqbE1LOUhXYUdQOVNyeDRwZkJ5?=
 =?utf-8?B?aTBYazBEb3dkSk5BUThMOWs0UEtkVXBZa2FDZ21KZmNDQisxRlo1S1QyaFdM?=
 =?utf-8?B?bW83MFF6Qy9zMVZDWisrMCtBSEJMWitUL05FSkIvek9vWTNlSzh1bU5STURw?=
 =?utf-8?B?Y2pTWnhFaVNRVHp4azRkbmVwWS83SzZlSDNicWM1TTJHcm5OaUwwbFZCS0pS?=
 =?utf-8?B?eVk4dis2SlpwUGpBOStjYUNRYmJSdysvNUsyRHZhem13YmFaajNFNXVvemZ5?=
 =?utf-8?B?WHRwNmp6WW9idVpHOTY3WWdQMWEvMFdZRnoxdGkzdW1LYlQwTWJZQ3ZvWjFl?=
 =?utf-8?B?Y3piZG1xbllEc3V4emZkR0lLdkI1V1BzSXI4aU1BL1hMTWp1eHRaUG1wQlZi?=
 =?utf-8?B?bVZIY1o1djMxbFhjM1RhY2pCbTRoVVNnTUh3bE9VQ1dvRGVlRllKcEpOY3Mv?=
 =?utf-8?B?WngyRlNrVzRTQmpydnZEYWEvVjFOTEJTa0ZZejJYYWcyVWZwSXVESXRuRExk?=
 =?utf-8?B?TldsMjZjYmtwcTU5Ly8rQzc1OU94clp1NFltb3A3MnB1RGN2cGEzblgvMk5X?=
 =?utf-8?B?d043R1J2cExWQVc4UU1DdWFvR0dzNDdrTklzT2hER0NQMm5qQWNVdTFLVGU5?=
 =?utf-8?B?dk13L0NQQ2pOc2pIWGpsdnRNM1FXaDVnWEtsWjB3cDNYVjhhN0UyUzQ3aklX?=
 =?utf-8?B?QytEQzNlUGZkK3lzb3RkMDM1ZkVDclc1QnJPUFI0WjlzNU8xbW00ZGhEbTNw?=
 =?utf-8?B?WFRtNlpib2hacC9XZnRFTTh2K1BNVE9qVk9kbjhNR1NzUG5BY243OG8zOXp3?=
 =?utf-8?B?NEd2Ym1ONU00ekhTNlFrdnpDZGlJSzFoK0xqSm5vT3FtZTgyMWVUVlRQek85?=
 =?utf-8?B?RXVXSm16Q05aWWdTaUV6OVFPaUxBMCtUZkszWlJrQ0dhQUtGWmR4T0l4RnRj?=
 =?utf-8?B?alcyaEZYQUZpYnFmSkU2ZEUyUWtWQjdIUWRaRWVkaFJONXMzWFBLcHZpRU9U?=
 =?utf-8?B?clB2S2wwL1VQOXEwRUg0b2VtbkNHU3lWeDR0UUFjRTF5QVFzWXdycGliUWo3?=
 =?utf-8?B?bjBBVkZvaFF3TDF1TWFLVjc4T215UUVWTnpaWXRFTnoxWExXUzVEN3ZnMXN0?=
 =?utf-8?B?ZHR4Wk9GRS9vOTN5cW0zYkN5SkxKMlZOUE1tenNyblFlSkU2RjA2aTliUkxv?=
 =?utf-8?B?VFZsa016ZUlha3cvMG1ZeVluYk1xcnBXZFkwY2F6dlZmdzA0aHRLYldqQXBa?=
 =?utf-8?B?YXNtbFFrbWJJeDRFSFN2UmFQZG1sNk5Jdi8xUGIyQUpSSVphSzJKd1VnRitG?=
 =?utf-8?B?T0lZN1NKOEpGUEh0TERMVFJ3NVF0YlJSMk03ckZFSk1pejJRRHpybGlBMmNZ?=
 =?utf-8?B?SEpHb3E2azM3SWUrYUt5OG1OUjQyeWpabExwc2Z5VmNJMEo0ZHFoQ3Nablpi?=
 =?utf-8?B?Wm5VWmIzNTBjZkhOR1AzYndNaFNRRlB5cHE5MGRLLzg5UlNZbjhMT3B2RVo2?=
 =?utf-8?B?QU5vQnlCNUtGdmFOaitMbUNYZU1wam15WGxuampVZVpuODBJYXFUSHRYTEpN?=
 =?utf-8?B?MFFJbW5WTFZBZXFzQ1FEUmpDc0RmRFVDc3JSQlRrK291cTRxSGR2NWhpdE0v?=
 =?utf-8?B?dnd1c3lBWnd2Q3pZL05HSDJvWUgwbHcxSEpWb0JsWWJZVFJpdThveXlaNnZ2?=
 =?utf-8?B?d3JtMUlVMVZ5QWgzcDc5YnR1WENEb2tXc1BqcnVWMHFWcDkvcU8xMTE5UFpl?=
 =?utf-8?B?Y1M0SzZxSVNFQVRVbDFFL251ZGpvbmFwaXJxc3pQTFo5RjhEa2ovU055RUt1?=
 =?utf-8?B?Z1dCM0Q4Q3pvU3Fib0Z5RkpoaElnSHRpelIrRlRLNnViL0k4T0N6RHJIWi9T?=
 =?utf-8?B?MkdUYzEwSmJvVHVlYlNOeWZxZFAvRzB0NnBxZzBadkdRTzlqT3EyNVg3ZUY2?=
 =?utf-8?B?QkpyWVJCNWdqNUhGYkVyUFpobDlkaElkM1J5K0RUL1JXY1REVVN2MVVMMzF4?=
 =?utf-8?B?WFAxdXVIU2V5SWcrM2wrODdISzdhMGVLNGtvK2ltV3l3WitNdERBbjNFK2Na?=
 =?utf-8?B?Z3pNNzUrTkhjMzNFTFJpNzRVYUMrd3FSTStFMlVwb0R2R21GVHlhbit1L3Fz?=
 =?utf-8?B?Wk5sNTJnbHIxRWpKVTdSMDQ5QlNaU0lMelJTODBVanVkVXFYQUtnV2cxcFVr?=
 =?utf-8?B?RmpGZytVM05VNXhSQkFzdEVELzZucTg5bjljSUs1ckhwbG5SZndaejAxY3l3?=
 =?utf-8?B?TEZ6akVDcW9pOHJjcEFEeEhGWEQ2bGcwd0VRZGVDNitYaTFRK095aXpXY1BC?=
 =?utf-8?Q?kNPPjHuPCw616RQg=3D?=
Content-ID: <36CBD901C8599A439EF9353D40DE3A2B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43aad5ea-d598-4650-4f55-08da4f6fc40a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 08:11:07.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+3UHMmlMVvjnmLERMrUfcF5NnbdC1Xb6FZuTIsUBeX/3mV8FHvvVsP+V8AKDpcXPINWn7itrHW7Fj/3/5wTwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 6/16/22 01:27, James Hilliard wrote:
> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> <buildroot@buildroot.org> wrote:
>>
>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
>>>
>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
>>>
>>>  How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>>
>> No, I don't do any sort of trickery to build bpftool on my end. The
>> bootstrapping, if becomes available for your configuration, uses clang
>> and only clang. I tried to explain this in v4 of the patch [1], the
>> second paragraph of the commit message.
> 
> I think clang/llvm support isn't going to work correctly yet since we only have
> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> 
> Minimum clang/llvm version for libbpf co-re is version 10:
> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere

You're right about the clang version, but it doesn't have anything to do
with Buildroot's clang. The build process uses the clang that is installed
on the host. For Debian bullseye, that is clang 11.

To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
the bootstrap part of bpftool, uses the x86 clang of the Debian machine.


-- 
Shahab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
